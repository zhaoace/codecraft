#!/usr/bin/env python
# coding=utf-8

from subprocess import Popen, PIPE


# Maybe need 'chmod 777 shell_for_demo2.sh'
p1 = Popen("./shell_for_demo2.sh", shell=True,
        stdin=PIPE, stderr=PIPE, stdout=PIPE );
p1.stdin.write('zhao')
output = p1.communicate()[0]
print output


# Another usage
p2 = Popen("./shell_for_demo2.sh", shell=True,
        stdin=PIPE, stderr=PIPE, stdout=PIPE );
p2.stdin.write('li\n')
# Be careful , it would hang there if not recieved \n as EOF.
# So better to use p2.communicate()
# p2.stdin.write('li')
print p2.stdout.read()
