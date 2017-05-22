# -*- coding: utf-8 -*-
# from sys import path
# path.append('c:/git/st/codecraft.git/python/learnpythonthehardway.org/')
# import   ex43_rooms


from sys import exit
from random import randint

print "ex43.py"



class Game(object):
    def __init__(self,start):
        self.start=start


    def play(self):
        next = self.start
        while True:
            print "\n-------------------- "
            room = eval(next)()
            next = room.play()

#end of class Game



class  StartRoom(object):
    def __init__(self):
        print "Now you are at StartRoom "
    def play(self):
        print "How old are you?"
        age = input("> ")

        if(age <= 18):
            print "Welcome child!"
            return "GoldRoom"
        else:
            return "AnimalRoom"


class AnimalRoom(object):
    def __init__(self):
        print "Now you are at AnimalRoom "
    def play(self):
        print "So are you a young lady? (Y/n)"
        is_young_lady = raw_input("> ")
        if(is_young_lady == "Y"):
            print "Young lady is always welcome!"
            return "GoldRoom"
        else:
            return "BookRoom"

class BookRoom(object):
    def __init__(self):
        print "Now you are at BookRoom "
    def play(self):
        print "12 x 3 + 4 -2 =? "
        answer = raw_input("> ")
        if (answer == 38):
            return "GoldRoom"
        else :
            return "Death"



class GoldRoom(object):
    def __init__(self):
        print "Now you are at GoldRoom "
    def play(self):
        return "EndRoom"


class EndRoom(object):
    def __init__(self):
        print "Now you are at EndRoom "
    def play(self):
        print "You win!"
        print "-------------------"
        exit(1)


class Death(object):
    def __init__(self):
        print "You died. "
        self.quips = [
            "少侠请重新来过。",
            "慢走啊大人。",
            "人命天定，重头再来。",
            "天若有情天亦老，你丫今天不洗澡。"
        ]
    def play(self):
        print self.quips[randint(0,len(self.quips)-1)]
        print "-------------------"
        exit(1)





a_game =  Game("StartRoom")
a_game.play()




