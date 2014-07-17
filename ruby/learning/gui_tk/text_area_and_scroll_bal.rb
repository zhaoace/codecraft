require 'tk'

title_text="滚动条示例程序"

root=TkRoot.new{title title_text}

text_area=TkText.new(root){
  width 50
  height 20
  pack :padx=>2,:pady=>2,:side=>'left',:fill=>'both'
}


scroll_bar=TkScrollbar.new(root) do
  orient 'vertical'
  pack :fill=>'both',:side=>'right'
end
scroll_bar.command(proc { |*args|
  text_area.yview(*args)
})
text_area.yscrollcommand(proc { |first, last|
  scroll_bar.set(first, last)
})

Tk.mainloop