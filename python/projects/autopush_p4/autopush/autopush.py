#!python
# encoding=UTF-8
import os
import time
import utils


# debug = True


FILE_BOX=[]
PARAM_BOX={ 'do_submmit':"no"}

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
    PARAM_BOX['do_submmit']    =     os.getenv("do_submmit")


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


def debug_add_p4login(bat_contant):
    if debug:
        p4login = open("p4login.bat","r")
        p4login_content = p4login.read()
        return p4login_content + bat_contant
    else:
        return bat_contant


def create_changelist_txt_for_checkin():
    pending_list_txt_content = """Change: new
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
    utils.write_to(FILE_BOX, "pending_list.txt", pending_list_txt_content)





def create_pendinglist_on_p4():
    create_changelist_txt_for_checkin()
    run_p4_create_pendinglist_bat_content = """echo Create a changelist for push using.
p4 change -i < %s
""" % FILE_BOX[-1]
    run_p4_create_pendinglist_bat_content = debug_add_p4login(run_p4_create_pendinglist_bat_content)
    utils.write_to(FILE_BOX, "run_p4_create_pendinglist.bat", run_p4_create_pendinglist_bat_content)
    os.system(FILE_BOX[-1])

    get_pendinglist_id_txt = "%s_get_pendinglist_id.txt" % len(FILE_BOX)
    FILE_BOX.append(get_pendinglist_id_txt)
    run_p4_get_pendinglist_id_content = 'p4 changes -m 1 -c %s -s pending > %s' % (PARAM_BOX["p4_workspace"] , get_pendinglist_id_txt)
    run_p4_get_pendinglist_id_content = debug_add_p4login(run_p4_get_pendinglist_id_content)
    utils.write_to(FILE_BOX, "run_p4_get_pendinglist_id.bat", run_p4_get_pendinglist_id_content)
    os.system(FILE_BOX[-1])

    p4_response_for_get_pendinglist = open(FILE_BOX[-2]).read() #read %s_get_pendinglist_id.txt and get the pending list id
    pendinglist_id = p4_response_for_get_pendinglist.split()[1]
    PARAM_BOX["pendinglist_id"] = pendinglist_id
    print "pendinglist_id is", PARAM_BOX["pendinglist_id"]




@log
def integrate_procss_on_p4():
    """Create scripte and run it. """
    run_p4_integrate_content = "echo integrate_procss_on_p4()\n"

    for part in PARAM_BOX['parts']:
        from_path = "//components/%s/%s/..."% (part, PARAM_BOX["branch_from"])
        to_path = "//components/%s/%s/..."% (part, PARAM_BOX["branch_to"])
        p4_operation = "\np4 integrate  -v -d -i -c %s %s%s  %s" % (PARAM_BOX["pendinglist_id"],from_path,PARAM_BOX["p4_changelist"],to_path)
        run_p4_integrate_content  += p4_operation
        # p4_operation = "p4 integrate  -v -d -i -c #{pendinglist} #{from}#{p4_changelist}  #{to}" % (PARAM_BOX["branch_to"],PARAM_BOX["branch_to"],PARAM_BOX["branch_to"],PARAM_BOX["branch_to"], ,)
        print "[p4_operation > ]", p4_operation

    run_p4_integrate_content += "\n p4 resolve -as -dl -c %s" % PARAM_BOX["pendinglist_id"]

    if  PARAM_BOX["do_submmit"].lower() != "no" :
        run_p4_integrate_content += "\n p4 submit -c %s "  % PARAM_BOX["pendinglist_id"]
    run_p4_integrate_content = debug_add_p4login(run_p4_integrate_content)
    utils.write_to(FILE_BOX, "run_p4_integrate.bat", run_p4_integrate_content)
    os.system(FILE_BOX[-1])




@log
def anlysis_logs():
    """Anlysis logs form runing , create a form to read easily ."""


def abort_process(msg="Something wrong"):
    """Abort process if error found or we stoped."""
    print "\n[PROCESS ABORTED] %s  , @%s.\n\n" % (msg,  time.strftime("%Y-%m-%d %H:%M:%S"))



# main process
if __name__ == '__main__':
    if debug:
        debug_init_env()

    get_params()
    if validate_params():
        create_pendinglist_on_p4()
        integrate_procss_on_p4()
        anlysis_logs()
    else:
        abort_process()


