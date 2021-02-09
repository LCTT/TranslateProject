[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12646-1.html)
[#]: subject: (Teach Python with Jupyter Notebooks)
[#]: via: (https://opensource.com/article/20/9/teach-python-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

用 Jupyter Notebook 教 Python
======

> 有了 Jupyter、PyHamcrest，用一点测试的代码把它们连在一起，你就可以教任何适用于单元测试的 Python 内容。

![](https://img.linux.net.cn/data/attachment/album/202009/24/045721mubdfdx1tb11fibi.jpg)

关于 Ruby 社区的一些事情一直让我印象深刻，其中两个例子是对测试的承诺和对易于上手的强调。这两方面最好的例子是 [Ruby Koans][2]，在这里你可以通过修复测试来学习 Ruby。

要是我们能把这些神奇的工具也用于 Python，我们应该可以做得更好。是的，使用 [Jupyter Notebook][3]、[PyHamcrest][4]，再加上一点类似于胶带的粘合代码，我们可以做出一个包括教学、可工作的代码和需要修复的代码的教程。

首先，需要一些“胶布”。通常，你会使用一些漂亮的命令行测试器来做测试，比如 [pytest][5] 或 [virtue][6]。通常，你甚至不会直接运行它。你使用像 [tox][7] 或 [nox][8] 这样的工具来运行它。然而，对于 Jupyter 来说，你需要写一小段粘合代码，可以直接在其中运行测试。

幸运的是，这个代码又短又简单：

```
import unittest

def run_test(klass):
    suite = unittest.TestLoader().loadTestsFromTestCase(klass)
    unittest.TextTestRunner(verbosity=2).run(suite)
    return klass
```

现在，装备已经就绪，可以进行第一次练习了。

在教学中，从一个简单的练习开始，建立信心总是一个好主意。

那么，让我们来修复一个非常简单的测试：

```
@run_test
class TestNumbers(unittest.TestCase):
   
    def test_equality(self):
        expected_value = 3 # 只改这一行
        self.assertEqual(1+1, expected_value)
```

```
    test_equality (__main__.TestNumbers) ... FAIL
   
    ======================================================================
    FAIL: test_equality (__main__.TestNumbers)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-7-5ebe25bc00f3>", line 6, in test_equality
        self.assertEqual(1+1, expected_value)
    AssertionError: 2 != 3
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.002s
   
    FAILED (failures=1)
```

“只改这一行” 对学生来说是一个有用的标记。它准确地表明了需要修改的内容。否则，学生可以通过将第一行改为 `return` 来修复测试。

在这种情况下，修复很容易：

```
@run_test
class TestNumbers(unittest.TestCase):
   
    def test_equality(self):
        expected_value = 2 # 修复后的代码行
        self.assertEqual(1+1, expected_value)
```

```
    test_equality (__main__.TestNumbers) ... ok
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.002s
   
    OK
```

然而，很快，`unittest` 库的原生断言将被证明是不够的。在 `pytest` 中，通过重写 `assert` 中的字节码来解决这个问题，使其具有神奇的属性和各种启发式方法。但这在 Jupyter notebook 中就不容易实现了。是时候挖出一个好的断言库了：PyHamcrest。

```
from hamcrest import *
@run_test
class TestList(unittest.TestCase):
   
    def test_equality(self):
        things = [1,
                  5, # 只改这一行
                  3]
        assert_that(things, has_items(1, 2, 3))
```

```
    test_equality (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_equality (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-11-96c91225ee7d>", line 8, in test_equality
        assert_that(things, has_items(1, 2, 3))
    AssertionError:
    Expected: (a sequence containing <1> and a sequence containing <2> and a sequence containing <3>)
         but: a sequence containing <2> was <[1, 5, 3]>
   
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.004s
   
    FAILED (failures=1)
```

PyHamcrest 不仅擅长灵活的断言，它还擅长清晰的错误信息。正因为如此，问题就显而易见了。`[1, 5, 3]` 不包含 `2`，而且看起来很丑：

```
@run_test
class TestList(unittest.TestCase):
   
    def test_equality(self):
        things = [1,
                  2, # 改完的行
                  3]
        assert_that(things, has_items(1, 2, 3))
```

```
    test_equality (__main__.TestList) ... ok
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.001s
   
    OK
```

使用 Jupyter、PyHamcrest 和一点测试的粘合代码，你可以教授任何适用于单元测试的 Python 主题。

例如，下面可以帮助展示 Python 从字符串中去掉空白的不同方法之间的差异。

```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # 这是个赠品：它可以工作！
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string # 只改这一行
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string # 只改这一行
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))
```

```
    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... FAIL
    test_start_strip (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_end_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-16-3db7465bd5bf>", line 19, in test_end_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with '  hello' and a string ending with 'world')
         but: a string ending with 'world' was '  hello world  '
   
   
    ======================================================================
    FAIL: test_start_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-16-3db7465bd5bf>", line 14, in test_start_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with 'hello' and a string ending with 'world  ')
         but: a string starting with 'hello' was '  hello world  '
   
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.006s
   
    FAILED (failures=2)
```

理想情况下，学生们会意识到 `.lstrip()` 和 `.rstrip()` 这两个方法可以满足他们的需要。但如果他们不这样做，而是试图到处使用 `.strip()` 的话：

```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # 这是个赠品：它可以工作！
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string.strip() # 改完的行
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string.strip() # 改完的行
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))
```

```
    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... FAIL
    test_start_strip (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_end_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-17-6f9cfa1a997f>", line 19, in test_end_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with '  hello' and a string ending with 'world')
         but: a string starting with '  hello' was 'hello world'
   
   
    ======================================================================
    FAIL: test_start_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "<ipython-input-17-6f9cfa1a997f>", line 14, in test_start_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with 'hello' and a string ending with 'world  ')
         but: a string ending with 'world  ' was 'hello world'
   
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.007s
   
    FAILED (failures=2)
```

他们会得到一个不同的错误信息，显示去除了过多的空白：

```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # 这是个赠品：它可以工作！
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string.lstrip() # Fixed this line
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string.rstrip() # Fixed this line
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))
```

```
    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... ok
    test_start_strip (__main__.TestList) ... ok
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.005s
   
    OK
```

在一个比较真实的教程中，会有更多的例子和更多的解释。这种使用 Jupyter Notebook 的技巧，有的例子可以用，有的例子需要修正，可以用于实时教学，可以用于视频课，甚至，可以用更多的其它零散用途，让学生自己完成一个教程。

现在就去分享你的知识吧!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/teach-python-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://github.com/edgecase/ruby_koans
[3]: https://jupyter.org/
[4]: https://github.com/hamcrest/PyHamcrest
[5]: https://docs.pytest.org/en/stable/
[6]: https://github.com/Julian/Virtue
[7]: https://tox.readthedocs.io/en/latest/
[8]: https://nox.thea.codes/en/stable/
