@echo off
color 0A
title Change-DNS-IPv4-Easy

:: Check if the script has administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo The script requires administrator privileges.
    echo Requesting permissions...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Declare global variables
set INTERFACES=Wi-Fi "Wi-Fi 2" "Wi-Fi 3" Ethernet "Ethernet 2" "Ethernet 3"

:menu
cls

echo.
echo                  _________-----_____
echo        ____------           __      ----_
echo  ___----             ___------              \
echo     ----________        ----                 \
echo                -----__    ^|             _____)
echo                     __-                /     \
echo         _______-----    ___--          \    /)\ 
echo   ------_______      ---____            \__/  /
echo                -----__    \ --    _          /\
echo                       --__--__     \_____/   \_/\ 
echo                               ---^|   /          ^|
echo                                  ^| ^|___________^|
echo                                  ^| ^| ((_(_)^| )_)
echo                                  ^|  \_((_(_)^|/(_)
echo                                   \             (
echo                                    \_____________)
echo.
echo.

echo =====================================================================
echo                            Change DNS IPv4
echo                           By: maxisandoval37
echo =====================================================================
echo.

echo 1) Default DNS
echo 2) AdGuard Default-Filtering (94.140.14.14, 94.140.15.15)
echo 3) AdGuard Non-Filtering (94.140.14.140, 94.140.14.141)
echo 4) AdGuard Family Protection (94.140.14.15, 94.140.15.16)
echo 5) Cloudflare (1.1.1.1, 1.0.0.1)
echo 6) Cloudflare+Malware Blocking (1.1.1.2, 1.0.0.2)
echo 7) Cloudflare+Family Protection (1.1.1.3, 1.0.0.3)
echo 8) Google (8.8.8.8, 8.8.4.4)
echo 9) Cisco OpenDNS Home (208.67.222.222, 208.67.220.220)
echo 10) Cisco OpenDNS FamilyShield (208.67.222.123, 208.67.220.123)
echo 11) Display Current DNS Settings

echo.
echo 0) Exit
echo.
echo =====================================================================
echo.

set /p option="Select an option: "
echo.

if "%option%"=="1" goto default
if "%option%"=="2" set DNS1=94.140.14.14 && set DNS2=94.140.15.15 && goto set_dns
if "%option%"=="3" set DNS1=94.140.14.140 && set DNS2=94.140.14.141 && goto set_dns
if "%option%"=="4" set DNS1=94.140.14.15 && set DNS2=94.140.15.16 && goto set_dns
if "%option%"=="5" set DNS1=1.1.1.1 && set DNS2=1.0.0.1 && goto set_dns
if "%option%"=="6" set DNS1=1.1.1.2 && set DNS2=1.0.0.2 && goto set_dns
if "%option%"=="7" set DNS1=1.1.1.3 && set DNS2=1.0.0.3 && goto set_dns
if "%option%"=="8" set DNS1=8.8.8.8 && set DNS2=8.8.4.4 && goto set_dns
if "%option%"=="9" set DNS1=208.67.222.222 && set DNS2=208.67.220.220 && goto set_dns
if "%option%"=="10" set DNS1=208.67.222.123 && set DNS2=208.67.220.123 && goto set_dns
if "%option%"=="11" goto display_dns
if "%option%"=="0" goto exit
echo Invalid option, please try again.
pause
goto menu

:default
echo Restoring default DNS settings...
for %%I in (%INTERFACES%) do (
    call :set_dns_default %%I
)
goto success

:set_dns
echo Setting DNS to %DNS1%and %DNS2%...
for %%I in (%INTERFACES%) do (
    call :set_dns_static %%I %DNS1% %DNS2%
)
goto success

:success
echo Changes applied successfully.
echo.
pause
goto menu

:set_dns_default
netsh interface ip set dns name=%1 source=dhcp >nul 2>&1
goto :eof

:set_dns_static
netsh interface ip set dns name=%1 static %2 primary >nul 2>&1
netsh interface ip add dns name=%1 %3 index=2 >nul 2>&1
goto :eof

:display_dns
echo Displaying current DNS settings...
echo.
nslookup localhost 2> nul
if %errorlevel% neq 0 (
    echo No DNS servers are configured.
)
pause
goto menu

:exit
exit /b