def get_text(name):
   return "lorem ipsum, {0} dolor sit amet".format(name)

def p_decorate(func):
   def func_wrapper(name):
       return "<p>{0}</p>".format(func(name))
   return func_wrapper

my_get_text = p_decorate(get_text)

print my_get_text("John")

# <p>Outputs lorem ipsum, John dolor sit amet</p>


# Try =====


def get_name(name):
    return "hi {0}".format(name)


def my_decorate(func):
    def func_wrapper(name):
        return "me me me {0} me me me".format(func(name))
    return func_wrapper

my_get_name = my_decorate(get_name)

print my_get_name("lilili")
