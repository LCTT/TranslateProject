[#]: subject: (Slice infinite generators with this Python 3.7 feature)
[#]: via: (https://opensource.com/article/21/5/python-37-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13459-1.html)

用这个 Python 3.7 的特性来切片无限生成器
======

> 了解更多关于这个和其他两个未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202106/05/230956bgcjacwcyujlndez.jpg)

这是关于 Python 3.x 首发特性系列文章的第八篇。[Python 3.7][2] 于 2018 年首次发布，尽管它已经发布了几年，但它引入的许多特性都未被充分利用，而且相当酷。下面是其中的三个。

### 注解推迟评估

在 Python 3.7 中，只要激活了正确的 `__future__` 标志，注解在运行时就不会被评估：

```
from __future__ import annotations

def another_brick(wall: List[Brick], brick: Brick) -> Education:
    pass
```

```
another_brick.__annotations__
```

```
    {'wall': 'List[Brick]', 'brick': 'Brick', 'return': 'Education'}
```

它使递归类型（指向自己的类）和其他有趣的事情成为了可能。然而，这意味着如果你想做自己的类型分析，你需要明确地使用 `ast`。

```
import ast
raw_type = another_brick.__annotations__['wall']
[parsed_type] = ast.parse(raw_type).body
```

```
subscript = parsed_type.value
f"{subscript.value.id}[{subscript.slice.id}]"
```

```
    'List[Brick]'
```

### itertools.islice 支持 __index__

Python 中的序列切片长期以来一直接受各种 _类 int 对象_（具有 `__index__()` 的对象）作为有效的切片部分。然而，直到 Python 3.7，`itertools.islice`，即核心 Python 中对无限生成器进行切片的唯一方法，才获得了这种支持。

例如，现在可以用 `numpy.short` 大小的整数来切片无限生成器：

```
import numpy
short_1 = numpy.short(1)
short_3 = numpy.short(3)
short_1, type(short_1)
``` 

```
    (1, numpy.int16)
```

```
import itertools
list(itertools.islice(itertools.count(), short_1, short_3))
```

```
    [1, 2]
```

### functools.singledispatch() 注解注册

如果你认为 [singledispatch][3] 已经很酷了，你错了。现在可以根据注解来注册了：

```
import attr
import math
from functools import singledispatch

@attr.s(auto_attribs=True, frozen=True)
class Circle:
    radius: float
       
@attr.s(auto_attribs=True, frozen=True)
class Square:
    side: float

@singledispatch
def get_area(shape):
    raise NotImplementedError("cannot calculate area for unknown shape",
                              shape)

@get_area.register
def _get_area_square(shape: Square):
    return shape.side ** 2

@get_area.register
def _get_area_circle(shape: Circle):
    return math.pi * (shape.radius ** 2)

get_area(Circle(1)), get_area(Square(1))
```

```
    (3.141592653589793, 1)
```

### 欢迎来到 2017 年

Python 3.7 大约是四年前发布的，但是在这个版本中首次出现的一些特性非常酷，而且没有得到充分利用。如果你还没使用，那么将它们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-37-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/downloads/cheat-sheet-python-37-beginners
[3]: https://opensource.com/article/19/5/python-singledispatch
