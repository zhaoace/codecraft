class Pangzi
  attr_accessor :level
  attr_reader :resource
  def initialize(level=4 )
    @level = level    
    leveCost = [0, 500, 1000, 1500, 2000, 2500]
    @resource = leveCost[level]
  end
end


class Tianshi
  attr_accessor :level
  attr_reader :resource
  def initialize(level=2 )
    @level = level    
    leveCost = [0, 5000, 6000]
    @resource = leveCost[level]
  end
end




class GongMM
  attr_accessor :level
  attr_reader :resource
  def initialize(level=4 )
    @level = level    
    leveCost = [0, 50, 80, 120, 160]
    @resource = leveCost[level]
  end
end





class Army
  attr_accessor :soldiers, :pangzi, :tianshi, :gongMM
  attr_reader :resource

  def initialize(summary=200, pangzi=0 , tianshi=0 , gongMM=0 )
  	@pangzi  = pangzi
  	@tianshi = tianshi
  	@gongMM  = gongMM ? (summary-pangzi*5-tianshi*14) : gongMM

  end

  def resource
  	 @resource = Pangzi.new.resource*@pangzi + Tianshi.new.resource*@tianshi + GongMM.new.resource*@gongMM;
  	 # @resource = (@resource/1000).to_s + "k" 
  end

  def soldiers
  	p "My soldiers: "
  	p "         pangzi  =  " + @pangzi.to_s
  	p "         tianshi =  " + @tianshi.to_s
  	p "         gong mm =  " + @gongMM.to_s
  	p "         cost    =  " + self.resource.to_s
  end

end






myArmy = Army.new 200,20,3
p myArmy.resource

p Army.new(200,20,2).resource
p Army.new(200,18,3).resource

Army.new(200,20,2).soldiers
Army.new(200,18,2).soldiers
Army.new(200,20,3).soldiers
Army.new(200,18,3).soldiers
Army.new.soldiers




# pangzi = Pangzi.new
# tianshi = Tianshi.new
# gongMM = GongMM.new
# p pangzi.resource
# p tianshi.resource
# p gongMM.resource

