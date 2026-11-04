"""Fit a frozen 1/15 m PN distance candidate; evaluate only 3/5 m holdouts.

All inputs are verified RAW/CORR logs. Uses the existing frozen 1 m matched
reference, per-frame pretrigger DC removal and three-point peak interpolation.
No board writes. Fit residuals are not an independent accuracy measurement.
"""
import argparse
from collections import Counter
import hashlib
import json
import math
import os
from pathlib import Path

from compare_pn_states import compare, validate

METHOD = "frozen_reference_dc128_abspeak_parabola3_v1"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def freeze_metadata(model_path):
    source_dir = Path(__file__).resolve().parent
    names = ("pn_distance_calibration.py", "compare_pn_states.py", "check_pn_capture.py", "check_raw_capture.py")
    return {"schema": "PN_DISTANCE_FREEZE_1", "model_sha256": sha(model_path),
            "implementation_sha256": {name: sha(source_dir/name) for name in names}}


def fractional_peak(values):
    if len(values) != 256 or not any(values):
        raise ValueError("Need 256 nonzero correlation samples")
    k = max(range(256), key=lambda i: abs(values[i]))
    if k in (0, 255):
        raise ValueError("Peak at correlation boundary; cannot interpolate")
    sign = 1 if values[k] > 0 else -1
    a, b, c = (sign * values[j] for j in (k-1, k, k+1))
    curvature = a - 2*b + c
    if curvature >= 0:
        raise ValueError("Peak is flat or not concave")
    fraction = 0.5 * (a-c) / curvature
    if not math.isfinite(fraction) or abs(fraction) > 0.5:
        raise ValueError("Unstable sub-sample peak")
    return k, k + fraction, sign


def load_reference(path, expected_sha=None):
    if expected_sha and sha(path) != expected_sha:
        raise ValueError("Frozen reference hash changed")
    ref = json.loads(path.read_text())
    if (ref["waveform"] != "PN127" or ref["sample_rate_hz"] != 200000000 or
            len(ref["raw_q2_sum"]) != 1024 or len(ref["correlation_q16_sum"]) != 256):
        raise ValueError("Unsupported reference")
    checked = []
    for source in ref["source_runs"]:
        p = path.parent / source["file"]
        if sha(p) != source["sha256"]:
            raise ValueError("Reference source hash changed")
        checked.append(validate(p))
    if len(checked) != ref["reference_count"]:
        raise ValueError("Reference count mismatch")
    if ([sum(x) for x in zip(*(r[0].samples for r in checked))] != ref["raw_q2_sum"] or
            [sum(x) for x in zip(*(r[1] for r in checked))] != ref["correlation_q16_sum"]):
        raise ValueError("Reference sums mismatch")
    return ref


def check_role(length_mm, role):
    expected = {1000: "fit", 15000: "fit", 3000: "validation", 5000: "validation"}
    if expected.get(length_mm) != role:
        raise ValueError("Length/role violates the predefined 1/15 fit and 3/5 holdout split")


def load_batch(path, role):
    batch = json.loads(path.read_text(encoding="utf-8-sig"))
    plan = batch["plan"]
    length = plan["length_mm"]
    check_role(length, role)
    if (batch["status"] != "complete" or plan["role"] != role or
            plan["waveform"] != "PN127" or plan["sample_rate_hz"] != 200000000 or
            plan["repeats_per_state"] != 3 or len(batch["captures"]) != 9):
        raise ValueError("Expected a complete 3-state x 3-repeat PN batch")
    if Counter(r["state"] for r in batch["captures"]) != {"matched": 3, "open": 3, "short": 3}:
        raise ValueError("Batch state counts differ")
    if len({r["sequence"] for r in batch["captures"]}) != 9:
        raise ValueError("Repeated cached measurement sequence")
    result = []
    for record in batch["captures"]:
        if (Path(record["file"]).name != record["file"] or
                record["role"] != role or record["length_mm"] != length):
            raise ValueError("Batch record disagrees with plan")
        p = path.parent / record["file"]
        if sha(p) != record["sha256"]:
            raise ValueError("Batch log hash mismatch")
        raw, corr, peak = validate(p)
        if raw.sequence != record["sequence"]:
            raise ValueError("Batch/log sequence mismatch")
        result.append((record["state"], length / 1000.0, p))
    return batch, result


def observation(ref, path, state, length_m):
    detail = compare(ref, path, state)
    result = {k: detail[k] for k in (
        "file", "sha256", "sequence", "raw_integrity", "correlation_integrity",
        "pc_pl_arithmetic", "total_peak_lag", "dc_removed_difference_peak_lag",
        "dc_removed_difference_peak_q16", "pretrigger_mean_q2")}
    result.update(state=state, declared_length_m=length_m)
    if state != "matched":
        k, fractional, sign = fractional_peak(detail["difference_correlation_q16_numerator"])
        if sign != (1 if state == "open" else -1):
            raise ValueError("Difference polarity disagrees with declared open/short state")
        result.update(fractional_lag=fractional, sign=sign)
    return result


