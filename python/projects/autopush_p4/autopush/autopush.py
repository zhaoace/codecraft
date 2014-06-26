#!python
# encoding=UTF-8
import os
import time
import utils


FILE_BOX=[]
PARAM_BOX={}

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
    PARAM_BOX['p4_operat_time'] = time.strftime("%Y-%m-%d %H:%M:%S")
    PARAM_BOX['p4_user']        =     os.getenv("p4user")
    PARAM_BOX['p4_changelist']  =     os.getenv("changelist")
    PARAM_BOX['branch_from']    =     os.getenv("integrate_from")
    PARAM_BOX['branch_to']      =     os.getenv("integrate_to")
    PARAM_BOX['push_requester'] =     os.getenv("push_requester")
    PARAM_BOX['push_reason']    =     os.getenv("push_reason")
    PARAM_BOX['parts']    =     ["sap.viz.sdk", "sap.viz.chart", "sap.viz.api", "sap.viz.extension", "sap.viz", "sap.viz.geo", "sap.viz.controls"]
    PARAM_BOX['p4_workspace']    =     os.getenv("p4_workspace")
    PARAM_BOX['p4_task_id']    =     os.getenv("p4_task_id")
    PARAM_BOX['p4_reviewed_by']    =     os.getenv("p4_reviewed_by")
    PARAM_BOX['p4_action']    =     os.getenv("p4_action")


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



def generate_pendinglist():
    pending_list_content = """Change: new
Client: %s
User: %s
Status: new
Description:
    ==Summary*: Integrate from %s %s @%s .
    Push request by %s.
    Push for %s.
    ==Reviewed by*: %s
    ==Task*: %s
    ==Action*:%s
        """ % ( PARAM_BOX['p4_workspace'], PARAM_BOX['p4_user'], PARAM_BOX['branch_from'],
                    PARAM_BOX['p4_changelist'], PARAM_BOX['p4_operat_time'], PARAM_BOX['push_requester'],
                    PARAM_BOX['push_reason'], PARAM_BOX['p4_reviewed_by'], PARAM_BOX['p4_task_id'],
                    PARAM_BOX['p4_action']   )
    utils.write_to(FILE_BOX, "pending_list.txt", pending_list_content)


@log
def generate_p4_script():
    """Generate a .bat to using for the perforce actions"""
    generate_pendinglist()

    p4_run_content = "echo generate_p4_script(111)"
    for part in PARAM_BOX['parts']:
        print "[part > ]", part
    utils.write_to(FILE_BOX, "run_p4.bat", p4_run_content)
    p4_run_content = "echo generate_p4_script(222)"
    utils.write_to(FILE_BOX, "run_p4_2.bat", p4_run_content)




@log
def system_run_p4_script():
    """Let system run the .bat to work with perforce"""
    CMD_SUCCESS = 0
    CMD_FAIL = -1
    print FILE_BOX
    for filename in FILE_BOX:
        if  ".bat" in filename :
            print filename  , "is batch."
            if os.system(filename) != CMD_SUCCESS:
                return CMD_FAIL;
        else:
            print filename  , "is not batch."
    return CMD_SUCCESS



@log
def anlysis_logs():
    """Anlysis logs form runing , create a form to read easily ."""



def abort_process(msg="Something wrong"):
    """Abort process if error found or we stoped."""
    print "\n[PROCESS ABORTED] %s  , @%s.\n\n" % (msg,  time.strftime("%Y-%m-%d %H:%M:%S"))



def debug_init_env():
    os.environ['p4_workspace'] = "DEBUG_P4_WORKSPACE"
    os.environ['p4user'] = "DEBUG_P4USER"
    os.environ['changelist'] = "DEBUG_CHANGELIST"
    os.environ['integrate_from'] = "DEBUG_INTEGRATE_FROM"
    os.environ['integrate_to'] = "DEBUG_INTEGRATE_TO"
    os.environ['push_requester'] = "DEBUG_PUSH_REQUESTER"
    os.environ['push_reason'] = "DEBUG_PUSH_REASON"
    os.environ['p4_task_id'] = "DEBUG_P4_TASK_ID"
    os.environ['p4_reviewed_by'] = "DEBUG_P4_REVIEWED_BY"
    os.environ['p4_action'] = "DEBUG_P4_ACTION"

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


    # if debug:
    #     for filename in FILE_BOX:
    #         os.remove(filename)


