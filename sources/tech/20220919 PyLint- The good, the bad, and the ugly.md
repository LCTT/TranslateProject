[#]: subject: "PyLint: The good, the bad, and the ugly"
[#]: via: "https://opensource.com/article/22/9/pylint-good-bad-ugly"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

PyLint: The good, the bad, and the ugly
======
Get the most out of PyLint.

![Python programming language logo with question marks][1]

Image by: Opensource.com

Hot take: PyLint is actually good!

"PyLint can save your life" is an exaggeration, but not as much as you might think! PyLint can keep you from really really hard to find and complicated bugs. At worst, it can save you the time of a test run. At best, it can help you avoid complicated production mistakes.

### The good

I'm embarrassed to say how common this can be. Naming tests is perpetually *weird*: Nothing cares about the name, and there's often not a natural name to be found. For instance, look at this code:

```
def test_add_small():
    # Math, am I right?
    assert 1 + 1 == 3
    
def test_add_large():
    assert 5 + 6 == 11
    
def test_add_small():
    assert 1 + 10 == 11
```

The test works:

```
collected 2 items                                                                         
test.py .. 
2 passed
```

In reality, these files can be hundreds of lines long, and the person adding the new test might not be aware of all the names. Unless someone is looking at test output carefully, everything looks fine.

Worst of all, the *addition of the overriding test*, the *breakage of the overridden test*, and the *problem that results in prod* might be separated by days, months, or even years.

### PyLint finds it

But like a good friend, PyLint is there for you.

```
test.py:8:0: E0102: function already defined line 1
     (function-redefined)
```

### The bad

Like a 90s sitcom, the more you get into PyLint, the more it becomes problematic. This is completely reasonable code for an inventory modeling program:

```
"""Inventory abstractions"""

import attrs

@attrs.define
class Laptop:
    """A laptop"""
    ident: str
    cpu: str
```

It seems that PyLint has opinions (probably formed in the 90s) and is not afraid to state them as facts:

```
$ pylint laptop.py | sed -n '/^laptop/s/[^ ]*: //p'
R0903: Too few public methods (0/2) (too-few-public-methods)
```

### The ugly

Ever wanted to add your own unvetted opinion to a tool used by millions? PyLint has 12 million monthly downloads.

> "People will just disable the whole check if it's too picky." —PyLint issue 6987, July 3rd, 2022

The attitude it takes towards adding a test with potentially many false positives is...*"eh."*

### Making it work for you

PyLint is fine, but you need to interact with it carefully. Here are the three things I recommend to make PyLint work for you.

#### 1. Pin it

Pin the PyLint version you use to avoid any surprises!

In your `.toml` file:

```
[project.optional-dependencies]
pylint = ["pylint"]
```

In your code:

```
from unittest import mock
```

This corresponds with code like this:

```
# noxfile.py
...
@nox.session(python=VERSIONS[-1])
def refresh_deps(session):
    """Refresh the requirements-*.txt files"""
    session.install("pip-tools")
    for deps in [..., "pylint"]:
        session.run(
            "pip-compile",
            "--extra",
            deps,
            "pyproject.toml",
            "--output-file",
            f"requirements-{deps}.txt",
        )
```

#### 2. Default deny

Disable all checks. Then enable ones that you think have a high value-to-false-positive ratio. (Not just false-negative-to-false-positive ratio!)

```
# noxfile.py
...
@nox.session(python="3.10")
def lint(session):
    files = ["src/", "noxfile.py"]
    session.install("-r", "requirements-pylint.txt")
    session.install("-e", ".")
    session.run(
        "pylint",
        "--disable=all",
        *(f"--enable={checker}" for checker in checkers)
        "src",
    )
```

#### 3. Checkers

These are some of the ones I like. Enforce consistency in the project, avoid some obvious mistakes.

```
checkers = [
    "missing-class-docstring",
    "missing-function-docstring",
    "missing-module-docstring",
    "function-redefined",
]
```

### Using PyLint

You can take just the good parts of PyLint. Run it in CI to keep consistency, and use the highest value checkers.

Lose the bad parts: Default deny checkers.

Avoid the ugly parts: Pin the version to avoid surprises.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/pylint-good-bad-ugly

作者：[Moshe Zadka][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_programming_question.png
