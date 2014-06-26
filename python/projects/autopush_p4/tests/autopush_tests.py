from nose.tools import *
from autopush import autopush

import time



def test_get_nowtime():
    result = autopush.get_nowtime()
    time.sleep(60)
    assert result is not None


# def test_must_fail():
#     assert_equal(False, True)


