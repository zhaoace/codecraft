#-- coding:utf-8 --
import sys
print sys.version

my_name   = 'Zed A. Shaw'
my_age    = 35
my_height = 74
my_weight = 180
my_eyes   = 'blue'
my_teeth  = 'white'
my_hair   = 'Brown'



print "Let's talk about %s." % my_name
print "He's %d inches tall." % my_height
print "He's %d pounds heavy." % my_weight
print "He's got %s eyes and %s hair." % (my_eyes , my_hair)
print "Actually that's not too heavy."
print "His teeth are usually %s depending on the coffee" % my_teeth



# tricky one
# print "\nIf I add %d, %d , and %d I get %d." % ( my_age, my_height, my_weight,my_age+my_height+my_weight)
