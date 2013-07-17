#非关键字可变长参数（元祖）
def tupleVarArgs(arg1, arg2='defaultB', *theRest):
    'display regular args and non-keyword variable args'
    print 'formal arg 1:', arg1 
    print 'formal arg 2:', arg2 
    for eachXtrArg in theRest:
        print 'another arg:', eachXtrArg

#test1
tupleVarArgs('abc')
#test2
tupleVarArgs(23, 4.56)
#test3
tupleVarArgs('abc', 123, 'xyz', 456.789)



#关键字变量参数（字典Dictionary)
def dictVarArgs (arg1,arg2='defaultB',**theRest):
    'display 2 regular args and keyword variable args'
    print 'formal arg1:',arg1
    print 'formal arg2:',arg2
    for eachXtrArg in theRest.keys():
        print 'Xtra arg %s: %s'%(eachXtrArg , str(theRest[eachXtrArg]))       


#test1
dictVarArgs(1220, 740.0, c='grail')
#test2
dictVarArgs(arg2='tales', c=123, d='poe', arg1='mystery')
#test3
dictVarArgs('one', d=10, e='zoo', men=('freud', 'gaudi'))



#同时使用关键字和非关键字可变长参数   <-- 存疑！
def newfoo(arg1,arg2,*nkw,**kw):
    'dispaly regular args andd all variable args'
    print 'arg1 is:',arg1 
    print 'arg2 is:',arg2
    for eachNKW in nkw:
        print 'addtiontal nokeyword arg:',eachNKW
    for eachKW in kw.keys():
        print "additional keyword arg '%s':%s" (eachKW,kw[eachKW])
        
#test1        
newfoo('wolf', 3, 'projects', freud=90, gamble=96)