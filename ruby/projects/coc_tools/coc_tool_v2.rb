# coc_tool_v2.rb


SOLDIER = {
    barbarian:  { food:1,   water:[0, 25,  40,   60,   80,   100,  150] },
    archer:     { food:1,   water:[0, 50,  80,   120,  160,  200,  300] },
    goblin:     { food:1,   water:[0, 25,  40,   60,   80,   100,  150] },
    giant:      { food:5,   water:[0, 500, 1000, 1500, 2000, 2500, 3000] }
}





class Army 
    attr_accessor :commander, :summary, :soldiers
    attr_reader :resource

    def initialize(commander="anonymous", summary=200, soldiers=[0,0,0,0])
        # @barbarian  = barbarian
        # @archer  = archer 
        # @goblin = goblin
        # @giant  = giant


    end


    def resource
        # @resource = Giant.new.resource*@giant + Healer.new.resource*@healer + Archer.new.resource*@archer + Goblin.new.resource*@goblin;
        @resource = 12222
    end



end



p 

p SOLDIER.keys


resource=0
SOLDIER.keys.each  do |soldierType| 
    resource += SOLDIER[soldierType][:water][4]
    p resource
end


