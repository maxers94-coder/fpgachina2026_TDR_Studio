"""Compare independently checked PN captures to a frozen diagnostic reference.

Remove each frame's mean over samples 0..127 before comparing. The digital
template has nonzero sum, so subtract the equivalent DC term from correlations.
This tool reports measured differences; it does not calibrate fault distance.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path

from check_raw_capture import fnv1a, read_captures
from check_pn_capture import check_pair, digital_template, parse_correlations


def validate(path):
    raw = read_captures(path)[-1]
    text = path.read_text(encoding="utf-8-sig")
    correlation = parse_correlations(text)[-1]
    peak = check_pair(raw, correlation)
    return raw, correlation[1], peak


def compare(reference, path, label):
    raw, corr, peak = validate(path)
    n = reference["reference_count"]
    pre = 128
    denominator = n * pre
    sums = reference["raw_q2_sum"]
    corr_sums = reference["correlation_q16_sum"]
    # DC(new)-DC(reference), as an exact fraction over n*128.
    dc_numerator = n * sum(raw.samples[:pre]) - sum(sums[:pre])
    diff_raw_numerator = [(n * value - total) * pre - dc_numerator
                          for value, total in zip(raw.samples, sums)]
    template = digital_template()
    diff_corr_numerator = [(n * value - total) * pre - dc_numerator * sum(template)
                           for value, total in zip(corr, corr_sums)]
    recomputed = [sum(diff_raw_numerator[k+i] * template[i] for i in range(640))
                  for k in range(256)]
    if recomputed != diff_corr_numerator:
        raise ValueError("DC-removed difference correlation identity failed")
    diff_peak = max(range(256), key=lambda k: abs(diff_corr_numerator[k]))
    word = corr[peak] & ((1 << 64) - 1)
    report = {
        "file": path.name, "operator_label": label,
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "sequence": raw.sequence, "mode": raw.waveform,
        "raw_integrity": "PASS", "correlation_integrity": "PASS",
        "pc_pl_arithmetic": "ALL_256_EXACT",
        "raw_fnv1a": f"{fnv1a(raw.samples):08X}",
        "raw_min_q2": min(raw.samples), "raw_max_q2": max(raw.samples),
        "pretrigger_mean_q2": sum(raw.samples[:pre]) / pre,
        "total_peak_lag": peak, "total_peak_q16": corr[peak],
        "total_peak_hi": f"{word >> 32:08X}", "total_peak_lo": f"{word & 0xffffffff:08X}",
        "dc_difference_from_reference_q2": dc_numerator / denominator,
        "dc_removed_difference_raw_rms_q2": math.sqrt(sum(v*v for v in diff_raw_numerator) / 1024) / denominator,
        "dc_removed_difference_peak_lag": diff_peak,
        "dc_removed_difference_peak_q16": diff_corr_numerator[diff_peak] / denominator,
        "dc_removed_difference_sign": (diff_corr_numerator[diff_peak] > 0) - (diff_corr_numerator[diff_peak] < 0),
        "difference_fraction_denominator": denominator,
        "difference_raw_q2_numerator": diff_raw_numerator,
        "difference_correlation_q16_numerator": diff_corr_numerator,
        "difference_arithmetic_identity": "ALL_256_EXACT",
        "distance_calibrated": False,
    }
    return report


def cosine(a, b):
    norm = math.sqrt(sum(x*x for x in a) * sum(x*x for x in b))
    return sum(x*y for x, y in zip(a, b)) / norm if norm else None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--reference", required=True, type=Path)
    parser.add_argument("--open-log", required=True, type=Path)
    parser.add_argument("--short-log", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path, help="New JSON report; never overwrite")
    args = parser.parse_args()
    try:
        ref = json.loads(args.reference.read_text())
        if (ref["waveform"] != "PN127" or ref["reference_count"] < 1 or
                ref["sample_rate_hz"] != 200000000 or
                len(ref["raw_q2_sum"]) != 1024 or len(ref["correlation_q16_sum"]) != 256):
            raise ValueError("Unsupported diagnostic reference")
        # Recheck source captures so a mislabeled or modified reference is caught.
        refs = []
        for source in ref["source_runs"]:
            p = args.reference.parent / source["file"]
            if hashlib.sha256(p.read_bytes()).hexdigest() != source["sha256"]:
                raise ValueError(f"Reference source hash mismatch: {p}")
            refs.append(validate(p))
        if len(refs) != ref["reference_count"]:
            raise ValueError("Reference count mismatch")
        if ([sum(x) for x in zip(*(r[0].samples for r in refs))] != ref["raw_q2_sum"] or
                [sum(x) for x in zip(*(r[1] for r in refs))] != ref["correlation_q16_sum"]):
            raise ValueError("Reference sums mismatch")
        opened = compare(ref, args.open_log, "open_per_operator")
        shorted = compare(ref, args.short_log, "short_per_operator")
        result = {
            "reference": args.reference.name,
            "reference_sha256": hashlib.sha256(args.reference.read_bytes()).hexdigest(),
            "method": "Subtract per-frame samples0..127 DC; subtract frozen matched mean; exact integer fraction arithmetic",
            "open": opened, "short": shorted,
            "open_short_difference_raw_cosine": cosine(opened["difference_raw_q2_numerator"], shorted["difference_raw_q2_numerator"]),
            "open_short_difference_correlation_cosine": cosine(opened["difference_correlation_q16_numerator"], shorted["difference_correlation_q16_numerator"]),
            "qualification": "One open and one short capture; diagnostic comparison, no distance or weak-impedance certification",
        }
        with args.output.open("x", encoding="utf-8") as stream:
            json.dump(result, stream, indent=2)
            stream.write("\n")
        for item in (opened, shorted):
            print(f"{item['operator_label']}: SEQ={item['sequence']}, total_lag={item['total_peak_lag']}, "
                  f"difference_lag={item['dc_removed_difference_peak_lag']}, "
                  f"difference_Q16={item['dc_removed_difference_peak_q16']:.3f}")
        print(f"Difference correlation cosine={result['open_short_difference_correlation_cosine']:.9f}")
        print(f"PN_STATE_COMPARISON_SAVED: {args.output}")
    except (OSError, ValueError, KeyError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
