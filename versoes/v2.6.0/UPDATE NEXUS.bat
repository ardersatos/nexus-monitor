@echo off
chcp 65001 >NUL
setlocal EnableExtensions
call :nxlang
setlocal EnableExtensions EnableDelayedExpansion
set "VER=2.6.0"
title NEXUS Monitor %VER% !T_1!
cd /d "%~dp0"
set "HERE=%~dp0"
if "%HERE:~-1%"=="\" set "HERE=%HERE:~0,-1%"
set "DEST=%LOCALAPPDATA%\Programs\NEXUS Monitor"
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "C=%ESC%[96m" & set "M=%ESC%[95m" & set "G=%ESC%[92m" & set "Y=%ESC%[93m" & set "R=%ESC%[91m" & set "D=%ESC%[90m" & set "B=%ESC%[1m" & set "N=%ESC%[0m"
set "HR=%D%  ────────────────────────────────────────────────────────────%N%"
set "PS=powershell -NoProfile -ExecutionPolicy Bypass -File "%HERE%\nexus_files.ps1""

rem o update só traz os ficheiros que mudaram: basta a lista e o script
for %%f in (nexus_files.txt nexus_files.ps1) do if not exist "%%f" goto naoextraido
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
rem o plugin é verificado sempre que está instalado (mesmo que a app Stream Deck não seja encontrada)
if defined SDEXE (call :plugEstado "%HERE%") else if exist "%PLUGDST%\NexusDeck.exe" call :plugEstado "%HERE%"
set "ADMIN="
net session >NUL 2>NUL && set "ADMIN=1"
if defined ARGS goto atualizar

rem ================================================================ ATUALIZAR
:atualizar
if not defined ADMIN (
  echo.
  cls
  call :logo
  echo   %B%!T_2!%N%  %D%%DE%%N% %C%→%N% %B%%VER%%N%
  echo   %D%!T_3! %DEST%%N%
  echo.
  echo   %Y%!T_6!%N% !T_5! %B%!T_4!%N%.
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList '1' -Verb RunAs"
  exit /b 0
)
set /a TOTAL=5, I=0
if "%PLUGSTATE%"=="velho" set /a TOTAL+=1
if "%PLUGSTATE%"=="nenhum" if defined SDEXE set /a TOTAL+=1
if defined OLD set /a TOTAL+=1

cls
call :logo
echo   %B%!T_7!%N%  %D%%DE% → %VER%%N%
echo   %D%%DEST%%N%
echo.

set "CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if not exist "%CSC%" set "CSC=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe"
if not exist "%CSC%" (
  echo   %R%✗%N% !T_8!
  goto erroFim
)

rem o update só traz o que mudou nas últimas 2 versões: confirma que o resto já está igual (antes de mexer em nada)
set "FALTA="
for /f "usebackq delims=" %%v in (`%PS% -Modo Verificar -Origem "%HERE%" -Destino "%DEST%"`) do set "FALTA=%%v"
if not "%FALTA%"=="0" goto precisaCompleto

call :passo "!T_9!"
call :fecharNexus
call :ok "!T_10!"

call :passo "!T_11!"
mkdir "%DEST%" >NUL 2>NUL
for /f "usebackq delims=" %%o in ("%COPIAS%") do for %%d in (lhm presentmon gdu) do if exist "%%o\%%d" if not exist "%DEST%\%%d" xcopy "%%o\%%d" "%DEST%\%%d\" /e /i /y /q >NUL
set "CP=0 0"
for /f "usebackq delims=" %%r in (`%PS% -Modo Copiar -Origem "%HERE%" -Destino "%DEST%"`) do set "CP=%%r"
call :tirarModulos
for /f "tokens=1,2" %%a in ("%CP%") do (set "NCOP=%%a" & set "NDEL=%%b")
if exist "%DEST%\NexusMonitor.cs" (call :ok "%NCOP% !T_14! %NDEL% !T_13!") else (call :falha "!T_12! %DEST%" & goto erroFim)
cd /d "%DEST%"

call :passo "NEXUS Monitor"
call :compilarNexus || goto erroFim
call :ok "!T_15! %VER%"

