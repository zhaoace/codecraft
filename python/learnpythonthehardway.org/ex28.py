answers = []

answers.append(  True and True)
answers.append(  False and True      )
answers.append(  1 == 1 and 2 == 1      )
answers.append(  "test" == "test"      )
answers.append(  1 == 1 or 2 != 1      )
answers.append(  True and 1==1      )
answers.append(  False and 0!= 0      )
answers.append(  True or 1 ==1      )
answers.append(  "test" == "testing"      )
answers.append(  1 != 0 and 2 == 1      )
answers.append(  "test"  != "testing"      )
answers.append(  "test" == 1      )
answers.append(  not (True and False)      )
answers.append(  not ( 1 == 1 and 0 !=1 )      )
answers.append(  not (10 ==1 or 1000 == 1000)      )
answers.append(  not (1 != 10 or 3 ==4)      )
answers.append(  not ("testing"  == "testing" and "Zed" == "Cool Guy")      )
answers.append(  1 == 1 and not ("testing" == 1 or 1 == 0 )      )
answers.append(  "chunky" == "bacon" and not ( 3 == 4 or 3 == 3)      )
answers.append(  3 == 3 and not ("testing" == "testing" or "Python" == "Fun")      )

print answers
