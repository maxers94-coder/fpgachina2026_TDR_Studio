"""Integrity and descriptive residuals for the fresh-barrel/D1K experiment.

This module does not detect faults, set thresholds, calibrate reflection strength,
or convert lags to distance. Fixture labels only group already-measured results.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path

from check_healthy_pn import parse_baseline, check_healthy_capture
from check_hmi_wave_capture import check_plot_capture
from check_live_healthy_table import check_live_table
from check_pn_continuous import record

STATES = ('reference_before', 'sample_D1K', 'reference_after')
ROOT = Path(__file__).resolve().parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def metrics_from_result(result):
    """No physical label, position, resistor value or VNA result is an input."""
    return {'peak_lag': result['dc_removed_peak_lag'],
            'peak_q16': result['dc_removed_peak_q16'], 'sign': result['dc_removed_sign'],
            'raw_rms_q2': result['dc_removed_raw_rms_q2'],
            'dc_delta_sum_q2': result['dc_sum_delta_q2'],
            'peak_at_search_edge': result['dc_removed_peak_lag'] in (0, 255)}


def hardware(path, base=None, expected_sequence=None):
    text = path.read_text(encoding='utf-8-sig')
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    starts = [i for i, line in enumerate(lines) if line.startswith('HW_INFO,')]
    require(len(starts) == 1, 'Expected one clean hardware response: ' + path.name)
    # The collector preserves an obscured initial V response before its one
    # allowed read-only retry. Only the subsequent complete clean block counts.
    clean = lines[starts[0]:]
    parsed = {}
    for prefix in ('HW_INFO', 'HW_STATUS', 'PN_INFO', 'HMI_INFO', 'REF_GUARD_INFO', 'CONT_INFO', 'HEALTHY_INFO'):
        rows = [line for line in clean if line.startswith(prefix+',')]
        require(len(rows) == 1, 'Missing/duplicate hardware record: ' + prefix)
        parsed[prefix] = record(rows[0])
    expected = {
        'HW_INFO': {'IP_ID': '4543484F', 'VERSION': '00030002', 'FS_HZ': '200000000', 'PAIR_HZ': '100000000', 'CAPS': '15'},
        'HW_STATUS': {'ERROR': '00000000'},
        'PN_INFO': {'SEED': '127', 'AMPLITUDE': '4096', 'CHIP_HZ': '50000000'},
        'HMI_INFO': {'PAGE': '0', 'VALID': '1', 'LOCKED': '0', 'WAVE_VERSION': '1'},
        'REF_GUARD_INFO': {'VERSION': '1', 'PROFILES': '2', 'BANK_CRC32': '02FEEBDD', 'GATE_Q16': '208916480', 'ADAPTIVE': '0'},
        'CONT_INFO': {'STATE': 'IDLE', 'IN_FLIGHT': '0'},
        'HEALTHY_INFO': {'FW_STAGE': '26', 'REF_N': '3', 'VOLATILE': '1', 'DISTANCE_VALID': '0'}}
    for prefix, fields in expected.items():
        require(all(parsed[prefix].get(k) == v for k, v in fields.items()), 'Hardware/config mismatch: ' + prefix)
    status = int(parsed['HW_STATUS']['STATUS'], 16)
    require(not status & ((1 << 3) | (1 << 4) | (1 << 5) | (1 << 7) | (1 << 19) | (1 << 20) | (1 << 24)),
            'Busy/rejected/clipped/overflow/error hardware')
    if base is not None:
        require(parsed['HEALTHY_INFO'].get('VALID') == '1' and
                parsed['HEALTHY_INFO'].get('BASE_ID') == str(base['baseline_id']) and
                parsed['HEALTHY_INFO'].get('CRC32') == base['crc32'], 'Reference changed in hardware readback')
        require(parsed['REF_GUARD_INFO'].get('ACTIVE_PROFILE') == str(base['reference_profile_id']) and
                parsed['REF_GUARD_INFO'].get('ACTIVE_MASK') == str(base['reference_profile_mask']), 'Reference profile changed')
    if expected_sequence is not None:
        require(parsed['CONT_INFO'].get('MEAS_SEQ') == str(expected_sequence), 'Unexpected measurement watermark')
    return parsed


def analyze(manifest_path, allow_synthetic=False):
    manifest_path = Path(manifest_path).resolve()
    folder = manifest_path.parent
    batch = json.loads(manifest_path.read_text(encoding='utf-8-sig'))
    require(batch.get('schema') == 'PN_WEAK_D_FRESH_DEVELOPMENT_1' and batch.get('status') == 'complete', 'Expected complete fresh-reference weak-D development batch')
    require(batch.get('firmware_stage') == 26 and batch.get('new_acquisition_count') == 12,
            'Unexpected firmware or acquisition count')
    evidence = batch.get('evidence_kind')
    require(evidence in ('operator_declared_live_development_capture', 'synthetic_tool_self_test'), 'Unknown evidence kind')
    require(evidence != 'synthetic_tool_self_test' or allow_synthetic, 'Synthetic self-test requires explicit permission flag')
    require(batch.get('reference_mode') == 'FRESH_BARREL_REFERENCE', 'Explicit fresh-reference mode required')
    plan = batch['plan']
    require(plan.get('reference_mode') == 'FRESH_BARREL_REFERENCE', 'Fresh-reference plan mode missing')
    fixed = {'firmware_stage': 26, 'waveform': 'PN127', 'sample_rate_hz': 200000000,
             'pair_hz': 100000000, 'chip_hz': 50000000, 'average_frames': 32,
             'far_end': 'verified_50ohm', 'reference_type': 'SMA_BARREL_PROVISIONAL',
             'sample_id': 'D', 'nominal_shunt_resistance_ohm': 1000, 'sample_topology': 'SHUNT_TO_GROUND',
             'sample_orientation': 'J1_toward_near_end', 'technical_repeats_per_state': 3,
             'baseline_sources': 3, 'new_acquisition_count': 12}
    require(all(plan.get(k) == v for k, v in fixed.items()), 'Unsupported development configuration')
    for key in ('front_length_m', 'back_length_m'):
        value = plan.get(key)
        require(type(value) in (int, float) and math.isfinite(value) and 0.1 <= value <= 100, 'Invalid operator length metadata')
    require(plan.get('states') == list(STATES), 'Physical-state order changed')
    require(plan.get('reference_bank_crc32') == '02FEEBDD' and
            plan.get('reference_gate_changed') is False, 'Reference guard policy changed')
    require(plan.get('truth_metadata_sent_to_firmware') is False and
            plan.get('vna_255mhz_values_used_as_calibration') is False and
            batch.get('vna_used_as_calibration') is False, 'Truth or uncalibrated VNA values cannot configure the measurement')
    for item in (plan, batch):
        require(item.get('same_structure_normal_pcb') is False, 'This protocol requires explicit provisional-barrel reference')
        require(item.get('classification_performed') is False and item.get('distance_valid') is False and
                item.get('weak_impedance_validated') is False, 'Development data cannot claim classification/distance qualification')
        require(item.get('detected') is None, 'Detection must remain NOT_EVALUATED, not a positive/negative decision')
    require(batch.get('reference_type') == 'SMA_BARREL_PROVISIONAL', 'Reference type changed')
    require(batch.get('fixture_id') == 'D_shunt_1kohm' and batch.get('nominal_shunt_resistance_ohm') == 1000
            and batch.get('sample_topology') == 'SHUNT_TO_GROUND', 'D1K fixture metadata changed')
    require('nominal_series_resistance_ohm' not in plan and 'nominal_series_resistance_ohm' not in batch,
            'D1K shunt protocol cannot be labelled as a series resistor')
    paths = [manifest_path]

    def file(name):
        require(isinstance(name, str) and Path(name).name == name and name not in ('.', '..'), 'Invalid source filename')
        path = folder / name
        require(path.is_file(), 'Missing source file: ' + name)
        paths.append(path)
        return path

    base_path = file(batch['baseline_file'])
    base = parse_baseline(base_path.read_text(encoding='utf-8-sig'))
    require(base.get('guard_version') == 1 and base['reference_bank_crc32'] == '02FEEBDD', 'Unexpected reference guard bank')
    for key, value in {'baseline_id': base['baseline_id'], 'baseline_crc32': base['crc32'],
                       'reference_profile_id': base['reference_profile_id'], 'reference_profile_mask': base['reference_profile_mask'],
                       'reference_bank_crc32': '02FEEBDD', 'source_raw_sequences': base['source_raw_sequences']}.items():
        require(batch.get(key) == value, 'Manifest/reference provenance mismatch: ' + key)
    initial = hardware(file('hardware_before.txt'))
    require(int(initial['CONT_INFO']['MEAS_SEQ']) == ((base['first_sequence']-1) & 0xffffffff), 'B source sequences not fresh')
    next_id = (int(initial['HEALTHY_INFO']['BASE_ID'])+1) & 0xffffffff
    require(base['baseline_id'] == (next_id or 1), 'B baseline ID not fresh')
    elf = ROOT / 'echo200_ps_integration/export_pn_stage26/echo_pn_stage26.elf'
    require(batch.get('host_expected_elf_sha256') == sha(elf), 'Expected firmware differs from sealed Stage26')
    paths.append(elf)
    entries = batch['captures']
    require(isinstance(entries, list) and len(entries) == 9, 'Expected nine D/R/C captures')
    expected_rows = [(state, repeat) for state in STATES for repeat in (1, 2, 3)]
    previous = base['last_sequence']
    captures, groups = [], {}
    for index, (entry, (state, repeat)) in enumerate(zip(entries, expected_rows)):
        require(entry.get('state') == state and entry.get('repeat') == repeat and entry.get('trial_id') == state,
                'State/trial/repeat ordering changed')
        if repeat == 1:
            hardware(file(state+'.hardware.txt'), base, previous)
            check_live_table(base_path, file(state+'.baseline.txt'))
        path = file(entry['file'])
        require(entry.get('sha256') == sha(path), 'Capture hash mismatch: ' + path.name)
        require(not any(token in path.read_text(encoding='utf-8-sig') for token in
                        ('[BASE] START:', 'BASE_READY,', 'BASE_BEGIN,', 'BASE_GUARD,', 'CONT_START,', 'CONT_FRAME,')),
                'Unexpected reference update or autonomous acquisition inside a D capture')
        result = check_healthy_capture(base, path)
        plot = check_plot_capture(path, base_path)
        expected_sequence = (previous+1) & 0xffffffff
        require(result['sequence'] == entry.get('sequence') == expected_sequence, 'Stale/non-contiguous acquisition')
        require(len(plot['plots']) == 1 and plot['plots'][0]['PAGE'] == '0' and
                plot['plots'][0]['KIND'] == 'CORR' and plot['plots'][0]['N'] == '512', 'Expected one MEASURE correlation plot')
        row = {'state': state, 'trial_id': state, 'repeat': repeat, 'sequence': expected_sequence,
               'metrics': metrics_from_result(result), 'source_file': path.name, 'source_sha256': sha(path),
               'arithmetic': 'ALL_256_EXACT', 'pixels': 'ALL_512_EXACT',
               'dc_removed_correlation_q16_numerator': result['dc_removed_correlation_q16_numerator'],
               'dc_removed_denominator': 128}
        captures.append(row)
        groups.setdefault(state, []).append(row)
        previous = expected_sequence
    check_live_table(base_path, file('baseline_after.txt'))
    hardware(file('hardware_after.txt'), base, previous)
    summaries = {}
    for state, rows in groups.items():
        sums = [sum(words) for words in zip(*(r['dc_removed_correlation_q16_numerator'] for r in rows))]
        peak = max(range(256), key=lambda k: abs(sums[k]))
        summaries[state] = {'technical_repeats': 3, 'independent_trials': 1,
            'sequences': [r['sequence'] for r in rows],
            'mean_raw_rms_q2': sum(r['metrics']['raw_rms_q2'] for r in rows)/3,
            'peak_lags': [r['metrics']['peak_lag'] for r in rows], 'signs': [r['metrics']['sign'] for r in rows],
            'max_abs_peak_q16': max(abs(r['metrics']['peak_q16']) for r in rows),
            'mean_correlation_peak_lag': peak, 'mean_correlation_peak_q16': sums[peak]/384,
            'mean_correlation_q16_numerator': sums, 'mean_correlation_denominator': 384}
    return {'schema': 'PN_WEAK_D_FRESH_DEVELOPMENT_ANALYSIS_1', 'status': 'PASS',
        'scope': 'data integrity and descriptive residuals only', 'evidence_kind': evidence,
        'firmware_stage': 26, 'sample_rate_hz': 200000000, 'logical_sample_period_ns': 5,
        'pair_clock_hz': 100000000, 'chip_rate_hz': 50000000, 'average_frames': 32,
        'baseline_id': base['baseline_id'], 'baseline_crc32': base['crc32'],
        'reference_profile_id': base['reference_profile_id'], 'reference_type': 'SMA_BARREL_PROVISIONAL',
        'same_structure_normal_pcb': False, 'baseline_unchanged': True,
        'checked_D_captures': 9, 'exact_correlation_points': 9*256, 'exact_display_pixels': 9*512,
        'captures': captures, 'group_summaries': summaries,
        'operator_geometry_metadata': {k: plan[k] for k in ('front_length_m', 'back_length_m')},
        'truth_metadata_used_for_peak_selection': False, 'VNA_used_as_calibration': False,
        'classifier_threshold': None, 'classification_performed': False, 'decision': None,
        'detected': None, 'distance_m': None, 'distance_valid': False, 'weak_impedance_validated': False,
        'qualification': 'The barrel/PCB substitution includes connector, PCB, solder and electrical-length changes. '
                         'D1K is an uncalibrated development sample; no resistor-only attribution, detection rate, '
                         'false-alarm rate, calibrated reflection coefficient or distance is established. '
                         'Three repeats per connection are technical repeats, not independent trials.',
        'source_sha256': {str(p.relative_to(folder)) if p.is_relative_to(folder) else str(p): sha(p) for p in paths}}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('manifest', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--allow-synthetic-self-test', action='store_true')
    args = parser.parse_args()
    try:
        result = analyze(args.manifest, args.allow_synthetic_self_test)
        with args.output.open('x', encoding='utf-8') as stream:
            json.dump(result, stream, indent=2, allow_nan=False)
            stream.write('\n')
    except (OSError, ValueError, KeyError, TypeError, IndexError) as exc:
        parser.exit(1, 'REJECTED: '+str(exc)+'\n')
    print('WEAK_D_FRESH_DATA_PASS: nine complete captures; fixed provisional reference; no fault or distance decision')


if __name__ == '__main__':
    main()
