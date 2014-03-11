;--------------  0. 常用的热键简写
;  # => WIN window key
;  ^ => CTRL
;  ! => ALT
;  + => SHIFT


;-------------- 1. 最朴素的热键设置方式
; WIN+n ,打开sublime
#n::Run, C:\Program Files\Sublime Text 2\sublime_text.exe

; CTRL+ALT+c, 打开计算器
^!c::Run, calc.exe

; WIN+o , 打开指定的link， 用默认浏览器。
#o::Run, http://shg-cvom-ci.dhcp.pgdev.sap.corp:8080/view/bycheckin/job/PI_bycheckin/

; SHIFT+ALT+] , 弹出一个对话框里面写着 hello world
+!]::MsgBox, hello world.

; WIN+s ， 模拟键盘输入一段内容。
#s::Send, Sincerely,{enter} Zhao, Li {enter}




;-------------- 2.1 热字符串 (hotstring)
;  这样，在大多数程序 [1]中，无论有无输入框，只要按下 znp
;再加一个结束符（空格、回车等），即可执行记事本。其优点是全普通键盘操作，字符串无字数限制，便于记忆。更多参见AutoHotkey帮助文档。
::znp::
  Run, notepad.exe
return


