#!python
# encoding=UTF-8
import os
import time


FILE_BOX=[
    ""
]
PARAM_BOX={

}




def log(func):
    def _deco():
        print "\n[%s() start. @%s]" % (func.__name__,  time.strftime("%Y-%m-%d %H:%M:%S"))
        result = func()
        print "[%s() end. @%s]" % (func.__name__,  time.strftime("%Y-%m-%d %H:%M:%S"))
        # 不需要返回func，实际上应返回原函数的返回值
        return result
    return _deco



@log
def get_params():
    """Get params from jenkins shell"""
    PARAM_BOX['PATH'] = os.getenv("PATH")
    PARAM_BOX['working_time'] = time.strftime("%Y-%m-%d %H:%M:%S")




@log
def validate_params():
    """Validate the params get from user"""
    if len(PARAM_BOX) is not 0:
        print "Params passed validation."
        return True
    else:
        print "Params is wrong, please check your params!"
        return False



@log
def generate_p4_script():
    """Generate a .bat to using for the perforce actions"""


@log
def system_run_p4_script():
    """Let system run the .bat to work with perforce"""
    os.system("echo come on ")



@log
def anlysis_logs():
    """Anlysis logs form runing , create a form to read easily ."""



def abort_process(msg="Something wrong"):
    """Abort process if error found or we stoped."""
    print "\n[PROCESS ABORTED] %s  , @%s.\n\n" % (msg,  time.strftime("%Y-%m-%d %H:%M:%S"))

def pay_attention_in_error():
    """Make a big picture to get attenion."""
    for i in range(1,10):
        print "*",
    print "ErrorTime:",time.strftime("%Y-%m-%d %H:%M:%S")
# main process








if __name__ == '__main__':
    get_params()
    if validate_params():
        generate_p4_script()
        system_run_p4_script()
        anlysis_logs()
    else:
        abort_process()


