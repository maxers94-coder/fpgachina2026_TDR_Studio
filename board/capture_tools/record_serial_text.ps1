param([string]$Port='', [switch]$PlanOnly, [switch]$FunctionsOnly)
$ErrorActionPreference='Stop'

function Get-LogReadCommand([char]$key) {
    $command=([string]$key).ToUpperInvariant()
    if($command -cin @('V','J','I','R','C')){return $command}
    return $null
}
function Write-LogReceive($writer,[string]$text,[switch]$Quiet) {
    if($text.Length){$writer.Write($text);$writer.Flush();if(-not $Quiet){[Console]::Write($text)}}
}
if($FunctionsOnly){return}
if($PlanOnly){
    [ordered]@{schema='SERIAL_TEXT_LOG_PLAN_1';baud=115200;data_bits=8;stop_bits=1;parity='None';
        automatic_commands=@();keyboard_commands=@('V','J','I','R','C');quit_key='Q';
        DTR=$false;RTS=$false;firmware_changed=$false}|ConvertTo-Json
    return
}
$workspace=Split-Path $PSScriptRoot -Parent
$serial=$null;$writer=$null;$txWriter=$null;$folder=$null;$failure=$null;$userQuit=$false
$utf8=New-Object Text.UTF8Encoding($false)
$clock=[Diagnostics.Stopwatch]::StartNew()
try {
    Write-Host 'Close VOFA/other serial programs. Use SCREEN CONTINUOUS and STOP for measurements.' -ForegroundColor Yellow
    if(-not $Port){$Port=Read-Host 'PC serial port (ENTER = COM7)';if(-not $Port){$Port='COM7'}}
    $Port=$Port.Trim().ToUpperInvariant()
    if($Port -notmatch '^COM[0-9]+$'){throw 'Enter a serial port such as COM7'}
    $parent=Join-Path $workspace 'captures/continuous_distance'
    New-Item -ItemType Directory -Path $parent -Force|Out-Null
    $folder=Join-Path $parent ('serial_text_'+(Get-Date -Format 'yyyyMMdd_HHmmss_fff'))
    New-Item -ItemType Directory -Path $folder -ErrorAction Stop|Out-Null
    $rxPath=Join-Path $folder 'received.txt'
    $writer=New-Object IO.StreamWriter([IO.File]::Open($rxPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::Read),$utf8)
    $txWriter=New-Object IO.StreamWriter([IO.File]::Open((Join-Path $folder 'sent.tsv'),[IO.FileMode]::CreateNew,[IO.FileAccess]::Write,[IO.FileShare]::Read),$utf8)
    $writer.AutoFlush=$true;$txWriter.AutoFlush=$true
    $serial=New-Object IO.Ports.SerialPort($Port,115200,[IO.Ports.Parity]::None,8,[IO.Ports.StopBits]::One)
    $serial.Handshake=[IO.Ports.Handshake]::None;$serial.DtrEnable=$false;$serial.RtsEnable=$false
    $serial.Encoding=[Text.Encoding]::ASCII;$serial.ReadBufferSize=65536;$serial.ReadTimeout=100;$serial.WriteTimeout=2000
    $serial.Open()
    Write-Host ('RECORDING: '+$rxPath) -ForegroundColor Green
    Write-Host 'Click this console, then press V/J/I/R/C to send ONE read command (no ENTER required).'
    Write-Host 'Wait for each command output to finish. Keep reference and cables unchanged while measuring.'
    Write-Host 'After SCREEN STOP and the final exports, press Q to finish/save. Q does not stop the board.'
    while(-not $userQuit){
        Write-LogReceive $writer ($serial.ReadExisting())
        if([Console]::KeyAvailable){
            $key=[Console]::ReadKey($true)
            if($key.Key -eq [ConsoleKey]::Q){$userQuit=$true;break}
            $command=Get-LogReadCommand $key.KeyChar
            if($command){
                $txWriter.WriteLine(('{0:F6}' -f $clock.Elapsed.TotalMilliseconds)+"`t"+$command)
                $serial.Write($command)
                Write-Host ("`n[SENT "+$command+']') -ForegroundColor Cyan
            }
        }
        Start-Sleep -Milliseconds 10
    }
    # Preserve late bytes already arriving after the final key, without waiting indefinitely.
    $drain=[Diagnostics.Stopwatch]::StartNew();$lastData=$drain.ElapsedMilliseconds
    while($drain.ElapsedMilliseconds -lt 2000){
        $text=$serial.ReadExisting()
        if($text.Length){Write-LogReceive $writer $text;$lastData=$drain.ElapsedMilliseconds}
        elseif($drain.ElapsedMilliseconds-$lastData -ge 200){break}
        Start-Sleep -Milliseconds 10
    }
} catch {
    $failure=$_.Exception.Message
    Write-Host ('FAILED: '+$failure+'; any received text is kept.') -ForegroundColor Red
} finally {
    if($null -ne $writer){$writer.Dispose()}
    if($null -ne $txWriter){$txWriter.Dispose()}
    if($null -ne $serial){$serial.Dispose()}
    if($folder){
        $meta=[ordered]@{schema='SERIAL_TEXT_LOG_1';port=$Port;baud=115200;ended_with_Q=$userQuit;
            failure=$failure;automatic_commands_sent=0;physical_screen_observation_recorded=$false;
            qualification='Raw received text and manually requested read exports; no automatic measurement or numerical acceptance.'}
        [IO.File]::WriteAllText((Join-Path $folder 'session.json'),($meta|ConvertTo-Json),$utf8)
        Write-Host ("`nSAVED TEXT: "+(Join-Path $folder 'received.txt')) -ForegroundColor Green
        Write-Host ('SEND THIS FOLDER: '+$folder)
    }
}
if($failure){exit 1}
