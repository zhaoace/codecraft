#testMkdir.rb


def makedir (dir)	
	if !Dir.exist?(dir)
		Dir.mkdir(dir)
	end
end

def dgMkdir (dir)
	node_dir = ""
	nodes = dir.split("/")	
	nodes.each do |node|
		node_dir+=node+"/"
		makedir(node_dir)
	end	
end
	


# ddtest="c:/p4/master/tp/test1/tp.jquery/1.8.0/REL/src"
# dgMkdir ddtest

