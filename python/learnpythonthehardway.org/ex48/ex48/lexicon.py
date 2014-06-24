directions = ["north", "south", "east", "west", "down", "up", "left", "right", "back"]
verbs =["go", "stop", "kill", "eat"]
stops =["the", "in", "of", "from", "at", "it"]
nouns= [ "door", "bear", "princess", "cabinet"]



def convert_number(s):
    try:
        return int(s)
    except ValueError:
        return None

def scan(stuff):
    words=stuff.split()
    result = []
    for word in words:
        if None != convert_number(word):
            result.append( ('number', convert_number(word)))
        elif word in directions:
            result.append( ('direction', word))
        elif word in verbs:
            result.append( ('verb', word))
        elif word in stops:
            result.append( ('stop', word))
        elif word in nouns:
            result.append( ('noun', word))
        else:
            result.append( ('error', word))
    return result


