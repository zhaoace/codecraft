#!/usr/bin/env python
# coding=utf-8

import sys

def main(str="lzhao"):
    print "main: hello", str

if __name__ == '__main__':
    print "sys.argv:",sys.argv
    if len(sys.argv ) > 1 :
        print sys.argv
        main(sys.argv[1])
    else:
        main()
