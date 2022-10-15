[#]: subject: "PyLint: The good, the bad, and the ugly"
[#]: via: "https://opensource.com/article/22/9/pylint-good-bad-ugly"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

PyLint: 优点，缺点和危险
======
充分利用 PyLint。

![带有问号的 Python 编程标志][1]

图像来源: Opensource.com

热议：PyLint 实际上很好！

“PyLint 可以拯救你的生命”，这是一句夸张的描述，但没有你想象的那么多。PyLint 可以让你远离非常难找到和复杂的缺陷。最坏的情况下，它只可以节省测试运行的时间。最好情况下，它可以帮你避免生产环境中复杂的错误。

### 优点

我不好意思说这种情况是多么普遍。命名测试总是*奇怪的*：没有人关心名字，而且通常也找不到一个自然的名字。例如以下代码：

```python
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

但问题是：如果你覆盖了一个名称，测试框架将愉快地跳过这个测试！
实际上，这些文件可能有数百行，而添加新测试的人可能并不知道所有的名称。除非有人仔细查看测试输出，否则一切看起来都很好。  

最糟糕的是，*覆盖测试的添加*，*覆盖测试的破坏*，以及*连锁反应问题*可能以会以天、月甚至年为单位发现。

### PyLint 会找到它

就像一个好朋友一样，PyLint 可以帮助你。

```
test.py:8:0: E0102: function already defined line 1
     (function-redefined)
```

### 缺点

就像 90 年代的情景喜剧一样，你对 PyLint 了解的越多，问题就越多。对一个库存建模程序来说，以下是完全合理的代码：

```python
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

> "如果太挑剔，人们会取消检查" — 这是 PyLint github 的 6987 编号事务，在 2022 年七月 3 号提出

对于添加一个可能有许多误报的测试，它的态度是 ... *嗯*。

### 让它为你工作

PyLint 很好，但你需要小心地与它配合。为了让 PyLint 为你工作，以下是我推荐的三件事：

#### 1. 固定它

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

```python
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

#### 2. 默认禁止

禁用所有检查，然后启用那些你认为误报比率高的。（不仅仅是漏报/误报的比率！）（to 校正：这里没理解）

```python
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

#### 3. 检查器

以下是我喜欢的检查器。加强项目的一致性，避免一些明显的错误。

```python
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
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_programming_question.png
