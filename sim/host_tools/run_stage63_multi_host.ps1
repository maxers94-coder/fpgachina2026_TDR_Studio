$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$work=Join-Path $PSScriptRoot 'work/stage63_multi_host'
$sourceDir=Join-Path $root 'echo200_hmi_auto_distance_app/src'
$gcc='D:/vivado/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe'
$savedPath=$env:PATH
Push-Location $work
try {
    $env:PATH=(Split-Path $gcc -Parent)+';'+$env:PATH
    & $gcc -std=c11 -Wall -Wextra -Werror -static -I "$PSScriptRoot/host_stubs" -I $sourceDir `
        "$PSScriptRoot/test_stage63_multi_main.c" "$sourceDir/echo_healthy_baseline.c" "$sourceDir/echo_hmi_wave.c" `
        "$sourceDir/echo_pn.c" "$sourceDir/echo_pn_range.c" "$sourceDir/tdr_hmi_protocol.c" "$sourceDir/echo_reference_guard.c" `
        "$sourceDir/return_candidate1.c" "$sourceDir/long_endpoint1.c" "$sourceDir/multireturn_candidate1.c" "$sourceDir/unified_candidate2.c" "$sourceDir/echo_multi61.c" "$sourceDir/negative_extension1.c" "$sourceDir/weak_candidate1.c" "$sourceDir/positive_candidate1.c" -lm -o stage63_multi_main_host.exe
    if($LASTEXITCODE -ne 0){throw 'Stage61 multi host compile failed'}
    & ./stage63_multi_main_host.exe '../healthy_baseline_ps/healthy_baseline_three_real_frames.txt' `
        "$root/captures/startup_controls/pn_startup_controls_5m_20261030_005731_585" `
        '../stage48_weak_real10m_fixture.txt' '../stage48_positive_real10m_fixture.txt' `
        '../stage48_positions_fixture.txt' '../stage48_class_fixture.txt' 2>&1 | Tee-Object -FilePath stage63_multi_main_host.log
    if($LASTEXITCODE -ne 0){throw 'Stage61 multi host cases failed'}
} finally {$env:PATH=$savedPath;Pop-Location}
