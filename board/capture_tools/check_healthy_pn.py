"""Check Stage20 B/J healthy-reference provenance and D/R/C arithmetic.

Accepts received text only. A successful check establishes protocol integrity
and integer arithmetic, not physical health, calibrated distance or sensitivity.
The historical RAW/CORR validators and frozen distance model are unchanged.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import zlib

from check_raw_capture import fields, parse_log
from check_pn_capture import digital_template, parse_correlations


def _lines(text):
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    if any("DENIED" in line or "FAILED:" in line or "[STOP]" in line or
           "LCD error" in line for line in lines):
        raise ValueError("Device reported a failed/rejected operation")
    return lines


def _matching(lines, prefix, count):
    result = [(i, line) for i, line in enumerate(lines) if line.startswith(prefix)]
    if len(result) != count:
        raise ValueError(f"Expected {count} {prefix} record(s), got {len(result)}")
    return result


def _u32(value, name, nonzero=False):
    n = int(value)
    if not (1 if nonzero else 0) <= n <= 0xffffffff:
        raise ValueError(f"Invalid {name}")
    return n


def _hex32(value):
    if not re.fullmatch(r"[0-9a-fA-F]{8}", value):
        raise ValueError("Expected an eight-digit hexadecimal word")
    return int(value, 16)


def _expected(values, expected, message):
    if any(values.get(k) != v for k, v in expected.items()):
        raise ValueError(message)


def _crc(samples):
    return zlib.crc32(b"".join(struct.pack("<h", v) for v in samples)) & 0xffffffff


def _trace_measurement(lines, count, sequences):
    traces = _matching(lines, "TXTRACE,", count)
    measures = _matching(lines, "MEASUREMENT,", count)
    begins = _matching(lines, "LOCATE_TEST_BEGIN,", count)
    ends = _matching(lines, "LOCATE_TEST_END,", count)
    for n in range(count):
        t, m, begin, end = (fields(rows[n][1]) for rows in (traces, measures, begins, ends))
        _expected(t, {"SEQ": "1", "RC": "0", "AFTER_CLEAR": "0", "END": "1"}, "Invalid new transaction trace")
        _u32(t["ENTRY"], "entry transaction count")
        _expected(m, {"SEQ": str(sequences[n]), "RAW_AVAILABLE": "1"}, "MEASUREMENT/RAW sequence mismatch")
        _expected(begin, {"COUNT": "1", "MODE": "PN127", "FRAMES": "32"}, "Unexpected transaction configuration")
        if _u32(begin["FIRST_TX_BEFORE"], "entry transaction count") != int(t["ENTRY"]):
            raise ValueError("Transaction entry counters disagree")
        _expected(end, {"COUNT": "1", "LAST_TX": "1"}, "Invalid transaction completion")
        if not begins[n][0] < traces[n][0] < measures[n][0] < ends[n][0]:
            raise ValueError("Transaction records are out of order")
    return traces, measures, begins, ends


def parse_baseline(text):
    """Return a checked B+J baseline dict; all three B source RAWs are required."""
    if any(line.strip().startswith("BASE_GUARD,") or
           (line.strip().startswith(("BASE_READY,", "BASE_BEGIN,", "BASE_END,")) and
            any(tag in line for tag in ("GUARD_VERSION=", "PROFILE_ID=", "PROFILE_MASK=", "BANK_CRC32=")))
           for line in text.splitlines()):
        from check_reference_profiles import parse_profile_baseline
        return parse_profile_baseline(text)
    lines = _lines(text)
    if any(line.startswith(("CORR", "DCORR", "PN_DIFF_RESULT,")) for line in lines):
        raise ValueError("Mixed correlation/difference protocol in baseline log")
    start = _matching(lines, "[BASE] START:", 1)[0][0]
    passed = _matching(lines, "[BASE] PASS:", 1)[0][0]
    ready_at, ready_line = _matching(lines, "BASE_READY,", 1)[0]
    begin_at, begin_line = _matching(lines, "BASE_BEGIN,", 1)[0]
    end_at, end_line = _matching(lines, "BASE_END,", 1)[0]
    if not start < ready_at < passed < begin_at < end_at:
        raise ValueError("B completion and J baseline table are out of order")
    begin, end, ready = map(fields, (begin_line, end_line, ready_line))
    _expected(begin, {"COUNT": "1024", "FORMAT": "Q2", "REF_N": "3", "VOLATILE": "1"}, "Unsupported healthy baseline metadata")
    _expected(end, {"COUNT": "1024"}, "Unsupported baseline footer")
    _expected(ready, {"REF_N": "3"}, "Unsupported baseline readiness metadata")
    baseline_id = _u32(begin["ID"], "baseline ID", nonzero=True)
    crc = _hex32(begin["CRC32"])
    if (_u32(end["ID"], "baseline ID") != baseline_id or
            _u32(ready["BASE_ID"], "baseline ID") != baseline_id or
            _hex32(end["CRC32"]) != crc or _hex32(ready["CRC32"]) != crc):
        raise ValueError("Baseline ID/CRC disagrees between READY, BEGIN and END")
    first, last = (_u32(begin[k], k) for k in ("FIRST_SEQ", "LAST_SEQ"))
    if (_u32(ready["FIRST_SEQ"], "first sequence") != first or
            _u32(ready["LAST_SEQ"], "last sequence") != last or last != (first+2) % (1 << 32)):
        raise ValueError("Baseline source sequence range disagrees")

    rows = _matching(lines, "BASE,", 1024)
    samples = []
    for index, (at, line) in enumerate(rows):
        _, i, value = line.split(",")
        n = int(value)
        if int(i) != index or not begin_at < at < end_at or not -32768 <= n <= 32767:
            raise ValueError("Invalid, missing or out-of-order baseline word")
        samples.append(n)
    if _crc(samples) != crc:
        raise ValueError("Baseline CRC32 mismatch")
    raw = parse_log(text)
    if len(raw) != 3 or any(r.waveform != "PN127" for r in raw):
        raise ValueError("Baseline requires exactly three PN RAW source frames")
    sequences = [r.sequence for r in raw]
    if sequences != [(first+i) % (1 << 32) for i in range(3)]:
        raise ValueError("Baseline source RAW sequences are not consecutive")
    raw_begins = _matching(lines, "RAW_BEGIN,", 3)
    raw_ends = _matching(lines, "RAW_END,", 3)
    traces, measures, tx_begins, tx_ends = _trace_measurement(lines, 3, sequences)
    distances = _matching(lines, "PN_DISTANCE,", 3)
    results = _matching(lines, "PN_RESULT,", 3)
    for i in range(3):
        meta = fields(raw_begins[i][1])
        if any(k in meta for k in ("PROC", "BASE_ID", "BASE_CRC")):
            raise ValueError("Baseline sources must use the legacy PN RAW format")
        _expected(fields(distances[i][1]), {"STATUS": "LOW_RETURN", "L_MM": "-1", "LAG_MILLI": "-1", "IN_SPAN": "0", "MODEL": "1", "DIAGNOSTIC": "1"}, "Baseline source was not a low-return PN measurement")
        if not (start < tx_begins[i][0] < traces[i][0] < results[i][0] < distances[i][0] <
                measures[i][0] < tx_ends[i][0] < raw_begins[i][0] < raw_ends[i][0] < ready_at):
            raise ValueError("Baseline acquisition/provenance records are out of order")
        if i and raw_ends[i-1][0] >= tx_begins[i][0]:
            raise ValueError("Baseline source transactions overlap")
    expected = []
    for words in zip(*(r.samples for r in raw)):
        total = sum(words)
        rounded = (abs(total) + 1) // 3
        expected.append(-rounded if total < 0 else rounded)
    if samples != expected:
        raise ValueError("Baseline is not the signed nearest three-frame mean")
    return {"schema": "HEALTHY_BASELINE_CHECK_1", "baseline_id": baseline_id,
            "crc32": f"{crc:08X}", "reference_count": 3, "samples_q2": samples,
            "first_sequence": first, "last_sequence": last, "source_raw_sequences": sequences,
            "source_raw_integrity": "ALL_3_PASS", "mean_quantization": "signed_nearest_divide_3",
            "provenance_verified": True, "distance_valid": False,
            "qualification": "Received B/J text integrity; operator-declared healthy cable, not physical health certification."}


def parse_healthy_capture(base, text):
    """Check exactly one D/R/C transaction against an already checked B+J dict."""
    lines = _lines(text)
    if any(line.startswith(("CORR", "BASE_BEGIN,", "BASE,", "BASE_READY,", "PN_DISTANCE,", "PN_RESULT,")) for line in lines):
        raise ValueError("Mixed legacy/baseline protocol in healthy-difference capture")
    if (base.get("provenance_verified") is not True or len(base["samples_q2"]) != 1024 or
            _crc(base["samples_q2"]) != _hex32(base["crc32"])):
        raise ValueError("An intact, provenance-checked B/J baseline is required")
    start = _matching(lines, "[DIFF] START:", 1)[0][0]
    passed = _matching(lines, "[DIFF] PASS:", 1)[0][0]
    raw = parse_log(text)
    if len(raw) != 1 or raw[0].waveform != "PN127":
        raise ValueError("Expected exactly one PN RAW measurement")
    raw = raw[0]
    elapsed_sequence = (raw.sequence-base["last_sequence"]) % (1 << 32)
    if elapsed_sequence == 0 or elapsed_sequence >= (1 << 31):
        raise ValueError("Difference sequence does not follow the baseline source frames")
    raw_begin_at, raw_header = _matching(lines, "RAW_BEGIN,", 1)[0]
    raw_end_at = _matching(lines, "RAW_END,", 1)[0][0]
    corr_begin_at, corr_header = _matching(lines, "DCORR_BEGIN,", 1)[0]
    corr_end_at = _matching(lines, "DCORR_END,", 1)[0][0]
    result_at, result_line = _matching(lines, "PN_DIFF_RESULT,", 1)[0]
    raw_meta, corr_meta, result = map(fields, (raw_header, corr_header, result_line))
    _expected(raw_meta, {"PROC": "HEALTHY_DIFF"}, "RAW is not marked HEALTHY_DIFF")
    for meta in (raw_meta, corr_meta, result):
        if (_u32(meta["BASE_ID"], "baseline ID") != base["baseline_id"] or
                _hex32(meta["BASE_CRC"]) != _hex32(base["crc32"])):
            raise ValueError("Capture uses a different/stale baseline ID or CRC")
    transformed = "\n".join(line[1:] if line.startswith("DCORR") else line for line in lines)
    correlations = parse_correlations(transformed)
    if len(correlations) != 1 or correlations[0][0] != raw.sequence:
        raise ValueError("RAW/DCORR sequence or capture count mismatch")
    corr = correlations[0][1]
    traces, measures, begins, ends = _trace_measurement(lines, 1, [raw.sequence])
    if not (start < begins[0][0] < traces[0][0] < result_at < measures[0][0] <
            ends[0][0] < passed < raw_begin_at < raw_end_at < corr_begin_at < corr_end_at):
        raise ValueError("D/R/C records are out of order")
    _expected(result, {"DISTANCE_VALID": "0"}, "Difference diagnostic must not claim distance validity")
    difference = [value-reference for value, reference in zip(raw.samples, base["samples_q2"])]
    template = digital_template()
    expected = [sum(difference[k+i]*template[i] for i in range(640)) for k in range(256)]
    if corr != expected:
        k = next(i for i in range(256) if corr[i] != expected[i])
        raise ValueError(f"Healthy PL/PC arithmetic mismatch at lag {k}: PL={corr[k]}, PC={expected[k]}")
    peak = max(range(256), key=lambda k: abs(corr[k]))
    sign = (corr[peak] > 0) - (corr[peak] < 0)
    word = (corr[peak] & ((1 << 64)-1))
    dc_sum = sum(difference[:128])
    if (int(result["PEAK_LAG"]) != peak or int(result["SIGN"]) != sign or
            (_hex32(result["HI"]) << 32 | _hex32(result["LO"])) != word or
            int(result["DC_SUM_DELTA"]) != dc_sum):
        raise ValueError("PN_DIFF_RESULT peak/sign/word/DC disagrees with RAW/DCORR")
    corrected = [128*value-dc_sum*sum(template) for value in corr]
    corrected_peak = max(range(256), key=lambda k: abs(corrected[k]))
    dc_removed_raw = [128*value-dc_sum for value in difference]
    return {"schema": "HEALTHY_PN_CAPTURE_CHECK_1", "sequence": raw.sequence,
            "baseline_id": base["baseline_id"], "baseline_crc32": base["crc32"],
            "raw_integrity": "PASS", "difference_correlation_integrity": "PASS",
            "pc_pl_arithmetic": "ALL_256_EXACT", "peak_lag": peak, "peak_q16": corr[peak], "sign": sign,
            "dc_sum_delta_q2": dc_sum, "pretrigger_dc_change_q2": dc_sum/128,
            "dc_removed_raw_rms_q2": math.sqrt(sum(v*v for v in dc_removed_raw)/1024)/128,
            "dc_removed_peak_lag": corrected_peak,
            "dc_removed_peak_q16": corrected[corrected_peak]/128,
            "dc_removed_sign": (corrected[corrected_peak] > 0)-(corrected[corrected_peak] < 0),
            "dc_removed_correlation_q16_numerator": corrected, "dc_removed_denominator": 128,
            "distance_valid": False, "weak_impedance_validated": False,
            "qualification": "Diagnostic residuals only; no fault threshold or calibrated distance."}


def check_healthy_capture(base, path):
    path = Path(path)
    result = parse_healthy_capture(base, path.read_text(encoding="utf-8-sig"))
    result.update(file=path.name, sha256=hashlib.sha256(path.read_bytes()).hexdigest())
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture", nargs="?", type=Path)
    parser.add_argument("--baseline", required=True, type=Path)
    parser.add_argument("--baseline-only", action="store_true")
    parser.add_argument("--output", type=Path, help="New JSON report; never overwrite")
    args = parser.parse_args()
    if args.baseline_only == (args.capture is not None):
        parser.error("Specify a capture, or --baseline-only without a capture")
    try:
        base = parse_baseline(args.baseline.read_text(encoding="utf-8-sig"))
        result = base if args.baseline_only else check_healthy_capture(base, args.capture)
        result = dict(result, source_baseline_file=args.baseline.name,
                      source_baseline_sha256=hashlib.sha256(args.baseline.read_bytes()).hexdigest())
        if args.output:
            with args.output.open("x", encoding="utf-8") as stream:
                json.dump(result, stream, indent=2)
                stream.write("\n")
        prefix = "HEALTHY_BASELINE_PASS" if args.baseline_only else "HEALTHY_PN_NUMERICAL_PASS"
        print(f"{prefix}: BASE_ID={base['baseline_id']} CRC32={base['crc32']}")
        if not args.baseline_only:
            print(f"SEQ={result['sequence']}; 1024 RAW words, 256 healthy-difference results exact")
        print("Text/arithmetic validation only; no distance or weak-reflection qualification.")
    except (OSError, ValueError, KeyError, TypeError, IndexError, struct.error) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
