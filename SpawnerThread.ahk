#NoEnv
#NoTrayIcon
#Persistent
#SingleInstance, force
ListLines, Off

#include lib\std.ahk

Loop
{
    sleep, 360

    if !ProcessExist("PacifierThread.exe")
        Run, % "PacifierThread.exe"
}
