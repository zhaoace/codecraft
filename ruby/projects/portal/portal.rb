#!/usr/bin/env ruby
require 'tk'
require './keywords'
require './ui_helper'

root = TkRoot.new
root.title = "ruby_tk_invoke_method_from_entry_widget "


btn = TkButton.new(root){
  text "Go!"
  pack :padx=>2,:pady=>2,:side=>'bottom'
  # command proc { showHelp }
}



label = TkLabel.new(root){
  text "Where to go?"
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

  UiHelper.entry_response_width entry
  UiHelper.clean_text label

  Keywords.guess(entry.value).each do |x|
    label.text  += x +"\n\n"
  end

}

root.bind("KeyPress-Escape"){
   Tk.exit()
}




root.bind("Control-KeyPress-Return"){
    label.text = "Control-KeyPress-return"
}
9.times do |x|
  root.bind("Control-KeyPress-#{x+1}"){
    label.text = "KeyPress-#{x+1}"
  }
end

Tk.mainloop
