#! /usr/bin/env python

def displayNumType(num):
    print num ,'is',
    if isinstance(num,(int,long,float,complex)):
        print 'a number of type:' , type(num).__name__
    else:
        print 'not a number at all!!'


def displayNumType2(num):
    print num ,'is',
    if type(num)==type(0):
        print 'an integer'
