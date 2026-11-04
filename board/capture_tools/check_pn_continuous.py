"""Check one screen-owned Stage26 continuous run and its stopped snapshot."""
import argparse
import hashlib
import json
from pathlib import Path
import re

from check_healthy_pn import parse_baseline, check_healthy_capture
from check_hmi_wave_capture import check_plot_capture

PLOT_KEYS = ('SEQ', 'BASE_ID', 'BASE_CRC', 'PAGE', 'KIND', 'N', 'FIRST',
             'COUNT', 'SCALE', 'ZERO', 'READY', 'DONE', 'FNV1A')


def record(line):
    result = {}
    for token in line.split(',')[1:]:
        if token.count('=') != 1:
            raise ValueError('Malformed continuous record')
        key, value = token.split('=')
        if not key or not value or key in result:
            raise ValueError('Missing/duplicate continuous field')
        result[key] = value
    return result


def number(fields, key, bits=32):
    value = fields.get(key, '')
    if not re.fullmatch(r'0|[1-9][0-9]*', value):
        raise ValueError('Invalid unsigned integer: ' + key)
    value = int(value)
    if value >= 1 << bits:
        raise ValueError('Unsigned integer out of range: ' + key)
    return value


def expect(fields, values):
    for key, value in values.items():
        if fields.get(key) != str(value):
            raise ValueError('Unexpected continuous field: ' + key)


def check_run(text, baseline, expected_reason, minimum_frames=1):
    if expected_reason not in ('USER', 'PAGE') or minimum_frames < 1:
        raise ValueError('Only normal USER/PAGE board-test runs are supported')
    lines = [line.strip() for line in text.splitlines() if line.strip()]
    if any(line.startswith('CONT_') and not line.startswith(
            ('CONT_START,', 'CONT_FRAME,', 'CONT_STOP,', 'CONT_IGNORED,')) for line in lines):
        raise ValueError('Unknown continuous protocol record')
    for line in lines:
        if line.startswith('CONT_IGNORED,'):
            ignored = record(line)
            expect(ignored, {'REASON': 'RUNNING'})
            if ignored.get('COMMAND') not in ('HMI', 'PC', 'START'):
                raise ValueError('Invalid ignored-command notice')
    if any(re.search(r'WAVE_ERROR|LCD error|DENIED|FAILED|\[STOP\]', line) for line in lines):
        raise ValueError('Device/display error in continuous run')
    starts = [(i, record(line)) for i, line in enumerate(lines) if line.startswith('CONT_START,')]
    frames = [(i, record(line)) for i, line in enumerate(lines) if line.startswith('CONT_FRAME,')]
    stops = [(i, record(line)) for i, line in enumerate(lines) if line.startswith('CONT_STOP,')]
    if len(starts) != 1 or len(stops) != 1 or len(frames) < minimum_frames:
        raise ValueError('Expected one complete run with enough confirmed frames')
    start_at, start = starts[0]
    stop_at, stop = stops[0]
    if start_at >= stop_at or any(not start_at < at < stop_at for at, _ in frames):
        raise ValueError('Continuous records out of order or frames after stop')
    if any(line.startswith(('FAST_RESULT,', 'LOCATE_TEST_BEGIN,', 'MEASUREMENT,',
                            '[BASE] START:', '[DIFF] START:', '[PN] START:', '[LOCATE] START:'))
           for line in lines):
        raise ValueError('Unexpected separate acquisition in compact screen run')
    session, first = number(start, 'SESSION'), number(start, 'FIRST_SEQ')
    if not session:
        raise ValueError('Continuous session must be nonzero')
    identity = {'SESSION': session, 'BASE_ID': baseline['baseline_id'], 'BASE_CRC': baseline['crc32']}
    expect(start, {**identity, 'DISTANCE_VALID': 0})
    for index, (_, frame) in enumerate(frames, 1):
        expect(frame, {**identity, 'INDEX': index, 'SEQ': (first+index-1) & 0xffffffff,
                       'PAGE': 0, 'KIND': 'CORR', 'N': 512, 'ZERO': 112,
                       'READY': 1, 'DONE': 1, 'TX': 1, 'FRAMES': 32,
                       'RESULTS': 256, 'RC': 0, 'DISTANCE_VALID': 0})
        if (frame.get('FIRST'), frame.get('COUNT')) not in (('0', '256'), ('96', '128')):
            raise ValueError('Unsupported correlation plot window')
        if number(frame, 'SCALE', 64) < 2147483648 or int(frame['SCALE']) >= 1 << 63:
            raise ValueError('Invalid plot scale')
        if not re.fullmatch(r'[0-9A-F]{8}', frame.get('FNV1A', '')):
            raise ValueError('Invalid pixel hash')
    last = (first+len(frames)-1) & 0xffffffff
    expect(stop, {'SESSION': session, 'REASON': expected_reason, 'LAST_SEQ': last,
                  'FRAMES': len(frames), 'STATE': 'IDLE', 'IN_FLIGHT': 0})
    measured = number(stop, 'MEAS_SEQ')
    # PAGE can cancel a measured frame before a current-page plot is confirmed.
    if ((measured-last) & 0xffffffff) not in ((0,) if expected_reason == 'USER' else (0, 1)):
        raise ValueError('Unreported acquisition count at stop')
    requested, done, latency = (number(stop, key, 64) for key in ('REQUEST_MS', 'DONE_MS', 'LATENCY_MS'))
    if done < requested or latency != done-requested:
        raise ValueError('Stop time/latency mismatch')
    return {'schema': 'PN_CONTINUOUS_RUN_CHECK_1', 'status': 'PASS', 'session': session,
            'confirmed_frames': len(frames), 'first_sequence': first, 'last_sequence': last,
            'measurement_sequence_at_stop': measured, 'baseline_id': baseline['baseline_id'],
            'baseline_crc32': baseline['crc32'], 'stop_reason': expected_reason,
            'stop_request_parsed_ms': requested, 'stop_done_ms': done,
            'parsed_stop_to_safe_boundary_ms': latency, 'last_frame': frames[-1][1],
            'frame_summaries_checked': True, 'every_frame_full_arrays_exported': False,
            'physical_touch_to_stop_latency_measured': False, 'distance_valid': False,
            'weak_impedance_validated': False, 'formal_refresh_rate_verified': False}


