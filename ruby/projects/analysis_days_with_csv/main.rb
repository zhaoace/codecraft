# main.rb

require "CSV"
require "date"
require "./core.rb"


writer = CSV.open("result.csv", "w")

csv = CSV.open("to_deal.csv")

csv.read.each do |line|
    startDay = getDateFromString line[0].split(";")[0]
    endDay = getDateFromString line[0].split(";")[1]

    months = []
    12.times do |month|
        month +=1
        currentMonthFirstDay = Date.new(2014,month.to_i,1)
        months << howManyDays(startDay, endDay, currentMonthFirstDay )
    end
    writer << [  startDay.strftime("%Y-%-m-%-d") , endDay.strftime("%Y-%-m-%-d") ] + months
end 


writer.close



