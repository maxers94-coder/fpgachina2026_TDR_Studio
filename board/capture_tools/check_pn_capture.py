"""Validate PN RAW/CORR logs and compare all PL results to integer correlation."""
import argparse
from pathlib import Path
from check_raw_capture import fields, parse_log


def parse_correlations(text):
    begin = None
    values = []
    result = []
    for number, source_line in enumerate(text.splitlines(), 1):
        line = source_line.strip()
        try:
            if line.startswith("CORR_BEGIN,"):
                if begin is not None:
                    raise ValueError("Nested CORR_BEGIN")
                begin = fields(line)
                expected = {"COUNT": "256", "FORMAT": "Q16", "MODE": "PN127", "CALIBRATED": "0"}
                if any(begin.get(k) != v for k, v in expected.items()):
                    raise ValueError("Unsupported correlation metadata")
                sequence = int(begin["SEQ"])
                if not 0 <= sequence <= 0xffffffff:
                    raise ValueError("Invalid sequence")
                values = []
            elif line.startswith("CORR,"):
                if begin is None:
                    raise ValueError("CORR row outside capture")
                _, index, hi, lo = line.split(",")
                if int(index) != len(values) or len(values) >= 256:
                    raise ValueError("Duplicate/missing/out-of-order correlation index")
                if len(hi) != 8 or len(lo) != 8:
                    raise ValueError("Expected two 32-bit hex words")
                word = (int(hi, 16) << 32) | int(lo, 16)
                if not 0 <= word < 1 << 64:
                    raise ValueError("Invalid 64-bit word")
                values.append(word - (1 << 64) if word & (1 << 63) else word)
            elif line.startswith("CORR_END,"):
                if begin is None:
                    raise ValueError("CORR_END without CORR_BEGIN")
                end = fields(line)
                if len(values) != 256 or end["COUNT"] != "256" or int(end["SEQ"]) != int(begin["SEQ"]):
                    raise ValueError("Truncated or mismatched correlation capture")
                hash_value = 2166136261
                for value in values:
                    for byte in (value & ((1 << 64) - 1)).to_bytes(8, "little"):
                        hash_value = ((hash_value ^ byte) * 16777619) & 0xffffffff
                if hash_value != int(end["FNV1A"], 16):
                    raise ValueError("Correlation checksum mismatch")
                result.append((int(begin["SEQ"]), values))
                begin = None
        except (KeyError, ValueError) as exc:
            raise ValueError(f"Line {number}: {exc}") from exc
    if begin is not None or not result:
        raise ValueError("No complete CORR capture")
    return result


def digital_template():
    # Independent recurrence b[n+7] = b[n] XOR b[n+1], seven initial ones.
    bits = [1] * 7
    for n in range(120):
        bits.append(bits[n] ^ bits[n + 1])
    return [0] * 128 + [16384 if b else -16384 for b in bits for _ in range(4)] + [0] * 4


def check_pair(capture, correlation):
    seq, observed = correlation
    if capture.waveform != "PN127" or capture.sequence != seq:
        raise ValueError("RAW/CORR must be the same PN measurement (same boot and SEQ)")
    template = digital_template()
    expected = [sum((capture.samples[lag + tap] - 566) * coefficient
                    for tap, coefficient in enumerate(template)) for lag in range(256)]
    mismatches = [lag for lag in range(256) if observed[lag] != expected[lag]]
    if mismatches:
        lag = mismatches[0]
        raise ValueError(f"PL/PC arithmetic mismatch at {lag}: PL={observed[lag]}, PC={expected[lag]}")
    return max(range(256), key=lambda k: abs(observed[k]))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("raw_log", type=Path)
    parser.add_argument("--corr-log", type=Path, help="Defaults to same file; do not mix boots")
    args = parser.parse_args()
    try:
        raw_text = args.raw_log.read_text(encoding="utf-8-sig", errors="replace")
        corr_text = (args.corr_log or args.raw_log).read_text(encoding="utf-8-sig", errors="replace")
        raw = parse_log(raw_text)[-1]
        corr = parse_correlations(corr_text)[-1]
        peak = check_pair(raw, corr)
        print(f"PN_NUMERICAL_PASS: SEQ={raw.sequence}, 1024 raw points, 256 signed results exact; peak lag={peak}")
        print("Digital-template diagnostic only. No calibrated PN distance or weak-impedance verdict.")
    except (OSError, ValueError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
