param([string]$VivadoBin='D:\AMD\2026.1\Vivado\bin')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
$drive=@('Z:','Y:','X:','W:') | Where-Object {
    -not (Test-Path "$_\")
} | Select-Object -First 1
if(-not $drive) { throw 'No free drive letter for Vivado path mapping' }
& "$env:SystemRoot\System32\subst.exe" $drive $projectRoot
if($LASTEXITCODE -ne 0) { throw 'SUBST failed' }
try {
    $xpr="$drive\vivado_ps\echo_ps_system.xpr"
    if(-not (Test-Path $xpr)) { throw "Project missing: $xpr" }
    & (Join-Path $VivadoBin 'vivado.bat') -mode gui -project $xpr
    if($LASTEXITCODE -ne 0) { throw "Vivado exited with $LASTEXITCODE" }
} finally {
    & "$env:SystemRoot\System32\subst.exe" $drive /D
}
