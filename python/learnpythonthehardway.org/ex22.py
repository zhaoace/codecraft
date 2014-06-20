# encoding:utf-8
from sys import argv
from os import exists


script , arg1, arg2 = argv

print "%r %s" % (arg1, arg2)



input = raw_input("input  what? \n > ")

f_script = open(script,"r")

print f_script.read()


f_script.close()

s = """
This
is
a
string
variable
'""'