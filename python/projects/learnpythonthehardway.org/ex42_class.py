class TheThing(object):
    def __init__(self):
        self.number = 0

    def some_fuction(self):
        print "I got called"

    def add_me_up(self, more):
        self.number +=more
        return self.number

a = TheThing()
b = TheThing()


a.some_fuction()
b.some_fuction()


print a.add_me_up(20)
print a.add_me_up(20)
print b.add_me_up(30)
print b.add_me_up(30)


print a.number
print b.number