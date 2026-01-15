; AutoHotkey script to detect Shift+K and cancel the prank
; Place this in the same folder as Hacked.bat
; Requires AutoHotkey v1.1 or later

#Persistent
#NoEnv
SetBatchLines, -1

; Hotkey: Shift + K
+k::
{
    ; Create a file that signals the batch script to stop
    FileAppend("", A_Temp . "\killswitch.tmp")
    
    ; Show confirmation message
    MsgBox, 64, SYSTEM RESTORED, Shutdown cancelled and prank stopped!, 3
    
    ; Cancel the shutdown
    RunWait, shutdown /a,, Hide
    
    ; Clean up files
    FileDelete(A_Temp . "\killswitch.tmp")
    FileDelete(A_Temp . "\hotkey_detector.vbs")
    
    ; Exit this script
    ExitApp
}

; Alternative: Ctrl+Alt+K for emergency exit
^!k::
{
    ; Create a file that signals the batch script to stop
    FileAppend("", A_Temp . "\killswitch.tmp")
    
    ; Cancel shutdown
    RunWait, shutdown /a,, Hide
    
    ; Show confirmation
    MsgBox, 64, SYSTEM RESTORED, Prank stopped!, 3
    
    ; Clean up
    FileDelete(A_Temp . "\hotkey_detector.vbs")
    FileDelete(A_Temp . "\killswitch.tmp")
    
    ; Exit this script
    ExitApp
}

; Escape key also works as emergency exit
Esc::
{
    ; Create kill switch signal
    FileAppend("", A_Temp . "\killswitch.tmp")
    RunWait, shutdown /a,, Hide
    MsgBox, 64, CANCELLED, Prank cancelled!, 3
    
    ; Cleanup
    FileDelete(A_Temp . "\hotkey_detector.vbs")
    FileDelete(A_Temp . "\killswitch.tmp")
    
    ExitApp
}
