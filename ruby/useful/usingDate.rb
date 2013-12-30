require 'date'

time = Time.now.year.to_s + Time.now.month.to_s
teams = [] << "sdk" << "chart" << "geo" << "controls"


teams.each do |x|
	name = x+time
	system "echo #{name}"
end
