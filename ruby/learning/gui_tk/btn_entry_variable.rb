require 'tk'

root = TkRoot.new
root.title = "Window"

entry1 = TkEntry.new(root)
entry2 = TkEntry.new(root) do
     show '*'
end

variable1 = TkVariable.new
variable2 = TkVariable.new
entry1.textvariable = variable1
entry2.textvariable = variable2
variable1.value = "Enter any text value"
variable2.value = "Enter any confidential value"

entry1.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 10)


entry2.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 40)



btn = TkButton.new(root){
    text  "change"
    command{
        variable1.value= "fuck "
    }
    pack side: "bottom"
}

Tk.mainloop