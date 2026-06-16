@echo off
setlocal

rem -- Le o token de token.txt (nunca commitado)
if not exist "%~dp0token.txt" (
    echo [ERRO] Arquivo token.txt nao encontrado.
    echo Crie o arquivo token.txt ao lado deste bat com apenas o seu PAT do GitHub.
    pause & exit /b 1
)
set /p TOKEN=<"%~dp0token.txt"
set "REMOTE=https://WolffsRoom:%TOKEN%@github.com/WolffsRoom/AtelierAyeshaPlus-translationPTBR-PSV.git"

chcp 65001 >nul
pushd "%~dp0"

echo [0/3] Removendo locks stale...
for %%L in (".git\index.lock" ".git\HEAD.lock" ".git\refs\heads\main.lock") do (
    if exist "%%~L" del /f /q "%%~L"
)

echo [1/3] Adicionando arquivos...
git add index.html
git add README.md
git add push-json.bat
git add push-html.bat

for /f %%i in ('git diff --cached --name-only 2^>nul ^| find /c "."') do set COUNT=%%i
echo    %COUNT% arquivo(s) para commitar

if "%COUNT%"=="0" (
    echo Nada novo para commitar.
    goto :sync
)

echo [2/3] Commit...
git commit -m "feat: atualiza interface de revisao e scripts"
if errorlevel 1 ( echo [ERRO] Commit falhou. & pause & exit /b 1 )

:sync
echo [3/3] Sincronizando e enviando...
git pull --rebase --autostash %REMOTE% main
if errorlevel 1 ( echo [ERRO] Pull/rebase falhou. & pause & exit /b 1 )

git push %REMOTE% HEAD:main
if errorlevel 1 ( echo [ERRO] Push falhou. & pause & exit /b 1 )

echo.
echo Pronto! Pages atualizado em alguns segundos.
popd
pause
