# test-my_first_ut.rb


require "test/unit"
require "./my_first_ut.rb"


class MyFirstTestPlan < Test::Unit::TestCase
    def test_outputMyName
        assert_equal('Zhaoace', outputMyName)
    end    

    def test_inputMyName2
        assert_equal('Zhaoace', outputMyName)
    end
end