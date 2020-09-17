[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Teach Python with Jupyter Notebooks)
[#]: via: (https://opensource.com/article/20/9/teach-python-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Teach Python with Jupyter Notebooks
======
With Jupyter, PyHamcrest, and a little duct tape of a testing harness,
you can teach any Python topic that is amenable to unit testing.
![Person reading a book and digital copy][1]

Some things about the Ruby community have always impressed me. Two examples are the commitment to testing and the emphasis on making it easy to get started. The best example of both is [Ruby Koans][2], where you learn Ruby by fixing tests.

With the amazing tools we have for Python, we should be able to do something even better. We can. Using [Jupyter Notebook][3], [PyHamcrest][4], and just a little bit of duct tape-like code, we can make a tutorial that includes teaching, code that works, and code that needs fixing.

First, some duct tape. Usually, you do your tests using some nice command-line test runner, like [pytest][5] or [virtue][6]. Usually, you do not even run it directly. You use a tool like [tox][7] or [nox][8] to run it. However, for Jupyter, you need to write a little harness that can run the tests directly in the cells.

Luckily, the harness is short, if not simple: ` `


```
import unittest

def run_test(klass):
    suite = unittest.TestLoader().loadTestsFromTestCase(klass)
    unittest.TextTestRunner(verbosity=2).run(suite)
    return klass
```

Now that the harness is done, it's time for the first exercise.

In teaching, it is always a good idea to start small with an easy exercise to build confidence.

So why not fix a really simple test?


```
@run_test
class TestNumbers(unittest.TestCase):
   
    def test_equality(self):
        expected_value = 3 # Only change this line
        self.assertEqual(1+1, expected_value)

[/code] [code]

    test_equality (__main__.TestNumbers) ... FAIL
   
    ======================================================================
    FAIL: test_equality (__main__.TestNumbers)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-7-5ebe25bc00f3&gt;", line 6, in test_equality
        self.assertEqual(1+1, expected_value)
    AssertionError: 2 != 3
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.002s
   
    FAILED (failures=1)
```

`Only change this line` is a useful marker for students. It shows exactly what needs to be changed. Otherwise, students could fix the test by changing the first line to `return`.

In this case, the fix is easy: ` `


```
@run_test
class TestNumbers(unittest.TestCase):
   
    def test_equality(self):
        expected_value = 2 # Fixed this line
        self.assertEqual(1+1, expected_value)

[/code] [code]

    test_equality (__main__.TestNumbers) ... ok
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.002s
   
    OK
```

Quickly, however, the `unittest` library's native assertions will prove lacking. In `pytest`, this is fixed with rewriting the bytecode in `assert` to have magical properties and all kinds of heuristics. This would not work easily in a Jupyter notebook. Time to dig out a good assertion library: PyHamcrest:


```
`from hamcrest import *`[/code] [code]

@run_test
class TestList(unittest.TestCase):
   
    def test_equality(self):
        things = [1,
                  5, # Only change this line
                  3]
        assert_that(things, has_items(1, 2, 3))

[/code] [code]

    test_equality (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_equality (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-11-96c91225ee7d&gt;", line 8, in test_equality
        assert_that(things, has_items(1, 2, 3))
    AssertionError:
    Expected: (a sequence containing &lt;1&gt; and a sequence containing &lt;2&gt; and a sequence containing &lt;3&gt;)
         but: a sequence containing &lt;2&gt; was &lt;[1, 5, 3]&gt;
   
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.004s
   
    FAILED (failures=1)
```

PyHamcrest is not just good at flexible assertions; it is also good at clear error messages. Because of that, the problem is plain to see: `[1, 5, 3]` does not contain `2`, and it looks ugly besides:


```
@run_test
class TestList(unittest.TestCase):
   
    def test_equality(self):
        things = [1,
                  2, # Fixed this line
                  3]
        assert_that(things, has_items(1, 2, 3))

[/code] [code]

    test_equality (__main__.TestList) ... ok
   
    ----------------------------------------------------------------------
    Ran 1 test in 0.001s
   
    OK
```

With Jupyter, PyHamcrest, and a little duct tape of a testing harness, you can teach any Python topic that is amenable to unit testing.

For example, the following can help show the differences between the different ways Python can strip whitespace from a string:


```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # This one is a freebie: it already works!
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string # Only change this line
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string # Only change this line
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))

[/code] [code]

    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... FAIL
    test_start_strip (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_end_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-16-3db7465bd5bf&gt;", line 19, in test_end_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with '  hello' and a string ending with 'world')
         but: a string ending with 'world' was '  hello world  '
   
   
    ======================================================================
    FAIL: test_start_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-16-3db7465bd5bf&gt;", line 14, in test_start_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with 'hello' and a string ending with 'world  ')
         but: a string starting with 'hello' was '  hello world  '
   
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.006s
   
    FAILED (failures=2)
```

Ideally, students would realize that the methods `.lstrip()` and `.rstrip()` will do what they need. But if they do not and instead try to use `.strip()` everywhere:


```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # This one is a freebie: it already works!
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string.strip() # Changed this line
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string.strip() # Changed this line
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))

[/code] [code]

    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... FAIL
    test_start_strip (__main__.TestList) ... FAIL
   
    ======================================================================
    FAIL: test_end_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-17-6f9cfa1a997f&gt;", line 19, in test_end_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with '  hello' and a string ending with 'world')
         but: a string starting with '  hello' was 'hello world'
   
   
    ======================================================================
    FAIL: test_start_strip (__main__.TestList)
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "&lt;ipython-input-17-6f9cfa1a997f&gt;", line 14, in test_start_strip
        assert_that(result,
    AssertionError:
    Expected: (a string starting with 'hello' and a string ending with 'world  ')
         but: a string ending with 'world  ' was 'hello world'
   
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.007s
   
    FAILED (failures=2)
```

They would get a different error message that shows too much space has been stripped:


```
source_string = "  hello world  "

@run_test
class TestList(unittest.TestCase):
   
    # This one is a freebie: it already works!
    def test_complete_strip(self):
        result = source_string.strip()
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world")))

    def test_start_strip(self):
        result = source_string.lstrip() # Fixed this line
        assert_that(result,
                   all_of(starts_with("hello"), ends_with("world  ")))

    def test_end_strip(self):
        result = source_string.rstrip() # Fixed this line
        assert_that(result,
                   all_of(starts_with("  hello"), ends_with("world")))

[/code] [code]

    test_complete_strip (__main__.TestList) ... ok
    test_end_strip (__main__.TestList) ... ok
    test_start_strip (__main__.TestList) ... ok
   
    ----------------------------------------------------------------------
    Ran 3 tests in 0.005s
   
    OK
```

In a more realistic tutorial, there would be more examples and more explanations. This technique using a notebook with some examples that work and some that need fixing can work for real-time teaching, a video-based class, or even, with a lot more prose, a tutorial the student can complete on their own.

Now go out there and share your knowledge!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/teach-python-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