rem o plugin da Stream Deck atualiza-se sempre com o NEXUS (e instala-se se a app Stream Deck existir)
if "%PLUGSTATE%"=="ok" goto atalhos
if "%PLUGSTATE%"=="nenhum" if not defined SDEXE goto atalhos
call :passo "!T_16!"
call :instalarPlugin
if "%PLUGRES%"=="ok" call :ok "!T_17!"
if "%PLUGRES%"=="novo" call :ok "!T_18!"
if "%PLUGRES%"=="erro" call :falha "!T_19!"
if "%PLUGRES%"=="copia" call :falha "!T_20!"

:atalhos
call :passo "!T_21!"
call :registar
call :ok "!T_23! %VER% !T_22!"

if not defined OLD goto reabrir
call :passo "!T_24!"
set "RES=0 0"
for /f "usebackq delims=" %%r in (`%PS% -Modo ApagarOutras -Destino "%DEST%" -Origem "%HERE%"`) do set "RES=%%r"
for /f "tokens=1,2" %%a in ("%RES%") do if "%%b"=="0" (call :ok "!T_26! %%a") else (call :falha "!T_26! %%a!T_25! %%b")

:reabrir
call :passo "!T_27!"
start "" "%DEST%\NEXUS Monitor.exe"
call :ok "!T_28!"

echo.
echo %HR%
echo   %G%%B%!T_29!%N%  NEXUS Monitor %VER%.
echo   %D%·%N% !T_32! %C%!T_31!%N% !T_30!
echo %HR%
echo.
del "%COPIAS%" >NUL 2>NUL
echo   %D%!T_33!%N%
timeout /t 3 >NUL
goto autoApagar

:precisaCompleto
set "BASEV="
for /f "usebackq delims=" %%b in (`%PS% -Modo Base -Origem "%HERE%"`) do set "BASEV=%%b"
echo.
echo   %Y%!T_6!%N% !T_34! %B%%BASEV%%N%
echo     !T_35! %B%%DE%%N%.
echo   %D%!T_36! %FALTA%%N%
echo.
echo   !T_39! %B%!T_38!%N% !T_37!
echo   %C%INSTALL NEXUS.bat%N%!T_40!
echo.
echo   %D%!T_41!%N%
echo.
pause
exit /b 1

:naoInstalado
cls
call :logo
echo   %Y%!T_6!%N% !T_42!
echo.
echo   !T_45! %B%!T_44!%N% !T_43!
echo   !T_47! %B%!T_38!%N% !T_46!
echo   !T_48! %C%INSTALL NEXUS.bat%N%.
echo.
pause
exit /b 1

:erroFim
echo.
pause
exit /b 1

:cancelado
echo.
echo   %D%!T_49!%N%
timeout /t 3 >NUL
exit /b 0

:naoextraido
cls
echo.
echo   !T_50!
echo.
echo   !T_51!
echo     !T_52!
echo     !T_53!
echo     !T_54!
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
if not defined TEMSD del "%DEST%\INSTALL STREAM DECK ADDON.bat" >NUL 2>NUL
set "TEMSR="
if exist "%LOCALAPPDATA%\VortxEngine" set "TEMSR=1"
if exist "%LOCALAPPDATA%\WhirlwindFX\SignalRgb" set "TEMSR=1"
if not defined TEMSR for /f "usebackq delims=" %%d in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('MyDocuments')"`) do del "%%d\WhirlwindFX\Plugins\NEXUS_Monitor.js" >NUL 2>NUL
exit /b 0

