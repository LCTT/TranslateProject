Perform robust unit tests with PyHamcrest
使用 PyHamcrest 执行健壮的单元测试
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

在[测试金字塔][1]的底部是单元测试。单元测试每次只测试一个代码单元，通常是一个函数或方法。

通常，设计单个单元测试是为了测试通过函数或特定分支选择的特定流，这使得失败的单元测试和导致失败的 bug 之间的映射变得容易。

理想情况下，单元测试使用很少或不使用外部资源，从而隔离它们并使它们更快。

_好_ 测试通过尽早发现 bug 并加快测试速度来提高开发人员的工作效率。_坏_ 测试降低了开发人员的工作效率。

单元测试套件通过在开发过程的早期发现问题来帮助维护高质量的产品。有效的单元测试在代码离开开发人员机器之前捕获 bug，或者至少在特定分支上的持续集成环境中捕获 bug。这标志着好的和坏的单元测试之间的区别：好的测试通过尽早捕获 bug 并使测试更快来提高开发人员的生产力。坏的测试降低了开发人员的工作效率。

当测试 _附带的特性_ 时，生产率通常会降低。当代码更改时测试失败，即时它仍然是正确的。发生这种情况是因为输出不同，但在某种程度上它不是函数契约的一部分。

因此，一个好的单元测试可以帮助执行函数所提交的契约。

如果单元测试中断，那意味着契约被违反了，应该明确修改（通过更改文档和测试），或者被修复（通过修复代码并保持测试不变）。

虽然将测试限制为只执行公共契约是一项需要学习的复杂技能，但有一些工具可以提供帮助。

其中一个工具是 [Hamcrest][2]，一个用于编写断言的框架。最初是为基于 Java 的单元测试而发明的，它现在支持多种语言，包括 [Python][3]。

Hamcrest 旨在使测试断言更容易编写和更精确。

```
def add(a, b):
    return a + b

from hamcrest import assert_that, equal_to

def test_add():
    assert_that(add(2, 2), equal_to(4))  
```

这是一个用于简单功能的断言。如果我们想要断言更复杂的怎么办？
```
def test_set_removal():
    my_set = {1, 2, 3, 4}
    my_set.remove(3)
    assert_that(my_set, contains_inanyorder([1, 2, 4]))
    assert_that(my_set, is_not(has_item(3)))
```

注意，我们可以简单地断言结果的顺序为 `1`, `2` 和 `4`，因为集合不保证顺序。

我们也可以很容易用 `is_not` 来否定断言。这有助于我们编写 _精确的断言_，使我们能够把自己限制在执行职能的公共契约方面。

然而，有时候，内置功能都不是我们 _真正_ 需要的。在这些情况下，Hamcrest 允许我们编写自己的匹配器。

想象一下以下功能：
```
def scale_one(a, b):
    scale = random.randint(0, 5)
    pick = random.choice([a,b])
    return scale * pick
```

我们可以自信地断言结果均匀地划分为至少一个输入。（to 校正：？？？什么意思）

匹配器继承自 `hamcrest.core.base_matcher.BaseMatcher`，重写两个方法：
```
class DivisibleBy(hamcrest.core.base_matcher.BaseMatcher):
    def __init__(self, factor):
        self.factor = factor

    def _matches(self, item):
        return (item % self.factor) == 0

    def describe_to(self, description):
        description.append_text('number divisible by')
        description.append_text(repr(self.factor))
```

编写高质量的 `describe_to` 方法很重要，因为这是测试失败时显示的消息的一部分。
```
def divisible_by(num):
    return DivisibleBy(num)
```

按照惯例，我们将匹配器包装在一个函数中。有时这给了我们进一步处理输入的机会，但在这种情况下，我们不需要进一步处理。
```
def test_scale():
    result = scale_one(3, 7)
    assert_that(result,
                any_of(divisible_by(3),
                divisible_by(7)))
```

请注意，我们将 `divisible_by` 匹配器与内置的 `any_of` 匹配器结合起来，以确保我们只测试函数提交的内容。

在编辑这篇文章时，我听到一个传言，“Hamcrest” 这个名字被认为是 “matches” 的字谜。人力资源管理...
```
>>> assert_that("matches", contains_inanyorder(*"hamcrest")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/moshez/src/devops-python/build/devops/lib/python3.6/site-packages/hamcrest/core/assert_that.py", line 43, in assert_that
    _assert_match(actual=arg1, matcher=arg2, reason=arg3)
  File "/home/moshez/src/devops-python/build/devops/lib/python3.6/site-packages/hamcrest/core/assert_that.py", line 57, in _assert_match
    raise AssertionError(description)
AssertionError:
Expected: a sequence over ['h', 'a', 'm', 'c', 'r', 'e', 's', 't'] in any order
      but: no item matches: 'r' in ['m', 'a', 't', 'c', 'h', 'e', 's']
```

经过进一步的研究，我找到了谣言的来源：它是 “matchers” 的字谜。
```
>>> assert_that("matchers", contains_inanyorder(*"hamcrest"))
>>>
```

如果你还没有为你的 Python 代码编写单元测试，那么现在是开始的好时机。如果你正在为你的 Python 代码编写单元测试，那么使用 Hamcrest 将允许你使你的断言更加 _精确_，既不会比你想要测试的多也不会少。这将在修改代码时减少误报，并减少修改工作代码的测试所花费的时间。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/robust-unit-tests-hamcrest

作者：[Moshe Zadka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/moshez
[1]:https://martinfowler.com/bliki/TestPyramid.html
[2]:http://hamcrest.org/
[3]:https://www.python.org/
