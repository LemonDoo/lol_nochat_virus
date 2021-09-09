sleep_s(seconds)
{
    seconds *= 1000
    sleep, seconds
}

ProcessExist(process_name)
{
    Process, Exist, % process_name
    if ErrorLevel
        return, 1
    else
        return, 0
}
