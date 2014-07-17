require 'tk'
#  use  cget to get params form tkComponents (then put them to console ...)

msg= "你好。"
root = TkRoot.new{title "title nihao"}
lable_msg = TkLabel.new (root) {
    text msg
    pack :padx=>2,  :pady=>2, :side=>'top'
    font "arial 20 "
}

TkButton.new(root){
    text "输出属性"
    pack :padx => 2, :pady =>2 , :side => 'bottom'
    command {
        puts lable_msg.cget('text')
        puts lable_msg.cget('justify')
        puts lable_msg.cget('border')
    }

}




Tk.mainloop

