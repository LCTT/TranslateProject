[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to mutation testing in Python)
[#]: via: (https://opensource.com/article/20/7/mutmut-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

An introduction to mutation testing in Python
======
Turn invisible bugs into visible fixes with mutation testing.
![Searching for code][1]

You have tests for everything; maybe you even have a badge in your project repository stating 100% test coverage. But what are these tests helping you do? How do you know?

The _costs_ of unit tests are clear to developers. Tests have to be written. Occasionally they don't work as intended: there are false alarms or flapping tests that alternate success and failure without any code changes. The small bugs you can find through unit tests are valuable, but often they happen quietly on a developer machine and are fixed before a commit ever goes into version control. But the truly alarming bugs are mostly invisible. And the worst of all, the _missing alarms_ are completely invisible: you don't see the bugs you failed to catch until the code gets into a user's hands—and sometimes not even then.

There is one type of test that makes it possible to make the invisible visible: [mutation testing][2].

Mutation testing algorithmically modifies source code and checks if any "mutants" survived each test. Any mutant that survives the unit test is a problem: it means that a modification to the code, likely introducing a bug, was not caught by the standard test suite.

One framework for mutation testing in [Python][3] is `mutmut`.

Imagine you need to write code that calculates the angle between the hour hand and the minute hand in an analog clock to the nearest degree. The code might look something like:


```
def hours_hand(hour, minutes):
    base = (hour % 12 ) * (360 // 12)
    correction = int((minutes / 60) * (360 // 12))
    return base + correction

def minutes_hand(hour, minutes):
    return minutes * (360 // 60)

def between(hour, minutes):
    return abs(hours_hand(hour, minutes) - minutes_hand(hour, minutes))
```

To begin, write a simple unit test:


```
import angle

def test_twelve():
    assert angle.between(12, 00) == 0
```

Is this enough? The code has no `if` statement, so if you check coverage:


```
$ coverage run `which pytest`
============================= test session starts ==============================
platform linux -- Python 3.8.3, pytest-5.4.3, py-1.8.2, pluggy-0.13.1
rootdir: /home/moshez/src/mut-mut-test
collected 1 item                                                              

tests/test_angle.py .                                                    [100%]

============================== 1 passed in 0.01s ===============================
```

Perfect! The tests pass, and coverage is at 100%. Testing expert, you are. But what does that coverage look like when you use mutation testing?


```
$ mutmut run --paths-to-mutate angle.py
&lt;snip&gt;
Legend for output:
🎉 Killed mutants.   The goal is for everything to end up in this bucket.
⏰ Timeout.          Test suite took 10 times as long as the baseline so were killed.
🤔 Suspicious.       Tests took a long time, but not long enough to be fatal.
🙁 Survived.         This means your tests needs to be expanded.
🔇 Skipped.          Skipped.
&lt;snip&gt;
⠋ 21/21  🎉 5  ⏰ 0  🤔 0  🙁 16  🔇 0
```

Oh no. Out of 21 mutants, 16 survived. Only five cases passed the mutation testing. But what does that mean?

For each mutation test, `mutmut` modified portions of your source code that simulates potential bugs. An example of a modification is changing a `>` comparison to `>=` to see what happens. If there is no unit test for this boundary condition, this mutation will "survive": this is a potential bug that none of the tests will detect.

It's time to write better unit tests. It is easy to check which changes were made with `results`:


```
$ mutmut results
&lt;snip&gt;
Survived 🙁 (16)

\---- angle.py (16) ----

4-7, 9-14, 16-21
$ mutmut apply 4
$ git diff
diff --git a/angle.py b/angle.py
index b5dca41..3939353 100644
\--- a/angle.py
+++ b/angle.py
@@ -1,6 +1,6 @@
 def hours_hand(hour, minutes):
     hour = hour % 12
\-    base = hour * (360 // 12)
\+    base = hour / (360 // 12)
     correction = int((minutes / 60) * (360 // 12))
     return base + correction
```

This is a typical example of a mutation `mutmut` performs; it analyzes the source code and changes operators to different operators: addition to subtraction or, in this case, multiplication to division. Unit tests, generally speaking, should catch bugs when an operator changes; otherwise, they are not testing the behavior effectively. Following this logic, `mutmut` twiddles through source code to double-check your tests.

You can use `mutmut apply` to apply a failed mutant. Wow, it turns out you barely checked whether the `hour` parameter was used correctly. Fix that:


```
$ git diff
diff --git a/tests/test_angle.py b/tests/test_angle.py
index f51d43a..1a2e4df 100644
\--- a/tests/test_angle.py
+++ b/tests/test_angle.py
@@ -2,3 +2,6 @@ import angle
 
 def test_twelve():
     assert angle.between(12, 00) == 0
+
+def test_three():
\+    assert angle.between(3, 00) == 90
```

Previously, you tested only for 12. Will adding a test for three be enough to improve?


```
$ mutmut run --paths-to-mutate angle.py
&lt;snip&gt;
⠋ 21/21  🎉 7  ⏰ 0  🤔 0  🙁 14  🔇 0
```

This new test managed to kill two of the mutants—better than before, but still a long way to go. I won't work through each of the 14 cases left to fix, because I think the pattern is clear. (Can you get them down to zero?)

Mutation testing is another tool, along with coverage measurement, that allows you to see how comprehensive your test suite is. Using it makes the case that tests need to be improved: any one of those surviving mutants is a mistake a human being can make while fat-fingering code, as well as a potential bug creeping into your program. Keep testing and happy hunting.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mutmut-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
[3]: https://opensource.com/resources/python
