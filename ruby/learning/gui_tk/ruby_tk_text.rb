# by www.yiibai.com
require 'tk'

root = TkRoot.new
root.title = "Window"

text = TkText.new(root) do
  width 30
  height 20
  borderwidth 1
  font TkFont.new('times 12 bold')
   pack("side" => "right",  "padx"=> "5", "pady"=> "5")
end
text.insert 'end', "Hello!\n\ntext widget example - www.yiibai.com"
Tk.mainloop

