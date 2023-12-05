@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=B:\Development\Projects\Batch_BDOLaunchProxy\testBlackDesertLauncher.exe
REM BFCPEICON=
REM BFCPEICONINDEX=1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Stapleton's Multi-BDO Launcher for Steam
REM BFCPEVERDESC=Steam Launch Proxy for BDO
REM BFCPEVERCOMPANY=Stapleton Software
REM BFCPEVERCOPYRIGHT=Taylor Stapleton 2023
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=20
REM BFCPEWINDOWWIDTH=80
REM BFCPEWTITLE=Stapleton's Multi-BDO Launcher for Steam
REM BFCPEOPTIONEND
setlocal EnableDelayedExpansion

rem Load Config
call BlackDesertLauncher_Config.bat

if %~nx0 == %NONSTEAM_LAUNCH% (goto :IncorrectLauncherNames)
if %~nx0 == %STEAM_LAUNCH% (goto :IncorrectLauncherNames)

:Startup
rem Startup
echo ********************************************
echo * Stapleton's Multi-BDO Launcher for Steam *
echo ********************************************
echo * ** Config Values **
echo * Default: %DEFAULT%
echo * Timeout: %TIMEOUT%s
echo ********************************************
echo * ** Install Locations **
echo * Non-Steam: %NONSTEAM_LOCATION%
echo * Steam: %STEAM_LOCATION%
echo ********************************************
echo * ** Pick Launcher **
echo * Non-Steam: 1
echo * Steam: 2
echo * Default: Wait for %TIMEOUT% seconds
rem ********************************************
rem *****************[1,2,Wait]*****************
choice /T %TIMEOUT% /C 12 /D %DEFAULT% /N /M *****************[1,2,Wait]*****************
set _e=%ERRORLEVEL%

rem Handle Choice
if %_e%==1 (goto :NonSteam)
if %_e%==2 (goto :Steam)

rem Launch Non Steam Version
:NonSteam
echo Launching Non-Steam Black Desert Online!
cd /d %NONSTEAM_LOCATION%
!NONSTEAM_LAUNCH!
echo Keep me open for Steam process tracking.
pause
exit 0

rem Launch Steam Version
:Steam
echo Launching Steam Black Desert Online!
cd /d %STEAM_LOCATION%
%STEAM_LAUNCH% %*
echo Keep me open for Steam process tracking.
pause
exit 0

:IncorrectLauncherNames
echo ###################################################################################
echo Min Requirement: None of the launchers can be named the same as this executable.
echo You are seeing this because that requirement has not been met.
echo - This Filename: %~nx0
echo - Steam Filename: %STEAM_LAUNCH%
echo - Non-Steam Filename: %NONSTEAM_LAUNCH%
echo Steam and Non-Steam filenames can match.
echo However, if you run both at the same time for some reason, filenames cannot match.
echo ###################################################################################
pause
goto :Startup



