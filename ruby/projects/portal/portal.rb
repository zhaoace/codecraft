#!/usr/bin/env ruby
require 'tk'
require './keywords'
require './ui_helper'



root = TkRoot.new
root.title = "ruby_tk_invoke_method_from_entry_widget "


goto_list = []

btn = TkButton.new(root){
  text "Go!"
  pack :padx=>2,:pady=>2,:side=>'bottom'
}



label = TkLabel.new(root){
  text "Where to go?"
  justify "left"
  pack :padx=>2,:pady=>2,:side=>'bottom'
}


labe_debug = TkLabel.new(root){
  text "debug message"
  bg "yellow"
  pack :padx=>2,:pady=>2,:side=>'bottom'
}



entry =  TkEntry.new(root){
  text "hello world!"
  width 30
  pack :padx=>2,:pady=>2,:side=>'left'
}
entry.focus


entry.bind("KeyRelease"){

  goto_list=[]
  UiHelper.entry_response_width entry
  UiHelper.clean_text label

  i = 1
  Keywords.guess(entry.value).each do |x|
    label.text  +=  "ctrl + #{i.to_s}: #{x} \n\n"
    goto_list << x
    i += 1
  end
  debug_msg = ""
  goto_list.each {|x|
    debug_msg+= x +"\n"
  }

  labe_debug.text =debug_msg

}

root.bind("KeyPress-Escape"){
   Tk.exit()
}

root.bind("KeyPress-Return"){
    label.text = "KeyPress-return"
    label.text = "system #{goto_list[0]}"
    system "start #{goto_list[0]}"
    Tk.exit()
}

9.times do |x|
  root.bind("Control-KeyPress-#{x+1}"){
    label.text = "system #{goto_list[x]}"
    system "start #{goto_list[x]}"
    Tk.exit()
  }
end


Tk.mainloop
