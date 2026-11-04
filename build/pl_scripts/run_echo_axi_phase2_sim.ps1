param(
    [string]$VivadoBin='D:\AMD\2026.1\Vivado\bin'
)

$ErrorActionPreference='Stop'
$stagingRoot=Split-Path $PSScriptRoot -Parent
$work=Join-Path $stagingRoot 'sim_work_axi_phase2'

function Invoke-Checked([string]$exe,[string[]]$toolArgs) {
    & $exe @toolArgs
    if ($LASTEXITCODE -ne 0) { throw "Tool failed ($LASTEXITCODE): $exe" }
}

New-Item -ItemType Directory -Path $work -Force | Out-Null
Push-Location $work
try {
    Invoke-Checked (Join-Path $VivadoBin 'xvlog.bat') @(
        '--sv',
        (Join-Path $stagingRoot 'rtl/integration/echo_pipeline_axi_bridge_phase2.sv'),
        (Join-Path $stagingRoot 'sim/tb_echo_pipeline_axi_bridge_phase2.sv')
    )
    Invoke-Checked (Join-Path $VivadoBin 'xelab.bat') @(
        'tb_echo_pipeline_axi_bridge_phase2','-s','echo_axi_phase2_sim','-debug','typical'
    )
    Invoke-Checked (Join-Path $VivadoBin 'xsim.bat') @(
        'echo_axi_phase2_sim','--runall','--log','echo_axi_phase2_sim.log'
    )
    if (-not (Select-String -LiteralPath 'echo_axi_phase2_sim.log' `
            -Pattern 'PASS: phase-2/v3 coefficient, pulse, average and result tests passed' -Quiet)) {
        throw 'Phase-2 simulation did not report PASS'
    }
    Write-Output 'PASS: AXI phase-2 simulation completed.'
} finally {
    Pop-Location
}
