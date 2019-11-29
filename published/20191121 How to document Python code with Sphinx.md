[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11624-1.html)
[#]: subject: (How to document Python code with Sphinx)
[#]: via: (https://opensource.com/article/19/11/document-python-sphinx)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

如何使用 Sphinx 给 Python 代码写文档
======

> 最好将文档作为开发过程的一部分。Sphinx 加上 Tox，让文档可以轻松书写，并且外观漂亮。

![Python in a coffee cup.][1]

Python 代码可以在源码中包含文档。这种方式默认依靠 **docstring**，它以三引号格式定义。虽然文档的价值是很大的，但是没有充足的文档的代码还是很常见。让我们演练一个场景，了解出色的文档的强大功能。

经历了太多在白板技术面试上要求你实现斐波那契数列，你已经受够了。你回家用 Python 写了一个可重用的斐波那契计算器，使用浮点技巧来实现 `O(1)` 复杂度。

代码很简单：

```
# fib.py
import math

_SQRT_5 = math.sqrt(5)
_PHI = (1 + _SQRT_5) / 2

def approx_fib(n):
    return round(_PHI**(n+1) / _SQRT_5)
```

（该斐波那契数列是四舍五入到最接近的整数的几何序列，这是我最喜欢的鲜为人知的数学事实之一。）

作为一个好人，你可以将代码开源，并将它放在 [PyPI][2] 上。`setup.py` 文件很简单：

```
import setuptools

setuptools.setup(
    name='fib',
    version='2019.1.0',
    description='Fibonacci',
    py_modules=["fib"],
)
```

但是，没有文档的代码是没有用的。因此，你可以向函数添加 docstring。我最喜欢的 docstring 样式之一是 [“Google” 样式][3]。标记很轻量，当它放在源代码中时很好。


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

但是函数的文档只是成功的一半。普通文档对于情境化代码用法很重要。在这种情况下，情景是恼人的技术面试。

有一种添加更多文档的方式，专业 Python 人的方式通常是在 `docs/` 添加 rst 文件（ [reStructuredText][4] 的缩写）。因此 `docs/index.rst` 文件最终看起来像这样：

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

我们完成了，对吧？我们已经将文本放在了文件中。人们应该会看的。

### 使 Python 文档更漂亮

为了使你的文档看起来更漂亮，你可以利用 [Sphinx][5]，它旨在制作漂亮的 Python 文档。这三个 Sphinx 扩展特别有用：

* `sphinx.ext.autodoc`：从模块内部获取文档
* `sphinx.ext.napoleon`：支持 Google 样式的 docstring
* `sphinx.ext.viewcode`：将 ReStructured Text 源码与生成的文档打包在一起

为了告诉 Sphinx 该生成什么以及如何生成，我们在 `docs/conf.py` 中配置一个辅助文件：

```
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
    'sphinx.ext.viewcode',
]
# 该入口点的名称，没有 .rst 扩展名。
# 惯例该名称是 index
master_doc = "index"
# 这些值全部用在生成的文档当中。
# 通常，发布（release）与版本（version）是一样的，
# 但是有时候我们会有带有 rc 标签的发布。
project = "Fib"
copyright = "2019, Moshe Zadka"
author = "Moshe Zadka"
version = release = "2019.1.0"
```

此文件使我们可以使用所需的所有元数据来发布代码，并注意扩展名（上面的注释说明了方式）。最后，要确保生成我们想要的文档，请使用 [Tox][6] 管理虚拟环境以确保我们顺利生成文档：

```
[tox]
# 默认情况下，`.tox` 是该目录。
# 将其放在非点文件中可以从
# 文件管理器或浏览器的
# 打开对话框中打开生成的文档，
# 这些对话框有时会隐藏点文件。
toxworkdir = {toxinidir}/build/tox

[testenv:docs]
# 从 `docs` 目录内运行 `sphinx`，
# 以确保它不会拾取任何可能进入顶层目录下的
# 虚拟环境或 `build/` 目录下的其他工件的杂散文件。
changedir = docs
# 唯一的依赖关系是 `sphinx`。
# 如果我们使用的是单独打包的扩展程序，
# 我们将在此处指定它们。
# 更好的做法是指定特定版本的 sphinx。
deps =
    sphinx
# 这是用于生成 HTML 的 `sphinx` 命令。
# 在其他情况下，我们可能想生成 PDF 或电子书。
commands =
    sphinx-build -W -b html -d {envtmpdir}/doctrees . {envtmpdir}/html
# 我们使用 Python 3.7。
# Tox 有时会根据 testenv 的名称尝试自动检测它，
# 但是 `docs` 没有给出有用的线索，因此我们必须明确它。
basepython = python3.7
```

现在，无论何时运行 Tox，它都会为你的 Python 代码生成漂亮的文档。

### 在 Python 中写文档很好

作为 Python 开发人员，我们可以使用的工具链很棒。我们可以从 **docstring** 开始，添加 .rst 文件，然后添加 Sphinx 和 Tox 来为用户美化结果。

你对好的文档有何评价？你还有其他喜欢的方式么？请在评论中分享它们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/document-python-sphinx

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_python.jpg?itok=G04cSvp_ (Python in a coffee cup.)
[2]: https://pypi.org/
[3]: http://google.github.io/styleguide/pyguide.html#381-docstrings
[4]: http://docutils.sourceforge.net/rst.html
[5]: http://www.sphinx-doc.org/en/master/
[6]: https://tox.readthedocs.io/en/latest/
