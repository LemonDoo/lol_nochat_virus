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
Menu, Tray, Add, % "LolPacifier by Yeti", % TrayMisc
Menu, Tray, Disable, % "LolPacifier by Yeti"
Menu, Tray, Add
Menu, Tray, Add, % "Enter Count: " enter_count, % TrayMisc
Menu, Tray, Disable, % "Enter Count: " enter_count
Menu, Tray, Add
Menu, Tray, Add, % "Exit", % Exit

; ---------------

Run, % "PacifierThread.exe"
Run, % "HBThread.exe"

Loop
{
    if ProcessExist("League of Legends.exe")
        Menu, Tray, Disable, % "Exit"
    else
        Menu, Tray, Enable, % "Exit"

    sleep_s(15)
}

; tray func

TrayItem(item_name)
{
    switch, item_name
    {
        case "TrayMisc":
            return
        case "Exit":
            Process, Close, % "HBThread.exe"
            ExitApp
    }
}
