[#]: subject: (Slice infinite generators with this Python 3.7 feature)
[#]: via: (https://opensource.com/article/21/5/python-37-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Slice infinite generators with this Python 3.7 feature
======
Learn more about this and two other underutilized but still useful
Python features.
![Hands on a keyboard with a Python book ][1]

This is the eighth in a series of articles about features that first appeared in a version of Python 3.x. [Python 3.7][2] was first released in 2018, and even though it has been out for a few years, many of the features it introduced are underused and pretty cool. Here are three of them.

### Postponed evaluation of annotations

In Python 3.7, as long as the right `__future__` flags are activated, annotations are not evaluated during runtime:


```
from __future__ import annotations

def another_brick(wall: List[Brick], brick: Brick) -&gt; Education:
    pass

```
```
`another_brick.__annotations__`
```
```
`    {'wall': 'List[Brick]', 'brick': 'Brick', 'return': 'Education'}`
```

This allows recursive types (classes that refer to themselves) and other fun things. However, it means that if you want to do your own type analysis, you need to use `ast` explictly:


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
`    'List[Brick]'`
```

### itertools.islice supports __index__

Sequence slices in Python have long accepted all kinds of _int-like objects_ (objects that have `__index__()`) as valid slice parts. However, it wasn't until Python 3.7 that `itertools.islice`, the only way in core Python to slice infinite generators, gained this support.

For example, now it is possible to slice infinite generators by `numpy.short`-sized integers:


```
import numpy
short_1 = numpy.short(1)
short_3 = numpy.short(3)
short_1, type(short_1)

``` 
```
`    (1, numpy.int16)`
```
```

import itertools
list(itertools.islice(itertools.count(), short_1, short_3))

```
```
`    [1, 2]`
```

### functools.singledispatch() annotation registration

If you thought [singledispatch][3] couldn't get any cooler, you were wrong. Now it is possible to register based on annotations:


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
`    (3.141592653589793, 1)`
```

### Welcome to 2017

Python 3.7 was released about four years ago, but some of the features that first showed up in this release are cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-37-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/downloads/cheat-sheet-python-37-beginners
[3]: https://opensource.com/article/19/5/python-singledispatch
