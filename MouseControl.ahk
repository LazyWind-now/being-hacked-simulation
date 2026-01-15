; AutoHotkey script for random mouse movement and clicking as part of the prank
; This creates the effect of remote control of the user's mouse
; Requires AutoHotkey v1.1 or later

#Persistent
#NoEnv
SetBatchLines, -1

SetTimer, RandomMouseAction, 2000  ; Run every 2 seconds

RandomMouseAction:
{
    ; Get random action (0=move, 1=click, 2=double-click, 3=rest)
    action := Random(1, 4)
    
    ; Random coordinates on screen with safe margins
    mouseX := Random(100, A_ScreenWidth - 100)
    mouseY := Random(100, A_ScreenHeight - 100)
    
    if (action == 1)
    {
        ; Move mouse to random position
        MouseMove, mouseX, mouseY, 10
    }
    else if (action == 2)
    {
        ; Move and click
        MouseMove, mouseX, mouseY, 15
        Sleep, 300
        Click
    }
    else if (action == 3)
    {
        ; Move and double-click
        MouseMove, mouseX, mouseY, 15
        Sleep, 300
        Click, 2
    }
    ; action == 4 does nothing (rest interval)
}

; Emergency exit on Shift+K (same as main script)
+k::
{
    MsgBox, 64, SYSTEM RESTORED, Mouse control disabled - prank stopped!, 3
    ExitApp
}

; Alternative: Ctrl+Alt+K
^!k::
{
    MsgBox, 64, SYSTEM RESTORED, Prank stopped!, 3
    ExitApp
}

; Escape key exit
Esc::
{
    MsgBox, 64, CANCELLED, Prank cancelled!, 3
    ExitApp
}
