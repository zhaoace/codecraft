#rescue.rb

def aaa(aaa)
	begin 
		p aaa
		if aaa=="aaa"
			#p aaa
		else			
			raise "error here"
		end
	rescue
		aaa = "aaa"
		retry
	end
end


aaa "xxx"


=begin

begin
    |   raise "test2"
    | rescue
    |   puts "An error occurred: #{$!}"
    | end
=end

begin 
	raise "raise a errMsg"
rescue
	p "do a rescue here."
	p "An error occureed: #{$!}"
end
