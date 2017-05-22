def fibonacci (int1):
    x = 0
    alist = [0,1,2]
    for i in range(int1+1):
        if int1<3 :
            break
        if i<3:
            continue        
        else:
            alist.append(alist[i-1]+alist[i-2])
            continue       
    else:
        print "range is" , len(alist)
    return alist[int1]

inputX = True
while inputX:
    inputX = int(raw_input("input"))
    print str(fibonacci(inputX))
    
    if inputX == 999:
        break
