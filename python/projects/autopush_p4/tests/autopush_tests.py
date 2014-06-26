from nose.tools import *
from autopush import autopush



def test_get_nowtime():
    result = autopush.get_nowtime()
    assert result is not None


# def test_must_fail():
#      assert_equal(False, True)


