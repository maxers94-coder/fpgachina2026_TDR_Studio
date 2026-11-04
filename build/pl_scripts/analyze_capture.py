"""Analyze Vivado ILA CSV (raw offset-binary ADC probes). Standard library only."""
import argparse
import cmath
import csv
import json
import math
from pathlib import Path


def fft(values):
    n = 1 << (len(values) - 1).bit_length()
    a = list(map(complex, values)) + [0j] * (n - len(values))
    j = 0
    for i in range(1, n):
        bit = n >> 1
        while j & bit:
            j ^= bit
            bit >>= 1
        j ^= bit
        if i < j:
            a[i], a[j] = a[j], a[i]
    width = 2
    while width <= n:
        root = cmath.exp(-2j * math.pi / width)
        for base in range(0, n, width):
            w = 1 + 0j
            for k in range(width // 2):
                u, v = a[base+k], w*a[base+k+width//2]
                a[base+k], a[base+k+width//2] = u+v, u-v
                w *= root
        width *= 2
    return a


def stats(codes, rate):
    mean = sum(codes) / len(codes)
    centered = [v-mean for v in codes]
    spectrum = fft([v*(0.5-0.5*math.cos(2*math.pi*i/(len(codes)-1)))
                    for i, v in enumerate(centered)])
    power = [abs(v)**2 for v in spectrum[:len(spectrum)//2+1]]
    k = max(range(1, len(power)), key=power.__getitem__)
    delta = 0.0
    if 1 < k < len(power)-1 and min(power[k-1:k+2]) > 0:
        left, mid, right = map(math.log, power[k-1:k+2])
        if left-2*mid+right:
            delta = max(-0.5, min(0.5, 0.5*(left-right)/(left-2*mid+right)))
    rms = math.sqrt(sum(v*v for v in centered)/len(codes))
    return dict(samples=len(codes), sample_rate_hz=rate, min_code=min(codes),
                max_code=max(codes), mean_code=mean, mean_signed=mean-8192,
                peak_to_peak_code=max(codes)-min(codes), ac_rms_code=rms,
                clipped_samples=sum(v in (0, 16383) for v in codes),
                fft_peak_hz=(k+delta)*rate/len(spectrum) if rms else None)


def read_capture(path, radix):
    rows = list(csv.reader(path.read_text(encoding='utf-8-sig').splitlines()))
    header_index = next((i for i, row in enumerate(rows)
                         if any('adc_rise_u14' in x for x in row)), None)
    if header_index is None:
        raise ValueError('CSV must include adc_rise_u14 and adc_fall_u14 raw probes')
    header = rows[header_index]

    def column(name, required=True):
        matches = [i for i, x in enumerate(header) if name in x]
        if len(matches) != 1:
            if not required and not matches:
                return None
            raise ValueError(f'Expected one column matching {name}, found {len(matches)}')
        return matches[0]

    cr, cf = column('adc_rise_u14'), column('adc_fall_u14')
    flags, counter = column('rx_flags', False), column('sample_word_count', False)
    bases = [16 if radix == 'hex' else 10] * len(header)
    rise, fall, counts = [], [], []
    for row in rows[header_index+1:]:
        if len(row) != len(header) or not any(row):
            continue
        if any('radix' in cell.lower() for cell in row):
            if radix == 'auto':
                for i, cell in enumerate(row):
                    cell = cell.lower()
                    bases[i] = 16 if 'hex' in cell else 2 if 'bin' in cell else 10
            continue

        def number(i):
            value = row[i].strip().replace('_', '')
            # In a HEX column, 0b00 is the ordinary ADC code 2816, not a
            # binary prefix. Honor the column radix before interpreting 0b.
            if value.lower().startswith('0x') or (
                    bases[i] != 16 and value.lower().startswith('0b')):
                return int(value, 0)
            return int(value, bases[i])

        try:
            if flags is not None and not (number(flags) & 1):
                continue
            r, f = number(cr), number(cf)
            if not (0 <= r <= 16383 and 0 <= f <= 16383):
                raise ValueError('Raw ADC codes outside 0..16383; check --radix')
            rise.append(r)
            fall.append(f)
            if counter is not None:
                counts.append(number(counter))
        except ValueError as exc:
            raise ValueError(f'Cannot parse CSV row {row}: {exc}') from exc
    if len(rise) < 32:
        raise ValueError('Need at least 32 valid words; capture continuously with rx_flags[0]=1')
    gaps = sum(((b-a) & 0xffffffff) != 1 for a, b in zip(counts, counts[1:]))
    return rise, fall, gaps, counter is not None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('csv', type=Path)
    parser.add_argument('--radix', choices=['auto', 'dec', 'hex'], default='auto',
                        help='auto reads Vivado radix row; otherwise assumes decimal')
    parser.add_argument('--order', choices=['rise-fall', 'fall-rise'], default='rise-fall')
    parser.add_argument('--expected-hz', type=float)
    parser.add_argument('--sample-rate', type=float, default=100e6,
                        help='Full ADC sample rate in Hz; default 100e6')
    parser.add_argument('--amplitude-reference', type=Path, help='Full-amplitude analysis JSON')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--check', action='store_true', help='Exit nonzero on failed checks')
    args = parser.parse_args()
    rise, fall, gaps, has_counter = read_capture(args.csv, args.radix)
    lanes = (rise, fall) if args.order == 'rise-fall' else (fall, rise)
    samples = [v for pair in zip(*lanes) for v in pair]
    result = dict(source=str(args.csv.resolve()), order=args.order,
                  word_counter_present=has_counter, discontinuous_word_steps=gaps,
                  rise=stats(rise, args.sample_rate/2), fall=stats(fall, args.sample_rate/2),
                  interleaved=stats(samples, args.sample_rate))
    checks = dict(no_clipping=result['interleaved']['clipped_samples'] == 0)
    if has_counter:
        checks['continuous_words'] = gaps == 0
    if args.expected_hz:
        actual = result['interleaved']['fft_peak_hz']
        result['frequency_relative_error'] = abs(actual/args.expected_hz-1) if actual else None
        checks['frequency_within_1_percent'] = bool(actual and result['frequency_relative_error'] <= 0.01)
    if args.amplitude_reference:
        previous = json.loads(args.amplitude_reference.read_text(encoding='utf-8'))
        denominator = previous['interleaved']['ac_rms_code']
        if denominator <= 0:
            raise ValueError('Reference AC RMS must be positive')
        result['amplitude_ratio'] = result['interleaved']['ac_rms_code']/denominator
        checks['half_amplitude_within_10_percent'] = 0.45 <= result['amplitude_ratio'] <= 0.55
    result['checks'] = checks
    target = args.output or args.csv.with_suffix('.analysis.json')
    target.write_text(json.dumps(result, indent=2, ensure_ascii=False)+'\n', encoding='utf-8')
    print(json.dumps(result, indent=2, ensure_ascii=False))
    print(f'Saved: {target.resolve()}')
    if args.check and not all(checks.values()):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
