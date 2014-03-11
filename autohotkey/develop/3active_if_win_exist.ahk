IfWinExist Skitch
{
    WinActivate
}
else
{
    Run Skitch
    WinWait Skitch
    WinActivate
}