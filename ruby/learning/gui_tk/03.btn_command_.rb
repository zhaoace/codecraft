require 'tk'
# click button will change label color

msg= "你好。"
root = TkRoot.new{title "title nihao"}
lable_msg = TkLabel.new (root) {
	text msg
	pack :padx=>2,  :pady=>2, :side=>'top'
	font "arial 20 "
}

TkButton.new(root){
	text "bianse"
	pack :padx => 2, :pady =>2 , :side => 'bottom'
	command {
		lable_msg.configure('foreground'=>'red')
	}

}




Tk.mainloop

