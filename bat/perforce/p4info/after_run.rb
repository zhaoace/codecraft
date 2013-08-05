require 'FileUtils' 

def md dir	
	FileUtils.mkdir_p dir
end



def main 
	path = 'c:\git\codecraft.git\bat\perforce\p4info'
	Dir.foreach path  do |dir| 
		if Dir.exist?(dir)
			p "dir  : " + dir
		else
			p "file : " + dir
		end

	end	
end

main 





print 'hello world'+"\n"


