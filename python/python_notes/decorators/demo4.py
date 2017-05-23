def compose_greet_func():
    def get_message():
        return "Hello there!"

    return get_message

greet = compose_greet_func()
print greet()

# Outputs: Hello there!




def get_a_message_function():
    def get_message():
        return "hi message!"
    return get_message


message = get_a_message_function()
print message()
