param(
    [string]$VivadoBin = 'D:\vivado\2026.1\Vivado\bin',
    [string]$Python = ''
)
$ErrorActionPreference = 'Stop'
$integration = Split-Path $PSScriptRoot -Parent
$workspace = Split-Path $integration -Parent
if (-not $Python) {
    $Python = Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
}
$vectors = Join-Path $workspace 'pn_dev\work\healthy_baseline'
$work = Join-Path $vectors 'sim_work'
$receipt = Join-Path $vectors 'simulation_receipt.json'
# Invalidate an old pass before beginning a fresh run.
if (Test-Path -LiteralPath $receipt) { Remove-Item -LiteralPath $receipt }
& $Python (Join-Path $workspace 'pn_dev\generate_healthy_baseline_vectors.py') $vectors
if ($LASTEXITCODE -ne 0) { throw 'Healthy-baseline vector generation failed.' }
New-Item -ItemType Directory -Path $work -Force | Out-Null
function Invoke-Checked([string]$name, [string[]]$toolArgs) {
    & (Join-Path $VivadoBin $name) @toolArgs
    if ($LASTEXITCODE -ne 0) { throw ('Simulation tool failed: ' + $name + ', code=' + $LASTEXITCODE) }
}
$sources = @(
    'rtl\processing\coeff_shadow_bank.sv',
    'rtl\processing\baseline_sub.sv',
    'rtl\processing\corr_mac.sv',
    'rtl\processing\result_bram.sv',
    'rtl\processing\processing_chain.sv',
    'sim\tb_healthy_baseline_replay.sv'
)
$sourcePaths = @($sources | ForEach-Object { Join-Path $integration $_ })
Push-Location $work
try {
    Invoke-Checked 'xvlog.bat' (@('--sv') + $sourcePaths)
    Invoke-Checked 'xelab.bat' @('tb_healthy_baseline_replay', '-s', 'healthy_baseline_replay', '-debug', 'typical')
    $log = Join-Path $work 'healthy_baseline_replay.log'
    # The testbench defaults to vectors in its parent folder. Avoid passing a
    # drive-qualified plusarg through the Windows xsim.bat wrapper.
    Invoke-Checked 'xsim.bat' @('healthy_baseline_replay', '--runall', '--log', $log)
    if (-not (Select-String -LiteralPath $log -SimpleMatch -Quiet -Pattern 'HEALTHY_BASELINE_REPLAY_PASS,REAL=51,SYNTHETIC=2,DIFF=54272,CORR=13568,BRAM=13568')) {
        throw 'Simulation completed without the required all-case PASS marker.'
    }
    if ((Select-String -LiteralPath $log -SimpleMatch -Pattern 'HEALTHY_BASELINE_CASE_PASS,').Count -ne 53) {
        throw 'Expected 53 individually checked cases.'
    }
    $hashes = [ordered]@{}
    foreach ($path in $sourcePaths) {
        $relative = $path.Substring($workspace.Length + 1).Replace('\', '/')
        $hashes[$relative] = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $summary = [ordered]@{
        schema='HEALTHY_BASELINE_SIMULATION_RECEIPT_1'; status='PASS';
        real_averaged_capture_count=51; synthetic_boundary_case_count=2;
        differences_checked=54272; correlations_checked=13568; bram_readbacks_checked=13568;
        live_board_test=$false; adc_frame_reconstruction=$false;
        source_sha256=$hashes;
        vector_manifest_sha256=(Get-FileHash -LiteralPath (Join-Path $vectors 'manifest.json') -Algorithm SHA256).Hash.ToLowerInvariant();
        log_sha256=(Get-FileHash -LiteralPath $log -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($receipt, ($summary | ConvertTo-Json -Depth 8), $utf8)
    Write-Output ('HEALTHY_BASELINE_SIMULATION_RECEIPT_SAVED: ' + $receipt)
} finally {
    Pop-Location
}
