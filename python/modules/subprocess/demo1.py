#!/usr/bin/env python
# coding=utf-8

from subprocess import Popen, PIPE
p1 = Popen(["sudo","dmesg"],stdout=PIPE);
p2 = Popen(["grep","Apple"],stdin=p1.stdout, stdout=PIPE)
p1.stdout.close()
output = p2.communicate()[0]
print output
print p2
