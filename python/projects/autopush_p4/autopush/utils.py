import time
import os

def get_nowtime():
    p4_operat_time = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
    print p4_operat_time
    return p4_operat_time