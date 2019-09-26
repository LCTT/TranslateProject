[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10859-1.html)
[#]: subject: (Write faster C extensions for Python with Cython)
[#]: via: (https://opensource.com/article/19/5/python-cython)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/moshez/users/foundjem/users/jugmac00)

使用 Cython 为 Python 编写更快的 C 扩展
======

> 在我们这个包含了 7 个 PyPI 库的系列文章中学习解决常见的 Python 问题的方法。

![Hand drawing out the word "code"](https://img.linux.net.cn/data/attachment/album/201905/15/225506fnn2mz6l3u122n70.jpg)

Python 是当今使用最多的[流行编程语言][2]之一，因为：它是开源的，它有广泛的用途（例如 Web 编程、业务应用、游戏、科学编程等等），它有一个充满活力和专注的社区支持它。这个社区可以让我们在 [Python Package Index][3]（PyPI）中有如此庞大、多样化的软件包，用以扩展和改进 Python 并解决不可避免的问题。

在本系列中，我们将介绍七个可以帮助你解决常见 Python 问题的 PyPI 库。首先是 [Cython][4]，一个简化 Python 编写 C 扩展的语言。

### Cython

使用 Python 很有趣，但有时，用它编写的程序可能很慢。所有的运行时动态调度会带来很大的代价：有时它比用 C 或 Rust 等系统语言编写的等效代码慢 10 倍。

将代码迁移到一种全新的语言可能会在成本和可靠性方面付出巨大代价：所有的手工重写工作都将不可避免地引入错误。我们可以两者兼得么？

为了练习一下优化，我们需要一些慢代码。有什么比斐波那契数列的意外指数实现更慢？

```
def fib(n):
  if n < 2:
    return 1
  return fib(n-1) + fib(n-2)
```

由于对 `fib` 的调用会导致两次再次调用，因此这种效率极低的算法需要很长时间才能执行。例如，在我的新笔记本电脑上，`fib(36)` 需要大约 4.5 秒。这个 4.5 秒会成为我们探索 Python 的 Cython 扩展能提供的帮助的基准。

使用 Cython 的正确方法是将其集成到 `setup.py` 中。然而，使用 `pyximport` 可以快速地进行尝试。让我们将 `fib` 代码放在 `fib.pyx` 中并使用 Cython 运行它。

```
>>> import pyximport; pyximport.install()
>>> import fib
>>> fib.fib(36)
```

只使用 Cython 而不*修改*代码，这个算法在我笔记本上花费的时间减少到大约 2.5 秒。几乎无需任何努力，这几乎减少了 50％ 的运行时间。当然，得到了一个不错的成果。

加把劲，我们可以让它变得更快。

```
cpdef int fib(int n):
  if n < 2:
    return 1
  return fib(n - 1) + fib(n - 2)
```

我们将 `fib` 中的代码变成用 `cpdef` 定义的函数，并添加了两个类型注释：它接受一个整数并返回一个整数。

这个变得快*多*了，大约只用了 0.05 秒。它是如此之快，以至于我可能开始怀疑我的测量方法包含噪声：之前，这种噪声在信号中丢失了。

当下次你的 Python 代码花费太多 CPU 时间时，也许会导致风扇狂转，为何不看看 Cython 是否可以解决问题呢？

在本系列的下一篇文章中，我们将看一下 Black，一个自动纠正代码格式错误的项目。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-cython

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez/users/foundjem/users/jugmac00
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_hand_draw.png?itok=dpAf--Db (Hand drawing out the word "code")
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/Cython/
