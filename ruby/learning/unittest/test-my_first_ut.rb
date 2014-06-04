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



    def test_helloWorld_no_var
        result = helloWorld
        expect = "helloWorld , I'm zhaoli "
        assert_equal(result, expect)
    end


    def test_helloDongdong_var1
        var = "dongdong"

        result = helloDongdong var
        expect = "hello, I'm #{var}"

        assert_equal(result, expect)
    end



end