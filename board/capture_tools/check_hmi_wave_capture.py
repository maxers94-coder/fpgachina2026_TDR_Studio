"""Recompute Stage21 drawing copies from coherent RAW and healthy DCORR logs.

The pixel checksum proves the drawing buffer and addt handshake recorded by PS,
not the physical appearance of the LCD. Visual board acceptance stays separate.
"""
import argparse
import hashlib
import json
from pathlib import Path

from check_raw_capture import fields, parse_log
from check_pn_capture import parse_correlations
from check_healthy_pn import parse_baseline, parse_healthy_capture


KINDS = {"AVG32": 0, "DIFF": 1, "CORR": 2}


def byte_fnv(values):
    result = 2166136261
    for value in values:
        result = ((result ^ value) * 16777619) & 0xffffffff
    return result


def render_reference(raw, baseline, corr, waveform, kind, page, zoom):
    if len(raw) != 1024 or page not in (0, 1) or kind not in (0, 1, 2) or zoom not in (0, 1):
        raise ValueError("Invalid drawing configuration")
    if kind and (waveform != 3 or baseline is None or len(baseline) != 1024):
        raise ValueError("Healthy D data are required for difference/correlation")
    if kind == 2 and (corr is None or len(corr) != 256):
        raise ValueError("Need all 256 healthy correlations")
    dc = sum(x-y for x, y in zip(raw[:128], baseline[:128])) if kind else 0
    if kind == 0:
        values = list(raw)
    elif kind == 1:
        values = [128*(x-y)-dc for x, y in zip(raw, baseline)]
    else:
        limit = 640*65535*32768
        if any(abs(value) > limit for value in corr):
            raise ValueError("Correlation outside the hardware arithmetic bound")
        values = [128*x-dc*65536 for x in corr]
    first, count = 0, len(values)
    if zoom:
        first = 96
        count = 128 if kind == 2 else 608 if waveform in (1, 3) else 160
    values = values[first:first+count]
    width, height = ((512, 224), (768, 240))[page]
    zero, radius = height//2, height//2-4
    denominator = 1 if kind == 0 else 128
    scale = (2048, 1024, 2147483648)[kind]*denominator
    while max(map(abs, values)) > scale:
        scale *= 2
    selected = []
    if count > width:
        for i in range(width//2):
            chunk = values[i*count//(width//2):(i+1)*count//(width//2)]
            extremes = sorted(((chunk.index(min(chunk)), min(chunk)),
                               (chunk.index(max(chunk)), max(chunk))))
            selected.extend(value for _, value in extremes)
    else:
        selected = [values[i*(count-1)//(width-1)] for i in range(width)]
    pixels = [zero + (1 if value >= 0 else -1)*((abs(value)*radius+scale//2)//scale)
              for value in selected]
    return {"pixels": pixels, "first": first, "source_count": count,
            "scale": scale//denominator, "zero": zero, "width": width,
            "fnv1a": f"{byte_fnv(pixels):08X}", "envelope": count > width}


def check_plot_capture(path, baseline_path=None):
    path = Path(path)
    text = path.read_text(encoding="utf-8-sig")
    if any(word in text for word in ("WAVE_ERROR:", "LCD error", "FAILED:", "DENIED", "[STOP]")):
        raise ValueError("Capture reports a device/display failure")
    raws = parse_log(text)
    if len(raws) != 1:
        raise ValueError("Need one coherent measurement per plot capture")
    raw = raws[0]
    header = fields(next(line for line in text.splitlines() if line.startswith("RAW_BEGIN,")))
    healthy = header.get("PROC") == "HEALTHY_DIFF"
    base = None
    corr = None
    if healthy:
        if baseline_path is None:
            raise ValueError("Healthy baseline file required")
        base = parse_baseline(Path(baseline_path).read_text(encoding="utf-8-sig"))
        parse_healthy_capture(base, text)
        corr = parse_correlations("\n".join(line[1:] if line.startswith("DCORR") else line
                                           for line in text.splitlines()))[0][1]
    waveform = 3 if healthy else 1 if raw.waveform == "PN127" else 2 if raw.waveform == "2" else 0
    plots = [fields(line) for line in text.splitlines() if line.startswith("HMI_PLOT,")]
    plots = [p for p in plots if int(p["SEQ"]) == raw.sequence]
    if not plots:
        raise ValueError("No confirmed plot for this measurement sequence")
    checked = []
    for p in plots:
        kind = KINDS[p["KIND"]]
        page = int(p["PAGE"])
        first = int(p["FIRST"])
        if first not in (0, 96):
            raise ValueError("Unknown drawing window")
        ref = render_reference(raw.samples, base["samples_q2"] if base else None,
                               corr, waveform, kind, page, int(first == 96))
        expected = {"N": str(ref["width"]), "COUNT": str(ref["source_count"]),
                    "SCALE": str(ref["scale"]), "ZERO": str(ref["zero"]),
                    "READY": "1", "DONE": "1", "FNV1A": ref["fnv1a"],
                    "BASE_ID": str(base["baseline_id"] if kind else 0),
                    "BASE_CRC": base["crc32"] if kind else "00000000"}
        if any(p.get(key) != value for key, value in expected.items()):
            raise ValueError("Plot metadata/pixel checksum disagrees with the cached data")
        checked.append(dict(p, pixels_recomputed=ref["width"],
                            pixel_checksum="PASS", envelope=ref["envelope"]))
    return {"schema": "HMI_WAVE_CAPTURE_CHECK_1", "sequence": raw.sequence,
            "file": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
            "plots": checked, "drawing_arithmetic": "ALL_PIXELS_EXACT",
            "new_acquisition_for_view_change": False, "lcd_visual_verified": False,
            "qualification": "Coherent RAW/DCORR, PS pixel checksum and FE/FD completion; LCD visual check is separate."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture", type=Path)
    parser.add_argument("--baseline", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    try:
        result = check_plot_capture(args.capture, args.baseline)
        if args.output:
            with args.output.open("x", encoding="utf-8") as f:
                json.dump(result, f, indent=2)
                f.write("\n")
        print(f"HMI_WAVE_PASS: SEQ={result['sequence']}; all drawing pixels/checksums exact")
    except (OSError, ValueError, KeyError, TypeError, IndexError, StopIteration) as exc:
        parser.exit(1, f"REJECTED: {exc}\n")


if __name__ == "__main__":
    main()
