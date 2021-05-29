[#]: subject: (What Python 3.3 did to improve exception handling in your code)
[#]: via: (https://opensource.com/article/21/5/python-33)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13439-1.html)

Python 3.3 为改进代码中的异常处理所做的工作
======

> 探索异常处理和其他未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202105/29/221357mxpj2kitltdez6zj.jpg)

这是 Python 3.x 首发特性系列文章的第四篇。Python 3.3 于 2012 年首次发布，尽管它已经发布了很长时间，但它引入的许多特性都没有得到充分利用，而且相当酷。下面是其中的三个。

### yield from

`yield` 关键字使 Python 更加强大。可以预见的是，人们都开始使用它来创建整个迭代器的生态系统。[itertools][2] 模块和 [more-itertools][3] PyPI 包就是其中两个例子。

有时，一个新的生成器会想要使用一个现有的生成器。作为一个简单的（尽管有点故意设计）的例子，设想你想枚举所有的自然数对。

一种方法是按照“自然数对的和，自然数对的第一项”的顺序生成所有的自然数对。用 `yield from` 来实现这个方法是很自然的。

`yield from <x>` 关键字是以下的简称：

```
for item in x:
    yield item
```

```
import itertools

def pairs():
    for n in itertools.count():
        yield from ((i, n-i) for i in range(n+1))
```

```
list(itertools.islice(pairs(), 6))
```

```
    [(0, 0), (0, 1), (1, 0), (0, 2), (1, 1), (2, 0)]
```

### 隐式命名空间包

假设有一个叫 Parasol 的虚构公司，它制造了一堆东西。它的大部分内部软件都是用 Python 编写的。虽然 Parasol 已经开源了它的一些代码，但其中一些代码对于开源来说过于专有或专业。

该公司使用内部 [DevPI][4] 服务器来管理内部软件包。对于 Parasol 的每个 Python 程序员来说，在 PyPI 上找一个未使用的名字是没有意义的，所以所有的内部包都被称为 `parasol.<business division>.<project>`。遵守最佳实践，开发人员希望包的名字能反映出这个命名系统。

这一点很重要！如果 `parasol.accounting.numeric_tricks` 包安装了一个名为 `numeric_tricks` 的顶层模块，这意味着依赖这个包的人将无法使用名为 `numeric_tricks` 的 PyPI 包，不管它写的有多好。

然而，这给开发者留下了一个两难的选择：哪个包拥有 `parasol/__init__.py` 文件？从 Python 3.3 开始，最好的解决办法是把 `parasol`，可能还有 `parasol.accounting`，变成没有 `__init__.py` 文件的 [命名空间包][5]。

### 抑制异常的上下文

有时，在从异常中恢复的过程中出现的异常是一个问题，有上下文来跟踪它是很有用的。然而，有时却不是这样：异常已经被处理了，而新的情况是一个不同的错误状况。

例如，想象一下，在字典中查找一个键失败后，如果不能分析它，则希望失败并返回 `ValueError()`。

```
import time

def expensive_analysis(data):
    time.sleep(10)
    if data[0:1] == ">":
        return data[1:]
    return None
```

这个函数需要很长的时间，所以当你使用它时，想要对结果进行缓存：

```
cache = {}

def last_letter_analyzed(data):
    try:
        analyzed = cache[data]
    except KeyError:
        analyzed = expensive_analysis(data)
        if analyzed is None:
            raise ValueError("invalid data", data)
        cached[data] = analyzed
    return analyzed[-1]
```

不幸的是，当出现缓存没有命中时，回溯看起来很难看：

```
last_letter_analyzed("stuff")
```

```
    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-16-a525ae35267b> in last_letter_analyzed(data)
          4     try:
    ----> 5         analyzed = cache[data]
          6     except KeyError:


    KeyError: 'stuff'
```

在处理上述异常的过程中，发生了另一个异常：

```
    ValueError                                Traceback (most recent call last)

    <ipython-input-17-40dab921f9a9> in <module>
    ----> 1 last_letter_analyzed("stuff")
   

    <ipython-input-16-a525ae35267b> in last_letter_analyzed(data)
          7         analyzed = expensive_analysis(data)
          8         if analyzed is None:
    ----> 9             raise ValueError("invalid data", data)
         10         cached[data] = analyzed
         11     return analyzed[-1]


    ValueError: ('invalid data', 'stuff')
```

如果你使用 `raise ... from None`，你可以得到更多可读的回溯：

```
def last_letter_analyzed(data):
    try:
        analyzed = cache[data]
    except KeyError:
        analyzed = expensive_analysis(data)
        if analyzed is None:
            raise ValueError("invalid data", data) from None
        cached[data] = analyzed
    return analyzed[-1]
```

```
last_letter_analyzed("stuff")
```

```
    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-21-40dab921f9a9> in <module>
    ----> 1 last_letter_analyzed("stuff")
   

    <ipython-input-20-5691e33edfbc> in last_letter_analyzed(data)
          5         analyzed = expensive_analysis(data)
          6         if analyzed is None:
    ----> 7             raise ValueError("invalid data", data) from None
          8         cached[data] = analyzed
          9     return analyzed[-1]


    ValueError: ('invalid data', 'stuff')
```

### 欢迎来到 2012 年

尽管 Python 3.3 在十年前就已经发布了，但它的许多功能仍然很酷，而且没有得到充分利用。如果你还没有，就把它们添加到你的工具箱中吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-33

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://docs.python.org/3/library/itertools.html
[3]: https://more-itertools.readthedocs.io/en/stable/
[4]: https://opensource.com/article/18/7/setting-devpi
[5]: https://www.python.org/dev/peps/pep-0420/
