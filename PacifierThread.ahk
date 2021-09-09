#NoEnv
#Persistent
#SingleInstance, force
ListLines, Off

#include lib\std.ahk

IniRead, enter_count, data.ini, Misc, enter_count

Loop
{
    sleep, 360

    if (!ProcessExist("LolPacifier.exe") && !ProcessExist("League of Legends.exe"))
        Process, Close, % "HBThread.exe"
        ExitApp
    if !ProcessExist("HBThread.exe")
        Run, % "HBThread.exe"
}

; PACIFIER THREAD

#IfWinActive ahk_class RiotWindowClass

Enter::
+Enter::
    EnterCounter()
    return

#IfWinActive

EnterCounter()
{
    global

    enter_count++
    IniWrite, %enter_count%, data.ini, Misc, enter_count 
}