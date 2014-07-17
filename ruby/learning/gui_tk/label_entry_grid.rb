require 'tk'
top = TkRoot.new {title "Label and Entry Widget"}
lb1=TkLabel.new(top){
      text 'Hello World'
      # background "yellow"
      foreground "#444400"
      pack('padx'=>10, 'pady'=>10, 'side'=>'left')
}.grid('row'=>1,'column'=>1)
e1 = TkEntry.new(top){
      background "#F4F4F4"
      # foreground "blue"
      pack('padx'=>10, 'pady'=>10, 'side'=>'left')
}.grid('row'=>1,'column'=>2)
lb2 =TkLabel.new(top){
      text 'labe2111111111111111111111'
      background "pink"
      # foreground "#"
      pack( 'side'=>'bottom', 'fill'=>'both')
}.grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1 , 'columnspan'=>2)



Tk.mainloop