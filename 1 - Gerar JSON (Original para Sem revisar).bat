@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem ================================================================
rem  Gera os JSON a partir dos .ebm
rem  Origem : Original\...        (.ebm)
rem  Destino: Sem revisar\...     (.json)  - mantem subpastas
rem ================================================================

set "ROOT=%~dp0"
set "SRC=%ROOT%Original"
set "DST=%ROOT%Sem revisar"
set "TOOL=%ROOT%Tools\gust_ebm.exe"

if not exist "%TOOL%" (
    echo [ERRO] Nao encontrei o conversor: "%TOOL%"
    pause
    exit /b 1
)
if not exist "%SRC%" (
    echo [ERRO] Nao encontrei a pasta de origem: "%SRC%"
    pause
    exit /b 1
)

set /a OK=0
set /a FAIL=0

echo Convertendo .ebm  --^>  .json
echo De  : %SRC%
echo Para: %DST%
echo.

for /r "%SRC%" %%F in (*.ebm) do (
    set "FDIR=%%~dpF"
    set "RELDIR=!FDIR:%SRC%\=!"
    set "OUTDIR=%DST%\!RELDIR!"
    if not exist "!OUTDIR!" mkdir "!OUTDIR!"

    rem copia o .ebm para a pasta destino, converte e remove a copia
    copy /y "%%F" "!OUTDIR!%%~nxF" >nul
    "%TOOL%" "!OUTDIR!%%~nxF" >nul 2>&1

    if exist "!OUTDIR!%%~nF.json" (
        del "!OUTDIR!%%~nxF" >nul 2>&1
        set /a OK+=1
        echo   [OK] !RELDIR!%%~nF.json
    ) else (
        set /a FAIL+=1
        echo   [FALHOU] %%F
    )
)

echo.
echo Separando arquivos 100%% dummy (JPN / nao traduzidos)...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$sem='%DST%'; $jpn=Join-Path (Split-Path $sem -Parent) 'JPN (dummy)'; $m=0;" ^
  "Get-ChildItem $sem -Recurse -Filter *.json | ForEach-Object {" ^
  "  $t=[IO.File]::ReadAllText($_.FullName,[Text.UTF8Encoding]::new($false));" ^
  "  $tot=([regex]::Matches($t,'\"msg_string\":')).Count;" ^
  "  $dum=([regex]::Matches($t,'\"msg_string\": \"' + [char]0x30c0 + [char]0x30df + [char]0x30fc + '\"')).Count;" ^
  "  if($tot -gt 0 -and $tot -eq $dum){" ^
  "    $rel=$_.FullName.Substring($sem.Length+1); $tg=Join-Path $jpn $rel; $td=Split-Path $tg -Parent;" ^
  "    if(-not(Test-Path $td)){New-Item -ItemType Directory -Force $td ^| Out-Null};" ^
  "    Move-Item $_.FullName $tg -Force; $m++ } };" ^
  "Get-ChildItem $sem -Recurse -Directory ^| Where-Object {@(Get-ChildItem $_.FullName -Recurse -File).Count -eq 0} ^| Remove-Item -Recurse -Force -ErrorAction SilentlyContinue;" ^
  "Write-Host ('  Movidos para JPN (dummy): ' + $m)"

echo.
echo ================================================
echo  Concluido.  Convertidos: !OK!   Falhas: !FAIL!
echo ================================================
pause
endlocal
