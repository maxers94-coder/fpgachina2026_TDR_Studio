param([string]$PythonExe='python',[string]$SdkRoot='D:/vivado/2026.1',[string]$RestoreDirectory='')
$ErrorActionPreference='Stop'
$projectRoot=Split-Path $PSScriptRoot -Parent
if(-not $RestoreDirectory){$RestoreDirectory=Join-Path $projectRoot 'build/_host_restored'}
& $PythonExe (Join-Path $projectRoot 'build/restore_snapshot.py') --scope host --output $RestoreDirectory
if($LASTEXITCODE -ne 0){throw 'Host source restoration failed.'}
$ws=Join-Path $RestoreDirectory 'workspace/vitis_echo200_hmi_ws'
$script=Join-Path $ws 'pn_dev/run_stage63_multi_host.ps1'
$gcc=Join-Path $SdkRoot 'tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe'
if(-not(Test-Path -LiteralPath $gcc)){throw ('Host compiler missing: '+$gcc)}
$sourceText=Get-Content -Raw -LiteralPath $script
$sourceText=$sourceText.Replace('D:/vivado/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe',$gcc.Replace('\','/'))
$runner=Join-Path $ws 'pn_dev/run_host_local.ps1'
if(Test-Path -LiteralPath $runner){throw 'Previous local runner exists; use a fresh RestoreDirectory.'}
Set-Content -LiteralPath $runner -Value $sourceText -Encoding UTF8
$work=Join-Path $ws 'pn_dev/work/stage63_multi_host'
New-Item -ItemType Directory -Path $work -Force | Out-Null
& $runner
if(-not $?){throw 'Host regression failed.'}
