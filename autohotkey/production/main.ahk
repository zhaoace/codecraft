;------------ startup progress after time
second = 1000 
one_minute := 60*second
two_minute := 2*one_minute

sleep , %one_minute%
Run   , chrome
Run   , "C:\Program Files\totalcmd\TOTALCMD64.EXE"
Run   , OUTLOOK
Run   , "C:\Program Files\Sublime Text 2\sublime_text.exe"





#Include hotkeys.ahk
#Include abbreviate.ahk

