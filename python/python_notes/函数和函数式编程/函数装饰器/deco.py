#! /usr/bin/env python

from time import ctime,sleep

def tsfunc (func):
    def wrappedFunc ():
        print '[%s] %s() called' % (
            ctime(),func.__name__)
        return func()
    return wrappedFunc


@tsfunc
def foo ():
    pass

foo()
sleep(3)

for i  in range(5):
    sleep(1)
    foo()