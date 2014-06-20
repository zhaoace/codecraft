# ---------encoding=UTF-8------------


prompt = "> "

print "你跑到了一个有两个门的房间，你选择#1还是#2门？"

door = raw_input(prompt)


if door == "1":
    print "这里有一个巨大的熊和蛋糕，你要干嘛？"
    print "1. 吃蛋糕。"
    print "2. 操熊。"

    bear = raw_input(prompt)

    if bear ==  "1":
        print "the bear eats your face off. Goood job!"
    elif  bear== "2":
        print "the bear eats your legs off. Goood job!"
    else :
        print "Well, doing %s is probably better. Bear  runs away." % bear




if door == "2":
    print "你在克鲁苏的凝视下掉向了无边的深渊。"
    print "1.Blueberries"
    print "2.Yellow jacket clothespins."
    print "3.Understanding revolvers yelling melodies."

    insanity = raw_input(prompt)
    if insanity == "1" or insanity == "2":
        print  "Your body survives poweed by a mind of jello. Good job!"
    else :
        print "THe insanity rots your eyes into a pool of muck. Good job!"

else:
    print "你傻波似得跑来跑去然后跌倒在匕首上挂了。大侠再见。"
