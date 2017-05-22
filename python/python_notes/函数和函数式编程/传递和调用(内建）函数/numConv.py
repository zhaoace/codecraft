#! /usr/bin/env python

def convert (func,seq):
    'conv. sequ of numbers to same type'
    return [func(eachNum) for eachNum in seq]

myseq = (123,45.67,-6.2e8,99999999L)
print convert(int,myseq)
print convert(long,myseq)
print convert(float,myseq)
print convert(str,myseq)
print convert(unicode,myseq)    