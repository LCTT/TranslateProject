[#]: subject: "PyLint: The good, the bad, and the ugly"
[#]: via: "https://opensource.com/article/22/9/pylint-good-bad-ugly"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15144-1.html"

PyLint 的优点、缺点和危险
======

![](https://img.linux.net.cn/data/attachment/album/202210/16/093840z9pnzfv9ykfccoq9.jpg)

> 充分利用 PyLint。

敲黑板：PyLint 实际上很好！

“PyLint 可以拯救你的生命”，这是一句夸张的描述，但没有你想象的那么夸张。PyLint 可以让你远离非常难找到的和复杂的缺陷。最差的情况下，它只可以节省测试运行的时间。最好的情况下，它可以帮你避免生产环境中复杂的错误。

### 优点

我不好意思说这种情况是多么普遍。测试的命名总是*那么奇怪*：没有人关心这个名称，而且通常也找不到一个自然的名称。例如以下代码：

```
def test_add_small():
    # Math, am I right?
    assert 1 + 1 == 3
    
def test_add_large():
    assert 5 + 6 == 11
    
def test_add_small():
    assert 1 + 10 == 11
```

测试生效：

```
collected 2 items                                                                         
test.py .. 
2 passed
```

但问题是：如果你覆盖了一个测试的名称，测试框架将愉快地跳过这个测试！

实际上，这些文件可能有数百行，而添加新测试的人可能并不知道所有的名称。除非有人仔细查看测试输出，否则一切看起来都很好。  

最糟糕的是，*被覆盖测试的添加*、*被覆盖测试造成的破坏*，以及*连锁反应的问题*可能要几天、几月甚至几年才能发现。

### PyLint 会找到它

就像一个好朋友一样，PyLint 可以帮助你。

```
test.py:8:0: E0102: function already defined line 1
     (function-redefined)
```

### 缺点

就像 90 年代的情景喜剧一样，你对 PyLint 了解的越多，问题就越多。以下是一个库存建模程序的常规代码：

```
"""Inventory abstractions"""

import attrs

@attrs.define
class Laptop:
    """A laptop"""
    ident: str
    cpu: str
```

但 PyLint 似乎有自己的观点（可能形成于 90 年代），并且不怕把它们作为事实陈述出来：

```
$ pylint laptop.py | sed -n '/^laptop/s/[^ ]*: //p'
R0903: Too few public methods (0/2) (too-few-public-methods)
```

### 危险

有没有想过在一个数百万人使用的工具中加入自己未证实的观点？PyLint 每月有 1200 万次下载。

> “如果太挑剔，人们会取消检查” — 这是 PyLint GitHub 的 6987 号议题，于 2022 年 7 月 3 号提出

对于添加一个可能有许多误报的测试，它的态度是 ... “*嗯*”。

### 让它为你工作

PyLint 很好，但你需要小心地与它配合。为了让 PyLint 为你工作，以下是我推荐的三件事：

#### 1、固定版本

固定你使用的 PyLint 版本，避免任何惊喜！

在你的 `.toml` 文件中定义:

```
[project.optional-dependencies]
pylint = ["pylint"]
```

在代码中定义：

```
from unittest import mock
```

这与以下代码对应：

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

#### 2、默认禁止

禁用所有检查，然后启用那些你认为误报比率高的。（不仅仅是漏报/误报的比率！）

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

#### 3、检查器

以下是我喜欢的检查器。加强项目的一致性，避免一些明显的错误。

```
checkers = [
    "missing-class-docstring",
    "missing-function-docstring",
    "missing-module-docstring",
    "function-redefined",
]
```

### 使用 PyLint

你可以只使用 PyLint 好的部分。在 CI 中运行它以保持一致性，并使用常用检查器。

放弃不好的部分：默认禁止检查器。

避免危险的部分：固定版本以避免意外。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/pylint-good-bad-ugly

作者：[Moshe Zadka][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_programming_question.png
