param(
    [ValidateSet('Sim','Project','Build','Rebuild')] [string]$Action='Sim',
    [string]$VivadoBin='D:\vivado\2026.1\Vivado\bin'
)
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$scriptRoot=$PSScriptRoot
$mappedDrive=$null
function Invoke-Checked([string]$exe,[string[]]$toolArgs) {
    & $exe @toolArgs
    if ($LASTEXITCODE -ne 0) { throw "Tool failed ($LASTEXITCODE): $exe" }
}
try {
# Vivado native tools can terminate without diagnostics under non-ASCII paths.
# SUBST is only a temporary alias; source files stay in the user's directory.
if ($projectRoot -match '[^\x00-\x7F]') {
    foreach($letter in 'Z','Y','X','W','U','T','S','R','Q') {
        $candidate="${letter}:"
        if (-not (Test-Path "${candidate}\")) {
            & "$env:SystemRoot\System32\subst.exe" $candidate $projectRoot
            if($LASTEXITCODE -ne 0) {throw 'Cannot create temporary ASCII build path'}
            $mappedDrive=$candidate
            $projectRoot="${candidate}\"
            $scriptRoot=Join-Path $projectRoot 'scripts'
            break
        }
    }
    if(-not $mappedDrive) {throw 'No free drive letter; copy this folder to an ASCII-only path'}
}
if ($Action -eq 'Sim') {
    $simWork=Join-Path $projectRoot 'sim/work'
    New-Item -ItemType Directory -Path $simWork -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $projectRoot 'rtl/sine_q15.mem') -Destination $simWork
    Copy-Item -LiteralPath (Join-Path $projectRoot 'rtl/ad9516_adc200m_dacref200m.mem') -Destination $simWork
    Push-Location $simWork
    try {
        $sources=@(Get-ChildItem -LiteralPath (Join-Path $projectRoot 'rtl') -Filter '*.sv' | ForEach-Object FullName)
        $sources+=Join-Path $projectRoot 'sim/tb_dac_sine.sv'
        $sources+=Join-Path (Split-Path $VivadoBin -Parent) 'data/verilog/src/glbl.v'
        Invoke-Checked (Join-Path $VivadoBin 'xvlog.bat') (@('--sv')+$sources)
        Invoke-Checked (Join-Path $VivadoBin 'xelab.bat') @('tb_dac_sine','glbl','-L','unisims_ver','-s','dac_sine_sim','-debug','typical')
        foreach($scenario in 0..8) {
            $logFile="scenario_$scenario.log"
            # An option file keeps cmd.exe batch wrappers from splitting '='.
            "--runall --testplusarg SCENARIO=$scenario --log $logFile" | Set-Content -LiteralPath 'scenario.args' -Encoding ascii
            Invoke-Checked (Join-Path $VivadoBin 'xsim.bat') @('dac_sine_sim','--file','scenario.args')
            if (-not (Select-String -LiteralPath $logFile -Pattern "PASS: scenario $scenario" -Quiet)) {
                throw "Simulation scenario $scenario did not pass"
            }
            Copy-Item -LiteralPath $logFile -Destination (Join-Path $projectRoot "reports/$logFile")
        }
        Copy-Item -LiteralPath 'adc_waveform.csv' -Destination (Join-Path $projectRoot 'reports/adc_waveform.csv')
        Copy-Item -LiteralPath 'waveform.csv' -Destination (Join-Path $projectRoot 'reports/waveform.csv')
    } finally { Pop-Location }
} else {
    $script=if($Action -eq 'Build'){'build.tcl'}elseif($Action -eq 'Rebuild'){'rebuild.tcl'}else{'create_project.tcl'}
    Push-Location $projectRoot
    try {
        Invoke-Checked (Join-Path $VivadoBin 'vivado.bat') @('-mode','batch','-source',(Join-Path $scriptRoot $script),'-log',"reports/$Action.log",'-journal',"reports/$Action.jou")
    } finally { Pop-Location }
}
} finally {
    if($mappedDrive) { & "$env:SystemRoot\System32\subst.exe" $mappedDrive /D }
}
