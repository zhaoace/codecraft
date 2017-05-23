from demo6 import *

print ""
print 'demo7 try 1 =============='
print get_text("iphone8")

get_text = p_decorate(get_text)
print get_text("iphone8")


# Try -----
print 'demo7 try 2 =============='
print get_name('lili')
get_name = my_decorate(get_name)
print get_name("lili")
