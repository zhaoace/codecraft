#03.func_area.rb

class Myclass
	private 
	def  t1
		"private"
	end
	protected 
	def t2
		"protected"
	end
end

x=Myclass.new
y=Myclass.new

#x.t1 #expect a NoMethodError
#y.t1 #expect a NoMethodError

class Myclass
	def t3(a)
		a.t2
	end
end
p x.t3(y);

p x.t3(Myclass.new)

class Myclass
	def t4(a)
		a.t1
	end
end
#p x.t4(y) #expect a NoMethodError

class Mysub < Myclass
	def t5
		t1
	end
end
z = Mysub.new
p "z.t5 = " + z.t5

class Mysub < Myclass
	def t6
		t2
	end
end
a = Mysub.new
p "a.t6 = " + a.t6




