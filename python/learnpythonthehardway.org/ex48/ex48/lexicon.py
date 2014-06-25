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




# ======= for ex49
class ParserError(Exception):
    pass

class Sentence(object):
    def __init__(self, subject, verb, object):
        self.subject = subject[1]
        self.verb = verb[1]
        self.object =object[1]


def peek(word_list):
    if word_list:
        word = word_list[0]
        return word[0]
    else:
        return None


def match(word_list, expecting):
    if word_list:
        word = word_list.pop(0)

        if word[0] == expecting:
            return word
        else:
            return None
    else:
        return None

def skip(word_list, word_type):

    print word_list
    while peek(word_list) == word_type:
        match(word_list, word_type)
    print word_list


def parse_verb(word_list):
    skip(word_list, 'stop')
    if peek(word_list) == 'verb':
        return match(word_list, 'verb')
    else:
        raise ParserError("Excepted a verb next.")


def parse_object(word_list):
    skip(word_list,'stop')
    next =  peek(word_list)
    if next == 'noun':
        return match(word_list,'noun')
    if next == 'direction':
        return match(word_list, 'direction')
    else:
        raise ParserError("Excepted a noun or direction next.")

def parse_subject(word_list, subj):
    verb = paser_verb(word_list)
    obj = parse_object(word_list)
    return Sentence(subj, verb, obj)

def parse_sentence(word_list):
    skip(word_list,'stop')

    start = peek(word_list)

    if start == 'noun':
        subj = match(word_list, 'noun')
        return parse_subject(word_list,subj)
    elif start == 'verb':
        return parse_subject(word_list, ('noun', 'player'))
    else:
        raise ParserError("Must start with subject object or verb, not %d" % start)



#===