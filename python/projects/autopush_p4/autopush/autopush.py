#!python
# encoding=UTF-8
import os
import time
import utils


FILE_BOX=[
"1_run_p4.bat"
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
    PARAM_BOX['p4_user']        =     os.getenv("p4user")
    PARAM_BOX['p4_changelist']  =     os.getenv("changelist")
    PARAM_BOX['branch_from']    =     os.getenv("integrate_from")
    PARAM_BOX['branch_to']      =     os.getenv("integrate_to")
    PARAM_BOX['push_requester'] =     os.getenv("push_requester")
    PARAM_BOX['push_reason']    =     os.getenv("push_reason")
    PARAM_BOX['parts']    =     ["sap.viz.sdk", "sap.viz.chart", "sap.viz.api", "sap.viz.extension", "sap.viz", "sap.viz.geo", "sap.viz.controls"]


def validate_fail(reason=""):
    print "Params is wrong, please check your params : \t%s !" % reason
    # raise "Params is wrong, please check your params %s!" % reason
    return False


def validate_pass():
    print "Params passed validation."
    return True


@log
def validate_params():
    """Validate the params get from user"""
    if len(PARAM_BOX) is not 0:
        for param_name in  sorted(PARAM_BOX.keys()):
            if PARAM_BOX[param_name] is not None:
                print param_name , "  " , PARAM_BOX[param_name] , " ."
                pass
            else:
                return validate_fail(param_name)

        return validate_pass()
    else:
        return validate_fail("PARAM_BOX is empty, please set your params.")


@log
def generate_p4_script():
    """Generate a .bat to using for the perforce actions"""
    p4_run_content = "echo generate_p4_script()"
    utils.write_to(FILE_BOX[0], p4_run_content)


@log
def system_run_p4_script():
    """Let system run the .bat to work with perforce"""
    return os.system(FILE_BOX[0])


@log
def anlysis_logs():
    """Anlysis logs form runing , create a form to read easily ."""



def abort_process(msg="Something wrong"):
    """Abort process if error found or we stoped."""
    print "\n[PROCESS ABORTED] %s  , @%s.\n\n" % (msg,  time.strftime("%Y-%m-%d %H:%M:%S"))



def debug_init_env():
    os.environ['p4user'] = "p4user"
    os.environ['changelist'] = "changelist"
    os.environ['integrate_from'] = "integrate_from"
    os.environ['integrate_to'] = "integrate_to"
    os.environ['push_requester'] = "push_requester"
    os.environ['push_reason'] = "push_reason"

# main process
if __name__ == '__main__':

    debug = True
    if debug:
        debug_init_env()

    get_params()
    if validate_params():
        generate_p4_script()
        system_run_p4_script()
        anlysis_logs()
    else:
        abort_process()


