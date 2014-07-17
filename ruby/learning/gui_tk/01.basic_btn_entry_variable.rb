require 'tk'


msg= "你好。"
root = TkRoot.new{title "title nihao"}
lable_msg = TkLabel.new (root) {
	text msg
	pack :padx=>2,  :pady=>2, :side=>'top'
	font "arial 20 bold"
}


msg += "Zhao !"
TkLabel.new(root,'text'=>msg).pack('padx'=>2,'pady'=>2,'side'=>'top')


TkButton.new(root){
	text "quit"
	pack
	command{
		exit
	}
}

exit_btn = TkButton.new(root){
	text  "tuichu"
	pack
}
exit_btn.command = lambda{exit}



var = TkVariable.new
TkEntry.new(root){
	text var
	pack
}

TkEntry.new(root){
	text var
	pack
}

Tk.mainloop

