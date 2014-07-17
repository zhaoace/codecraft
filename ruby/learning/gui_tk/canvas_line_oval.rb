require 'tk'

title_text="绘图示例程序"
root=TkRoot.new{title title_text}
c=TkCanvas.new(root)
c.pack
#head
TkcOval.new(c,30,30,80,80).fill 'blue'
#arms
TkcLine.new(c,10,110,100,110)
#body
TkcLine.new(c,55,80,55,170)
#left leg
TkcLine.new(c,55,170,10,250)
#right leg
TkcLine.new(c,55,170,100,250)


Tk.mainloop