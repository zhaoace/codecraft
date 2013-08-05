#!/usr/bin/env ruby
class MegaGreeter 
	attr_accessor :names
	

	#Create the object
	def initialize(names="world")
		@names=names
	end

	#Say hi to everyone
	def say_hi
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("each")
			#@names is a list
			@names.each do |name|
				puts "hello #{name}!"
			end
		else
			puts "Hello #{@names}!"
		end
	end

	#Say bye to everyone
	def say_bye
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			puts "Godbye #{@names.join(",")}.Come back soon!"
		else
			puts "Good bye #{@names}.Come back soon!"
		end
	end

end


#if __FILE___ == $0
	mg = MegaGreeter.new
	mg.say_hi
	mg.say_bye

	#chnage name t0 be zeke
	mg.names="zeke"
	mg.say_hi
	mg.say_bye

	#change name to Array
	mg.names = ["Albert","Brenda","zhaoli","youkun"]
	mg.say_hi
	mg.say_bye

	# change to nil
	mg.names = nil
	mg.say_hi
	mg.say_bye

#end
