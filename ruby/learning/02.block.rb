x =  [3,1,2,4,8,0]
z = x.select{|s| s<3 }
puts z


class Array

	def myfind
		if  block_given?
			z = []
			each { |s| z<< s if yield s}
			z
		else
			raise "no block given"
		end		
	end
end

zz = x.myfind{|s| s<3}
p zz



zzz = x.myfind
p zzz  #expect an RuntimeError here.





