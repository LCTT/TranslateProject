[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to document Python code with Sphinx)
[#]: via: (https://opensource.com/article/19/11/document-python-sphinx)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to document Python code with Sphinx
======
Documentation is best as part of the development process. Sphinx, along
with Tox, makes it easy to write and beautiful to look at.
![Python in a coffee cup.][1]

Python code can include documentation right inside its source code. The default way of doing so relies on **docstrings**, which are defined in a triple quote format. While the value of documentation is well... documented, it seems all too common to not document code sufficiently. Let's walk through a scenario on the power of great documentation.

After one too many whiteboard tech interviews that ask you to implement the Fibonacci sequence, you have had enough. You go home and write a reusable Fibonacci calculator in Python that uses floating-point tricks to get to O(1).

The code is pretty simple:


```
# fib.py
import math

_SQRT_5 = math.sqrt(5)
_PHI = (1 + _SQRT_5) / 2

def approx_fib(n):
    return round(_PHI**(n+1) / _SQRT_5)
```

(That the Fibonacci sequence is a geometric sequence rounded to the nearest whole number is one of my favorite little-known math facts.)

Being a decent person, you make the code open source and put it on [PyPI][2]. The **setup.py** file is simple enough:


```
import setuptools

setuptools.setup(
    name='fib',
    version='2019.1.0',
    description='Fibonacci',
    py_modules=["fib"],
)
```

However, code without documentation is useless. So you add a docstring to the function. One of my favorite docstring styles is the ["Google" style][3]. It is light on markup, which is nice when it is inside the source code.


```
def approx_fib(n):
    """
    Approximate Fibonacci sequence

    Args:
        n (int): The place in Fibonacci sequence to approximate

    Returns:
        float: The approximate value in Fibonacci sequence
    """
    # ...
```

But the function's documentation is only half the battle. Prose documentation is important for contextualizing code usage. In this case, the context is annoying tech interviews. 

There is an option to add more documentation, and the Pythonic pattern is to use an **rst** file (short for [reStructuredText][4]) commonly added under a **docs/** directory. So the **docs/index.rst** file ends up looking like this:


```
Fibonacci
=========

Are you annoyed at tech interviewers asking you to implement
the Fibonacci sequence?
Do you want to have some fun with them?
A simple
:code:`pip install fib`
is all it takes to tell them to,
um,
fib off.

.. automodule:: fib
   :members:
```

And we're done, right? We have the text in a file. Someone should look at it.

### Making Python documentation beautiful

To make your documentation look beautiful, you can take advantage of [Sphinx][5], which is designed to make pretty Python documents. In particular, these three Sphinx extensions are helpful:

  * **sphinx.ext.autodoc**: Grabs documentation from inside modules
  * **sphinx.ext.napoleon**: Supports Google-style docstrings
  * **sphinx.ext.viewcode**: Packages the ReStructured Text sources with the generated docs



In order to tell Sphinx what and how to generate, we configure a helper file at **docs/conf.py**:


```
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
    'sphinx.ext.viewcode',
]
# The name of the entry point, without the ".rst" extension.
# By convention this will be "index"
master_doc = "index"
# This values are all used in the generated documentation.
# Usually, the release and version are the same,
# but sometimes we want to have the release have an "rc" tag.
project = "Fib"
copyright = "2019, Moshe Zadka"
author = "Moshe Zadka"
version = release = "2019.1.0"
```

This file allows us to release our code with all the metadata we want and note our extensions (the comments above explain how). Finally, to document exactly how we want the documentation generated, use [Tox][6] to manage the virtual environment to make sure we generate the documentation smoothly:


```
[tox]
# By default, .tox is the directory.
# Putting it in a non-dot file allows opening the generated
# documentation from file managers or browser open dialogs
# that will sometimes hide dot files.
toxworkdir = {toxinidir}/build/tox

[testenv:docs]
# Running sphinx from inside the "docs" directory
# ensures it will not pick up any stray files that might
# get into a virtual environment under the top-level directory
# or other artifacts under build/
changedir = docs
# The only dependency is sphinx
# If we were using extensions packaged separately,
# we would specify them here.
# A better practice is to specify a specific version of sphinx.
deps =
    sphinx
# This is the sphinx command to generate HTML.
# In other circumstances, we might want to generate a PDF or an ebook
commands =
    sphinx-build -W -b html -d {envtmpdir}/doctrees . {envtmpdir}/html
# We use Python 3.7. Tox sometimes tries to autodetect it based on the name of
# the testenv, but "docs" does not give useful clues so we have to be explicit.
basepython = python3.7
```

Now, whenever you run Tox, it will generate beautiful documentation for your Python code.

### Documentation in Python is excellent

As a Python developer, the toolchain available to us is fantastic. We can start with **docstrings**, add **.rst** files, then add Sphinx and Tox to beautify the results for users. 

What do you appreciate about good documentation? Do you have other favorite tactics? Share them in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/document-python-sphinx

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_python.jpg?itok=G04cSvp_ (Python in a coffee cup.)
[2]: https://pypi.org/
[3]: http://google.github.io/styleguide/pyguide.html#381-docstrings
[4]: http://docutils.sourceforge.net/rst.html
[5]: http://www.sphinx-doc.org/en/master/
[6]: https://tox.readthedocs.io/en/latest/
