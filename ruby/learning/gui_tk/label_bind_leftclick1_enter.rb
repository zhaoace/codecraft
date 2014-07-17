# keyboard binding (点住ctrl然后点击鼠标左键)

require 'tk'

msg="你好！中国"
root=TkRoot.new{title msg}
label_msg=TkLabel.new(root){
  text  msg
  pack :padx=>2,:pady=>2,:side=>'top'
  font "arial 20 bold"
}
label_msg.bind("1"){label_msg.configure('foreground'=>'red')}
label_msg.bind("Enter"){label_msg.configure('foreground'=>'green')}



Tk.mainloop