def check_files(events_path, baseline_path, expected_reason, snapshot_path=None, minimum_frames=1):
    events_path, baseline_path = Path(events_path), Path(baseline_path)
    baseline = parse_baseline(baseline_path.read_text(encoding='utf-8-sig'))
    result = check_run(events_path.read_text(encoding='utf-8-sig'), baseline, expected_reason, minimum_frames)
    paths = [events_path, baseline_path]
    if snapshot_path is not None:
        snapshot_path = Path(snapshot_path)
        numeric = check_healthy_capture(baseline, snapshot_path)
        plot = check_plot_capture(snapshot_path, baseline_path)
        if numeric['sequence'] != result['last_sequence'] or len(plot['plots']) != 1:
            raise ValueError('Stopped snapshot does not belong to final confirmed frame')
        for key in PLOT_KEYS:
            if result['last_frame'].get(key) != plot['plots'][0].get(key):
                raise ValueError('Final frame/snapshot metadata mismatch: ' + key)
        result['stopped_snapshot'] = {'arithmetic': numeric, 'plot': plot}
        paths.append(snapshot_path)
    result['source_sha256'] = {path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in paths}
    result['qualification'] = ('Screen continuous-run summaries and optional final complete snapshot checked. '
                               'Stop latency starts when firmware parses the request. No weak-fault, distance, '
                               'optical refresh timing or long-run qualification.')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('events')
    parser.add_argument('--baseline', required=True)
    parser.add_argument('--expected-reason', required=True, choices=('USER', 'PAGE'))
    parser.add_argument('--snapshot')
    parser.add_argument('--minimum-frames', type=int, default=1)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    try:
        result = check_files(args.events, args.baseline, args.expected_reason,
                             args.snapshot, args.minimum_frames)
        Path(args.output).write_text(json.dumps(result, indent=2, allow_nan=False)+'\n', encoding='utf-8')
    except (ValueError, KeyError, OSError) as exc:
        print('REJECTED: ' + str(exc))
        return 1
    print('PN_CONTINUOUS_RUN_PASS: SESSION=%d %d confirmed frames; STOP=%s; parsed-stop latency=%d ms' %
          (result['session'], result['confirmed_frames'], result['stop_reason'],
           result['parsed_stop_to_safe_boundary_ms']))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
