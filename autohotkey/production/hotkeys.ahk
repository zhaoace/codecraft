;-------------    hotkeys.ahk
#NoEnv
#SingleInstance, force
SendMode Input


;-- win+alt+up  => 增大音量
#!up:: 
    SoundSet, +3
    SoundGet, master_volume
    Transform, master_volume, Round, master_volume
    TrayTip, volume, %master_volume%, , 1
Return


;-- win+alt+up  => 降低音量
#!down:: 
    SoundSet, -3
    SoundGet, master_volume
    Transform, master_volume, Round, master_volume
    TrayTip, volume, %master_volume%, , 1
Return


;-- win+alt+l  => 呼叫lync
#!l:: 
    Run, lync
Return


;-- win+alt+o  => 呼叫outlook
#!o:: 
    Run, outlook
Return



;-- CTRL+ALT+A  =>利用Skitch截屏
^!a::
    IfWinExist Skitch
    {
        WinActivate
        Send, ^+5
    }
    else
    {
        Run Skitch
        WinWait Skitch
        WinActivate
        Send, ^+5
    }
return


;-- CTRL+ALT+F9 => 弹出link list，快速选择去哪里
^!f9::
    Run, ruby C:\git\st\codecraft.git\ruby\projects\windows_start_helper\windows_start_helper.rb    
return




;-- 无论何时何地用 gl+空格/回车 => 弹出link list，快速选择去哪里
::gl::
    Run, ruby C:\git\st\codecraft.git\ruby\projects\windows_start_helper\windows_start_helper.rb    
return


;-- 无论何时何地用 subl+空格/回车 => 打开sublime
::subl::
    Run, C:\Program Files\Sublime Text 2\sublime_text.exe   
return

