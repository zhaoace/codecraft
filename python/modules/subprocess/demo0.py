#!/usr/bin/env python
# coding=utf-8
import subprocess

# No need to handle stdout or anything , they go to system stdout.
return_code = subprocess.call("echo hello wrold", shell=True)
print return_code

# Or, you redirect the stdout to a PIPE, you need to hand the stdout
#    otherwish it went wrong
p1 = subprocess.Popen('echo hell world 2', shell=True, stdout=subprocess.PIPE)
print p1.stdout.read()


# It get a broken pipe if not read the stdout.
p2 = subprocess.Popen('echo hell world 3', shell=True, stdout=subprocess.PIPE)
# print p2.stdout.read()
