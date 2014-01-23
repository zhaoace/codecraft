# work_with_csv.rb

require 'csv'
writer = CSV.open('test.csv','w')
writer << [1,5.3,'dawn']
writer << [2,33,'paul']
writer.close


CSV.open("test2.csv", 'w') do | writer | 
    writer << ['sophie', 9, 75.0]
    writer << ['brian', 46, 175.4]
end

