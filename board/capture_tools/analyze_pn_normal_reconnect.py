"""Inspect one 5 m/50-ohm development reconnect batch, without classifying faults.

The initial baseline is fixed within this batch. It never replaces the firmware's
frozen 1 m reference. Repeats within one connection are technical repeats, not
independent reconnect operations. No decision threshold or distance is produced.
"""
import argparse
import hashlib
import json
from pathlib import Path

from check_raw_capture import fields, parse_log
from check_pn_capture import parse_correlations
from compare_pn_states import compare, validate


SCHEMA = "PN_NORMAL_RECONNECT_1"


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def bounded_integer(value, low, high, name):
    if type(value) is not int or not low <= value <= high:
        raise ValueError(f"Invalid {name}: expected integer {low}..{high}")
    return value


def checked_capture(path):
    text = path.read_text(encoding="utf-8-sig")
    raw = parse_log(text)
    corr = parse_correlations(text)
    if len(raw) != 1 or len(corr) != 1:
        raise ValueError(f"Expected exactly one RAW/CORR transaction: {path.name}")
    lines = text.splitlines()
    starts = [line for line in lines if line.startswith("[PN] START:")]
    passes = [line for line in lines if line.startswith("[PN] PASS:")]
    measurements = [fields(line) for line in lines if line.startswith("MEASUREMENT,")]
    traces = [fields(line) for line in lines if line.startswith("TXTRACE,")]
    if len(starts) != 1 or len(passes) != 1 or len(measurements) != 1 or len(traces) != 1:
        raise ValueError(f"Expected one successful new P measurement: {path.name}")
    if (measurements[0].get("SEQ") != str(raw[0].sequence) or
            measurements[0].get("RAW_AVAILABLE") != "1" or
            any(traces[0].get(k) != v for k, v in {"RC": "0", "END": "1", "AFTER_CLEAR": "0"}.items())):
        raise ValueError(f"Measurement/RAW sequence or TX status mismatch: {path.name}")
    if any("DENIED" in line or "FAILED:" in line or line.startswith("[STOP]") for line in lines):
        raise ValueError(f"Device reported failure: {path.name}")
    return validate(path)


def group_summary(records, kind, operation):
    rows = [row for row in records if row["group_kind"] == kind and row["operation"] == operation]
    return {
        "group_kind": kind, "operation": operation,
        "technical_repeat_count": len(rows),
        "sequences": [row["sequence"] for row in rows],
        "max_abs_dc_removed_correlation_peak_q16": max(abs(row["dc_removed_difference_peak_q16"]) for row in rows),
        "max_abs_dc_change_q2": max(abs(row["dc_difference_from_reference_q2"]) for row in rows),
        "mean_dc_removed_raw_rms_q2": sum(row["dc_removed_difference_raw_rms_q2"] for row in rows) / len(rows),
        "max_dc_removed_raw_rms_q2": max(row["dc_removed_difference_raw_rms_q2"] for row in rows),
        "pretrigger_dc_min_q2": min(row["pretrigger_mean_q2"] for row in rows),
        "pretrigger_dc_max_q2": max(row["pretrigger_mean_q2"] for row in rows),
    }


