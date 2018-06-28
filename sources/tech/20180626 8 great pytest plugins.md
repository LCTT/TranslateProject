8 great pytest plugins
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A)

We are big fans of [pytest][1] and use it as our default Python testing tool for work and open source projects. For this month's Python column, we're sharing why we love pytest and some of the plugins that make testing with pytest so much fun.

### What is pytest?

As the tool's website says, "The pytest framework makes it easy to write small tests, yet scales to support complex functional testing for applications and libraries."

`test_*.py` and as functions that begin with `test_*`. Pytest will then find all your tests, across your whole project, and run them automatically when you run `pytest` in your console. Pytest accepts `set_trace()` function that can be entered into your test; this will pause your tests and allow you to interact with your variables and otherwise "poke around" in the console to debug your project.

Pytest allows you to define your tests in any file calledand as functions that begin with. Pytest will then find all your tests, across your whole project, and run them automatically when you runin your console. Pytest accepts [flags and arguments][2] that can change when the testrunner stops, how it outputs results, which tests are run, and what information is included in the output. It also includes afunction that can be entered into your test; this will pause your tests and allow you to interact with your variables and otherwise "poke around" in the console to debug your project.

One of the best aspects of pytest is its robust plugin ecosystem. Because pytest is such a popular testing library, over the years many plugins have been created to extend, customize, and enhance its capabilities. These eight plugins are among our favorites.

### Great 8

**1.[pytest-sugar][3]**
`pytest-sugar` changes the default look and feel of pytest, adds a progress bar, and shows failing tests instantly. It requires no configuration; just `pip install pytest-sugar`, run your tests with `pytest`, and enjoy the prettier, more useful output.

**2.[pytest-cov][4]**
`pytest-cov` adds coverage support for pytest to show which lines of code have been tested and which have not. It will also include the percentage of test coverage for your project.

**3.[pytest-picked][5]**
`pytest-picked` runs tests based on code that you have modified but not committed to `git` yet. Install the library and run your tests with `pytest --picked` to test only files that have been changed since your last commit.

**4.[pytest-instafail][6]**
`pytest-instafail` modifies pytest's default behavior to show failures and errors immediately instead of waiting until pytest has finished running every test.

**5.[pytest-tldr][7]**
A brand-new pytest plugin that limits the output to just the things you need. `pytest-tldr` (the `tldr` stands for "too long, didn't read"), like `pytest-sugar`, requires no configuration other than basic installation. Instead of pytest's default output, which is pretty verbose, `pytest-tldr`'s default limits the output to only tracebacks for failing tests and omits the color-coding that some find annoying. Adding a `-v` flag returns the more verbose output for those who prefer it.

**6.[pytest-xdist][8]**
`pytest-xdist` allows you to run multiple tests in parallel via the `-n` flag: `pytest -n 2`, for example, would run your tests on two CPUs. This can significantly speed up your tests. It also includes the `--looponfail` flag, which will automatically re-run your failing tests.

**7.[pytest-django][9]**
`pytest-django` adds pytest support to Django applications and projects. Specifically, `pytest-django` introduces the ability to test Django projects using pytest fixtures, omits the need to import `unittest` and copy/paste other boilerplate testing code, and runs faster than the standard Django test suite.

**8.[django-test-plus][10]**
`django-test-plus` isn't specific to pytest, but it now supports pytest. It includes its own `TestCase` class that your tests can inherit from and enables you to use fewer keystrokes to type out frequent test cases, like checking for specific HTTP error codes.

The libraries we mentioned above are by no means your only options for extending your pytest usage. The landscape for useful pytest plugins is vast. Check out the [Pytest Plugins Compatibility][11] page to explore on your own. Which ones are your favorites?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/pytest-plugins

作者：[Jeff Triplett;Lacery Williams Henschel][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/sites/default/files/styles/byline_thumbnail/public/pictures/dcus-2017-bw.jpg?itok=s8PhD7Ok
[1]:https://docs.pytest.org/en/latest/
[2]:https://docs.pytest.org/en/latest/usage.html
[3]:https://github.com/Frozenball/pytest-sugar
[4]:https://github.com/pytest-dev/pytest-cov
[5]:https://github.com/anapaulagomes/pytest-picked
[6]:https://github.com/pytest-dev/pytest-instafail
[7]:https://github.com/freakboy3742/pytest-tldr
[8]:https://github.com/pytest-dev/pytest-xdist
[9]:https://pytest-django.readthedocs.io/en/latest/
[10]:https://django-test-plus.readthedocs.io/en/latest/
[11]:https://plugincompat.herokuapp.com/
