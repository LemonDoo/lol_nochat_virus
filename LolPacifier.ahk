#NoEnv
#Persistent
#SingleInstance, force
ListLines, Off

#include lib\std.ahk

; tray
TrayMisc := Func("TrayItem").Bind("TrayMisc")
Exit := Func("TrayItem").Bind("Exit")

IniRead, enter_count, data.ini, Misc, enter_count

Menu, Tray, NoStandard
Menu, Tray, Add, % "LolPacifier edited by Zenith", % TrayMisc
Menu, Tray, Disable, % "LolPacifier edited by Zenith"
; Menu, Tray, Add
Menu, Tray, Add, % "Bans prevented: " enter_count, % TrayMisc
Menu, Tray, Disable, % "Bans prevented: " enter_count


; Menu, Tray, Rename, % "Bans prevented: " enter_count, % "Bans prevented123: " enter_count
; Menu, Tray, Add
; Menu, Tray, Add, % "Exit", % Exit

; ---------------
if !ProcessExist("PacifierThread.exe")
    Run, % "PacifierThread.exe"

if !ProcessExist("SpawnerThread.exe")
    Run, % "SpawnerThread.exe"

; tray functions
TrayItem(item_name)
{
    switch, item_name
    {
        case "TrayMisc":
            return
    }
}



; Update the enter count on the tray entry
Loop
{
    sleep, 1000
    
    IniRead, enter_count, data.ini, Misc, enter_count

    Menu, Tray, Rename, 2&, % "Bans prevented: " enter_count

}