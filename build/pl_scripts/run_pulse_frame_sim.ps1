param([string]$VivadoBin='D:\AMD\2026.1\Vivado\bin')

$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$work=Join-Path $root 'sim_work_pulse_frame'
New-Item -ItemType Directory -Path $work -Force | Out-Null
Push-Location $work
try {
    & (Join-Path $VivadoBin 'xvlog.bat') -sv `
        (Join-Path $root 'rtl/sync_pulse_engine.sv') `
        (Join-Path $root 'rtl/pulse_burst_32.sv') `
        (Join-Path $root 'rtl/processing/accum_tdp_bram.sv') `
        (Join-Path $root 'rtl/processing/frame_average_bram.sv') `
        (Join-Path $root 'rtl/processing/frame_average_pair_bram.sv') `
        (Join-Path $root 'sim/tb_pulse_frame_integration.sv')
    if ($LASTEXITCODE -ne 0) { throw 'xvlog failed' }
    & (Join-Path $VivadoBin 'xelab.bat') tb_pulse_frame_integration -s pulse_frame_sim
    if ($LASTEXITCODE -ne 0) { throw 'xelab failed' }
    & (Join-Path $VivadoBin 'xsim.bat') pulse_frame_sim --runall --log pulse_frame_sim.log
    if ($LASTEXITCODE -ne 0 -or -not (Select-String -LiteralPath 'pulse_frame_sim.log' `
            -Pattern 'PASS: pulse engine metadata and dual-lane 32-frame average aligned' -Quiet)) {
        throw 'pulse/frame integration simulation failed'
    }
    Write-Output 'PASS: pulse/frame integration simulation'
} finally {
    Pop-Location
}
