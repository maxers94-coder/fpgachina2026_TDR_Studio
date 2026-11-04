param(
    [string]$VivadoBin='D:\AMD\2026.1\Vivado\bin'
)

$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$work=Join-Path $projectRoot 'sim/work_echo_integration'
$vectorDir=Join-Path $projectRoot 'vectors/echo_pipeline_example'

function Invoke-Checked([string]$exe,[string[]]$toolArgs) {
    & $exe @toolArgs
    if ($LASTEXITCODE -ne 0) {
        throw "Tool failed ($LASTEXITCODE): $exe"
    }
}

New-Item -ItemType Directory -Path $work -Force | Out-Null
Push-Location $work
try {
    $processing=Get-ChildItem -LiteralPath (Join-Path $projectRoot 'rtl/processing') -Filter '*.sv' |
        Sort-Object Name |
        ForEach-Object FullName
    $sources=@($processing)
    $sources+=Join-Path $projectRoot 'rtl/integration/adc_pair_echo_pipeline.sv'
    $sources+=Join-Path $projectRoot 'sim/tb_adc_pair_echo_pipeline.sv'

    Invoke-Checked (Join-Path $VivadoBin 'xvlog.bat') (@('--sv')+$sources)
    Invoke-Checked (Join-Path $VivadoBin 'xelab.bat') @(
        'tb_adc_pair_echo_pipeline',
        '-s','echo_integration_sim',
        '-debug','typical'
    )

    $normalizedVectorDir=$vectorDir -replace '\\','/'
    "--runall --testplusarg VECTOR_DIR=$normalizedVectorDir --log echo_integration.log" |
        Set-Content -LiteralPath 'echo_integration.args' -Encoding ascii
    Invoke-Checked (Join-Path $VivadoBin 'xsim.bat') @(
        'echo_integration_sim',
        '--file','echo_integration.args'
    )

    if (-not (Select-String -LiteralPath 'echo_integration.log' `
            -Pattern 'PASS: ADC pair adapter and complete RTL chain matched 256/256 correlation results' `
            -Quiet)) {
        throw 'ADC pair integration simulation did not report PASS'
    }

    Copy-Item -LiteralPath 'echo_integration.log' `
        -Destination (Join-Path $projectRoot 'reports/echo_integration.log') -Force
    Write-Output 'PASS: ADC pair adapter and complete RTL chain matched the golden model.'
} finally {
    Pop-Location
}
