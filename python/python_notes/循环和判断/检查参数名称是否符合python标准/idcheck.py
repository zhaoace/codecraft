#!  usr/bin/env python

import string

alphas= string.letters + '_'
nums = string.digits
myInput = 'start'

print 'Welcome to the Identifier Checker v1.0'
print 'Testees must be at leaset 2 chars long.'

while myInput != '..':
    myInput = raw_input('Indetifier to test?')
    print ''
    
    if len(myInput) >1:
        if myInput[0] not in alphas:
            print '''ivalid: first symbol must be
                   alphabeitc'''
        else:
            for otherChar in myInput[1:]:
                if otherChar not in alphas+nums:
                    print '''invalid: remaining symobls must be alphanumeric'''
                    break
                else:
                    print "okey as an identifier"
    else:
        print "Testees must be at leaset 2 chars long."

                    
