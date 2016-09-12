Translating by cposture
Python unittest: assertTrue is truthy, assertFalse is falsy
===========================

In this post, I explore the differences between the unittest boolean assert methods assertTrue and assertFalse and the assertIs identity assertion.

### Definitions

Here’s what the [unittest module documentation][1] currently notes about assertTrue and assertFalse, with the appropriate code highlighted:


>assertTrue(expr, msg=None)

>assertFalse(expr, msg=None)

>>Test that expr is true (or false).

>>Note that this is equivalent to

>>bool(expr) is True

>>and not to

>>expr is True

>>(use assertIs(expr, True) for the latter).

[Mozilla Developer Network defines truthy][2] as:

> A value that translates to true when evaluated in a Boolean context.
In Python this is equivalent to:

```
bool(expr) is True
```

Which exactly matches what assertTrue is testing for.

Therefore the documentation already indicates assertTrue is truthy and assertFalse is falsy. These assertion methods are creating a bool from the received value and then evaluating it. It also suggests that we really shouldn’t use assertTrue or assertFalse for very much at all.

### What does this mean in practice?

Let’s use a very simple example - a function called always_true that returns True. We’ll write the tests for it and then make changes to the code and see how the tests perform.

Starting with the tests, we’ll have two tests. One is “loose”, using assertTrue to test for a truthy value. The other is “strict” using assertIs as recommended by the documentation:

```
import unittest

from func import always_true


class TestAlwaysTrue(unittest.TestCase):

    def test_assertTrue(self):
        """
        always_true returns a truthy value
        """
        result = always_true()

        self.assertTrue(result)

    def test_assertIs(self):
        """
        always_true returns True
        """
        result = always_true()

        self.assertIs(result, True)
```

Here’s the code for our simple function in func.py:

```
def always_true():
    """
    I'm always True.

    Returns:
        bool: True
    """
    return True
```

When run, everything passes:

```
always_true returns True ... ok
always_true returns a truthy value ... ok

----------------------------------------------------------------------
Ran 2 tests in 0.004s

OK
```

Happy days!

Now, “someone” changes always_true to the following:

```
def always_true():
    """
    I'm always True.

    Returns:
        bool: True
    """
    return 'True'
```

Instead of returning True (boolean), it’s now returning string 'True'. (Of course this “someone” hasn’t updated the docstring - we’ll raise a ticket later.)

This time the result is not so happy:

```
always_true returns True ... FAIL
always_true returns a truthy value ... ok

======================================================================
FAIL: always_true returns True
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/assertttt/test.py", line 22, in test_is_true
    self.assertIs(result, True)
AssertionError: 'True' is not True

----------------------------------------------------------------------
Ran 2 tests in 0.004s

FAILED (failures=1)
```

Only one test failed! This means assertTrue gave us a false-positive. It passed when it shouldn’t have. It’s lucky we wrote the second test with assertIs.

Therefore, just as we learned from the manual, to keep the functionality of always_true pinned tightly the stricter assertIs should be used rather than assertTrue.

### Use assertion helpers

Writing out assertIs to test for True and False values is not too lengthy. However, if you have a project in which you often need to check that values are exactly True or exactly False, then you can make yourself the assertIsTrue and assertIsFalse assertion helpers.

This doesn’t save a particularly large amount of code, but it does improve readability in my opinion.

```
def assertIsTrue(self, value):
    self.assertIs(value, True)

def assertIsFalse(self, value):
    self.assertIs(value, False)
```

### Summary

In general, my recommendation is to keep tests as tight as possible. If you mean to test for the exact value True or False, then follow the [documentation][3] and use assertIs. Do not use assertTrue or assertFalse unless you really have to.

If you are looking at a function that can return various types, for example, sometimes bool sometimes int, then consider refactoring. This is a code smell and in Python, that False value for an error would probably be better raised as an exception.

In addition, if you really need to assert the return value from a function under test is truthy, there might be a second code smell - is your code correctly encapsulated? If assertTrue and assertFalse are asserting that function return values will trigger if statements correctly, then it might be worth sense-checking you’ve encapsulated everything you intended in the appropriate place. Maybe those if statements should be encapsulated within the function under test.

Happy testing!



--------------------------------------------------------------------------------

via: http://jamescooke.info/python-unittest-asserttrue-is-truthy-assertfalse-is-falsy.html

作者：[James Cooke][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://jamescooke.info/pages/hello-my-name-is-james.html
[1]:https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertTrue
[2]:https://developer.mozilla.org/en-US/docs/Glossary/Truthy
[3]:https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertTrue
