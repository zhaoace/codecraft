#ruby_tk_invoke_method_from_entry_widget.rb



require 'tk'

def a
    p "xx"
end

def getAColor
    colors = ['black', 'red', 'green','blue']
    colors[rand 4]
    return  colors[rand 4]
end

root = TkRoot.new
root.title = "ruby_tk_invoke_method_from_entry_widget "


foo = TkVariable.new
entry = Tk::Tile::Entry.new(root) {
  validate 'key';
  # validatecommand a;
  textvariable foo
  pack
}

btn = TkButton.new(root){
  text "变色"
  pack :padx=>2,:pady=>2,:side=>'bottom'

}


label_msg = TkLabel.new(root){
    text "label_msg"
    pack :padx=>20,:pady=>20,:side=>'bottom'
}



btn.bind("Enter"){label_msg.configure('foreground'=>'red')}
btn.bind("Leave"){label_msg.configure('foreground'=>'black')}
entry.bind("KeyRelease"){label_msg.configure('foreground'=>getAColor)}



Tk.mainloop
