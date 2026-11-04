param([string]$PythonExe='python',[string]$SdkRoot='D:/vivado/2026.1',[string]$RestoreDirectory='',[string]$BuildDirectory='')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
if(-not $RestoreDirectory){$RestoreDirectory=Join-Path $PSScriptRoot '_restored'}
& $PythonExe (Join-Path $PSScriptRoot 'restore_snapshot.py') --scope app --output $RestoreDirectory
if($LASTEXITCODE -ne 0){throw 'Source restoration failed.'}
if(-not $BuildDirectory){$BuildDirectory=Join-Path $PSScriptRoot ('_runs/app_'+(Get-Date -Format 'yyyyMMdd_HHmmss'))}
$legacy=Join-Path $RestoreDirectory 'tools/rebuild_fw63_app.ps1'
& $legacy -WorkspaceRoot (Join-Path $RestoreDirectory 'workspace/vitis_echo200_hmi_ws') -SdkRoot $SdkRoot -BuildDirectory $BuildDirectory
if(-not $?){throw 'Application build failed.'}
Write-Host ('NEW_APP_OUTPUT: '+$BuildDirectory)
