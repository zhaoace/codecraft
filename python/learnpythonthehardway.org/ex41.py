print "ex41.py"

from sys import exit
from random import randint

def death():
    quips = ["You died. You kinda suck at this.",
             "Nic job, you died ... jackass.",
             "Such a luser.",
             "I have a small puppy that's better at this."]
    print quips[randint(0, len(quips)-1)]
    exit(1)



def central_corridor():
    print ""
    print ""
    print ""
    print ""
    print "\n"
    print "You're"
    print "a Gothon"
    print "flowing "
    print "Armory"


    action = raw_input("> ")

    if action == "shoot!":
        print "Quick on"
        print "His "
        print "off your aim"
        print "completely "
        print "makes"
        print "you are dead."
        return 'death'


    elif action == "dodge!":
        print "Like a world class boxer"
        print "as the Gothon's blaster"
        print "in the middle of "
        print "bant your head"
        print "You wake up "
        print "your head and eats you."
        return 'death'

    elif action == "tell a joke" :
        print "Lucky for you "
        print "You tell the one "
        print "Lbhe zbgure vs fs"
        print "The Gothon stops,"
        print "While he's laughing"
        print "putting him down"
        return 'laser_weapon_armory'

    else:
        print "Does not compute!"
        return 'central_corridor'


def laser_weapon_armory():
        print "you do a dive roll "
        print "for more Gothons"
        print "Your stand up and "
        print "neutron bomb"
        print "and you need "
        print "wrong 10 "
        print "get the boob. the code is 3digits"
        code ="%d%d%d" % (randint(1,9), randint(1,9) ,randint(1,9))
        guess = raw_input("[keypad]> ")
        guesses = 0

        while guess!=code and guesses < 10:
            print "BZZZEDD"
            guesses += 1
            guess = raw_input("[keypad]> ")

        if guess == code:
            print "The container clicks"
            print "You grab "
            print "brigge where you must"
            return 'the_bridge'
        else:
            print "The lock buzzes one"
            print "melting sound as"
            print "You decide to sit there"
            print "ship from their ship "
            return 'death'


def the_bridge():
    print "You burst onto "
    print "under your arm"
    print "take control of"
    print "clown costume than "
    print "weapons out yet"
    print "arm and don't want"

    action = raw_input("> ")

    if action == "throw the bomb":
        print "in a panic you throw the bomb"
        print "and make a leap for the dor"
        print "Gonthon shoots you "
        print "As you die you "
        print "the bomb"
        print "it goes off."
        return 'death'

    elif action == "Slowly place the bomb":
        print "your poitn "
        print "and the "
        print "you inch backward to the door"
        print "You then jump back"
        print "and blast the lock"
        print "Now that"
        print "get off this tin can"
        return 'escape_pod'
    else:
        print "DOES NOT COMPUTE!"
        return 'the_bridge'


def escape_pod():
    print "You rush through"
    print "the escape pod before"
    print "hardly any Gothons"
    print "interference. you get "
    print "now need to."
    print "do you take?"

    good_pod = randint(1,5)
    guess = raw_input("[pod #]> ")

    if int(guess)!= good_pod:
        print "You jump into pod %s and " % guess
        print "the pod escapes"
        print "impodes as the hull "
        print "into jamjelly"
        return 'death'

    else:
        print "You jump into pond %s and " % guess
        print "The pod esily "
        print "the planet"
        print "back and see your "
        print "time. You won!"
        exit(0)


ROOMS = {
    'death': death,
    'central_corridor': central_corridor,
    'laser_weapon_armor': laser_weapon_armory,
    'the_bridge': the_bridge,
    'escape+pod':escape_pod
}


def runner(map, start):
    next = start

    while True:
        room = map[next]
        print "\n----"
        next = room()


runner(ROOMS, 'central_corridor')








