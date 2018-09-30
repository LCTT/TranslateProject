Perform robust unit tests with PyHamcrest
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

At the base of the [testing pyramid][1] are unit tests. Unit tests test one unit of code at a time—usually one function or method.

Often, a single unit test is designed to test one particular flow through a function, or a specific branch choice. This enables easy mapping of a unit test that fails and the bug that made it fail.

Ideally, unit tests use few or no external resources, isolating them and making them faster.

_Good_ tests increase developer productivity by catching bugs early and making testing faster. _Bad_ tests decrease developer productivity.

Unit test suites help maintain high-quality products by signaling problems early in the development process. An effective unit test catches bugs before the code has left the developer machine, or at least in a continuous integration environment on a dedicated branch. This marks the difference between good and bad unit tests:tests increase developer productivity by catching bugs early and making testing faster.tests decrease developer productivity.

Productivity usually decreases when testing _incidental features_. The test fails when the code changes, even if it is still correct. This happens because the output is different, but in a way that is not part of the function's contract.

A good unit test, therefore, is one that helps enforce the contract to which the function is committed.

If a unit test breaks, the contract is violated and should be either explicitly amended (by changing the documentation and tests), or fixed (by fixing the code and leaving the tests as is).

While limiting tests to enforce only the public contract is a complicated skill to learn, there are tools that can help.

One of these tools is [Hamcrest][2], a framework for writing assertions. Originally invented for Java-based unit tests, today the Hamcrest framework supports several languages, including [Python][3].

Hamcrest is designed to make test assertions easier to write and more precise.
```
def add(a, b):

    return a + b



from hamcrest import assert_that, equal_to



def test_add():

    assert_that(add(2, 2), equal_to(4))  

```

This is a simple assertion, for simple functionality. What if we wanted to assert something more complicated?
```
def test_set_removal():

    my_set = {1, 2, 3, 4}

    my_set.remove(3)

    assert_that(my_set, contains_inanyorder([1, 2, 4]))

    assert_that(my_set, is_not(has_item(3)))

```

Note that we can succinctly assert that the result has `1`, `2`, and `4` in any order since sets do not guarantee order.

We also easily negate assertions with `is_not`. This helps us write _precise assertions_ , which allow us to limit ourselves to enforcing public contracts of functions.

Sometimes, however, none of the built-in functionality is _precisely_ what we need. In those cases, Hamcrest allows us to write our own matchers.

Imagine the following function:
```
def scale_one(a, b):

    scale = random.randint(0, 5)

    pick = random.choice([a,b])

    return scale * pick

```

We can confidently assert that the result divides into at least one of the inputs evenly.

A matcher inherits from `hamcrest.core.base_matcher.BaseMatcher`, and overrides two methods:
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

Writing high-quality `describe_to` methods is important, since this is part of the message that will show up if the test fails.
```
def divisible_by(num):

    return DivisibleBy(num)

```

By convention, we wrap matchers in a function. Sometimes this gives us a chance to further process the inputs, but in this case, no further processing is needed.
```
def test_scale():

    result = scale_one(3, 7)

    assert_that(result,

                any_of(divisible_by(3),

                       divisible_by(7)))

```

Note that we combined our `divisible_by` matcher with the built-in `any_of` matcher to ensure that we test only what the contract commits to.

While editing this article, I heard a rumor that the name "Hamcrest" was chosen as an anagram for "matches". Hrm...
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

Researching more, I found the source of the rumor: It is an anagram for "matchers".
```
>>> assert_that("matchers", contains_inanyorder(*"hamcrest"))

>>>

```

If you are not yet writing unit tests for your Python code, now is a good time to start. If you are writing unit tests for your Python code, using Hamcrest will allow you to make your assertion _precise_ —neither more nor less than what you intend to test. This will lead to fewer false positives when modifying code and less time spent modifying tests for working code.

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
