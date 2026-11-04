param(
    [string]$WorkspaceRoot = '',
    [string]$SdkRoot = 'D:/vivado/2026.1',
    [string]$BuildDirectory = ''
)
$ErrorActionPreference='Stop'
if(-not $WorkspaceRoot){$WorkspaceRoot=Join-Path (Split-Path $PSScriptRoot -Parent) 'workspace/vitis_echo200_hmi_ws'}
$WorkspaceRoot=(Resolve-Path -LiteralPath $WorkspaceRoot).Path
$src=Join-Path $WorkspaceRoot 'echo200_hmi_auto_distance_app/src'
$bsp=Join-Path $WorkspaceRoot 'echo200_hmi_platform/export/echo200_hmi_platform/sw/standalone_ps7_cortexa9_0'
$cmake=Join-Path $SdkRoot 'Vitis/tps/win64/cmake-4.0.1/bin/cmake.exe'
$ninja=Join-Path $SdkRoot 'Vitis/bin/ninja.exe'
$compilerDir=Join-Path $SdkRoot 'Vitis/gnu/aarch32/nt/gcc-arm-none-eabi/bin'
foreach($p in @($src,$bsp,$cmake,$ninja,(Join-Path $compilerDir 'arm-none-eabi-gcc.exe'))){if(-not(Test-Path -LiteralPath $p)){throw "Missing dependency: $p"}}
if(-not $BuildDirectory){$BuildDirectory=Join-Path (Split-Path $WorkspaceRoot -Parent) ('fw63_build_'+(Get-Date -Format 'yyyyMMdd_HHmmss'))}
if(Test-Path -LiteralPath $BuildDirectory){throw 'Preserve existing output; choose a new BuildDirectory.'}
New-Item -ItemType Directory -Path $BuildDirectory -ErrorAction Stop|Out-Null
$BuildDirectory=(Resolve-Path -LiteralPath $BuildDirectory).Path
$savedPath=$env:PATH
try{
    $env:PATH=$compilerDir+';'+(Split-Path $cmake -Parent)+';'+(Split-Path $ninja -Parent)+';'+$env:PATH
    $bsp=$bsp.Replace('\','/');$src=$src.Replace('\','/')
    & $cmake -S $src -B $BuildDirectory -G Ninja "-DCMAKE_MAKE_PROGRAM=$ninja" `
        "-DCMAKE_TOOLCHAIN_FILE=$bsp/cortexa9_toolchain.cmake" "-DCMAKE_MODULE_PATH=$bsp" `
        "-DCMAKE_SPECS_FILE=$bsp/Xilinx.spec" '-DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY' `
        "-DCMAKE_LIBRARY_PATH=$bsp/lib" "-DCMAKE_INCLUDE_PATH=$bsp/include" 2>&1 | Tee-Object -FilePath (Join-Path $BuildDirectory 'configure.log')
    if($LASTEXITCODE -ne 0){throw 'Fresh application configure failed; inspect configure.log.'}
    & $cmake --build $BuildDirectory 2>&1 | Tee-Object -FilePath (Join-Path $BuildDirectory 'build.log')
    if($LASTEXITCODE -ne 0){throw 'Application build failed; inspect build.log.'}
    $elf=Join-Path $BuildDirectory 'echo200_hmi_auto_distance_app.elf'
    if(-not(Test-Path -LiteralPath $elf)){throw 'Build returned no application ELF.'}
    Write-Host ('APP_BUILD_PASS: '+$elf) -ForegroundColor Green
    Write-Host 'This builds an application only; it does not replace the sealed BOOT or access a board.'
}finally{$env:PATH=$savedPath}
