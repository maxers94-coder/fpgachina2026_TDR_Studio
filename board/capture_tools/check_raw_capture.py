"""Validate Stage16 UART logs before exporting Q2 samples. Standard library only."""
import argparse
import csv
from dataclasses import dataclass
from pathlib import Path


@dataclass
class Capture:
    sequence: int
    samples: list[int]
    waveform: str = "5"


def fields(line):
    result = {}
    for token in line.split(",")[1:]:
        key, value = token.split("=", 1)
        if key in result:
            raise ValueError(f"Duplicate metadata field: {key}")
        result[key] = value
    return result


def fnv1a(samples):
    result = 2166136261
    for sample in samples:
        word = sample & 0xffff
        for byte in (word & 255, word >> 8):
            result = ((result ^ byte) * 16777619) & 0xffffffff
    return result


def parse_log(text):
    captures = []
    begin = None
    samples = []
    for number, source_line in enumerate(text.splitlines(), 1):
        line = source_line.strip()
        try:
            if line.startswith("RAW_BEGIN,"):
                if begin is not None:
                    raise ValueError("New RAW_BEGIN before previous RAW_END")
                begin = fields(line)
                expected = {"COUNT": "1024", "FORMAT": "Q2",
                            "FRAMES": "32", "FS_HZ": "200000000"}
                if (any(begin.get(k) != v for k, v in expected.items()) or
                        begin.get("MODE") not in ("5", "2", "PN127")):
                    raise ValueError("Unexpected capture format/mode/rate/count")
                sequence = int(begin["SEQ"])
                if not 0 <= sequence <= 0xffffffff:
                    raise ValueError("Invalid measurement sequence")
                samples = []
            elif line.startswith("RAW,"):
                if begin is None:
                    raise ValueError("Sample outside RAW_BEGIN/RAW_END")
                _, index, value = line.split(",")
                if int(index) != len(samples) or len(samples) >= 1024:
                    raise ValueError("Missing, duplicate or out-of-order sample")
                sample = int(value)
                if not -32768 <= sample <= 32767:
                    raise ValueError("Q2 sample is outside signed int16 range")
                samples.append(sample)
            elif line.startswith("RAW_END,"):
                if begin is None:
                    raise ValueError("RAW_END without RAW_BEGIN")
                end = fields(line)
                if len(samples) != 1024 or end["COUNT"] != "1024":
                    raise ValueError("Incomplete 1024-point capture")
                if int(end["SEQ"]) != int(begin["SEQ"]):
                    raise ValueError("Measurement sequence mismatch")
                expected = {"SUM": sum(samples), "MIN": min(samples),
                            "MAX": max(samples)}
                if any(int(end[k]) != v for k, v in expected.items()):
                    raise ValueError("Sum/min/max mismatch")
                if int(end["FNV1A"], 16) != fnv1a(samples):
                    raise ValueError("Sample checksum mismatch")
                captures.append(Capture(int(begin["SEQ"]), samples, begin["MODE"]))
                begin = None
        except (ValueError, KeyError) as exc:
            raise ValueError(f"Line {number}: {exc}") from exc
    if begin is not None:
        raise ValueError("Truncated log: missing RAW_END")
    if not captures:
        raise ValueError("No complete RAW_BEGIN..RAW_END capture. Save received serial TEXT; use P then R for PN, or L then R for Mode5. A numeric value-column export is not a UART text log.")
    return captures


def read_captures(path):
    return parse_log(Path(path).read_text(encoding="utf-8-sig", errors="replace"))


def centered(samples):
    dc = sum(samples[400:1000]) / 600.0
    return dc, [value - dc for value in samples]


def compare(a, b):
    """Remove DC using the same 400..999 window as the current locator."""
    dc_a, ca = centered(a)
    dc_b, cb = centered(b)
    difference = [x - y for x, y in zip(ca, cb)]
    rms = (sum(v * v for v in difference) / len(difference)) ** 0.5
    peak = max(abs(v) for v in difference)
    ea = sum(v * v for v in ca)
    eb = sum(v * v for v in cb)
    similarity = sum(x * y for x, y in zip(ca, cb)) / (ea * eb) ** 0.5 if ea and eb else None
    return dc_a, dc_b, rms, peak, similarity


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("log", type=Path, help="Serial log containing complete RAW_BEGIN..RAW_END")
    parser.add_argument("--label", default="unspecified", help="Physical condition supplied by operator")
    parser.add_argument("--output", type=Path, help="New CSV path (existing files are never overwritten)")
    parser.add_argument("--compare", type=Path, help="Compare last valid capture with another serial log")
    args = parser.parse_args()
    try:
        captures = read_captures(args.log)
        other = read_captures(args.compare)[-1] if args.compare else None
        if other and other.waveform != captures[-1].waveform:
            raise ValueError("Cannot compare captures from different waveform modes")
        output = args.output or args.log.with_suffix(".raw.csv")
        # All records are validated BEFORE creating the output file.
        with output.open("x", newline="", encoding="utf-8-sig") as stream:
            writer = csv.writer(stream)
            writer.writerow(["capture", "sequence", "mode", "operator_label", "index", "q2", "adc_code"])
            for capture_index, capture in enumerate(captures, 1):
                for index, value in enumerate(capture.samples):
                    writer.writerow([capture_index, capture.sequence, capture.waveform, args.label, index, value, value / 4.0])
        print(f"VALIDATED: {len(captures)} complete capture(s). CSV: {output}")
        for capture in captures:
            dc, _ = centered(capture.samples)
            print(f"SEQ={capture.sequence}, DC_Q2={dc:.3f}, MIN={min(capture.samples)}, MAX={max(capture.samples)}")
        if other:
            dc_a, dc_b, rms, peak, similarity = compare(captures[-1].samples, other.samples)
            print(f"DC-centered comparison: current_DC={dc_a:.3f}, other_DC={dc_b:.3f}, "
                  f"RMS_difference_Q2={rms:.3f}, MAX_difference_Q2={peak:.3f}, similarity={similarity}")
        print("Data integrity only: does not certify a 50-ohm termination, fault classification or distance accuracy.")
    except (ValueError, OSError) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