def fit(args):
    ref = load_reference(args.reference)
    identity = json.loads(args.identity.read_text())
    if identity["length_mm"] != 1000:
        raise ValueError("Existing short-cable data must be confirmed 1 m")
    rows = []
    for source in identity["stage17_runs"]:
        if source["state"] in ("open", "short"):
            rows.append(observation(ref, args.identity.parent/source["file"], source["state"], 1.0))
    if Counter(r["state"] for r in rows) != {"open": 1, "short": 1}:
        raise ValueError("Need the existing independent 1 m open/short endpoints")
    batch, records = load_batch(args.batch, "fit")
    if batch["plan"]["length_mm"] != 15000:
        raise ValueError("Fit batch must be 15 m")
    batch_rows = [observation(ref, p, state, length) for state, length, p in records]
    rows += [r for r in batch_rows if r["state"] != "matched"]
    means = {length: sum(r["fractional_lag"] for r in rows if r["declared_length_m"] == length) /
             sum(r["declared_length_m"] == length for r in rows) for length in (1.0, 15.0)}
    slope = (means[15.0]-means[1.0]) / 14.0
    offset = means[1.0] - slope
    if not math.isfinite(slope) or slope <= 0:
        raise ValueError("Invalid distance calibration slope")
    for row in rows:
        row["fit_estimate_m"] = (row["fractional_lag"]-offset)/slope
        row["fit_residual_mm"] = 1000*(row["fit_estimate_m"]-row["declared_length_m"])
    ref_relative = Path(os.path.relpath(args.reference, args.output.parent)).as_posix()
    return {
        "schema": "PN_DISTANCE_CANDIDATE_1", "status": "FROZEN_AWAITING_HOLDOUT",
        "method": METHOD, "reference": ref_relative, "reference_sha256": sha(args.reference),
        "training_manifest_sha256": sha(args.batch), "identity_sha256": sha(args.identity),
        "fit_lengths_m": [1, 15], "independent_validation_lengths_m": [3, 5],
        "formula": "distance_m = (fractional_lag - offset_samples) / samples_per_m",
        "offset_samples": offset, "samples_per_m": slope, "fit_endpoint_mean_lags": means,
        "sample_rate_hz": 200000000, "waveform": "PN127", "pretrigger_dc_samples": 128,
        "fractional_peak_rule": "abs maximum over lags0..255; orient sign; three-point parabola; reject boundary/flat peaks",
        "matched_reference_rule": "Use the same frozen SEQ6/7/8 1m matched reference for all lengths; never adapt on holdouts",
        "training_observations": rows,
        "matched_15m_controls": [r for r in batch_rows if r["state"] == "matched"],
        "accuracy_validated": False, "firmware_distance_output_enabled": False,
        "limitations": ["Only one open and one short capture at 1m", "Fit residuals are not holdout accuracy",
                        "Nominal/known lengths supplied by operator; physical length uncertainty not measured",
                        "No automatic matched/open/short classifier or weak-impedance threshold"],
    }


def evaluate(args):
    frozen = json.loads(args.model.with_suffix(".freeze.json").read_text())
    if frozen != freeze_metadata(args.model):
        raise ValueError("Frozen model or implementation changed; do not adapt it on validation data")
    model = json.loads(args.model.read_text())
    if model["schema"] != "PN_DISTANCE_CANDIDATE_1" or model["method"] != METHOD:
        raise ValueError("Unknown frozen model")
    reference = args.model.parent / model["reference"]
    ref = load_reference(reference, model["reference_sha256"])
    batch, records = load_batch(args.batch, "validation")
    rows = [observation(ref, p, state, length) for state, length, p in records]
    for row in rows:
        if row["state"] == "matched":
            row["distance_m"] = None
            row["reason"] = "Matched control: no fault-distance estimate"
            continue
        # Declared length is used only for scoring AFTER blind lag prediction.
        row["distance_m"] = (row["fractional_lag"]-model["offset_samples"])/model["samples_per_m"]
        row["error_mm"] = 1000*(row["distance_m"]-row["declared_length_m"])
        row["error_percent_of_length"] = 100*(row["distance_m"]-row["declared_length_m"])/row["declared_length_m"]
    estimates = [r for r in rows if r["state"] != "matched"]
    return {
        "schema": "PN_DISTANCE_HOLDOUT_1", "status": "EVALUATED_NOT_CERTIFIED",
        "model_sha256": sha(args.model), "batch_manifest_sha256": sha(args.batch),
        "length_m": batch["plan"]["length_m"], "observations": rows,
        "max_absolute_error_mm": max(abs(r["error_mm"]) for r in estimates),
        "mean_absolute_error_mm": sum(abs(r["error_mm"]) for r in estimates)/len(estimates),
        "qualification": "Independent length comparison; tolerance/signoff not predefined; no weak-impedance conclusion",
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    train = sub.add_parser("fit")
    train.add_argument("--reference", type=Path, required=True)
    train.add_argument("--identity", type=Path, required=True)
    train.add_argument("--batch", type=Path, required=True)
    train.add_argument("--output", type=Path, required=True)
    test = sub.add_parser("evaluate")
    test.add_argument("--model", type=Path, required=True)
    test.add_argument("--batch", type=Path, required=True)
    test.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    try:
        result = fit(args) if args.command == "fit" else evaluate(args)
        with args.output.open("x", encoding="utf-8") as stream:
            json.dump(result, stream, indent=2)
            stream.write("\n")
        if args.command == "fit":
            with args.output.with_suffix(".freeze.json").open("x", encoding="utf-8") as stream:
                json.dump(freeze_metadata(args.output), stream, indent=2)
                stream.write("\n")
            print(f"PN_CANDIDATE_FROZEN: offset={result['offset_samples']:.9f}, samples_per_m={result['samples_per_m']:.9f}")
            print("Awaiting predefined 3m/5m holdout batches; fit residuals do not establish accuracy.")
        else:
            print(f"PN_HOLDOUT_EVALUATED: length={result['length_m']}m, max_abs_error={result['max_absolute_error_mm']:.3f}mm")
        print(args.output)
    except (ValueError, KeyError, OSError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