def analyze(manifest_path, allow_synthetic=False):
    manifest_path = manifest_path.resolve()
    batch = json.loads(manifest_path.read_text(encoding="utf-8-sig"))
    if not isinstance(batch, dict):
        raise ValueError("Manifest must be a JSON object")
    if batch.get("schema") != SCHEMA or batch.get("status") != "complete":
        raise ValueError("Expected a complete PN_NORMAL_RECONNECT_1 batch")
    evidence = batch.get("evidence_kind")
    if evidence not in ("operator_declared_live_capture", "synthetic_tool_self_test"):
        raise ValueError("Unknown evidence kind")
    if evidence == "synthetic_tool_self_test" and not allow_synthetic:
        raise ValueError("Synthetic self-test batch requires --allow-synthetic-self-test")
    plan = batch["plan"]
    if not isinstance(plan, dict):
        raise ValueError("Plan must be a JSON object")
    if (plan.get("length_m") != 5 or plan.get("termination") != "matched_50ohm" or
            plan.get("waveform") != "PN127" or plan.get("sample_rate_hz") != 200000000 or
            plan.get("frames") != 32 or plan.get("formal_fixture_normal") is not False or
            plan.get("baseline_policy") != "fixed_initial_batch_mean_dc128"):
        raise ValueError("Unsupported development reconnect plan")
    baseline_count = bounded_integer(plan["baseline_repeats"], 1, 10, "baseline repeats")
    reconnect_count = bounded_integer(plan["reconnect_groups"], 1, 20, "reconnect groups")
    repeat_count = bounded_integer(plan["repeats_per_reconnect"], 1, 10, "technical repeats")
    expected = [("baseline", 0, repeat) for repeat in range(1, baseline_count + 1)]
    expected += [("reconnect", operation, repeat)
                 for operation in range(1, reconnect_count + 1)
                 for repeat in range(1, repeat_count + 1)]
    entries = batch["captures"]
    if not isinstance(entries, list) or any(not isinstance(entry, dict) for entry in entries):
        raise ValueError("Captures must be a list of objects")
    if len(entries) != len(expected) or plan.get("total_captures") != len(expected):
        raise ValueError("Capture count does not match the predeclared plan")
    seen_files, seen_sequences = set(), set()
    checked = []
    previous_sequence = None
    for entry, ordering in zip(entries, expected):
        bounded_integer(entry["operation"], 0, reconnect_count, "operation")
        bounded_integer(entry["repeat"], 1, 10, "repeat")
        bounded_integer(entry["sequence"], 0, 0xffffffff, "sequence")
        if (entry.get("group_kind"), entry.get("operation"), entry.get("repeat")) != ordering:
            raise ValueError("Baseline/reconnect ordering or grouping does not match the plan")
        name = entry["file"]
        if not isinstance(name, str) or not name or Path(name).name != name or "\\" in name:
            raise ValueError("Capture filename must stay within its batch folder")
        path = (manifest_path.parent / name).resolve()
        if not path.is_relative_to(manifest_path.parent):
            raise ValueError("Capture path escapes its batch folder")
        if name in seen_files:
            raise ValueError("Capture filename repeated")
        seen_files.add(name)
        if sha256(path) != entry["sha256"]:
            raise ValueError(f"Capture SHA256 mismatch: {name}")
        result = checked_capture(path)
        seq = result[0].sequence
        if seq != entry["sequence"] or seq in seen_sequences:
            raise ValueError("Repeated or mislabeled sequence; cached/restarted batches are not accepted")
        if previous_sequence is not None and seq != (previous_sequence + 1) % (1 << 32):
            raise ValueError("Measurement sequence must advance by one; a restart or extra command interrupted the batch")
        seen_sequences.add(seq)
        previous_sequence = seq
        checked.append((entry, path, result))
    baseline = checked[:baseline_count]
    reference = {
        "reference_count": baseline_count,
        "raw_q2_sum": [sum(values) for values in zip(*(row[2][0].samples for row in baseline))],
        "correlation_q16_sum": [sum(values) for values in zip(*(row[2][1] for row in baseline))],
    }
    records = []
    for entry, path, _ in checked:
        report = compare(reference, path, "same_batch_50ohm_development")
        # Preserve all 256 residuals, but do not invent a fault distance from a noise peak.
        denominator = report["difference_fraction_denominator"]
        corr_values = report.pop("difference_correlation_q16_numerator")
        report["dc_removed_difference_correlation_q16"] = [value / denominator for value in corr_values]
        report.pop("difference_raw_q2_numerator")
        report.pop("distance_calibrated")
        report.update({key: entry[key] for key in ("group_kind", "operation", "repeat")})
        records.append(report)
    groups = [group_summary(records, "baseline", 0)]
    groups += [group_summary(records, "reconnect", operation) for operation in range(1, reconnect_count + 1)]
    return {
        "schema": "PN_NORMAL_RECONNECT_REPORT_1", "evidence_kind": evidence,
        "source_manifest": manifest_path.name, "source_manifest_sha256": sha256(manifest_path),
        "plan": plan, "capture_count": len(records), "reconnect_operation_count": reconnect_count,
        "technical_repeats_are_independent_trials": False,
        "firmware_reference_changed": False,
        "baseline_sources": [row[0] for row in baseline],
        "baseline_note": "Initial connection only; within-baseline residuals share the fitted mean and are descriptive.",
        "method": "Fixed initial batch mean; remove samples0..127 DC; verify all 256 exact difference correlations.",
        "records": records, "groups": groups,
        "qualification": "Same 5 m cable, far-end 50-ohm reconnect development data; no in-line Normal fixture, distance, decision threshold, false-alarm-rate or weak-reflection conclusion.",
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("manifest", type=Path)
    parser.add_argument("--output", required=True, type=Path, help="New JSON report; never overwrite")
    parser.add_argument("--allow-synthetic-self-test", action="store_true")
    args = parser.parse_args()
    try:
        result = analyze(args.manifest, args.allow_synthetic_self_test)
        with args.output.open("x", encoding="utf-8") as stream:
            json.dump(result, stream, indent=2)
            stream.write("\n")
        print(f"RECONNECT_DATA_CHECKED: {result['capture_count']} captures, {result['reconnect_operation_count']} reconnect operations")
        print(f"Evidence: {result['evidence_kind']}; repeats within each connection are technical repeats.")
        print(f"REPORT_SAVED: {args.output}")
    except (OSError, ValueError, KeyError, TypeError, IndexError, ZeroDivisionError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
