param(
    [string]$VivadoBin='D:\AMD\2026.1\Vivado\bin'
)

$ErrorActionPreference='Stop'
$stagingRoot=Split-Path $PSScriptRoot -Parent
$work=Join-Path $stagingRoot 'sim_work_axi_bridge'

function Invoke-Checked([string]$exe,[string[]]$toolArgs) {
    & $exe @toolArgs
    if ($LASTEXITCODE -ne 0) {
        throw "Tool failed ($LASTEXITCODE): $exe"
    }
}

New-Item -ItemType Directory -Path $work -Force | Out-Null
Push-Location $work
try {
    $bridge=Join-Path $stagingRoot 'rtl/integration/echo_pipeline_axi_bridge.sv'
    $testbench=Join-Path $stagingRoot 'sim/tb_echo_pipeline_axi_bridge.sv'

    Invoke-Checked (Join-Path $VivadoBin 'xvlog.bat') @(
        '--sv', $bridge, $testbench
    )
    Invoke-Checked (Join-Path $VivadoBin 'xelab.bat') @(
        'tb_echo_pipeline_axi_bridge',
        '-s','echo_axi_bridge_sim',
        '-debug','typical'
    )
    Invoke-Checked (Join-Path $VivadoBin 'xsim.bat') @(
        'echo_axi_bridge_sim',
        '--runall',
        '--log','echo_axi_bridge_sim.log'
    )

    if (-not (Select-String -LiteralPath 'echo_axi_bridge_sim.log' `
            -Pattern 'PASS: AXI4-Lite bridge register, IRQ and atomic result tests passed' `
            -Quiet)) {
        throw 'AXI bridge simulation did not report PASS'
    }

    Write-Output 'PASS: AXI4-Lite bridge simulation completed.'
} finally {
    Pop-Location
}
