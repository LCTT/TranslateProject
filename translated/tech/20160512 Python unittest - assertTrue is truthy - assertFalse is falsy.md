Python 单测：assertTrue 要返回真，assertFalse 要返回假
===========================

在这篇文章中，我们将介绍返回布尔值的断言单测方法 `assertTrue` 和 `assertFalse` 以及判断是什么的断言单测方法 `assertIs` 之间的区别。

### 定义

下面是目前[单测模块文档][1]中关于 `assertTrue` 和 `assertFalse` 的说明，代码进行了高亮：


>assertTrue(expr, msg=None)

>assertFalse(expr, msg=None)

>>Test that expr is true (or false).

>>Note that this is equivalent to

>>bool(expr) is True

>>and not to

>>expr is True

>>(use assertIs(expr, True) for the latter).

[Mozilla 开发者网络中定义 `真`][2] 如下：

> 在一个布尔值的上下文环境中能变成真的值

在 Python 中等价于：

```
bool(expr) is True
```

这个和 `assertTrue` 的测试目的完全匹配：

因此那篇文章中已经指出 `assertTrue` 要返回真，`assertFalse` 要返回假。这些断言方法从接受到的值构造出一个布尔值，然后判断它。同样文章中也建议我们根本不应该使用 `assertTrue` 和 `assertFalse`。

### 在应用中这是什么意思？

我们使用一个非常简单的例子 - 一个名称为 always_true 的函数，它返回 `True`。我们为它写一些测试用例，然后改变代码，看看测试用例的表现。

作为开始，我们先写两个测试用例。一个是“宽松的”：使用 `assertTrue` 来测试真的值。另外一个是“严格的”：使用文档中建议的 `assertIs` 函数。

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

下面是 func.py 中的非常简单的函数代码：

```
def always_true():
    """
    I'm always True.

    Returns:
        bool: True
    """
    return True
```

当你运行时，所有测试都通过了：

```
always_true returns True ... ok
always_true returns a truthy value ... ok

----------------------------------------------------------------------
Ran 2 tests in 0.004s

OK
```

日子过得很开心。

现在，某个人将 always_true 函数改变成下面这样：

```
def always_true():
    """
    I'm always True.

    Returns:
        bool: True
    """
    return 'True'
```

它现在是用返回字符串 "True" 来替代之前反馈的 `True` （布尔值）。（当然，那个“某人”并没有更新文档 - 后面我们会增加难度。）

这次结果并不如人意：

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

只有一个测试用例失败了！这意味着 `assertTrue` 给了我们一个假的正确性。在它不应该通过时，它通过了。很幸运的是我们第二个测试是使用 `assertIs` 来写的。

因此，跟手册上获取的信息一样，为了保证 `always_true` 的功能和更严格测试的结果保持一致，应该使用 `assertIs` 而不是 `assertTrue`。

### 使用断言的辅助方法

使用 `assertIs` 来测试返回 `True` 和 `False` 来冗长了。因此，如果你有个项目需要经常检查是否是返回了 `True` 或者 `False`，那们你可以给自己编写一些断言的辅助方法。

这好像并没有节省大量的代码，但是我个人觉得提高了代码的可读性。

```
def assertIsTrue(self, value):
    self.assertIs(value, True)

def assertIsFalse(self, value):
    self.assertIs(value, False)
```

### 总结

一般来说，我的建议是让测试越严格越好。如果你想测试 `True` 或者 `False`，听从[文档][3]的建议，使用 `assertIs`。除非不得已，否则不要使用 `assertTrue` 和 `assertFalse`。

如果你面对的是一个可以返回多种类型的函数，例如，有时候返回布尔值，有时候返回整数，那么考虑重构它。这是代码的异味。在 Python 中， 抛出一个异常比使用 `False` 表示错误更好。

此外，如果你确实想使用断言来判断函数的返回值是否是真，可能还存在第二个代码异味 - 代码是正确封装了吗？如果 `assertTrue` 和 `assertFalse` 是根据正确的 `if` 语句来执行，那么值得检查下你是否把所有你想要的东西都封装在合适的位置。也许这些 `if` 语句应该封装在测试的函数中。

愉快地测试！



--------------------------------------------------------------------------------

via: http://jamescooke.info/python-unittest-asserttrue-is-truthy-assertfalse-is-falsy.html

作者：[James Cooke][a]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://jamescooke.info/pages/hello-my-name-is-james.html
[1]:https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertTrue
[2]:https://developer.mozilla.org/en-US/docs/Glossary/Truthy
[3]:https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertTrue
