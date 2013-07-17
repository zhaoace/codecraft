
def myTrim ( inStr ):
    inStr = list(inStr)

    print "start_",inStr , "_start"
    for i,v in enumerate(inStr):
        if v == ' ' :
            continue
        if v != ' ' :
            inStr = inStr[i:]
            print inStr
            break

    inStr.reverse()
    print "reverse_",''.join(inStr) , "_reverse"
    for i,v in enumerate(inStr):
        if v == ' ' :
            continue    
        if v != ' ' :
            inStr = inStr[i:]
            print inStr
            break

    inStr.reverse()
    inStr = ''.join(inStr)    
    inStr = unicode(inStr)
    print "end_",inStr,"_end"   




s = raw_input("Input a string with space \n")
myTrim(s)
        
    