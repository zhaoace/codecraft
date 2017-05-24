import datetime
from functools import wraps

def timer(func):
    @wraps(func)
    def func_wrapper(*args, **kwargs):
        start_at = datetime.datetime.now()

        result = func(*args, **kwargs)

        end_at = datetime.datetime.now()
        time_cost = end_at - start_at
        return result , time_cost
    return func_wrapper


if __name__ == '__main__':

    @timer
    def hello(name):
        return "hello " + name


    print hello('li')
