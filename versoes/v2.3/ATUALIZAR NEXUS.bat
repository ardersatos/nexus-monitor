@echo off
chcp 65001 >NUL
setlocal EnableExtensions
set "VER=2.3"
title NEXUS Monitor %VER% · Atualizar
cd /d "%~dp0"
set "HERE=%~dp0"
if "%HERE:~-1%"=="\" set "HERE=%HERE:~0,-1%"
set "DEST=%LOCALAPPDATA%\Programs\NEXUS Monitor"
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "C=%ESC%[96m" & set "M=%ESC%[95m" & set "G=%ESC%[92m" & set "Y=%ESC%[93m" & set "R=%ESC%[91m" & set "D=%ESC%[90m" & set "B=%ESC%[1m" & set "N=%ESC%[0m"
set "HR=%D%  ────────────────────────────────────────────────────────────%N%"
set "PS=powershell -NoProfile -ExecutionPolicy Bypass -File "%HERE%\nexus_ficheiros.ps1""

rem o update só traz os ficheiros que mudaram: basta a lista e o script
for %%f in (nexus_ficheiros.txt nexus_ficheiros.ps1) do if not exist "%%f" goto naoextraido
set "ARGS=%~1"

rem ---- procura sozinho onde o NEXUS está instalado
set "ACHADO="
for /f "usebackq delims=" %%i in (`%PS% -Modo Procurar`) do set "ACHADO=%%i"
if defined ACHADO set "DEST=%ACHADO%"
set "JA="
if exist "%DEST%\NEXUS Monitor.exe" set "JA=1"
set "COPIAS=%TEMP%\nexus_copias.txt"
%PS% -Modo Antiga -Destino "%DEST%" -Origem "%HERE%" > "%COPIAS%" 2>NUL
set "OLD="
for /f "usebackq delims=" %%o in ("%COPIAS%") do if not defined OLD set "OLD=%%o"
if not defined JA if not defined OLD goto naoInstalado
set "DE=antiga"
if exist "%DEST%\versao.txt" set /p DE=<"%DEST%\versao.txt"
set "SDEXE="
if exist "streamdeck\procurar_streamdeck.ps1" for /f "usebackq delims=" %%p in (`powershell -NoProfile -ExecutionPolicy Bypass -File "streamdeck\procurar_streamdeck.ps1"`) do set "SDEXE=%%p"
set "PLUGSRC=%DEST%\streamdeck\com.nexus.monitor.sdPlugin"
set "PLUGDST=%APPDATA%\Elgato\StreamDeck\Plugins\com.nexus.monitor.sdPlugin"
set "PLUGSTATE=nenhum"
if defined SDEXE call :plugEstado "%HERE%"
set "ADMIN="
net session >NUL 2>NUL && set "ADMIN=1"
if defined ARGS goto atualizar

rem ================================================================ ATUALIZAR
:atualizar
if not defined ADMIN (
  echo.
  cls
  call :logo
  echo   %B%Atualizar o NEXUS Monitor%N%  %D%%DE%%N% %C%→%N% %B%%VER%%N%
  echo   %D%Encontrado em: %DEST%%N%
  echo.
  echo   %Y%!%N% No aviso do Windows carrega em %B%Sim%N%.
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList '1' -Verb RunAs"
  exit /b 0
)
set /a TOTAL=5, I=0
if "%PLUGSTATE%"=="velho" set /a TOTAL+=1
if defined OLD set /a TOTAL+=1

cls
call :logo
echo   %B%A atualizar%N%  %D%%DE% → %VER%%N%
echo   %D%%DEST%%N%
echo.

set "CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if not exist "%CSC%" set "CSC=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe"
if not exist "%CSC%" (
  echo   %R%✗%N% Não encontrei o .NET Framework 4 neste PC.
  goto erroFim
)

rem o update só traz o que mudou nas últimas 2 versões: confirma que o resto já está igual (antes de mexer em nada)
set "FALTA="
for /f "usebackq delims=" %%v in (`%PS% -Modo Verificar -Origem "%HERE%" -Destino "%DEST%"`) do set "FALTA=%%v"
if not "%FALTA%"=="0" goto precisaCompleto

call :passo "Fechar o NEXUS"
call :fecharNexus
call :ok "fechado"

