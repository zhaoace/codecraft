s="hello"

def s.hi
	p split(//).join("-")	
end
s.hi



class Myclass
	def self.hi
		p "hi world"
	end
end
Myclass.hi

def Myclass.echo
	p self.inspect
end
Myclass.echo

module Mymod
	def fm
		"m"
	end
	def age
		20
	end
end

guy = "kenn"
guy.extend Mymod

p guy.fm
p guy.age

