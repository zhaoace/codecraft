require 'date'


def get_remember_steps start_day
    remember_steps =[1, 3, 7, 15, 30]
    result = ''
    remember_steps.each do |step|
        next_day = start_day + step
        next_day_str = next_day.mon.to_s + '.' + next_day.mday.to_s        
        result += next_day_str + '  ' 
    end
    result
end


p get_remember_steps Date.today

