#!/usr/bin/env ruby
require 'tk'



def get_a_color
    colors = ['black', 'red', 'green','blue']
    colors[rand 4]
    return  colors[rand 4]
end

class WindowsCommander
    def self.path_check path_to_check
        formatted_path =  path_to_check.gsub(/\//,"\\")
    end

    def self.start_path path_to_open
        system "start #{path_check path_to_open}"
    end
end


def get_most_like_words input_text

    return input_text+"xxxx"
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


label_msg = TkLabel.new(root){
    text "label_msg"
    pack :padx=>20,:pady=>20,:side=>'bottom'
}


entry.bind("Control-Key-KP_Enter"){
    root.background="red"
    label_msg.text = "KeyPress-KP_Enter"
    path_to_open="\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_4.0"
    system "start #{path_to_open}"
}

btn = TkButton.new(root){
  text "变色"
  # image "C:\\git\\st\\codecraft.git\\ruby\\projects\\portal\\xxxx.gif"
  pack :padx=>2,:pady=>2,:side=>'bottom'
  command {
       label_msg.text = "Control-KeyPress"
  }
}



_keysym = TkVariable.new
label_keypress = TkLabel.new(root){

  text _keysym
  pack :padx=>20,:pady=>20,:side=>'bottom'
}

root.bind("KeyPress-X"){
  label_keypress.background=get_a_color
}

root.bind("KeyPress-KP_Enter"){
  root.background=get_a_color
  label_keypress.text = "KeyPress-KP_Enter"
}
root.bind("KeyPress-y"){
  root.background=get_a_color
  label_keypress.text = "yyyyyyyyyy"
}




entry.bind("KeyRelease"){
    label_msg.configure('foreground'=>get_a_color)
    label_msg.text = get_most_like_words( entry.value )
    label_keypress.text = entry.value
}

root.bind("KeyPress-Return"){

  x = entry.value
  label_keypress.text = x

  if( x == '1' )  then


    path_to_open="\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_4.0"
    system "start #{path_to_open}"


  end


}




Tk.mainloop
