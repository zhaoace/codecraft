#! /usr/bin/env python

db = {}

def newuser():
    prompt = 'login desired:'
    while True:
        name = raw_input(prompt)
        if db.has_key(name):
            prompt = 'name taken,try anoter:'
            continue
        else:
            pwd = raw_input('passwd:')
            db[name] = pwd
            break

def olduser():
     name = raw_input('login:')
     pwd = raw_input('passwd:')
     passwd = db.get(name)
     if passwd == pwd:
         print 'welcome back', name
     else:
         print 'login incorret'

def showmenu ():
    prompt = """
(N)ew User Login
(E)xisting User Login
(Q)uit

Enter choice:"""
    done = False
    while not done:
        chosen = False
        while not chosen:
            try:
                choice = raw_input(prompt).strip()[0].lower()
            except(EOFError,KeyboardInterrupt):
                choice = 'q'
            if choice not in 'neq':
                print 'invalid option , try again'
            else:
                chosen = True
                #done = True
        newuser()
        olduser()


if __name__ == '__main__':
    showmenu()

            


        

    
 
     
    