call :passo "Ficheiros"
mkdir "%DEST%" >NUL 2>NUL
for /f "usebackq delims=" %%o in ("%COPIAS%") do for %%d in (lhm presentmon gdu) do if exist "%%o\%%d" if not exist "%DEST%\%%d" xcopy "%%o\%%d" "%DEST%\%%d\" /e /i /y /q >NUL
set "CP=0 0"
for /f "usebackq delims=" %%r in (`%PS% -Modo Copiar -Origem "%HERE%" -Destino "%DEST%"`) do set "CP=%%r"
call :tirarModulos
for /f "tokens=1,2" %%a in ("%CP%") do (set "NCOP=%%a" & set "NDEL=%%b")
if exist "%DEST%\NexusMonitor.cs" (call :ok "%NCOP% atualizados, %NDEL% a mais removidos") else (call :falha "não consegui copiar para %DEST%" & goto erroFim)
cd /d "%DEST%"

call :passo "NEXUS Monitor"
call :compilarNexus || goto erroFim
call :ok "atualizado para %VER%"

if not "%PLUGSTATE%"=="velho" goto atalhos
call :passo "Plugin Stream Deck"
call :instalarPlugin
if "%PLUGRES%"=="ok" call :ok "já atualizado"
if "%PLUGRES%"=="novo" call :ok "atualizado"
if "%PLUGRES%"=="erro" call :falha "erro ao criar - vê o erro_deck.txt"

:atalhos
call :passo "Atalhos"
call :registar
call :ok "versão %VER% registada"

if not defined OLD goto reabrir
call :passo "Outras cópias"
set "RES=0 0"
for /f "usebackq delims=" %%r in (`%PS% -Modo ApagarOutras -Destino "%DEST%" -Origem "%HERE%"`) do set "RES=%%r"
for /f "tokens=1,2" %%a in ("%RES%") do if "%%b"=="0" (call :ok "apagadas: %%a") else (call :falha "apagadas: %%a, falharam: %%b")

:reabrir
call :passo "Abrir o NEXUS"
start "" "%DEST%\NEXUS Monitor.exe"
call :ok "a abrir"

echo.
echo %HR%
echo   %G%%B%✓ Atualizado!%N%  NEXUS Monitor %VER%.
echo   %D%·%N% O que mudou: %C%ATUALIZACOES.txt%N% na pasta do NEXUS ^(ou no menu Iniciar ^> NEXUS Monitor^).
echo %HR%
echo.
del "%COPIAS%" >NUL 2>NUL
echo   %D%Esta janela fecha-se e apaga os ficheiros do update.%N%
timeout /t 3 >NUL
goto autoApagar

:precisaCompleto
set "BASEV="
for /f "usebackq delims=" %%b in (`%PS% -Modo Base -Origem "%HERE%"`) do set "BASEV=%%b"
echo.
echo   %Y%!%N% Este update serve para quem tem a versão %B%%BASEV%%N%
echo     ^(até 2 versões atrás^), e este NEXUS está na %B%%DE%%N%.
echo   %D%Em falta: %FALTA%%N%
echo.
echo   Usa a %B%release normal%N% ^(o zip sem "update" no nome^) e corre o
echo   %C%INSTALAR NEXUS.bat%N%: atualiza na mesma e guarda as tuas definições.
echo.
echo   %D%Nada foi alterado.%N%
echo.
pause
exit /b 1

:naoInstalado
cls
call :logo
echo   %Y%!%N% O NEXUS Monitor não está instalado neste PC.
echo.
echo   Este é o %B%update%N% - só atualiza um NEXUS que já esteja instalado.
echo   Para instalar de raiz usa a %B%release normal%N% ^(o zip sem "update" no nome^)
echo   e corre o %C%INSTALAR NEXUS.bat%N%.
echo.
pause
exit /b 1

:erroFim
echo.
pause
exit /b 1

:cancelado
echo.
echo   %D%Cancelado - nada foi alterado.%N%
timeout /t 3 >NUL
exit /b 0

:naoextraido
cls
echo.
echo   [!] Faltam ficheiros nesta pasta.
echo.
echo   Abriste este ficheiro de dentro do zip?
echo     1. Fecha esta janela.
echo     2. Botão direito no zip ^> "Extrair tudo..." ^> Extrair.
echo     3. Abre a pasta extraída e corre o ATUALIZAR NEXUS.bat de lá.
echo.
pause
exit /b 1

rem ================================================================ FUNÇÕES
:logo
echo.
echo   %C%███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗%N%
echo   %C%████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝%N%
echo   %C%██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗%N%
echo   %M%██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║%N%
echo   %M%██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║%N%
echo   %M%╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝%N%  %D%MONITOR %VER%%N%
echo.
exit /b 0

rem escreve "[n/total] Nome  " sem mudar de linha; :ok / :falha acabam a linha
:passo
set /a I+=1
set "PNOME=%~1                         "
<NUL set /p "=%N%   %D%[%I%/%TOTAL%]%N%  %PNOME:~0,24%"
exit /b 0

