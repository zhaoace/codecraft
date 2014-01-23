# coc_tool_v2.rb
SOLDIER = {
    barbarian:    { food:1,   water:[0, 25,    40,    60,    80,   100,  150  ] },
    archer:       { food:1,   water:[0, 50,    80,    120,   160,  200,  300  ] },
    goblin:       { food:1,   water:[0, 25,    40,    60,    80,   100,  150  ] },
    giant:        { food:5,   water:[0, 500,   1000,  1500,  2000, 2500, 3000 ] },
    wallbreaker:  { food:2,   water:[0, 1000,  1500,  2000,  2500, 3000, 3500 ] },
    balloon:      { food:5,   water:[0, 2000,  2500,  3000,  3500, 4000, 4500 ] },
    wizard:       { food:4,   water:[0, 1500,  2000,  2500,  3000, 3500, 4000 ] },
    healer:       { food:14,  water:[0, 5000,  6000,  8000,  10000 ] },
    dragon:       { food:20,  water:[0, 25000, 30000, 36000, 42000 ] },
}


class Army 
    attr_accessor :commander, :summary, :soldiers    

    def initialize(commander="anonymous", soldiers=[ [0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0] ])
        @commander = commander
        @soldiers = soldiers
    end

    def food 
        food = 0
        @soldiers.each_index do |i|
            name  = SOLDIER.keys[i]            
            count = @soldiers[i][1]
            food += SOLDIER[name][:food]* count
        end
        food
    end
    
    def resource        
        resource = 0
        @soldiers.each_index do |i|
            name  = SOLDIER.keys[i]
            level = @soldiers[i][0]
            count = @soldiers[i][1]
            resource += SOLDIER[name][:water][level] * count
        end
        resource
    end
end


