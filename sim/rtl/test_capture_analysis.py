"""Check ILA CSV decoding, sample rate, frequency and amplitude numerically."""
import csv
import math
from pathlib import Path
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'scripts'))
from analyze_capture import read_capture, stats


with tempfile.TemporaryDirectory() as temporary:
    root = Path(temporary)
    for frequency in (5e6, 10e6, 20e6):
        codes = [round(8192+2000*math.sin(2*math.pi*frequency*i/100e6)) for i in range(8192)]
        half = [round(8192+(x-8192)/2) for x in codes]
        filename = root / 'vivado_hex.csv'
        with filename.open('w', newline='') as stream:
            writer = csv.writer(stream)
            writer.writerow(['Sample in Buffer', 'adc_rise_u14[13:0]', 'adc_fall_u14[13:0]',
                             'rx_flags[7:0]', 'sample_word_count[31:0]'])
            writer.writerow(['Radix - UNSIGNED', 'HEX', 'HEX', 'HEX', 'HEX'])
            for i in range(4096):
                writer.writerow([i, f'{codes[2*i]:04x}', f'{codes[2*i+1]:04x}',
                                 '07', f'{(0xfffff800+i)&0xffffffff:08x}'])
        rise, fall, gaps, present = read_capture(filename, 'auto')
        assert rise == codes[::2] and fall == codes[1::2] and gaps == 0 and present
        measured = stats([v for pair in zip(rise, fall) for v in pair], 100e6)
        assert abs(measured['fft_peak_hz']/frequency-1) < .001, measured
        assert .499 < stats(half, 100e6)['ac_rms_code']/measured['ac_rms_code'] < .501
        # A finite window need not contain an integer number of sine periods.
        assert abs(measured['mean_code']-8192) < 10
    assert stats([8192]*128, 100e6)['fft_peak_hz'] is None
    assert stats([8192]*128, 100e6)['ac_rms_code'] == 0
    rows = filename.read_text().splitlines()
    filename.write_text('\n'.join(rows[:12]+rows[13:])+'\n')
    assert read_capture(filename, 'auto')[2] == 1
    # Bare HEX values beginning with 0b must not be mistaken for binary.
    # Explicit binary prefixes remain accepted for BIN and default columns.
    for column_radix, encoded, expected in (
        ('HEX', ['0b00', '0b01', '0b10', '0b11', '0bcd', '0x0bcd'],
         [2816, 2817, 2832, 2833, 3021, 3021]),
        ('BIN', ['0b101010', '101011'], [42, 43]),
        (None, ['0b101010', '43'], [42, 43]),
    ):
        with filename.open('w', newline='') as stream:
            writer = csv.writer(stream)
            writer.writerow(['Sample in Buffer', 'adc_rise_u14', 'adc_fall_u14'])
            if column_radix:
                writer.writerow(['Radix - UNSIGNED', column_radix, column_radix])
            for i in range(32):
                value = encoded[i % len(encoded)]
                writer.writerow([i, value, value])
        rise, fall, _, _ = read_capture(filename, 'auto')
        assert rise == fall == [expected[i % len(expected)] for i in range(32)]
print('PASS: Vivado HEX/BIN CSV including 0b HEX codes, counter wrap/gaps, '
      '5/10/20 MHz, half amplitude and zero baseline')
