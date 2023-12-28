::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlbMbCXqZg==
::ZQ05rAF9IAHYFVzEqQISDDR4TRGMP2OKFLoE8Yg=
::eg0/rx1wNQPfEVWB+kM9LVsJDDeNKXm5A/sZ8O2b
::fBEirQZwNQPfEVWB+kM9LVsJDDeNKXm5A/se6fyb
::cRolqwZ3JBvQF1fEqQI4PA9EX17Nc3iuA7QR6+f24v+Jq1kEGuEwdcDI0rWcJeQV40nhZtkr33ZfnM4YDRJUbV30Zwtp+j8S4zPVZ5/E628=
::dhA7uBVwLU+EWGqQ9VI8LQ9bQkSxM22uEbQO7Yg=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEwEMpJBRGDDeWPXu2A6ET5qipv7jUwg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdC2DJH2B4kc8JwtZSQqWAFuoCb8Z6/zo08iGtk4Va8AbV6Paz7qNKNAB5V39SZk4wkZpl94eDx4WewquDg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
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



