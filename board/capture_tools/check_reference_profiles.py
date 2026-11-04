"""Independently check Stage25 fixed-profile B admission; no phase/gain fitting."""
import hashlib
import json
from pathlib import Path
import struct
import zlib

from check_raw_capture import fields, parse_log
from check_pn_capture import digital_template, parse_correlations, check_pair

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_BANK = ROOT / "captures/calibration/pn_reference_guard_profiles_v1_20261030.json"
GATE = 208916480
DEN = 384
BANK_CRC32 = "02FEEBDD"
BANK_BYTES_SHA256 = "db4803b0e8ce376106c114b2241dce04cda200637158d69c89bda723afb6696f"


def load_profiles(path=None, verify_sources=False):
    path = Path(path) if path else DEFAULT_BANK
    bank = json.loads(path.read_text(encoding="utf-8-sig"))
    if (bank["schema"] != "ECHO_REFERENCE_GUARD_PROFILES_1" or bank["profile_count"] != 2 or
            bank["reference_count"] != 3 or bank["pretrigger_count"] != 128 or
            bank["raw_count"] != 1024 or bank["correlation_count"] != 256 or
            bank["gate_q16"] != GATE or bank["denominator"] != DEN or
            bank["comparison"] != "strict_less_than"):
        raise ValueError("Unsupported fixed reference bank")
    if bank["bank_crc32"] != BANK_CRC32 or bank["bank_bytes_sha256"] != BANK_BYTES_SHA256:
        raise ValueError("Fixed reference bank identity changed")
    if [p["id"] for p in bank["profiles"]] != [1, 2]:
        raise ValueError("Profile count/order differs from the checked bank")
    encoded = bytearray()
    template = digital_template()
    for profile in bank["profiles"]:
        sums, correlations = profile["raw_q2_sum"], profile["correlation_q16_sum"]
        if (profile["reference_count"] != 3 or len(sums) != 1024 or len(correlations) != 256 or
                any(type(x) is not int or not -98304 <= x <= 98301 for x in sums)):
            raise ValueError("Invalid reference sums/counts")
        if sum(sums[:128]) != profile["pretrigger_sum_q2"]:
            raise ValueError("Reference pretrigger sum mismatch")
        expected = [sum((sums[k+i]-3*566)*template[i] for i in range(640)) for k in range(256)]
        if expected != correlations:
            raise ValueError("Reference correlation sums do not follow the stored RAW sources")
        encoded.extend(struct.pack("<Ii", 3, profile["pretrigger_sum_q2"]))
        encoded.extend(struct.pack("<256q", *correlations))
        if verify_sources:
            sources = []
            corr_sources = []
            if len(profile["source_runs"]) != 3:
                raise ValueError("Expected three explicit source files")
            for entry in profile["source_runs"]:
                relative = Path(entry["file"])
                if relative.is_absolute() or ".." in relative.parts:
                    raise ValueError("Invalid reference source path")
                source = ROOT / relative
                if hashlib.sha256(source.read_bytes()).hexdigest() != entry["sha256"]:
                    raise ValueError("Reference source hash changed")
                text = source.read_text(encoding="utf-8-sig")
                raws, corrs = parse_log(text), parse_correlations(text)
                if len(raws) != 1 or len(corrs) != 1 or raws[0].sequence != entry["sequence"]:
                    raise ValueError("Reference source sequence/count mismatch")
                check_pair(raws[0], corrs[0])
                sources.append(raws[0].samples)
                corr_sources.append(corrs[0][1])
            if [sum(x) for x in zip(*sources)] != sums or [sum(x) for x in zip(*corr_sources)] != correlations:
                raise ValueError("Reference sums differ from the frozen sources")
    crc = f"{zlib.crc32(encoded) & 0xffffffff:08X}"
    if len(encoded) != 4112 or crc != BANK_CRC32:
        raise ValueError("Reference bank CRC/length mismatch")
    if hashlib.sha256(encoded).hexdigest() != BANK_BYTES_SHA256:
        raise ValueError("Reference bank byte hash mismatch")
    return bank


