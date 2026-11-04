"""Record delivery evidence and hashes; never claims a hardware measurement."""
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
report = (root / 'reports/timing.rpt').read_text(encoding='utf-8')
match = re.search(r'WNS\(ns\).*?\n\s*[- ]+\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)', report)
if not match:
    raise SystemExit('Cannot parse routed timing summary')
wns, whs, wpws = float(match[1]), float(match[5]), float(match[9])
simulations = {}
for scenario in range(9):
    text = (root / f'reports/scenario_{scenario}.log').read_text(encoding='utf-8')
    simulations[str(scenario)] = bool(re.search(fr'PASS: scenario {scenario}\b', text)) and (
        'AD9516 frequency check: ADC=200000000 Hz, DCO=100000000 Hz, DAC REF=200000000 Hz' in text)
if min(wns, whs, wpws) < 0 or not all(simulations.values()):
    raise SystemExit('Timing or simulation verification has not passed')
files = sorted([*root.glob('rtl/*.sv'), *root.glob('rtl/*.mem'),
                *root.glob('constraints/*.xdc'), *root.glob('scripts/*.tcl'),
                *root.glob('scripts/*.ps1'), *root.glob('scripts/*.py'),
                *root.glob('sim/*.sv'), *root.glob('sim/*.py')])
artifacts = [root / 'adc_dac_loopback_test.bit', root / 'adc_dac_loopback_test.ltx']
if any(not p.is_file() for p in artifacts):
    raise SystemExit('Missing matching bit/ltx artifacts')
build_inputs = [*root.glob('rtl/*.sv'), *root.glob('rtl/*.mem'),
                *root.glob('constraints/*.xdc'),
                *(root / 'scripts' / name for name in
                  ('create_project.tcl', 'debug_clock.tcl', 'build.tcl', 'rebuild.tcl', 'run.ps1'))]
report_files = [root / 'reports' / name for name in
                ('timing.rpt', 'drc.rpt', 'cdc.rpt', 'bus_skew.rpt',
                 'adc_input_timing.rpt', 'dac_output_timing.rpt', 'clocks.rpt', 'io.rpt')]
newest_input = max(p.stat().st_mtime for p in build_inputs)
for path in [*artifacts, *report_files]:
    if path.stat().st_mtime < newest_input:
        raise SystemExit(f'Stale artifact/report: {path.name}; rebuild first')
newest_sim_input = max(p.stat().st_mtime for p in
                       [*root.glob('rtl/*.sv'), *root.glob('rtl/*.mem'), *root.glob('sim/*.sv')])
for scenario in range(9):
    if (root / f'reports/scenario_{scenario}.log').stat().st_mtime < newest_sim_input:
        raise SystemExit(f'Stale simulation scenario {scenario}; rerun Sim first')

drc_text = (root / 'reports/drc.rpt').read_text(encoding='utf-8')
drc = {m[1]: dict(severity=m[2].strip(), count=int(m[3])) for m in re.finditer(
       r'^\|\s*([A-Z][A-Z0-9-]+)\s*\|\s*(Error|Critical Warning|Warning|Info)\s*\|[^|]+\|\s*(\d+)\s*\|',
       drc_text, re.M)}
if any(item['severity'] in ('Error', 'Critical Warning') for item in drc.values()):
    raise SystemExit('DRC still contains Error or Critical Warning')
skew_text = (root / 'reports/bus_skew.rpt').read_text(encoding='utf-8')
skews = [(m[1], float(m[2])) for m in re.finditer(
         r'Slack\s+\((MET|VIOLATED)\)\s*:\s*([-\d.]+)ns', skew_text)]
if not skews or any(status != 'MET' or slack < 0 for status, slack in skews):
    raise SystemExit('Bus skew evidence missing or failing')
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
cdc_text = (root / 'reports/cdc.rpt').read_text(encoding='utf-8')
cdc = {m[1]: dict(severity=m[2], count=int(m[3]))
       for m in re.finditer(r'^(CDC-\d+)\s+(Info|Warning|Critical)\s+(\d+)\s', cdc_text, re.M)}
result = dict(created_utc=datetime.now(timezone.utc).isoformat(), hardware_tested=False,
              device='xc7z020clg484-2',
              configuration=dict(adc_sample_rate_hz=200_000_000, adc_dco_hz=100_000_000,
                                 adc_capture_phase_deg=119.25, adc_idelay_tap=16,
                                 dac_dci_hz=100_000_000, dac_reference_hz=200_000_000,
                                 dac_internal_sample_rate_hz=800_000_000),
              routed_timing_ns=dict(setup_wns=wns, hold_whs=whs, pulse_width=wpws),
              xsim_scenarios=simulations, cdc_summary=cdc,
              drc_summary=drc, minimum_bus_skew_slack_ns=min(s for _, s in skews),
              adc_board_skew_budget_ns=0.2, adc_tap_requires_hardware_validation=True,
              source_sha256={str(p.relative_to(root)): digest(p) for p in files},
              report_sha256={str(p.relative_to(root)): digest(p) for p in report_files},
              artifacts={p.name: dict(bytes=p.stat().st_size, sha256=digest(p)) for p in artifacts})
(root / 'reports/validation.json').write_text(json.dumps(result, indent=2)+'\n', encoding='utf-8')
print(json.dumps({k: result[k] for k in ('hardware_tested', 'routed_timing_ns', 'xsim_scenarios', 'artifacts')}, indent=2))
