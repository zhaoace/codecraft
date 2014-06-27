import time
import os



def write_to(FILE_BOX, filename, file_content):
    filename = str(len(FILE_BOX)) + "_"+ filename
    FILE_BOX.append(filename)
    file_handle = open(filename, 'w')
    file_handle.write(file_content)
    file_handle.close()
    print FILE_BOX

def debug_init_env():
    os.environ['p4_workspace'] = "autopush_i015571_PVGD50798664A"
    os.environ['p4user'] = "i015571"
    os.environ['changelist'] = "@6487551"
    os.environ['integrate_from'] = "4.0/REL"
    os.environ['integrate_to'] = "trunk/feat_arch"
    os.environ['push_requester'] = "zhao , li"
    os.environ['push_reason'] = "testing autopush "
    os.environ['p4_task_id'] = "jira-250"
    os.environ['p4_reviewed_by'] = "Zhao, Li"
    os.environ['p4_action'] = "add"
    os.environ['do_submmit'] = "no"