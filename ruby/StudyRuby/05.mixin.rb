#05.mixin.rb

module Mymod
	attr_reader :names	
	def set_up(a)
		@names = a
	end
	def add_name(name)
		@names << name
	end
	def rm_name(name)
		@names.delete(name)
	end
end

class Myclass < Array
	include Mymod
	def initialize(*a)
		super(a)
		set_up(a)
	end
end

x = Myclass.new("jessi","jane","joan")

x.push("jenn")
p x
p x.names
p ""
x.add_name("jeff")
p x
p x.names
p ""
x.delete("jane")
p x
p x.names
p ""
x.rm_name("jessi")
p x
p x.names
p ""




