def compose_greet_func(name):
    def get_message():
        return "Hello there "+name+"!"

    return get_message

greet = compose_greet_func("John")
print greet()

# Outputs: Hello there John!


def outer_func(name):
    def hi_name():
        return 'hi ! ' + name +' ...'
    return hi_name


message  = outer_func("li")
print message()

print outer_func("lililili")()
