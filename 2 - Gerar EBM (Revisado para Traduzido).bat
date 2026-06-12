@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem ================================================================
rem  Gera os .ebm traduzidos a partir dos JSON revisados
rem  Origem : Revisado\...     (.json)
rem  Destino: Traduzido\...    (.ebm)  - mantem subpastas
rem ================================================================

set "ROOT=%~dp0"
set "SRC=%ROOT%Revisado"
set "DST=%ROOT%Traduzido"
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

echo Convertendo .json  --^>  .ebm
echo De  : %SRC%
echo Para: %DST%
echo.

for /r "%SRC%" %%F in (*.json) do (
    set "FDIR=%%~dpF"
    set "RELDIR=!FDIR:%SRC%\=!"
    set "OUTDIR=%DST%\!RELDIR!"
    if not exist "!OUTDIR!" mkdir "!OUTDIR!"

    rem copia o .json para a pasta destino, converte e remove a copia
    copy /y "%%F" "!OUTDIR!%%~nxF" >nul
    "%TOOL%" "!OUTDIR!%%~nxF" >nul 2>&1

    if exist "!OUTDIR!%%~nF.ebm" (
        del "!OUTDIR!%%~nxF" >nul 2>&1
        set /a OK+=1
        echo   [OK] !RELDIR!%%~nF.ebm
    ) else (
        set /a FAIL+=1
        echo   [FALHOU] %%F
    )
)

echo.
echo ================================================
echo  Concluido.  Gerados: !OK!   Falhas: !FAIL!
echo ================================================
pause
endlocal
