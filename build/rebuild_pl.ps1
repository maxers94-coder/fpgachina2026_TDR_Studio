param([string]$PythonExe='python',[string]$SdkRoot='D:/vivado/2026.1',[string]$RestoreDirectory='')
$ErrorActionPreference='Stop'
if(-not $RestoreDirectory){$RestoreDirectory=Join-Path $PSScriptRoot ('_runs/pl_'+(Get-Date -Format 'yyyyMMdd_HHmmss'))}
if(Test-Path -LiteralPath $RestoreDirectory){throw 'Choose a fresh isolated RestoreDirectory for PL generation.'}
$vivado=Join-Path $SdkRoot 'Vivado/bin/vivado.bat'
if(-not(Test-Path -LiteralPath $vivado)){throw ('Vivado not found: '+$vivado)}
& $PythonExe (Join-Path $PSScriptRoot 'restore_snapshot.py') --scope pl --output $RestoreDirectory
if($LASTEXITCODE -ne 0){throw 'PL source restoration failed.'}
$script=Join-Path $RestoreDirectory 'workspace/vitis_echo200_hmi_ws/echo200_ps_integration/scripts/build_pn_system.tcl'
Push-Location $RestoreDirectory
try{& $vivado -mode batch -source $script -log (Join-Path $RestoreDirectory 'vivado_build.log') -journal (Join-Path $RestoreDirectory 'vivado_build.jou');if($LASTEXITCODE -ne 0){throw 'PL build failed; inspect isolated logs.'}}finally{Pop-Location}
Write-Host 'A rebuilt bitstream requires separate timing review and board validation; sealed BOOT was not changed.'
