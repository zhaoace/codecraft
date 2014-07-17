# layout


# require 'tk'

# title_text="place 方式示例程序"
# root=TkRoot.new{title title_text}

# TkButton.new(root, 'text'=>'按钮 1').place('height'=>50,'width'=>100,'x'=>20,'y'=>40)
# TkButton.new(root, 'text'=>'按钮 2').place('height'=>80,'width'=>80,'x'=>50,'y'=>80)

# Tk.mainloop


require 'tk'

title_text="grid 方式示例程序"
root=TkRoot.new{title title_text}

TkButton.new(root, 'text'=>'按钮1').grid('row'=>1,'column'=>7)
TkButton.new(root, 'text'=>'按钮2').grid('row'=>2,'column'=>8)
TkButton.new(root, 'text'=>'按钮3').grid('row'=>3,'column'=>3)
TkButton.new(root, 'text'=>'按钮4').grid('row'=>1,'column'=>3)
TkButton.new(root, 'text'=>'按钮5').grid('row'=>3,'column'=>1)

Tk.mainloop