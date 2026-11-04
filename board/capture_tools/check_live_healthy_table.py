"""Check a fresh J table against an unchanged, provenance-checked B/J source.

The original three acquisition records are reused only to verify the reference;
they are not new measurements. This tool never creates a baseline or accesses
the serial port, firmware, or hardware.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from check_healthy_pn import parse_baseline


def compare_live_table(baseline_text, live_table_text):
    original = parse_baseline(baseline_text)
    source_lines = baseline_text.splitlines(keepends=True)
    table_at = [i for i, line in enumerate(source_lines) if line.strip().startswith("BASE_BEGIN,")]
    if len(table_at) != 1:
        raise ValueError("Expected one original BASE_BEGIN")
    prefix = "".join(source_lines[:table_at[0]])
    # Re-run the existing complete B/J validator against the original B sources
    # and current J. Any new RAW/acquisition records in J also fail its counts.
    current = parse_baseline(prefix + "\n" + live_table_text)
    if current != original:
        raise ValueError("Live table, baseline ID/CRC or source sequence metadata changed")
    return {
        "schema": "LIVE_HEALTHY_TABLE_CHECK_1", "status": "PASS",
        "baseline_id": original["baseline_id"], "crc32": original["crc32"],
        "first_sequence": original["first_sequence"], "last_sequence": original["last_sequence"],
        "source_raw_sequences": original["source_raw_sequences"],
        "table_word_count": len(original["samples_q2"]),
        "live_matches_reference_table": True, "new_baseline_acquisitions": 0,
        "qualification": "Fresh J equals the saved B/J table, ID, CRC and source metadata; no physical-health or distance qualification.",
    }


def check_live_table(baseline_path, live_table_path):
    baseline_path, live_table_path = Path(baseline_path), Path(live_table_path)
    original_bytes, live_bytes = baseline_path.read_bytes(), live_table_path.read_bytes()
    result = compare_live_table(original_bytes.decode("utf-8-sig"), live_bytes.decode("utf-8-sig"))
    result.update(source_baseline_file=baseline_path.name,
                  source_baseline_sha256=hashlib.sha256(original_bytes).hexdigest(),
                  live_table_file=live_table_path.name,
                  live_table_sha256=hashlib.sha256(live_bytes).hexdigest())
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("live_table", type=Path)
    parser.add_argument("--baseline", required=True, type=Path)
    parser.add_argument("--output", type=Path, help="New JSON file; never overwrite")
    args = parser.parse_args()
    try:
        result = check_live_table(args.baseline, args.live_table)
        if args.output:
            with args.output.open("x", encoding="utf-8") as stream:
                json.dump(result, stream, indent=2)
                stream.write("\n")
        print(f"LIVE_HEALTHY_TABLE_PASS: BASE_ID={result['baseline_id']} CRC32={result['crc32']} ALL_1024_EXACT")
    except (OSError, ValueError, KeyError, TypeError, IndexError, struct.error) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
