class Giant
  attr_accessor :level
  attr_reader :resource
  def initialize(level=4 )
    @level = level    
    leveCost = [0, 500, 1000, 1500, 2000, 2500]
    @resource = leveCost[level]
  end
end


class Healer
  attr_accessor :level
  attr_reader :resource
  def initialize(level=2 )
    @level = level    
    leveCost = [0, 5000, 6000]
    @resource = leveCost[level]
  end
end




class Archer
  attr_accessor :level
  attr_reader :resource
  def initialize(level=4 )
    @level = level    
    leveCost = [0, 50, 80, 120, 160]
    @resource = leveCost[level]
  end
end


class Goblin
  attr_accessor :level
  attr_reader :resource
  def initialize(level=4 )
    @level = level    
    leveCost = [0, 25, 40, 60, 80,100]
    @resource = leveCost[level]
  end
end



class Army
  attr_accessor :soldiers, :giant, :healer, :goblin, :archer
  attr_reader :resource

  def initialize(summary=200, giant=0, healer=0, goblin=0, archer=0 )
  	@giant  = giant
  	@healer = healer
    @goblin = goblin
  	@archer  = archer 
  end

  def resource
  	 @resource = Giant.new.resource*@giant + Healer.new.resource*@healer + Archer.new.resource*@archer + Goblin.new.resource*@goblin;
  	 # @resource = (@resource/1000).to_s + "k" 
  end

  def soldiers
  	p "My soldiers: "
  	p "         巨人      =  " + @giant.to_s
  	p "         天使      =  " + @healer.to_s
    p "         绿皮      =  " + @goblin.to_s
  	p "         弓箭手     =  " + @archer.to_s
  	p "         圣水消耗   =  " + self.resource.to_s
  end 

end




# Army.new( 200, 3, 0, 13, 27 ).soldiers

myArmy = Army.new
myArmy.giant = 20    #巨人
myArmy.healer = 2   #天使  
myArmy.goblin = 19   #绿皮
myArmy.archer = 37   #弓箭手
myArmy.soldiers


# myArmy = Army.new 200,20,3
# p myArmy.resource

# p Army.new(200,20,2).resource
# p Army.new(200,18,3).resource

# Army.new(200,20,2).soldiers
# Army.new(200,18,2).soldiers
# Army.new(200,20,3).soldiers
# Army.new(200,18,3).soldiers
# Army.new.soldiers




# giant = Giant.new
# healer = Healer.new
# archer = Archer.new
# p giant.resource
# p healer.resource
# p archer.resource

