[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10887-1.html)
[#]: subject: (Add methods retroactively in Python with singledispatch)
[#]: via: (https://opensource.com/article/19/5/python-singledispatch)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez)

使用 singledispatch 在 Python 中追溯地添加方法
======

> 在我们覆盖 7 个 PyPI 库的系列文章中了解更多解决 Python 问题的信息。

![](https://img.linux.net.cn/data/attachment/album/201905/23/093515sgmu4auml9caz54l.jpg)

Python 是当今使用最多[流行的编程语言][2]之一，因为：它是开源的，它具有广泛的用途（例如 Web 编程、业务应用、游戏、科学编程等等），它有一个充满活力和专注的社区支持它。这个社区是我们在 [Python Package Index][3]（PyPI）中提供如此庞大、多样化的软件包的原因，用以扩展和改进 Python。并解决不可避免的问题。

在本系列中，我们将介绍七个可以帮助你解决常见 Python 问题的 PyPI 库。今天，我们将研究 [singledispatch][4]，这是一个能让你追溯地向 Python 库添加方法的库。

### singledispatch

想象一下，你有一个有 Circle、Square 等类的“形状”库。

Circle 类有半径、Square 有边、Rectangle 有高和宽。我们的库已经存在，我们不想改变它。

然而，我们想给库添加一个面积计算。如果我们不会和其他人共享这个库，我们只需添加 `area` 方法，这样我们就能调用 `shape.area()` 而无需关心是什么形状。

虽然可以进入类并添加一个方法，但这是一个坏主意：没有人希望他们的类会被添加新的方法，程序会因奇怪的方式出错。

相反，functools 中的 `singledispatch` 函数可以帮助我们。


```
@singledispatch
def get_area(shape):
    raise NotImplementedError("cannot calculate area for unknown shape",
                              shape)
```

`get_area` 函数的“基类”实现会报错。这保证了如果我们出现一个新的形状时，我们会明确地报错而不是返回一个无意义的结果。


```
@get_area.register(Square)
def _get_area_square(shape):
    return shape.side ** 2
@get_area.register(Circle)
def _get_area_circle(shape):
    return math.pi * (shape.radius ** 2)
```

这种方式的好处是如果某人写了一个匹配我们代码的*新*形状，它们可以自己实现 `get_area`。


```
from area_calculator import get_area

@attr.s(auto_attribs=True, frozen=True)
class Ellipse:
    horizontal_axis: float
    vertical_axis: float

@get_area.register(Ellipse)
def _get_area_ellipse(shape):
    return math.pi * shape.horizontal_axis * shape.vertical_axis
```

*调用* `get_area` 很直接。


```
print(get_area(shape))
```

这意味着我们可以将大量的 `if isintance()`/`elif isinstance()` 的代码以这种方式修改，而无需修改接口。下一次你要修改 if isinstance，你试试 `singledispatch！

在本系列的下一篇文章中，我们将介绍 tox，一个用于自动化 Python 代码测试的工具。

#### 回顾本系列的前几篇文章：

  * [Cython][5]
  * [Black][6]
  * [attrs][7]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-singledispatch

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/singledispatch/
[5]: https://linux.cn/article-10859-1.html
[6]: https://linux.cn/article-10864-1.html
[7]: https://linux.cn/article-10871-1.html
