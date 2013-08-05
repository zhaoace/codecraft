require 'FileUtils' 


def md dir	
	FileUtils.mkdir_p dir
end


def main 
	path = 'c:\git\codecraft.git\bat\perforce\p4info\bin'
	Dir.foreach path  do |dir| 
		if Dir.exist?(dir)
			# p "dir  : " + dir
		else
			# p "file : " + dir			
			read_and_deal_with_p4_changes_log path+"\\"+dir			
		end
	end	
end


def read_and_deal_with_p4_changes_log log_file
	File.open(log_file, "r+") { |file|  
		# content = ''
		file.each_line do |line|
			# content << line
			# p line
			deal_with_p4_change line
		end
		# p content
	}
end


def deal_with_p4_change p4change
		
end



# Run main 

# main 
read_and_deal_with_p4_changes_log 'c:\git\codecraft.git\bat\perforce\p4info\bin\chart2013july.txt'












