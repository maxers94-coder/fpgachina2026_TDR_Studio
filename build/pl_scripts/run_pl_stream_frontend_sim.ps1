param(
    [string]$VivadoBin='D:\AMD\2026.1\Vivado\bin'
)

$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$work=Join-Path $projectRoot 'sim/work_pl_stream_frontend'

function Invoke-Checked([string]$exe,[string[]]$toolArgs) {
    & $exe @toolArgs
    if ($LASTEXITCODE -ne 0) {
        throw "Tool failed ($LASTEXITCODE): $exe"
    }
}

New-Item -ItemType Directory -Path $work -Force | Out-Null
Push-Location $work
try {
    $sources=@(
        (Join-Path $projectRoot 'rtl/processing/adc_pair_average.sv'),
        (Join-Path $projectRoot 'rtl/integration/adc_pl_stream_frontend.sv'),
        (Join-Path $projectRoot 'sim/tb_adc_pl_stream_frontend.sv')
    )
    Invoke-Checked (Join-Path $VivadoBin 'xvlog.bat') (@('--sv')+$sources)
    Invoke-Checked (Join-Path $VivadoBin 'xelab.bat') @(
        'tb_adc_pl_stream_frontend',
        '-s','pl_stream_frontend_sim',
        '-debug','typical'
    )
    '--runall --log pl_stream_frontend.log' |
        Set-Content -LiteralPath 'pl_stream_frontend.args' -Encoding ascii
    Invoke-Checked (Join-Path $VivadoBin 'xsim.bat') @(
        'pl_stream_frontend_sim',
        '--file','pl_stream_frontend.args'
    )
    if (-not (Select-String -LiteralPath 'pl_stream_frontend.log' `
            -Pattern 'PASS: ADC PL stream frontend preserved raw pairs, framed AXI data, and detected overflow' `
            -Quiet)) {
        throw 'PL stream frontend simulation did not report PASS'
    }
    Write-Output 'PASS: PL stream frontend simulation matched all checks.'
} finally {
    Pop-Location
}
