@echo off
setlocal

rem -- Variaveis ANTES do chcp: o code page 65001 quebra o parser do set em alguns builds do CMD
set "TOKEN=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"
set "REMOTE=https://WolffsRoom:%TOKEN%@github.com/WolffsRoom/AtelierAyeshaPlus-translationPTBR-PSV.git"

chcp 65001 >nul
pushd "%~dp0"

echo [0/5] Removendo locks stale...
for %%L in (".git\index.lock" ".git\HEAD.lock" ".git\refs\heads\main.lock") do (
    if exist "%%~L" del /f /q "%%~L"
)

echo [1/5] Atualizando .gitignore...
powershell -NoProfile -Command "$g=Get-Content .gitignore -Raw; $g=$g -replace '/Sem revisar/\*','/Sem revisar/*.gitkeep'; $g=$g -replace '/Revisado/\*','/Revisado/*.gitkeep'; if($g -notmatch 'Ingles JSON'){$g+=[char]10+'!/Ingles JSON/'+[char]10}; Set-Content .gitignore $g -NoNewline -Encoding UTF8"

echo [2/5] Adicionando arquivos...
git add .gitignore
git add "Sem revisar/"
git add "Revisado/"
if exist "Ingles JSON\" (
    git add "Ingles JSON/"
    echo    Ingles JSON incluido.
)

for /f %%i in ('git diff --cached --name-only 2^>nul ^| find /c "."') do set COUNT=%%i
echo    %COUNT% arquivo(s) para commitar

if "%COUNT%"=="0" (
    echo Nada novo para commitar.
    goto :sync
)

echo [3/5] Commit...
git commit -m "feat: adiciona arquivos JSON (Sem revisar + Revisado)"
if errorlevel 1 ( echo [ERRO] Commit falhou. & pause & exit /b 1 )

:sync
echo [4/5] Sincronizando com remoto (pull --rebase --autostash)...
git pull --rebase --autostash %REMOTE% main
if errorlevel 1 ( echo [ERRO] Pull/rebase falhou. & pause & exit /b 1 )

echo [5/5] Push...
git push %REMOTE% HEAD:main
if errorlevel 1 ( echo [ERRO] Push falhou. & pause & exit /b 1 )

echo.
echo Pronto!
popd
pause
