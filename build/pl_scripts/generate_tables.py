"""Regenerate checked-in DDS/clock ROMs; Python standard library only."""
import argparse
import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
# Supplied FMCADDA K7 demo, ad9516_spi_wr_config.v, WR_STA_0..75.
# 10 MHz onboard TCXO -> 200 MHz ADC clock / 200 MHz DAC REFCLK.
# Divider 4.1 remains /2 and Divider 4.2 is bypassed by 0x1A1[5]=1.
# The official AD9516 guidance recommends using X.1 and bypassing X.2 for /2.
CLOCK_WORDS = """
000018 000100 000210 000343 000400 00107c 001101 001200
001308 00140c 001500 001605 0017b4 001807 001900 001a45
001bed 001c02 001d0a 001e00 001f0e 00a001 00a100 00a200
00a301 00a400 00a500 00a601 00a700 00a800 00a901 00aa00
00ab00 00f00a 00f10a 00f20a 00f30a 00f40a 00f50a 014003
014146 014246 014346 019000 019180 019200 019300 019480
019500 019600 019780 019802 019900 019a00 019b11 019c20
019d00 019e00 019f00 01a000 01a120 01a200 01a300 01e003
01e102 023000 023100 023200 001806 023201 001807 023201
023001 023201 023000 023201
""".split()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--amplitude", type=int, default=8192)
    args = parser.parse_args()
    if not 1 <= args.amplitude <= 30000:
        parser.error("amplitude must be 1..30000; inverse sinc requires headroom")
    assert len(CLOCK_WORDS) == 76
    (ROOT / "rtl/ad9516_adc200m_dacref200m.mem").write_text("\n".join(CLOCK_WORDS) + "\n", encoding="ascii")
    samples = [round(args.amplitude * math.sin(2 * math.pi * n / 1024)) for n in range(1024)]
    (ROOT / "rtl/sine_q15.mem").write_text("\n".join(f"{n & 0xffff:04x}" for n in samples) + "\n", encoding="ascii")
    metadata = {"dci_hz": 100_000_000, "adc_dco_hz": 100_000_000, "phase_step": 429496730,
                "frequency_hz": 100_000_000 * 429496730 / 2**32,
                "lut_samples": 1024, "peak_code": args.amplitude,
                "clock_words": len(CLOCK_WORDS)}
    (ROOT / "reports/waveform.json").write_text(json.dumps(metadata, indent=2) + "\n", encoding="ascii")
    print(json.dumps(metadata))


if __name__ == "__main__":
    main()
