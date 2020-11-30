[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12871-1.html)
[#]: subject: (An introduction to mutation testing in Python)
[#]: via: (https://opensource.com/article/20/7/mutmut-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Python 突变测试介绍
======

> 通过突变测试来修复未知的 bug。

![](https://img.linux.net.cn/data/attachment/album/202011/29/230106ie9xc89dj3jx1yj9.jpg)

你一定对所有内容都进行了测试，也许你甚至在项目仓库中有一个徽章，标明有 100% 的测试覆盖率，但是这些测试真的帮到你了吗？你怎么知道的？

开发人员很清楚单元测试的*成本*。测试必须要编写。有时它们无法按照预期工作：存在假告警或者抖动测试。在不更改任何代码的情况下有时成功，有时失败。通过单元测试发现的小问题很有价值，但是通常它们悄无声息的出现在开发人员的机器上，并且在提交到版本控制之前就已得到修复。但真正令人担忧的问题大多是看不见的。最糟糕的是，*丢失的告警*是完全不可见的：你看不到没能捕获的错误，直到出现在用户手上 —— 有时甚至连用户都看不到。

有一种测试可以使不可见的错误变为可见：<ruby>[突变测试][2]<rt>mutation testing</rt></ruby>。

变异测试通过算法修改源代码，并检查每次测试是否都有“变异体”存活。任何在单元测试中幸存下来的变异体都是问题：这意味着对代码的修改（可能会引入错误）没有被标准测试套件捕获。

[Python][3] 中用于突变测试的一个框架是 `mutmut`。

假设你需要编写代码来计算钟表中时针和分针之间的角度，直到最接近的度数，代码可能会这样写：

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

首先，写一个简单的单元测试：

```
import angle

def test_twelve():
    assert angle.between(12, 00) == 0
```

足够了吗？代码没有 `if` 语句，所以如果你查看覆盖率：

```
$ coverage run `which pytest`
============================= test session starts ==============================
platform linux -- Python 3.8.3, pytest-5.4.3, py-1.8.2, pluggy-0.13.1
rootdir: /home/moshez/src/mut-mut-test
collected 1 item                                                              

tests/test_angle.py .                                                    [100%]

============================== 1 passed in 0.01s ===============================
```

完美！测试通过，覆盖率为 100%，你真的是一个测试专家。但是，当你使用突变测试时，覆盖率会变成多少？

```
$ mutmut run --paths-to-mutate angle.py
<snip>
Legend for output:
🎉 Killed mutants.   The goal is for everything to end up in this bucket.
⏰ Timeout.          Test suite took 10 times as long as the baseline so were killed.
🤔 Suspicious.       Tests took a long time, but not long enough to be fatal.
🙁 Survived.         This means your tests needs to be expanded.
🔇 Skipped.          Skipped.
<snip>
⠋ 21/21  🎉 5  ⏰ 0  🤔 0  🙁 16  🔇 0
```

天啊，在 21 个突变体中，有 16 个存活。只有 5 个通过了突变测试，但是，这意味着什么呢？

对于每个突变测试，`mutmut` 会修改部分源代码，以模拟潜在的错误，修改的一个例子是将 `>` 比较更改为 `>=`，查看会发生什么。如果没有针对这个边界条件的单元测试，那么这个突变将会“存活”：这是一个没有任何测试用例能够检测到的潜在错误。

是时候编写更好的单元测试了。很容易检查使用 `results` 所做的更改：

```
$ mutmut results
<snip>
Survived 🙁 (16)

---- angle.py (16) ----

4-7, 9-14, 16-21
$ mutmut apply 4
$ git diff
diff --git a/angle.py b/angle.py
index b5dca41..3939353 100644
--- a/angle.py
+++ b/angle.py
@@ -1,6 +1,6 @@
 def hours_hand(hour, minutes):
     hour = hour % 12
-    base = hour * (360 // 12)
+    base = hour / (360 // 12)
     correction = int((minutes / 60) * (360 // 12))
     return base + correction
```

这是 `mutmut` 执行突变的一个典型例子，它会分析源代码并将运算符更改为不同的运算符：减法变加法。在本例中由乘法变为除法。一般来说，单元测试应该在操作符更换时捕获错误。否则，它们将无法有效地测试行为。按照这种逻辑，`mutmut` 会遍历源代码仔细检查你的测试。

你可以使用 `mutmut apply` 来应用失败的突变体。事实证明你几乎没有检查过 `hour` 参数是否被正确使用。修复它：

```
$ git diff
diff --git a/tests/test_angle.py b/tests/test_angle.py
index f51d43a..1a2e4df 100644
--- a/tests/test_angle.py
+++ b/tests/test_angle.py
@@ -2,3 +2,6 @@ import angle
 
 def test_twelve():
     assert angle.between(12, 00) == 0
+
+def test_three():
+    assert angle.between(3, 00) == 90
```

以前，你只测试了 12 点钟，现在增加一个 3 点钟的测试就足够了吗？

```
$ mutmut run --paths-to-mutate angle.py
<snip>
⠋ 21/21  🎉 7  ⏰ 0  🤔 0  🙁 14  🔇 0
```

这项新测试成功杀死了两个突变体，比以前更好，当然还有很长的路要走。我不会一一解决剩下的 14 个测试用例，因为我认为模式已经很明确了。（你能将它们降低到零吗？）

变异测试和覆盖率一样，是一种工具，它允许你查看测试套件的全面程度。使用它使得测试用例需要改进：那些幸存的突变体中的任何一个都是人类在篡改代码时可能犯的错误，以及潜伏在程序中的隐藏错误。继续测试，愉快地搜寻 bug 吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mutmut-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
[3]: https://opensource.com/resources/python
