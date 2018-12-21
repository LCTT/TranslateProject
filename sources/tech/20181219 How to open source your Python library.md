[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to open source your Python library)
[#]: via: (https://opensource.com/article/18/12/tips-open-sourcing-python-libraries)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to open source your Python library
======
This 12-step checklist will ensure a successful launch.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

You wrote a Python library. I'm sure it's amazing! Wouldn't it be neat if it was easy for people to use it? Here is a checklist of things to think about and concrete steps to take when open sourcing your Python library.

### 1\. Source

Put the code up on [GitHub][1], where most open source projects happen and where it is easiest for people to submit pull requests.

### 2\. License

Choose an open source license. A good, permissive default is the [MIT License][2]. If you have specific requirements, Creative Common's [Choose a License][3] can guide you through the alternatives. Most importantly, there are three rules to keep in mind when choosing a license:

  * Don't create your own license.
  * Don't create your own license.
  * Don't create your own license.



### 3\. README

Put a file called README.rst, formatted with ReStructured Text, at the top of your tree.

GitHub will render ReStructured Text just as well as Markdown, and ReST plays better with Python's documentation ecosystem.

### 4\. Tests

Write tests. This is not useful just for you: it is useful for people who want to make patches that avoid breaking related functionality.

Tests help collaborators collaborate.

Usually, it is best if they are runnable with [**pytest**][4]. There are other test runners—but very little reason to use them.

### 5\. Style

Enforce style with a linter: PyLint, Flake8, or Black with **\--check**. Unless you use Black, make sure to specify configuration options in a file checked into source control.

### 6\. API documentation

Use docstrings to document modules, functions, classes, and methods.

There are a few styles you can use. I prefer the [Google-style docstrings][5], but [ReST docstrings][6] are an option.

Both Google-style and ReST docstrings can be processed by Sphinx to integrate API documentation with prose documentation.

### 7\. Prose documentation

Use [Sphinx][7]. (Read [our article on it][8].) A tutorial is useful, but it is also important to specify what this thing is, what it is good for, what it is bad for, and any special considerations.

### 8\. Building

Use **tox** or **nox** to automatically run your tests and linter and build the documentation. These tools support a "dependency matrix." These matrices tend to explode fast, but try to test against a reasonable sample, such as Python versions, versions of dependencies, and possibly optional dependencies you install.

### 9\. Packaging

Use [setuptools][9]. Write a **setup.py** and a **setup.cfg**. If you support both Python 2 and 3, specify universal wheels in the **setup.cfg**.

One thing **tox** or **nox** should do is build a wheel and run tests against the installed wheel.

Avoid C extensions. If you absolutely need them for performance or binding reasons, put them in a separate package. Properly packaging C extensions deserves its own post. There are a lot of gotchas!

### 10\. Continuous integration

### 11\. Versions

Use a public continuous integration runner. [TravisCI][10] and [CircleCI][11] offer free tiers for open source projects. Configure GitHub or other repo to require passing checks before merging pull requests, and you'll never have to worry about telling people to fix their tests or their style in code reviews.

Use either [SemVer][12] or [CalVer][13]. There are many tools to help manage versions: [incremental][14], [bumpversion][15], and [setuptools_scm][16] are all packages on PyPI that help manage versions for you.

### 12\. Release

Release by running **tox** or **nox** and using **twine** to upload the artifacts to PyPI. You can do a "test upload" by running [DevPI][17].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/tips-open-sourcing-python-libraries

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://github.com/
[2]: https://en.wikipedia.org/wiki/MIT_License
[3]: https://choosealicense.com/
[4]: https://docs.pytest.org/en/latest/
[5]: https://github.com/google/styleguide/blob/gh-pages/pyguide.md
[6]: https://www.python.org/dev/peps/pep-0287/
[7]: http://www.sphinx-doc.org/en/master/
[8]: https://opensource.com/article/18/11/building-custom-workflows-sphinx
[9]: https://pypi.org/project/setuptools/
[10]: https://travis-ci.org/
[11]: https://circleci.com/
[12]: https://semver.org/
[13]: https://calver.org/
[14]: https://pypi.org/project/incremental/
[15]: https://pypi.org/project/bumpversion/
[16]: https://pypi.org/project/setuptools_scm/
[17]: https://opensource.com/article/18/7/setting-devpi
