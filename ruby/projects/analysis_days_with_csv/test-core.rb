#test.rb
require "date"
require "test/unit"
require "./core.rb"


class UnitTestPlan < Test::Unit::TestCase

    def test_max 
        target = Date.new(2014,4,15)        
        result = max(Date.new(2013,7,15), Date.new(2014,4,15) ) 
        assert_equal(target, result)
    end 


    def test_min
        target = Date.new(2013,7,15)        
        result = min(Date.new(2013,7,15), Date.new(2014,4,15) )
        assert_equal(target, result)
    end 


    def test_getDateFromString_1
        dateString = "20140119"
        target = Date.new(2014,1,19)        
        result = getDateFromString dateString
        assert_equal(target, result)

        dateString = "2014-1-9"
        target = Date.new(2014,1,9)        
        result = getDateFromString dateString
        assert_equal(target, result)

        dateString = "2014-1-9"
        target = Date.new(2014,1,9)        
        result = getDateFromString dateString
        assert_equal(target, result)
    end


    def test_howManyDays

        dateArray = [
            Date.new(2013,11,1) ,
            Date.new(2014,4,9) ,
            Date.new(2014,2,1) ,
        ]
        target = 28
        result = howManyDays *dateArray
        assert_equal(target, result)

        dateArray = [
            Date.new(2014,1,2) ,
            Date.new(2014,1,9) ,
            Date.new(2014,1,1) ,
        ]
        target = 7
        result = howManyDays *dateArray
        assert_equal(target, result)

        dateArray = [
            Date.new(2013,12,1) ,
            Date.new(2014,1,9) ,
            Date.new(2014,1,1) ,
        ]
        target = 8
        result = howManyDays *dateArray
        assert_equal(target, result)



        dateArray = [
            Date.new(2014,2,13) ,
            Date.new(2014,11,9) ,
            Date.new(2014,2,1) ,
        ]
        target = 16
        result = howManyDays *dateArray
        assert_equal(target, result)

        dateArray = [
            Date.new(2014,2,13) ,
            Date.new(2014,11,9) ,
            Date.new(2014,12,1) ,
        ]
        target = 0
        result = howManyDays *dateArray
        assert_equal(target, result)


    end 

    def test_nextMonthFirstDayFunc
        target = Date.new(2014,1,1) 
        result = nextMonthFirstDayFunc( Date.new(2013,12,1))
        assert_equal(target, result)

        target = Date.new(2013,12,1) 
        result = nextMonthFirstDayFunc( Date.new(2013,11,1))
        assert_equal(target, result)
    end



end