def evaluate_profiles(raw, corr=None, bank=None):
    bank = load_profiles() if bank is None else bank
    if len(raw) != 1024 or any(type(x) is not int or not -32768 <= x <= 32767 for x in raw):
        raise ValueError("Invalid PN RAW input")
    if corr is None:
        template = digital_template()
        corr = [sum((raw[k+i]-566)*template[i] for i in range(640)) for k in range(256)]
    limit = 640*65535*32768
    if len(corr) != 256 or any(type(x) is not int or abs(x) > limit for x in corr):
        raise ValueError("Invalid PN correlation input")
    mask, peaks = 0, []
    for index, profile in enumerate(bank["profiles"]):
        dc = 3*sum(raw[:128])-profile["pretrigger_sum_q2"]
        peak = max(abs((3*value-total)*128-dc*65536)
                   for value, total in zip(corr, profile["correlation_q16_sum"]))
        peaks.append(peak)
        if peak < GATE*DEN:
            mask |= 1 << index
    return {"matched_mask": mask, "peak_numerators": peaks, "denominator": DEN,
            "gate_q16": GATE, "bank_crc32": bank["bank_crc32"]}


def parse_profile_baseline(text):
    # Import only after check_healthy_pn has loaded, avoiding a dispatch cycle.
    from check_healthy_pn import _lines, _matching, _u32, _hex32, _expected, _trace_measurement, _crc
    lines = _lines(text)
    if any(line.startswith(("CORR", "DCORR", "PN_DIFF_RESULT,")) for line in lines):
        raise ValueError("Mixed correlation protocol in profile baseline")
    bank = load_profiles()
    start = _matching(lines, "[BASE] START:", 1)[0][0]
    passed = _matching(lines, "[BASE] PASS:", 1)[0][0]
    ready_at, ready_line = _matching(lines, "BASE_READY,", 1)[0]
    begin_at, begin_line = _matching(lines, "BASE_BEGIN,", 1)[0]
    end_at, end_line = _matching(lines, "BASE_END,", 1)[0]
    if not start < ready_at < passed < begin_at < end_at:
        raise ValueError("B/J records out of order")
    begin, end, ready = map(fields, (begin_line, end_line, ready_line))
    _expected(begin, {"COUNT": "1024", "FORMAT": "Q2", "REF_N": "3", "VOLATILE": "1"}, "Invalid baseline format")
    _expected(end, {"COUNT": "1024"}, "Invalid baseline footer")
    _expected(ready, {"REF_N": "3"}, "Invalid reference count")
    baseline_id = _u32(begin["ID"], "baseline ID", nonzero=True)
    crc = _hex32(begin["CRC32"])
    if (int(end["ID"]) != baseline_id or int(ready["BASE_ID"]) != baseline_id or
            _hex32(end["CRC32"]) != crc or _hex32(ready["CRC32"]) != crc):
        raise ValueError("Baseline ID/CRC mismatch")
    first, last = (_u32(begin[key], key) for key in ("FIRST_SEQ", "LAST_SEQ"))
    if int(ready["FIRST_SEQ"]) != first or int(ready["LAST_SEQ"]) != last or last != (first+2) % (1 << 32):
        raise ValueError("Source sequence interval mismatch")
    rows = _matching(lines, "BASE,", 1024)
    samples = []
    for index, (at, line) in enumerate(rows):
        _, address, value = line.split(",")
        value = int(value)
        if int(address) != index or not begin_at < at < end_at or not -32768 <= value <= 32767:
            raise ValueError("Invalid baseline word/index")
        samples.append(value)
    if _crc(samples) != crc:
        raise ValueError("Baseline CRC mismatch")
    raw = parse_log(text)
    if len(raw) != 3 or any(frame.waveform != "PN127" for frame in raw):
        raise ValueError("Expected three PN source frames")
    sequences = [frame.sequence for frame in raw]
    if sequences != [(first+i) % (1 << 32) for i in range(3)]:
        raise ValueError("Source RAW sequences mismatch")
    raw_begins, raw_ends = _matching(lines, "RAW_BEGIN,", 3), _matching(lines, "RAW_END,", 3)
    traces, measures, tx_begins, tx_ends = _trace_measurement(lines, 3, sequences)
    results, distances, guards = (_matching(lines, prefix, 3) for prefix in ("PN_RESULT,", "PN_DISTANCE,", "BASE_GUARD,"))
    common_mask, guard_sources = 3, []
    template = digital_template()
    for i, frame in enumerate(raw):
        meta = fields(raw_begins[i][1])
        if any(key in meta for key in ("PROC", "BASE_ID", "BASE_CRC")):
            raise ValueError("B source must remain a PN RAW frame")
        _expected(fields(distances[i][1]), {"MODEL": "1", "DIAGNOSTIC": "1"}, "Invalid legacy diagnostic metadata")
        if not (start < tx_begins[i][0] < traces[i][0] < results[i][0] < distances[i][0] <
                measures[i][0] < tx_ends[i][0] < guards[i][0] < raw_begins[i][0] < raw_ends[i][0] < ready_at):
            raise ValueError("B source/guard records out of order")
        if i and raw_ends[i-1][0] >= tx_begins[i][0]:
            raise ValueError("B sources overlap")
        corr = [sum((frame.samples[k+j]-566)*template[j] for j in range(640)) for k in range(256)]
        peak = max(range(256), key=lambda k: abs(corr[k]))
        word = corr[peak] & ((1 << 64)-1)
        result = fields(results[i][1])
        _expected(result, {"PEAK_LAG": str(peak), "SIGN": str((corr[peak] > 0)-(corr[peak] < 0)),
                           "HI": f"{word >> 32:08X}", "LO": f"{word & 0xffffffff:08X}", "CALIBRATED": "0"}, "Source PN summary disagrees with RAW")
        expected = evaluate_profiles(frame.samples, corr, bank)
        guard = fields(guards[i][1])
        _expected(guard, {"SEQ": str(frame.sequence), "VERSION": "1", "MASK": str(expected["matched_mask"]),
                          "P1_MAX_NUM": str(expected["peak_numerators"][0]), "P2_MAX_NUM": str(expected["peak_numerators"][1]),
                          "DEN": str(DEN), "GATE_Q16": str(GATE), "BANK_CRC32": bank["bank_crc32"]}, "Admission record disagrees with RAW/reference bank")
        common_mask &= expected["matched_mask"]
        guard_sources.append({"sequence": frame.sequence, **expected})
    if not common_mask:
        raise ValueError("No common compatible reference across three sources")
    profile_id = 1 if common_mask & 1 else 2
    identity = {"GUARD_VERSION": "1", "PROFILE_ID": str(profile_id), "PROFILE_MASK": str(common_mask),
                "BANK_CRC32": bank["bank_crc32"]}
    for meta in (begin, ready, end):
        _expected(meta, identity, "Reference profile identity differs from admitted sources")
    mean = []
    for words in zip(*(frame.samples for frame in raw)):
        total = sum(words)
        value = (abs(total)+1)//3
        mean.append(-value if total < 0 else value)
    if samples != mean:
        raise ValueError("Stored table is not the signed nearest three-source mean")
    return {"schema": "HEALTHY_BASELINE_CHECK_1", "baseline_id": baseline_id,
            "crc32": f"{crc:08X}", "reference_count": 3, "samples_q2": samples,
            "first_sequence": first, "last_sequence": last, "source_raw_sequences": sequences,
            "source_raw_integrity": "ALL_3_PASS", "mean_quantization": "signed_nearest_divide_3",
            "provenance_verified": True, "distance_valid": False,
            "guard_version": 1, "reference_profile_id": profile_id, "reference_profile_mask": common_mask,
            "reference_bank_crc32": bank["bank_crc32"], "reference_guard_sources": guard_sources,
            "qualification": "B/J data and fixed-profile compatibility verified; explicit operator Normal declaration, not physical health or weak-fault certification."}
