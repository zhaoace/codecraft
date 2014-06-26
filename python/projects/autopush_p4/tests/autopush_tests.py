from nose.tools import *
from autopush.autopush import *
import os

import time


CMD_SUCCESS = 0

def test_must_pass():
    assert_equal(True, validate_pass())


def test_must_fail():
    assert_equal(False, validate_fail())


def test_get_params():
    os.environ["p4_user"] =  "p4_user"
    result = os.getenv("p4_user")
    assert_equal(result , "p4_user")

def test_validate_params():
    os.environ['p4user'] = "p4user"
    os.environ['changelist'] = "changelist"
    os.environ['integrate_from'] = "integrate_from"
    os.environ['integrate_to'] = "integrate_to"
    os.environ['push_requester'] = "push_requester"
    os.environ['push_reason'] = "push_reason"
    get_params()
    assert  validate_params()

def test_generate_p4_script():
    generate_p4_script()
    assert os.path.exists(FILE_BOX[0])


def test_system_run_p4_script():
    result = system_run_p4_script()
    assert_equal(result, CMD_SUCCESS)
    assert True