:ok
echo %G%✓%N% %D%%~1%N%
exit /b 0

:falha
echo %R%✗%N% %~1
exit /b 0

rem ---- módulos que este PC não tem (Stream Deck / SignalRGB): os ficheiros deles saem da pasta do NEXUS
:tirarModulos
set "TEMSD="
if defined SDEXE set "TEMSD=1"
if exist "%APPDATA%\Elgato\StreamDeck" set "TEMSD=1"
if not defined TEMSD rmdir /s /q "%DEST%\streamdeck" >NUL 2>NUL
if not defined TEMSD del "%DEST%\INSTALAR ADDON STREAM DECK.bat" >NUL 2>NUL
set "TEMSR="
if exist "%LOCALAPPDATA%\VortxEngine" set "TEMSR=1"
if exist "%LOCALAPPDATA%\WhirlwindFX\SignalRgb" set "TEMSR=1"
if not defined TEMSR for /f "usebackq delims=" %%d in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('MyDocuments')"`) do del "%%d\WhirlwindFX\Plugins\NEXUS_Monitor.js" >NUL 2>NUL
exit /b 0

rem cria o NEXUS Monitor.exe na pasta do NEXUS
:compilarNexus
pushd "%DEST%"
del "NEXUS Monitor.exe" >NUL 2>NUL
"%CSC%" /nologo /codepage:65001 /target:winexe /optimize+ /out:"NEXUS Monitor.exe" /win32icon:nexus.ico /resource:index.html,index.html /resource:disk.html,disk.html /resource:pad.html,pad.html /resource:perf.html,perf.html /resource:i18n.js,i18n.js /r:System.Management.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.Core.dll /r:System.ServiceProcess.dll /r:Microsoft.VisualBasic.dll NexusMonitor.cs codigo\*.cs > erro.txt 2>&1
if not exist "NEXUS Monitor.exe" (
  call :falha "erro ao criar o programa"
  echo.
  type erro.txt
  echo.
  echo   %D%Envia o ficheiro erro.txt ^(%DEST%^) a quem te deu o NEXUS.%N%
  popd
  exit /b 1
)
del erro.txt >NUL 2>NUL
> "versao.txt" echo %VER%
popd
exit /b 0

rem PLUGSTATE = nenhum / velho / ok, comparando a assinatura com a do plugin instalado
rem %1 = pasta de onde vêm os ficheiros do plugin (a extraída, antes de copiar; ou a do NEXUS)
:plugEstado
set "PLUGHASH="
for /f "usebackq delims=" %%h in (`powershell -NoProfile -Command "$b='%~1'; $f = @('streamdeck\NexusDeck.cs','streamdeck\com.nexus.monitor.sdPlugin\pi.html','streamdeck\com.nexus.monitor.sdPlugin\manifest.json') | ForEach-Object { if (Test-Path -LiteralPath (Join-Path $b $_)) { Join-Path $b $_ } else { Join-Path '%DEST%' $_ } }; ((Get-FileHash -Algorithm SHA256 -LiteralPath $f | ForEach-Object Hash) -join '').Substring(0,40)"`) do set "PLUGHASH=%%h"
set "PLUGHASH=%PLUGHASH%@%DEST%\"
set "PLUGSTATE=nenhum"
if not exist "%PLUGDST%\NexusDeck.exe" exit /b 0
set "PLUGSTATE=velho"
set "OLDHASH="
if exist "%PLUGDST%\nexus_build.txt" set /p OLDHASH=<"%PLUGDST%\nexus_build.txt"
if "%OLDHASH%"=="%PLUGHASH%" set "PLUGSTATE=ok"
exit /b 0

rem PLUGRES = ok (já estava) / novo / erro
:instalarPlugin
call :plugEstado "%DEST%"
set "PLUGRES=ok"
if "%PLUGSTATE%"=="ok" exit /b 0
del "%PLUGSRC%\NexusDeck.exe" >NUL 2>NUL
"%CSC%" /nologo /codepage:65001 /target:winexe /optimize+ /out:"%PLUGSRC%\NexusDeck.exe" /r:System.Drawing.dll /r:System.Web.Extensions.dll /r:System.Core.dll "%DEST%\streamdeck\NexusDeck.cs" > "%DEST%\erro_deck.txt" 2>&1
if not exist "%PLUGSRC%\NexusDeck.exe" (set "PLUGRES=erro" & exit /b 0)
del "%DEST%\erro_deck.txt" >NUL 2>NUL
> "%PLUGSRC%\nexus_path.txt" echo %DEST%\NEXUS Monitor.exe
> "%PLUGSRC%\nexus_build.txt" echo %PLUGHASH%
taskkill /im "StreamDeck.exe" /f >NUL 2>NUL
taskkill /im "NexusDeck.exe" /f >NUL 2>NUL
timeout /t 2 /nobreak >NUL
if exist "%PLUGDST%" rmdir /s /q "%PLUGDST%" >NUL 2>NUL
xcopy "%PLUGSRC%" "%PLUGDST%\" /e /i /y /q >NUL
rem reabre a Stream Deck sem administrador
if defined SDEXE explorer.exe "%SDEXE%"
if exist "%PLUGDST%\NexusDeck.exe" (set "PLUGRES=novo") else (set "PLUGRES=erro")
exit /b 0

