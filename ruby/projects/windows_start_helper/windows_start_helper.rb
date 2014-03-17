class WindowsCommander
    def self.path_check path_to_check
        formatted_path =  path_to_check.gsub(/\//,"\\") 
    end

    def self.start_path path_to_open
        system "start #{path_check path_to_open}"
    end
end



FAV_PATH = [    
    ["WDF dropzone","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components",],
    ["WDF cvom4.0","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_4.0",],
    ["WDF cvom_3.3","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_3.3",],
    ["WDF cvom_trunk_pi","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_trunk_pi",],
    ["SHG cvom4.0","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_4.0",],
    ["SHG cvom_3.3","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_3.3",],
    ["SHG cvom_trunk_pi","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_trunk_pi",],
    ["WDF cvom4.0","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_4.0",],
    # "\\\\shg-cvom-ci.dhcp.pgdev.sap.corp",
]


COMMAND_LIST = {
    "exit" =>  "exit",
    "x" =>  "exit" ,
    "e" =>  "exit" ,
    '' => "next" ,
}


p "Hello world. "
p "----------------------------------------"
p ""
FAV_PATH.each_index do |index|
    p "#{index}: #{FAV_PATH[index][0]}"
    p ""
end
p "----------------------------------------"
p "Exit by typing : e or x or exit."
p "----------------------------------------"

input = "start"
while true do
    input = gets    
    input.chomp!


    if (COMMAND_LIST.keys.include? input) then
        next if COMMAND_LIST[input].to_s == "next"
        break if COMMAND_LIST[input].to_s == "exit"
    end

    if input.match(/^\d+$/) then
        chosen_index = Integer(input)             
        if chosen_index < FAV_PATH.size then  
            p chosen_index
            p FAV_PATH[chosen_index]        
            WindowsCommander.start_path FAV_PATH[chosen_index][1]
            break
        end
    end
    p "Exit by typing : e or x or exit."
end

# system "pause"