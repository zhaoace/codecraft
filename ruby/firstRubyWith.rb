
class  Greeter 
	def initialize(name="world")
		@name = name
	end

	def say_hi
		puts "hi, #{@name}!"
	end

	def say_bye
		puts "bye, #{@name}~~~"
	end
end

class Greeter
	attr_accessor :name
end

g=Greeter.new("Lisi")

g.say_hi
g.say_bye
p Greeter.instance_methods(false)
p g.respond_to?("name")
p g.respond_to?("say_hi")
p g.respond_to?("to_s")

p g.name
g.name="zhangsan"
p g.name

#====================
p "========================================="
def h( name="world")
	puts "hello #{name}"
end

h
h("zhao")
h "zhang"





