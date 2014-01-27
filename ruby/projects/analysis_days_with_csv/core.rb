require 'date'


def max a, b
    a > b ? a : b
end

def min a, b
    a < b ? a : b
end


def getDateFromString time_string
    if time_string.include? "-"
        time = []
        time_string.split('-').each { |t|  time << t.to_i}
        Date.new(time[0],time[1],time[2])
    else 
        time = [time_string[0..3].to_i,time_string[4..5].to_i,time_string[6..7].to_i]
        Date.new(time[0],time[1],time[2])
    end
end

def howManyDays startDay, endDay, currentMonthFirstDay
    nextMonthFirstDay = nextMonthFirstDayFunc currentMonthFirstDay
    currentMonthLastDay = nextMonthFirstDay - 1
    lastMonthLastDay = currentMonthFirstDay - 1
    


    # p   "max(0, min(#{endDay} , #{nextMonthFirstDay}) -  max(#{startDay}, #{currentMonthFirstDay}))"

    # p   "#{min(endDay , nextMonthFirstDay)} - #{max(startDay, currentMonthFirstDay)}"

    # p    min(endDay , nextMonthFirstDay) -  max(startDay, currentMonthFirstDay)

    days = ((min(endDay , nextMonthFirstDay) -  max(startDay, currentMonthFirstDay))).to_i    
    
    days < 0 ? 0 :days

end




def nextMonthFirstDayFunc thisMonthFirstDay
    if thisMonthFirstDay.month == 12
        Date.new(thisMonthFirstDay.year+1, 1, 1)
    else
        Date.new(thisMonthFirstDay.year, thisMonthFirstDay.month+1, 1) 
    end

end 

