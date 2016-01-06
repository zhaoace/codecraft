import time
import functools
import threading


def async(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        my_thread = threading.Thread(target=func, args=args, kwargs=kwargs)
        my_thread.start()
    return wrapper


timer = 0
flag = True
signal = True

@async
def foo(caller, sleep_time):
    global flag, singal, timer
    while(signal):
        print "caller={0} , flag={1} ".format(caller, flag)
        time.sleep(sleep_time)
        flag = not flag

foo("lzhao", 3)
foo("txiao", 7)


time.sleep(10)
signal = False
