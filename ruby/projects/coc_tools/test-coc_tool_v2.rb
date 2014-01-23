# test-coc_tool_v2.rb
require "test/unit"
require "./coc_tool_v2.rb"

class UnitTestCocTools < Test::Unit::TestCase
	def test_ArmyWithAnonymousCommander
		assert_equal("anonymous" , Army.new.commander )
	end

	def test_ArmyWithCommander
		assert_equal("zhaoace" , Army.new("zhaoace").commander )
	end

	def test_ArmyWithNoSoldiers
		soldiers = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0] ]
		assert_equal(soldiers , Army.new("zhaoace").soldiers )
	end


	def test_ArmyWithSoldiers
		soldiers = [[1,1],[3,2],[4,4] ]
		assert_equal(soldiers , Army.new("zhaoace",[[1,1],[3,2],[4,4]]).soldiers )
	end


	def test_ResourceWithSingleSoldier
		soldiers = [[1,1]]
		targetResource = SOLDIER[:barbarian][:water][1]
		armyResource = Army.new("zhaoace",[[1,1]]).resource
		assert_equal(targetResource , armyResource )
	end

	def test_ResourceWithMutipleSoldiers
		soldiers = [[1,1],[2,10]]
		targetResource = SOLDIER[:barbarian][:water][1] + SOLDIER[:archer][:water][2] * 10
		armyResource = Army.new("zhaoace", soldiers).resource
		assert_equal(targetResource , armyResource )
	end


	def test_FoodWithSingleSoldier
		soldiers = [[0,0],[1,1]]
		targetFood = SOLDIER[:archer][:food]
		armyFood = Army.new("zhaoace", soldiers).food
		assert_equal(targetFood , armyFood )
	end

	def test_ResourceWithMutipleSoldiers
		soldiers = [[1,1],[2,10]]
		targetFood = SOLDIER[:barbarian][:food] + SOLDIER[:archer][:food] * 10
		armyFood = Army.new("zhaoace", soldiers ).food
		assert_equal(targetFood , armyFood )
	end



end


