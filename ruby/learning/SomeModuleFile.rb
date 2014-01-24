module SomeModule
	class SomeClass
		def hello
			"hi"
		end
	end
	Constant = "I am a constant."
	def self.speak
		"I am a module method."
	end
	def speak
		"I am a mixin method."
	end


	module InnerModule
		class SomeClass
			def hello
				"inner hi "
			end
		end
		Constant = "I am a inner  constant."
		def self.speak
			"I am a inner module method."
		end
		def speak
			"I am a inner  mixin method."
		end
	end
end