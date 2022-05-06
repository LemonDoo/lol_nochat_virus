#NoEnv
#NoTrayIcon
#Persistent
#SingleInstance, force
ListLines, Off

#include lib\std.ahk

IniRead, enter_count, data.ini, Misc, enter_count

Loop
{
    sleep, 360
    
    if !ProcessExist("SpawnerThread.exe")
        Run, % "SpawnerThread.exe"
}

; PACIFIER THREAD

#IfWinActive ahk_class RiotWindowClass

Shift & NumpadEnter::
Shift::
NumpadEnter::
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