rem cria o NEXUS Monitor.exe na pasta do NEXUS
:compilarNexus
pushd "%DEST%"
del "NEXUS Monitor.exe" >NUL 2>NUL
"%CSC%" /nologo /codepage:65001 /target:winexe /optimize+ /out:"NEXUS Monitor.exe" /win32icon:nexus.ico /resource:index.html,index.html /resource:disk.html,disk.html /resource:pad.html,pad.html /resource:perf.html,perf.html /resource:i18n.js,i18n.js /resource:tour.js,tour.js /resource:shell.js,shell.js /r:System.Management.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.Core.dll /r:System.ServiceProcess.dll /r:Microsoft.VisualBasic.dll NexusMonitor.cs codigo\*.cs > erro.txt 2>&1
if not exist "NEXUS Monitor.exe" (
  call :falha "!T_55!"
  echo.
  type erro.txt
  echo.
  echo   %D%!T_57!%DEST%!T_56!%N%
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
if not defined SDEXE for /f "usebackq delims=" %%p in (`powershell -NoProfile -Command "(Get-Process StreamDeck -ErrorAction SilentlyContinue | Select-Object -First 1).Path"`) do set "SDEXE=%%p"
taskkill /im "StreamDeck.exe" /f >NUL 2>NUL
taskkill /im "NexusDeck.exe" /f >NUL 2>NUL
timeout /t 2 /nobreak >NUL
rem a Stream Deck pode demorar a largar os ficheiros: tenta até 3 vezes e confere que o plugin copiado é mesmo o novo
set "CPOK="
for /l %%i in (1,1,3) do if not defined CPOK (
  taskkill /im "StreamDeck.exe" /f >NUL 2>NUL
  taskkill /im "NexusDeck.exe" /f >NUL 2>NUL
  if exist "%PLUGDST%" rmdir /s /q "%PLUGDST%" >NUL 2>NUL
  xcopy "%PLUGSRC%" "%PLUGDST%\" /e /i /y /q >NUL 2>NUL
  fc /b "%PLUGSRC%\NexusDeck.exe" "%PLUGDST%\NexusDeck.exe" >NUL 2>NUL && set "CPOK=1"
  if not defined CPOK timeout /t 2 /nobreak >NUL
)
rem reabre a Stream Deck sem administrador
if defined SDEXE explorer.exe "%SDEXE%"
if defined CPOK (set "PLUGRES=novo") else (set "PLUGRES=copia")
exit /b 0

rem atalho no menu Iniciar + entrada em Definições > Aplicações (com o desinstalador)
:registar
set "UK=HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\NEXUS Monitor"
reg add "%UK%" /v DisplayName /d "NEXUS Monitor" /f >NUL
reg add "%UK%" /v DisplayVersion /d "%VER%" /f >NUL
reg add "%UK%" /v Publisher /d "NEXUS" /f >NUL
reg add "%UK%" /v DisplayIcon /d "%DEST%\NEXUS Monitor.exe" /f >NUL
reg add "%UK%" /v InstallLocation /d "%DEST%" /f >NUL
reg add "%UK%" /v UninstallString /d "cmd.exe /c \"\"%DEST%\UNINSTALL NEXUS.bat\"\"" /f >NUL
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
copy /y "%HERE%\nexus_files.ps1" "%TEMP%\nexus_limpar.ps1" >NUL
cd /d "%TEMP%"
start "" /min cmd /c ""%RM%""
exit

rem ================================================================ LÍNGUA (gerado na build)
:nxlang
set "NXL=en"
for /f "usebackq delims=" %%l in (`powershell -NoProfile -Command "(Get-UICulture).TwoLetterISOLanguageName"`) do set "NXL=%%l"
if defined NEXUS_LANG set "NXL=%NEXUS_LANG%"
if /i not "%NXL%"=="pt" if /i not "%NXL%"=="es" if /i not "%NXL%"=="fr" if /i not "%NXL%"=="de" set "NXL=en"
goto nxl_%NXL%
:nxl_pt
set "K_YN=SN" & set "K_SEC=SEC" & set "K_S1=S" & set "K_S2=E" & set "K_S3=C"
set "T_1=· Atualizar"
set "T_2=Atualizar o NEXUS Monitor"
set "T_3=Encontrado em:"
set "T_4=Sim"
set "T_5=No aviso do Windows carrega em"
set "T_6=!"
set "T_7=A atualizar"
set "T_8=Não encontrei o .NET Framework 4 neste PC."
set "T_9=Fechar o NEXUS"
set "T_10=fechado"
set "T_11=Ficheiros"
set "T_12=não consegui copiar para"
set "T_13=a mais removidos"
set "T_14=atualizados,"
set "T_15=atualizado para"
set "T_16=Plugin Stream Deck"
set "T_17=já atualizado"
set "T_18=atualizado"
set "T_19=erro ao criar - vê o erro_deck.txt"
set "T_20=não consegui copiar"
set "T_21=Atalhos"
set "T_22=registada"
set "T_23=versão"
set "T_24=Outras cópias"
set "T_25=, falharam:"
set "T_26=apagadas:"
set "T_27=Abrir o NEXUS"
set "T_28=a abrir"
set "T_29=✓ Atualizado!"
set "T_30=na pasta do NEXUS (ou no menu Iniciar > NEXUS Monitor)."
set "T_31=CHANGELOG.pt.txt"
set "T_32=O que mudou:"
set "T_33=Esta janela fecha-se e apaga os ficheiros do update."
set "T_34=Este update serve para quem tem a versão"
set "T_35=(até 2 versões atrás), e este NEXUS está na"
set "T_36=Em falta:"
set "T_37=(o zip sem "update" no nome) e corre o"
set "T_38=release normal"
set "T_39=Usa a"
set "T_40=: atualiza na mesma e guarda as tuas definições."
set "T_41=Nada foi alterado."
set "T_42=O NEXUS Monitor não está instalado neste PC."
set "T_43=- só atualiza um NEXUS que já esteja instalado."
set "T_44=update"
set "T_45=Este é o"
set "T_46=(o zip sem "update" no nome)"
set "T_47=Para instalar de raiz usa a"
set "T_48=e corre o"
set "T_49=Cancelado - nada foi alterado."
set "T_50=[!] Faltam ficheiros nesta pasta."
set "T_51=Abriste este ficheiro de dentro do zip?"
set "T_52=1. Fecha esta janela."
set "T_53=2. Botão direito no zip > "Extrair tudo..." > Extrair."
set "T_54=3. Abre a pasta extraída e corre o UPDATE NEXUS.bat de lá."
set "T_55=erro ao criar o programa"
set "T_56=) a quem te deu o NEXUS."
set "T_57=Envia o ficheiro erro.txt ("
exit /b 0
:nxl_en
set "K_YN=YN" & set "K_SEC=HBT" & set "K_S1=H" & set "K_S2=B" & set "K_S3=T"
set "T_1=· Update"
set "T_2=Update NEXUS Monitor"
set "T_3=Found in:"
set "T_4=Yes"
set "T_5=In the Windows prompt, click"
set "T_6=!"
set "T_7=Updating"
set "T_8=Couldn't find .NET Framework 4 on this PC."
set "T_9=Close NEXUS"
set "T_10=closed"
set "T_11=Files"
set "T_12=couldn't copy to"
set "T_13=extra ones removed"
set "T_14=updated,"
set "T_15=updated to"
set "T_16=Stream Deck plugin"
set "T_17=already up to date"
set "T_18=updated"
set "T_19=build error - see erro_deck.txt"
set "T_20=couldn't copy"
set "T_21=Shortcuts"
set "T_22=registered"
set "T_23=version"
set "T_24=Other copies"
set "T_25=, failed:"
set "T_26=deleted:"
set "T_27=Open NEXUS"
set "T_28=opening"
set "T_29=✓ Updated!"
set "T_30=in the NEXUS folder."
set "T_31=CHANGELOG.txt"
set "T_32=What changed:"
set "T_33=This window closes and deletes the update files."
set "T_34=This update is for people who have version"
set "T_35=(up to 2 versions back), and this NEXUS is on"
set "T_36=Missing:"
set "T_37=(the zip without "update" in its name) and run"
set "T_38=full release"
set "T_39=Use the"
set "T_40=: it updates anyway and keeps your settings."
set "T_41=Nothing was changed."
set "T_42=NEXUS Monitor is not installed on this PC."
set "T_43=- it only updates a NEXUS that is already installed."
set "T_44=update"
set "T_45=This is the"
set "T_46=(the zip without "update" in its name)"
set "T_47=For a fresh install use the"
set "T_48=and run"
set "T_49=Cancelled - nothing was changed."
set "T_50=[!] Files are missing in this folder."
set "T_51=Did you open this file from inside the zip?"
set "T_52=1. Close this window."
set "T_53=2. Right-click the zip > "Extract All..." > Extract."
set "T_54=3. Open the extracted folder and run UPDATE NEXUS.bat from there."
set "T_55=error building the program"
set "T_56=) to whoever gave you NEXUS."
set "T_57=Send the erro.txt file ("
exit /b 0
:nxl_es
set "K_YN=SN" & set "K_SEC=AEC" & set "K_S1=A" & set "K_S2=E" & set "K_S3=C"
set "T_1=· Actualizar"
set "T_2=Actualizar NEXUS Monitor"
set "T_3=Encontrado en:"
set "T_4=Sí"
set "T_5=En el aviso de Windows pulsa"
set "T_6=!"
set "T_7=Actualizando"
set "T_8=No encontré .NET Framework 4 en este PC."
set "T_9=Cerrar NEXUS"
set "T_10=cerrado"
set "T_11=Archivos"
set "T_12=no pude copiar a"
set "T_13=sobrantes eliminados"
set "T_14=actualizados,"
set "T_15=actualizado a"
set "T_16=Plugin de Stream Deck"
set "T_17=ya actualizado"
set "T_18=actualizado"
set "T_19=error al crear - mira erro_deck.txt"
set "T_20=no pude copiar"
set "T_21=Accesos directos"
set "T_22=registrada"
set "T_23=versión"
set "T_24=Otras copias"
set "T_25=, fallaron:"
set "T_26=borradas:"
set "T_27=Abrir NEXUS"
set "T_28=abriendo"
set "T_29=✓ ¡Actualizado!"
set "T_30=en la carpeta de NEXUS."
set "T_31=CHANGELOG.txt"
set "T_32=Qué ha cambiado:"
set "T_33=Esta ventana se cierra y borra los archivos de la actualización."
set "T_34=Esta actualización es para quien tiene la versión"
set "T_35=(hasta 2 versiones atrás), y este NEXUS está en la"
set "T_36=Falta:"
set "T_37=(el zip sin "update" en el nombre) y ejecuta"
set "T_38=versión completa"
set "T_39=Usa la"
set "T_40=: actualiza igual y guarda tus ajustes."
set "T_41=No se ha cambiado nada."
set "T_42=NEXUS Monitor no está instalado en este PC."
set "T_43=- solo actualiza un NEXUS ya instalado."
set "T_44=update"
set "T_45=Este es el"
set "T_46=(el zip sin "update" en el nombre)"
set "T_47=Para instalar desde cero usa la"
set "T_48=y ejecuta"
set "T_49=Cancelado - no se ha cambiado nada."
set "T_50=[!] Faltan archivos en esta carpeta."
set "T_51=¿Abriste este archivo desde dentro del zip?"
set "T_52=1. Cierra esta ventana."
set "T_53=2. Botón derecho en el zip > "Extraer todo..." > Extraer."
set "T_54=3. Abre la carpeta extraída y ejecuta UPDATE NEXUS.bat desde allí."
set "T_55=error al crear el programa"
set "T_56=) a quien te dio NEXUS."
set "T_57=Envía el archivo erro.txt ("
exit /b 0
:nxl_fr
set "K_YN=ON" & set "K_SEC=ICS" & set "K_S1=I" & set "K_S2=C" & set "K_S3=S"
set "T_1=· Mise à jour"
set "T_2=Mettre à jour NEXUS Monitor"
set "T_3=Trouvé dans :"
set "T_4=Oui"
set "T_5=Dans l'alerte de Windows, clique sur"
set "T_6=!"
set "T_7=Mise à jour"
set "T_8=.NET Framework 4 introuvable sur ce PC."
set "T_9=Fermer NEXUS"
set "T_10=fermé"
set "T_11=Fichiers"
set "T_12=impossible de copier vers"
set "T_13=en trop supprimés"
set "T_14=mis à jour,"
set "T_15=mis à jour vers"
set "T_16=Plugin Stream Deck"
set "T_17=déjà à jour"
set "T_18=mis à jour"
set "T_19=erreur de création - voir erro_deck.txt"
set "T_20=copie impossible"
set "T_21=Raccourcis"
set "T_22=enregistrée"
set "T_23=version"
set "T_24=Autres copies"
set "T_25=, échecs :"
set "T_26=supprimées :"
set "T_27=Ouvrir NEXUS"
set "T_28=ouverture"
set "T_29=✓ Mis à jour !"
set "T_30=dans le dossier de NEXUS."
set "T_31=CHANGELOG.txt"
set "T_32=Nouveautés :"
set "T_33=Cette fenêtre se ferme et supprime les fichiers de la mise à jour."
set "T_34=Cette mise à jour est pour ceux qui ont la version"
set "T_35=(jusqu'à 2 versions en arrière), et ce NEXUS est en"
set "T_36=Manquant :"
set "T_37=(le zip sans "update" dans le nom) et lance"
set "T_38=version complète"
set "T_39=Utilise la"
set "T_40= : il met à jour quand même et garde tes réglages."
set "T_41=Rien n'a été modifié."
set "T_42=NEXUS Monitor n'est pas installé sur ce PC."
set "T_43=- elle ne met à jour qu'un NEXUS déjà installé."
set "T_44=mise à jour"
set "T_45=Ceci est la"
set "T_46=(le zip sans "update" dans le nom)"
set "T_47=Pour une nouvelle installation, utilise la"
set "T_48=et lance"
set "T_49=Annulé - rien n'a été modifié."
set "T_50=[!] Il manque des fichiers dans ce dossier."
set "T_51=As-tu ouvert ce fichier depuis le zip ?"
set "T_52=1. Ferme cette fenêtre."
set "T_53=2. Clic droit sur le zip > "Extraire tout..." > Extraire."
set "T_54=3. Ouvre le dossier extrait et lance UPDATE NEXUS.bat depuis celui-ci."
set "T_55=erreur lors de la création du programme"
set "T_56=) à la personne qui t'a donné NEXUS."
set "T_57=Envoie le fichier erro.txt ("
exit /b 0
:nxl_de
set "K_YN=JN" & set "K_SEC=HWE" & set "K_S1=H" & set "K_S2=W" & set "K_S3=E"
set "T_1=· Aktualisierung"
set "T_2=NEXUS Monitor aktualisieren"
set "T_3=Gefunden in:"
set "T_4=Ja"
set "T_5=Klicke in der Windows-Abfrage auf"
set "T_6=!"
set "T_7=Aktualisierung läuft"
set "T_8=.NET Framework 4 wurde auf diesem PC nicht gefunden."
set "T_9=NEXUS schließen"
set "T_10=geschlossen"
set "T_11=Dateien"
set "T_12=konnte nicht kopieren nach"
set "T_13=überflüssige entfernt"
set "T_14=aktualisiert,"
set "T_15=aktualisiert auf"
set "T_16=Stream-Deck-Plugin"
set "T_17=bereits aktuell"
set "T_18=aktualisiert"
set "T_19=Fehler beim Erstellen - siehe erro_deck.txt"
set "T_20=konnte nicht kopieren"
set "T_21=Verknüpfungen"
set "T_22=eingetragen"
set "T_23=Version"
set "T_24=Andere Kopien"
set "T_25=, fehlgeschlagen:"
set "T_26=gelöscht:"
set "T_27=NEXUS öffnen"
set "T_28=wird geöffnet"
set "T_29=✓ Aktualisiert!"
set "T_30=im NEXUS-Ordner."
set "T_31=CHANGELOG.txt"
set "T_32=Was ist neu:"
set "T_33=Dieses Fenster schließt sich und löscht die Update-Dateien."
set "T_34=Dieses Update ist für Version"
set "T_35=(bis 2 Versionen zurück), dieses NEXUS ist auf"
set "T_36=Fehlt:"
set "T_37=(das Zip ohne "update" im Namen) und starte"
set "T_38=volle Version"
set "T_39=Nutze die"
set "T_40=: aktualisiert trotzdem und behält deine Einstellungen."
set "T_41=Nichts wurde geändert."
set "T_42=NEXUS Monitor ist auf diesem PC nicht installiert."
set "T_43=- es aktualisiert nur ein bereits installiertes NEXUS."
set "T_44=Update"
set "T_45=Das ist das"
set "T_46=(das Zip ohne "update" im Namen)"
set "T_47=Für eine Neuinstallation nutze die"
set "T_48=und starte"
set "T_49=Abgebrochen - nichts wurde geändert."
set "T_50=[!] In diesem Ordner fehlen Dateien."
set "T_51=Hast du diese Datei direkt im Zip geöffnet?"
set "T_52=1. Schließe dieses Fenster."
set "T_53=2. Rechtsklick auf das Zip > "Alle extrahieren..." > Extrahieren."
set "T_54=3. Öffne den entpackten Ordner und starte dort UPDATE NEXUS.bat."
set "T_55=Fehler beim Erstellen des Programms"
set "T_56=) an die Person, von der du NEXUS hast."
set "T_57=Schicke die Datei erro.txt ("
exit /b 0
