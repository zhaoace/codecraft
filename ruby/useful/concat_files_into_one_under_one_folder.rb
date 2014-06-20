
input_folder = 'c:\SDK\artifactdeployer-0.16.3\aa'
output_file= 'c:\SDK\artifactdeployer-0.16.3\text.txt'


File.open(output_file, "w") { |file|
    Dir.new(input_folder).each do |x|
        # p input_folder+'\\' + x
        target = input_folder+'\\' + x
        if  !File.directory?( target ) then
            File.open(target, "r") { |loadFile|
                file<<loadFile.read
            }
        else
            p "#{target} is a folder .  Skiped."
        end
    end

}
