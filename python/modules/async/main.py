import time
import functools
import threading


def async(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        my_thread = threading.Thread(target=func, args=args, kwargs=kwargs)
        my_thread.start()
    return wrapper


@async
def foo(x,y):
    c = 0
    while c < 5:
        c = c + 1
    print '\n',x,y
    time.sleep(3)
    print '---'


foo(456,789)
foo(123,y=345)
foo(333,y=2)
foo(444,y=1)
foo(990,y=3)
