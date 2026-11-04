"""Generate arithmetic-only replay vectors from genuine averaged PN captures.

No ADC frames are synthesized from the saved 32-frame averages. The measured
5 m baseline is used for numerical conformance across different cable setups;
those cross-topology cases are not physical healthy-baseline validation.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import sys
import zlib


WORKSPACE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(WORKSPACE / "tools"))
from analyze_pn_normal_reconnect import analyze
from check_pn_capture import digital_template
from compare_pn_states import validate
from pn_distance_calibration import freeze_metadata


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def nearest_third(value):
    """Round signed integer/3 to nearest; denominator 3 has no half-way ties."""
    return (value + 1) // 3 if value >= 0 else -((-value + 1) // 3)


def crc16le(values):
    data = b"".join((v & 0xffff).to_bytes(2, "little") for v in values)
    return f"{zlib.crc32(data):08X}", hashlib.sha256(data).hexdigest()


def correlate(difference, template):
    return [sum(difference[k + i] * coefficient
                for i, coefficient in enumerate(template)) for k in range(256)]


def write_mem(path, values, width):
    mask = (1 << width) - 1
    digits = (width + 3) // 4
    path.write_text("".join(f"{value & mask:0{digits}X}\n" for value in values), encoding="ascii")


def generate(output):
    frozen_model = WORKSPACE / "captures/calibration/pn_distance_candidate_v1_1m_15m_20261028.json"
    assert freeze_metadata(frozen_model) == json.loads(frozen_model.with_suffix(".freeze.json").read_text())
    old_fixture_path = WORKSPACE / "pn_dev/work/pn_range_fixture_metadata.json"
    old = json.loads(old_fixture_path.read_text(encoding="utf-8"))
    assert len(old["cases"]) == 33
    batch_dir = WORKSPACE / "captures/normal_reconnect/pn_normal_5m_20261029_103203_996"
    session_path = batch_dir / "session.json"
    session = json.loads(session_path.read_text(encoding="utf-8-sig"))
    report = analyze(session_path)
    assert report == json.loads((batch_dir / "analysis.json").read_text(encoding="utf-8"))
    assert report["capture_count"] == 18 and report["reconnect_operation_count"] == 5
    baseline_entries = session["captures"][:3]
    assert all(entry["group_kind"] == "baseline" and entry["operation"] == 0 for entry in baseline_entries)
    baseline_raw = [validate(batch_dir / entry["file"])[0].samples for entry in baseline_entries]
    exact_sum = [sum(values) for values in zip(*baseline_raw)]
    baseline = [nearest_third(v) for v in exact_sum]
    error_numerators = [3 * b - total for b, total in zip(baseline, exact_sum)]
    assert max(abs(v) for v in error_numerators) <= 1
    assert all(-32768 <= v <= 32767 for v in baseline)
    template = digital_template()
    assert len(template) == 640 and sum(template) == 65536
    template_crc, template_sha = crc16le(template)
    baseline_crc, baseline_sha = crc16le(baseline)
    baseline_corr = correlate(baseline, template)
    baseline_exact_sum_corr = correlate(exact_sum, template)
    quantization_error_corr_numerator3 = [s - 3 * b for s, b in zip(baseline_exact_sum_corr, baseline_corr)]
    quantization_error_dc_corr_numerator384 = [
        128 * v + (3 * sum(baseline[:128]) - sum(exact_sum[:128])) * sum(template)
        for v in quantization_error_corr_numerator3
    ]

    # Captures can have an original root copy and a byte-identical batch copy.
    # Resolve by name and expected SHA, never by sequence alone (boots restart it).
    paths_by_name = {}
    for path in (WORKSPACE / "captures").rglob("*.txt"):
        paths_by_name.setdefault(path.name, []).append(path)
    source_cases = []
    for entry in old["cases"]:
        candidates = [p for p in paths_by_name.get(entry["file"], []) if sha256(p) == entry["sha256"]]
        if not candidates:
            raise ValueError(f"Missing immutable source: {entry['file']}")
        path = min(candidates, key=lambda p: (len(p.parts), str(p)))
        source_cases.append((path, entry["sha256"], entry["state"], "historical_33_arithmetic_only"))
    for entry in session["captures"]:
        source_cases.append((batch_dir / entry["file"], entry["sha256"], "matched", "normal_reconnect_5m_18"))
    if len({item[1] for item in source_cases}) != 51:
        raise ValueError("Expected 51 unique genuine source hashes")

    records = []
    raw_words, baseline_words, differences, correlations, ps_fixture = [], [], [], [], ["53"]
    ps_fixture += [" ".join(map(str, baseline)), " ".join(map(str, template))]
    for index in range(53):
        if index < 51:
            path, expected_sha, state, collection = source_cases[index]
            if sha256(path) != expected_sha:
                raise ValueError("Source changed before replay generation")
            raw_capture, old_corr, _ = validate(path)
            raw = raw_capture.samples
            current_baseline = baseline
            record = {
                "index": index, "kind": "real_averaged_capture",
                "source_file": path.relative_to(WORKSPACE).as_posix(), "source_sha256": expected_sha,
                "source_sequence": raw_capture.sequence, "operator_state": state,
                "collection": collection, "baseline": "fixed_measured_5m_quantized",
                "physical_cross_topology_validation": False,
            }
        else:
            positive = index == 51
            raw = [32767 if positive else -32768] * 1024
            current_baseline = [-32768 if positive else 32767] * 1024
            record = {
                "index": index, "kind": "synthetic_signed_boundary",
                "source_sequence": None, "operator_state": "synthetic",
                "baseline": "synthetic_override_minimum" if positive else "synthetic_override_maximum",
                "physical_cross_topology_validation": False,
            }
        diff = [value - base for value, base in zip(raw, current_baseline)]
        assert all(-65535 <= v <= 65535 for v in diff)
        corr = correlate(diff, template)
        assert all(-(1 << 47) <= v < (1 << 47) for v in corr)
        if index < 51:
            # Independent linearity identity using the original PL results.
            from_old = [v + 566 * sum(template) - b for v, b in zip(old_corr, baseline_corr)]
            if corr != from_old:
                raise ValueError("Measured-baseline correlation identity disagrees with captured PL results")
        else:
            expected_diff = 65535 if index == 51 else -65535
            assert diff == [expected_diff] * 1024
            assert corr == [expected_diff * 65536] * 256
        baseline_case_crc, _ = crc16le(current_baseline)
        pre_delta = sum(raw[:128]) - sum(current_baseline[:128])
        dc_corrected_numerator128 = [128 * v - pre_delta * sum(template) for v in corr]
        record.update(
            baseline_crc32=baseline_case_crc,
            raw_min_q2=min(raw), raw_max_q2=max(raw),
            difference_min_q2=min(diff), difference_max_q2=max(diff),
            correlation_min_q16=min(corr), correlation_max_q16=max(corr),
            dc_delta_pre_sum_q2=pre_delta,
            pc_only_dc_corrected_peak_abs_q16=max(abs(v) for v in dc_corrected_numerator128) / 128,
        )
        records.append(record)
        raw_words.extend(raw)
        baseline_words.extend(current_baseline)
        differences.extend(diff)
        correlations.extend(corr)
        # Decimal input for independent PS helper tests; each case carries its
        # own baseline because the final two cases deliberately override it.
        ps_fixture += [f"{index} {int(index < 51)} {pre_delta}",
                       " ".join(map(str, current_baseline)), " ".join(map(str, raw)),
                       " ".join(map(str, corr))]

    output.mkdir(parents=True, exist_ok=True)
    write_mem(output / "baseline_i16.mem", baseline, 16)
    write_mem(output / "template_i16.mem", template, 16)
    write_mem(output / "case_baseline_i16.mem", baseline_words, 16)
    write_mem(output / "case_raw_i16.mem", raw_words, 16)
    write_mem(output / "case_difference_i17.mem", differences, 17)
    write_mem(output / "case_correlation_i64.mem", correlations, 64)
    (output / "ps_healthy_baseline_cases.txt").write_text("\n".join(ps_fixture) + "\n", encoding="ascii")
    inputs = [old_fixture_path, session_path, batch_dir / "analysis.json", frozen_model,
              frozen_model.with_suffix(".freeze.json")]
    source_tools = [Path(__file__), WORKSPACE / "tools/analyze_pn_normal_reconnect.py"]
    source_tools += [WORKSPACE / "tools" / n for n in ("check_raw_capture.py", "check_pn_capture.py", "compare_pn_states.py", "pn_distance_calibration.py")]
    metadata = {
        "schema": "HEALTHY_BASELINE_REPLAY_VECTORS_1", "case_count": len(records),
        "real_capture_count": 51, "synthetic_case_count": 2,
        "sample_representation": "genuine 32-frame averages in signed16 Q2; no per-frame ADC reconstruction",
        "processing": "signed17 raw-minus-baseline; signed PN Q14 linear correlation; signed64 result",
        "dc_correction": "PC-only exact numerator over128; not applied to PL expected correlation",
        "cross_topology_scope": "All 51 are arithmetic conformance; the common 5m reference is not physically valid for other cable topologies",
        "n": 1024, "l": 640, "k": 256, "template_sum_q14": sum(template),
        "template_crc32": template_crc, "template_bytes_sha256": template_sha,
        "baseline_crc32": baseline_crc, "baseline_bytes_sha256": baseline_sha,
        "baseline_sources": baseline_entries,
        "baseline_quantization": {
            "rule": "nearest signed-symmetric of exact sum/3; no half-way ties for denominator3",
            "error_numerator_denominator": 3,
            "error_numerators": error_numerators,
            "max_abs_error_q2": max(abs(v) for v in error_numerators) / 3,
            "rms_error_q2": math.sqrt(sum(v * v for v in error_numerators) / 1024) / 3,
            "max_abs_correlation_quantization_deviation_q16": max(abs(v) for v in quantization_error_corr_numerator3) / 3,
            "max_abs_pc_dc_corrected_quantization_deviation_q16": max(abs(v) for v in quantization_error_dc_corr_numerator384) / 384,
        },
        "input_sha256": {p.relative_to(WORKSPACE).as_posix(): sha256(p) for p in inputs},
        "source_sha256": {p.relative_to(WORKSPACE).as_posix(): sha256(p) for p in source_tools},
        "cases": records,
        "artifacts": {p.name: {"bytes": p.stat().st_size, "sha256": sha256(p)}
                      for p in output.iterdir() if p.is_file() and p.suffix in (".mem", ".txt")},
    }
    (output / "manifest.json").write_text(json.dumps(metadata, indent=2) + "\n", encoding="utf-8")
    print(f"HEALTHY_BASELINE_VECTORS_PASS: real=51 synthetic=2 CRC={baseline_crc}; arithmetic replay only")
    return metadata


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    try:
        generate(args.output.resolve())
    except (OSError, ValueError, KeyError, AssertionError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
