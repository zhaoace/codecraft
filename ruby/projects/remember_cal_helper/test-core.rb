# test-core.rb
require "test/unit"
require "./core.rb"
require 'date'


class UnitTestRemeberStepCore < Test::Unit::TestCase
    def test_get_remember_steps
        start_day = Date.new(2014,03,05)
        target = "3.6  3.8  3.12  3.20  4.4  "
        result_called = get_remember_steps(start_day)
        assert_equal(target , result_called )        
    end
end


