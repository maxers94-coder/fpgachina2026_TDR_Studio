"""Verify two fresh-reference D1k batches and describe their measured lag change.

Known positions label the comparison; they never choose a peak or configure
the firmware. This tool does not deploy a distance model or classify faults.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import tempfile
from zipfile import ZipFile

from analyze_pn_weak_d_fresh_development import analyze, hardware
from check_healthy_pn import parse_baseline, check_healthy_capture
from check_hmi_wave_capture import check_plot_capture
from check_live_healthy_table import check_live_table
from check_raw_capture import fields

ROOT = Path(__file__).resolve().parents[1]
STATES = ('reference_before', 'sample_D1K', 'reference_after')
PHASES = (('position_5m', 5, 15), ('position_15m', 15, 5))


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))


def verify_transcript(folder):
    rows = []
    for line in (folder / 'serial_transcript.txt').read_text(encoding='utf-8-sig').splitlines():
        stamp, direction, payload = line.split('\t', 2)
        require(direction in ('TX', 'RX'), 'Invalid transcript direction')
        rows.append((float(stamp), direction, payload))
    require(all(a[0] <= b[0] for a, b in zip(rows, rows[1:])), 'Transcript clock reversed')
    commands = [r[2] for r in rows if r[1] == 'TX']
    expected = ['V', 'B', 'J'] + sum((['V', 'J'] + ['D', 'R', 'C'] * 3 for _ in STATES), []) + ['J', 'V']
    # The shared collector permits one read-only V retry if its header was
    # obscured. Keep the original failed response, and never retry B or D.
    clean_rows, retries = [], 0
    index = 0
    while index < len(rows):
        row = rows[index]
        if row[1:] == ('TX', 'V'):
            end = index + 1
            while end < len(rows) and rows[end][1] == 'RX':
                end += 1
            response = [r[2] for r in rows[index + 1:end]]
            if not any(s.startswith('HW_INFO,') for s in response):
                require(end < len(rows) and rows[end][1:] == ('TX', 'V'), 'Incomplete V without retry')
                require(not any(s.startswith(('[BASE]', '[DIFF]', '[PN] START:', 'RAW_BEGIN,', 'CONT_')) for s in response), 'Acquisition during V retry')
                retries += 1
                require(retries <= 1, 'More than one V header retry')
                index = end
                continue
        clean_rows.append(row)
        index += 1
    require([r[2] for r in clean_rows if r[1] == 'TX'] == expected, 'Unexpected PC command order')
    headers = {'V': 'HW_INFO,', 'B': '[BASE] START:', 'J': 'BASE_BEGIN,',
               'D': '[DIFF] START:', 'R': 'RAW_BEGIN,', 'C': 'DCORR_BEGIN,'}
    for index, row in enumerate(clean_rows):
        if row[1] == 'TX':
            require(index + 1 < len(clean_rows) and clean_rows[index + 1][1] == 'RX'
                    and clean_rows[index + 1][2].startswith(headers[row[2]]), 'Command/response ownership differs')
    rx = [r[2] for r in clean_rows if r[1] == 'RX']
    require(not any(any(word in s for word in ('DENIED', 'FAILED', 'LCD error', 'WAVE_ERROR', '[STOP]')) for s in rx), 'Device/display rejection in transcript')
    for prefix, count in (('[BASE] START:', 1), ('[PN] START:', 0), ('[DIFF] START:', 9),
                          ('LOCATE_TEST_BEGIN,', 12), ('LOCATE_TEST_END,', 12),
                          ('TXTRACE,', 12), ('PN_RESULT,', 3), ('PN_DIFF_RESULT,', 9)):
        require(sum(s.startswith(prefix) for s in rx) == count, 'Unexpected transaction count: ' + prefix)
    require(not any(s.startswith(('CONT_START,', 'CONT_FRAME,', '[HMI] SINGLE ->')) for s in rx), 'Autonomous acquisition in position study')
    for s in rx:
        if s.startswith('TXTRACE,'):
            require(all(fields(s).get(k) == v for k, v in {'SEQ': '1', 'AFTER_CLEAR': '0', 'END': '1', 'RC': '0'}.items()), 'Rejected/multiple TX transaction')
    order = ['hardware_before.txt', 'baseline.txt']
    for state in STATES:
        order += [state + '.hardware.txt', state + '.baseline.txt']
        order += [f'{state}_r{n}.txt' for n in (1, 2, 3)]
    order += ['baseline_after.txt', 'hardware_after.txt']
    rebuilt = [line for name in order for line in (folder / name).read_text(encoding='utf-8-sig').splitlines()]
    # In a retry the obscured block is also preserved in hardware_before.txt
    # or the relevant state hardware file. It remains part of the full RX.
    require(rebuilt == [r[2] for r in rows if r[1] == 'RX'], 'Transcript/raw files differ')
    require(Counter(commands) == Counter(V=5 + retries, B=1, J=5, D=9, R=9, C=9), 'Unexpected acquisition/export count')
    return {'TX_count': len(commands), 'RX_count': len(rebuilt), 'V_header_retries': retries,
            'commands': dict(Counter(commands)), 'RX_files_exact': True}


def verify_batch(path, expected_front, expected_back, allow_synthetic):
    work = ROOT / 'pn_dev/work'
    with ZipFile(path) as z, tempfile.TemporaryDirectory(prefix='weak_position_verify_', dir=work) as temp:
        folder = Path(temp).resolve()
        require(folder.parent == work.resolve() and folder.name.startswith('weak_position_verify_'), 'Invalid temporary directory')
        entries = [i for i in z.infolist() if not i.is_dir()]
        names = [i.filename for i in entries]
        require(len(names) == len(set(names)) == 45, 'Expected 45 unique capture files')
        require(all('/' not in n and '\\' not in n and ':' not in n and n not in ('.', '..') for n in names), 'Unsafe ZIP member')
        require(z.testzip() is None, 'Capture ZIP CRC failure')
        for i in entries:
            (folder / i.filename).write_bytes(z.read(i))
        session = read(folder / 'session.json')
        require(session['plan']['front_length_m'] == expected_front and session['plan']['back_length_m'] == expected_back, 'Wrong cable geometry/order')
        result = analyze(folder / 'session.json', allow_synthetic=allow_synthetic)
        require(result == read(folder / 'analysis.json'), 'Stored batch analysis differs')
        base_path = folder / 'baseline.txt'
        base = parse_baseline(base_path.read_text(encoding='utf-8-sig'))
        require(read(folder / 'baseline.checked.json') == dict(base, source_baseline_file='baseline.txt', source_baseline_sha256=sha(base_path)), 'Stored baseline check differs')
        checked = {'baseline.checked.json'}
        for state in STATES:
            name = state + '.baseline.checked.json'
            require(check_live_table(base_path, folder / (state + '.baseline.txt')) == read(folder / name), 'Stored state J check differs')
            checked.add(name)
        require(check_live_table(base_path, folder / 'baseline_after.txt') == read(folder / 'baseline_after.checked.json'), 'Stored final J check differs')
        checked.add('baseline_after.checked.json')
        for item in session['captures']:
            capture = folder / item['file']
            numeric = check_healthy_capture(base, capture)
            name = capture.stem + '.checked.json'
            require(read(folder / name) == dict(numeric, source_baseline_file='baseline.txt', source_baseline_sha256=sha(base_path)), 'Stored arithmetic check differs')
            checked.add(name)
            name = capture.stem + '.plot.checked.json'
            require(check_plot_capture(capture, base_path) == read(folder / name), 'Stored plot check differs')
            checked.add(name)
        require(checked == {p.name for p in folder.glob('*.checked.json')} and len(checked) == 23, 'Unexpected checked files')
        transcript = verify_transcript(folder)
        return {'archive_sha256': sha(path), 'evidence_kind': session['evidence_kind'],
                'front_length_m': expected_front, 'back_length_m': expected_back,
                'baseline_id': base['baseline_id'], 'baseline_crc32': base['crc32'],
                'source_raw_sequences': base['source_raw_sequences'],
                'groups': {s: {k: v for k, v in result['group_summaries'][s].items()
                               if k != 'mean_correlation_q16_numerator'} for s in STATES},
                'before_hardware': hardware(folder / 'hardware_before.txt'),
                'after_hardware': hardware(folder / 'hardware_after.txt'),
                'transcript': transcript, 'checked_JSON_exact': 23,
                'exact_correlation_points': 2304, 'exact_display_pixels': 4608}


def analyze_pair(manifest, allow_synthetic=False):
    manifest = Path(manifest).resolve()
    batch = read(manifest)
    require(batch.get('schema') == 'PN_WEAK_D_POSITION_PAIR_1' and batch.get('status') == 'complete', 'Expected complete D position pair')
    require(batch.get('firmware_stage') == 26 and batch.get('fixture_id') == 'D_shunt_1kohm', 'Wrong firmware/fixture')
    require(batch.get('classification_performed') is False and batch.get('distance_valid') is False, 'Position study cannot claim fault/distance qualification')
    require(len(batch.get('phases', [])) == 2, 'Expected exactly two phases')
    results = []
    for entry, (label, front, back) in zip(batch['phases'], PHASES):
        require(entry.get('label') == label and entry.get('front_length_m') == front and entry.get('back_length_m') == back, 'Phase labels/geometry changed')
        name = entry.get('zip')
        require(name == label + '.zip', 'Unexpected phase archive name')
        path = manifest.parent / name
        require(sha(path) == entry.get('sha256'), 'Phase archive hash differs')
        results.append(verify_batch(path, front, back, allow_synthetic))
    require(results[0]['evidence_kind'] == results[1]['evidence_kind'], 'Mixed live and synthetic evidence')
    require(results[0]['after_hardware'] == results[1]['before_hardware'], 'Reset/change/unowned acquisition between phases')
    low, high = [r['groups']['sample_D1K'] for r in results]
    return {'schema': 'PN_WEAK_D_POSITION_PAIR_ANALYSIS_1', 'status': 'PASS',
            'scope': 'data integrity and descriptive peak displacement only',
            'evidence_kind': results[0]['evidence_kind'], 'firmware_stage': 26,
            'phases': results, 'new_acquisitions': 24, 'D_measurements': 18,
            'exact_correlation_points': 4608, 'exact_display_pixels': 9216,
            'nominal_position_change_m': 10, 'nominal_total_cable_m_each_phase': 20,
            'sample_peak_lags': [low['peak_lags'], high['peak_lags']],
            'sample_signs': [low['signs'], high['signs']],
            'mean_curve_peak_lag_change_samples': high['mean_correlation_peak_lag'] - low['mean_correlation_peak_lag'],
            'position_truth_used_for_peak_selection': False,
            'movement_qualified': False, 'distance_model_deployed': False,
            'classification_performed': False, 'detected': None, 'distance_valid': False,
            'weak_impedance_validated': False, 'optical_screen_verified': False,
            'qualification': 'Two operator-declared cable arrangements of the same D1k fixture and 5m/15m cables. Each has its own explicitly acquired barrel reference. Peaks are selected over all 256 lags. No fitted distance, calibrated Gamma, detection probability or independent blind-trial qualification.',
            'source_sha256': {p.name: sha(p) for p in [manifest] + [manifest.parent / e['zip'] for e in batch['phases']]}}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('manifest', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--allow-synthetic-self-test', action='store_true')
    args = parser.parse_args()
    try:
        result = analyze_pair(args.manifest, args.allow_synthetic_self_test)
        with args.output.open('x', encoding='utf-8') as f:
            json.dump(result, f, indent=2, allow_nan=False)
            f.write('\n')
    except (OSError, ValueError, KeyError, TypeError, IndexError, AssertionError) as exc:
        parser.exit(1, 'REJECTED: ' + str(exc) + '\n')
    print('WEAK_POSITION_PAIR_DATA_PASS: 18 D captures; 4608 correlations and 9216 pixels exact; no distance qualification')


if __name__ == '__main__':
    main()
