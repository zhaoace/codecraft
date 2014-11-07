#NoEnv
#SingleInstance, force
SendMode Input



#NoEnv
#SingleInstance, force
SendMode Input

; ctrl + alt + 1 : start a loop
^!1::
settimer, shark_shake, 50
Return

; ctrl + alt + 2 : switch on / off
^!2::
settimer, shark_shake, off
Return



shark_shake:
    MouseMove , -1, 0 , , R
    sleep 50
    MouseMove , 1, 0 , , R
    sleep 50
    sleep  300
    click 85,666  1
    sleep 300
    click 292,305  1
return