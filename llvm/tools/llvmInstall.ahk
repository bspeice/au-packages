#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
; SetControlDelay 

winTitleInstall = cmd.exe
WinWait, %winTitleInstall%, , 720
WinActivate, %winTitleInstall%
WinWaitActive, %winTitleInstall%, , 720
Sleep 10000
ControlSend, , {Enter}, %winTitleInstall%
