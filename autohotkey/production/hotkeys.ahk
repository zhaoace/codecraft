;-------------    hotkeys.ahk
#NoEnv
#SingleInstance, force
SendMode Input
DetectHiddenWindows, on



;============= 自定义功能
;---- win+esc， 暂存最小化当前窗口
lastTitle=0
#Esc::
    if ( lastTitle!=0 ){
        ;msgbox , lastTitle !=0 , %lastTitle%  
        WinActivate, %lastTitle%   
        lastTitle=0
    }
    else { 
        WinGetActiveTitle , nowTitle
        WinMinimize, %nowTitle% 
        lastTitle = %nowTitle%    
        ;msgbox , nowTitle = %nowTitle% ,  lastTitle = %lastTitle%

    }
return


;==================== 系统音量
;-- ctrl+win+up  => 增大音量
^#up:: 
    SoundSet, +3
    SoundGet, master_volume
    Transform, master_volume, Round, master_volume
    TrayTip, volume, %master_volume%, , 1
Return

;-- ctrl+win+up  => 降低音量
^#down:: 
    SoundSet, -3
    SoundGet, master_volume
    Transform, master_volume, Round, master_volume
    TrayTip, volume, %master_volume%, , 1
Return



;==================== evernote 相关
;-- ctrl+alt+e  => 呼叫evernote 并搜索
^#e::
    IfWinNotExist ahk_class ENMainFrame
    {
        Run evernote        
        WinActivate
        WinWaitActive ahk_class ENMainFrame
        Send, ^!e
    }    
    IfWinNotActive ahk_class ENMainFrame
    {
        WinActivate
        WinWaitActive ahk_class ENMainFrame
        Send, ^!e
    }
    else
    {
        WinWaitActive ahk_class ENMainFrame
        Send, ^!e   
    }
Return

;-- ctrl+alt+n  => 呼叫evernote 并新建一个页面
^#n::
    IfWinNotExist ahk_class ENMainFrame
    {
        Run evernote       
        Send, ^!n
    }    
    else
    {
        Send, ^!n   
    }
Return



;-- CTRL+SHIFT+U => 在evernote里时，转化成无序列表
^+U::
    IfWinActive ahk_class ENMainFrame
    {
        Send , ^+B
    }
    IfWinActive ahk_class ENSingleNoteView
    {
        Send , ^+B    
    }
return


;-- CTRL+SHIFT+I => 在evernote里时，转化成有序列表
^+I::
    IfWinActive ahk_class ENMainFrame
    {        
        Send , ^+O
    }
    IfWinActive ahk_class ENSingleNoteView
    {        
        Send , ^+O    
    }
return





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








；================ 打开 或者 激活 或者 最小化 
；================ 以下用来绑定快捷键和应用的关系
;-- ctrl+win+s  => 呼叫sublime
^#s:: 
    OpenOrActriveOrMinimize("PX_WINDOW_CLASS", "subl")
Return

;-- ctrl+win+t  => 呼叫notepad
^#t:: 
    OpenOrActriveOrMinimize("Notepad", "notepad C:\Users\I015571\Documents\baiduyun\work@sap\ini\fastlaunch\temp.txt")
Return

;-- ctrl+win+o  => 呼叫outlook
^#o:: 
    OpenOrActriveOrMinimize("rctrl_renwnd32", "outlook")
Return

;-- ctrl+win+l  => 呼叫lync
^#l:: 
    OpenOrActriveOrMinimize("CommunicatorMainWindowClass", "lync")
Return







;------------- Functions

OpenOrActriveOrMinimize( target_class_id, target_program){ 

    IfWinNotExist ahk_class %target_class_id% 
    {
        Run %target_program%     
    }    
    IfWinNotActive ahk_class %target_class_id%  
    {
        WinActivate
    }
    else   
    {
        WinMinimize
    }
}