rem atalho no menu Iniciar + entrada em Definições > Aplicações (com o desinstalador)
:registar
set "UK=HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\NEXUS Monitor"
reg add "%UK%" /v DisplayName /d "NEXUS Monitor" /f >NUL
reg add "%UK%" /v DisplayVersion /d "%VER%" /f >NUL
reg add "%UK%" /v Publisher /d "NEXUS" /f >NUL
reg add "%UK%" /v DisplayIcon /d "%DEST%\NEXUS Monitor.exe" /f >NUL
reg add "%UK%" /v InstallLocation /d "%DEST%" /f >NUL
reg add "%UK%" /v UninstallString /d "cmd.exe /c \"\"%DEST%\DESINSTALAR NEXUS.bat\"\"" /f >NUL
reg add "%UK%" /v NoModify /t REG_DWORD /d 1 /f >NUL
reg add "%UK%" /v NoRepair /t REG_DWORD /d 1 /f >NUL
rem os atalhos que existirem passam a apontar para a pasta certa (não cria os que o utilizador não quis)
powershell -NoProfile -Command "$p=[Environment]::GetFolderPath('Programs')+'\NEXUS Monitor.lnk'; if(-not (Test-Path -LiteralPath $p)){exit}; $s=(New-Object -ComObject WScript.Shell).CreateShortcut($p); $s.TargetPath='%DEST%\NEXUS Monitor.exe'; $s.WorkingDirectory='%DEST%'; $s.IconLocation='%DEST%\NEXUS Monitor.exe,0'; $s.Description='NEXUS Monitor'; $s.Save()" >NUL 2>NUL
powershell -NoProfile -Command "$p=[Environment]::GetFolderPath('Desktop')+'\NEXUS Monitor.lnk'; if(-not (Test-Path -LiteralPath $p)){exit}; $s=(New-Object -ComObject WScript.Shell).CreateShortcut($p); $s.TargetPath='%DEST%\NEXUS Monitor.exe'; $s.WorkingDirectory='%DEST%'; $s.IconLocation='%DEST%\NEXUS Monitor.exe,0'; $s.Description='NEXUS Monitor'; $s.Save()" >NUL 2>NUL
exit /b 0

rem fecha o NEXUS com calma (retoma apps em pausa) e só depois à força
:fecharNexus
tasklist /fi "imagename eq NEXUS Monitor.exe" 2>NUL | find /i "NEXUS Monitor.exe" >NUL || exit /b 0
curl -s -m 3 -X POST http://127.0.0.1:8765/api/shutdown >NUL 2>NUL
timeout /t 2 /nobreak >NUL
taskkill /im "NEXUS Monitor.exe" /f >NUL 2>NUL
taskkill /im "PresentMon.exe" /f >NUL 2>NUL
timeout /t 1 /nobreak >NUL
exit /b 0

:temPawn
powershell -NoProfile -Command "if (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like 'PawnIO*' }) { exit 0 } else { exit 1 }" >NUL 2>NUL
exit /b %errorlevel%

rem apaga os ficheiros extraídos do zip (e este .bat) depois de a janela fechar
:autoApagar
set "RM=%TEMP%\nexus_limpar.bat"
> "%RM%" echo @echo off
>>"%RM%" echo timeout /t 2 /nobreak ^>NUL
>>"%RM%" echo powershell -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\nexus_limpar.ps1" -Modo Limpar -Origem "%HERE%" ^>NUL 2^>NUL
>>"%RM%" echo del "%TEMP%\nexus_limpar.ps1" ^>NUL 2^>NUL
>>"%RM%" echo (goto) 2^>NUL ^& del "%%~f0"
copy /y "%HERE%\nexus_ficheiros.ps1" "%TEMP%\nexus_limpar.ps1" >NUL
cd /d "%TEMP%"
start "" /min cmd /c ""%RM%""
exit
