# readFileByLine.rb


File.open("readFileByLine.rb", "r") { |file|  	
	content =  ''	
	file.each_line do |line|
		content << line
		#p line
	end	
	p content
}





File.open("readFileByLine.rb", "r") { |file|  

	content =  file.read	
	p content
	# p file.methods
}

