



cars = 100
space_in_a_car = 4.0
drivers =30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity= cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

print "\nThere are " , cars, " cars availbale."
print "\nThere are only", drivers, "drivers available."
print "\nThere will be", cars_not_driven , "empty cars today"
print "\nWe can transport ", carpool_capacity , "people today."
print "\nWe have ", passengers, " to carpool today"
print "\nWe need to put about ", average_passengers_per_car , "in each car."
