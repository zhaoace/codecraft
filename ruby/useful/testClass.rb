#testClass.rb

class ThirdParty
	attr_accessor :name , :version ,  :approvalID
	def initialize (name, version, approvalID)
		@name = name
		@version = version
		@approvalID = approvalID
	end
	def v
		@v="v";
	end

	def to_s
		return 		(	" [name= " + name.to_s + "]"	+		
						" [version= " + version.to_s + "]"	 +		
						" [approvalID= " + approvalID.to_s + "]"		)
	end
end


tp= ThirdParty.new("demo","1.0.0","123456")
p tp.to_s
p.v
