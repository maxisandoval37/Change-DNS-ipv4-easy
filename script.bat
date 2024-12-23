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

echo ===========================================================
echo                       Change DNS IPv4
echo                      By: maxisandoval37
echo ===========================================================
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
echo.
echo 0) Exit
echo ===============================
set /p option="Select an option: "

if "%option%"=="1" goto default
if "%option%"=="2" goto adguard_default
if "%option%"=="3" goto adguard_non_filtering
if "%option%"=="4" goto adguard_family
if "%option%"=="5" goto cloudflare
if "%option%"=="6" goto cloudflare_malware
if "%option%"=="7" goto cloudflare_family
if "%option%"=="8" goto google
if "%option%"=="9" goto opendns_home
if "%option%"=="10" goto opendns_family
if "%option%"=="0" goto exit
echo Invalid option, please try again.
pause
goto menu

:default
echo Restoring default DNS settings...
call :set_dns_default "Wi-Fi"
call :set_dns_default "Wi-Fi 2"
call :set_dns_default "Wi-Fi 3"
call :set_dns_default "Ethernet"
call :set_dns_default "Ethernet 2"
call :set_dns_default "Ethernet 3"
goto success

:adguard_default
echo Setting AdGuard Default DNS...
call :set_dns_static "Wi-Fi" 94.140.14.14 94.140.15.15
call :set_dns_static "Wi-Fi 2" 94.140.14.14 94.140.15.15
call :set_dns_static "Wi-Fi 3" 94.140.14.14 94.140.15.15
call :set_dns_static "Ethernet" 94.140.14.14 94.140.15.15
call :set_dns_static "Ethernet 2" 94.140.14.14 94.140.15.15
call :set_dns_static "Ethernet 3" 94.140.14.14 94.140.15.15
goto success

:adguard_non_filtering
echo Setting AdGuard Non-Filtering DNS...
call :set_dns_static "Wi-Fi" 94.140.14.140 94.140.14.141
call :set_dns_static "Wi-Fi 2" 94.140.14.140 94.140.14.141
call :set_dns_static "Wi-Fi 3" 94.140.14.140 94.140.14.141
call :set_dns_static "Ethernet" 94.140.14.140 94.140.14.141
call :set_dns_static "Ethernet 2" 94.140.14.140 94.140.14.141
call :set_dns_static "Ethernet 3" 94.140.14.140 94.140.14.141
goto success

:adguard_family
echo Setting AdGuard Family Protection DNS...
call :set_dns_static "Wi-Fi" 94.140.14.15 94.140.15.16
call :set_dns_static "Wi-Fi 2" 94.140.14.15 94.140.15.16
call :set_dns_static "Wi-Fi 3" 94.140.14.15 94.140.15.16
call :set_dns_static "Ethernet" 94.140.14.15 94.140.15.16
call :set_dns_static "Ethernet 2" 94.140.14.15 94.140.15.16
call :set_dns_static "Ethernet 3" 94.140.14.15 94.140.15.16
goto success

:cloudflare
echo Setting Cloudflare DNS...
call :set_dns_static "Wi-Fi" 1.1.1.1 1.0.0.1
call :set_dns_static "Wi-Fi 2" 1.1.1.1 1.0.0.1
call :set_dns_static "Wi-Fi 3" 1.1.1.1 1.0.0.1
call :set_dns_static "Ethernet" 1.1.1.1 1.0.0.1
call :set_dns_static "Ethernet 2" 1.1.1.1 1.0.0.1
call :set_dns_static "Ethernet 3" 1.1.1.1 1.0.0.1
goto success

:cloudflare_malware
echo Setting Cloudflare+Malware Blocking DNS...
call :set_dns_static "Wi-Fi" 1.1.1.2 1.0.0.2
call :set_dns_static "Wi-Fi 2" 1.1.1.2 1.0.0.2
call :set_dns_static "Wi-Fi 3" 1.1.1.2 1.0.0.2
call :set_dns_static "Ethernet" 1.1.1.2 1.0.0.2
call :set_dns_static "Ethernet 2" 1.1.1.2 1.0.0.2
call :set_dns_static "Ethernet 3" 1.1.1.2 1.0.0.2
goto success

:cloudflare_family
echo Setting Cloudflare+Family Protection DNS...
call :set_dns_static "Wi-Fi" 1.1.1.3 1.0.0.3
call :set_dns_static "Wi-Fi 2" 1.1.1.3 1.0.0.3
call :set_dns_static "Wi-Fi 3" 1.1.1.3 1.0.0.3
call :set_dns_static "Ethernet" 1.1.1.3 1.0.0.3
call :set_dns_static "Ethernet 2" 1.1.1.3 1.0.0.3
call :set_dns_static "Ethernet 3" 1.1.1.3 1.0.0.3
goto success

:opendns_home
echo Setting Cisco OpenDNS Home DNS...
call :set_dns_static "Wi-Fi" 208.67.222.222 208.67.220.220
call :set_dns_static "Wi-Fi 2" 208.67.222.222 208.67.220.220
call :set_dns_static "Wi-Fi 3" 208.67.222.222 208.67.220.220
call :set_dns_static "Ethernet" 208.67.222.222 208.67.220.220
call :set_dns_static "Ethernet 2" 208.67.222.222 208.67.220.220
call :set_dns_static "Ethernet 3" 208.67.222.222 208.67.220.220
goto success

:opendns_family
echo Setting Cisco OpenDNS FamilyShield DNS...
call :set_dns_static "Wi-Fi" 208.67.222.123 208.67.220.123
call :set_dns_static "Wi-Fi 2" 208.67.222.123 208.67.220.123
call :set_dns_static "Wi-Fi 3" 208.67.222.123 208.67.220.123
call :set_dns_static "Ethernet" 208.67.222.123 208.67.220.123
call :set_dns_static "Ethernet 2" 208.67.222.123 208.67.220.123
call :set_dns_static "Ethernet 3" 208.67.222.123 208.67.220.123
goto success

:success
echo Changes applied successfully.
pause
goto menu

:set_dns_default
netsh interface ip set dns name=%1 source=dhcp
goto :eof

:set_dns_static
netsh interface ip set dns name=%1 static %2
netsh interface ip add dns name=%1 %3 index=2
goto :eof

:exit
echo Exiting...
pause
exit