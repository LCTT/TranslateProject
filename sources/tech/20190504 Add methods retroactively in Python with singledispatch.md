[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add methods retroactively in Python with singledispatch)
[#]: via: (https://opensource.com/article/19/5/python-singledispatch)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez)

Add methods retroactively in Python with singledispatch
======
Learn more about solving common Python problems in our series covering
seven PyPI libraries.
![][1]

Python is one of the most [popular programming languages][2] in use today—and for good reasons: it's open source, it has a wide range of uses (such as web programming, business applications, games, scientific programming, and much more), and it has a vibrant and dedicated community supporting it. This community is the reason we have such a large, diverse range of software packages available in the [Python Package Index][3] (PyPI) to extend and improve Python and solve the inevitable glitches that crop up.

In this series, we'll look at seven PyPI libraries that can help you solve common Python problems. Today, we'll examine [**singledispatch**][4], a library that allows you to add methods to Python libraries retroactively.

### singledispatch

Imagine you have a "shapes" library with a **Circle** class, a **Square** class, etc.

A **Circle** has a **radius** , a **Square** has a **side** , and a **Rectangle** has **height** and **width**. Our library already exists; we do not want to change it.

However, we do want to add an **area** calculation to our library. If we didn't share this library with anyone else, we could just add an **area** method so we could call **shape.area()** and not worry about what the shape is.

While it is possible to reach into a class and add a method, this is a bad idea: nobody expects their class to grow new methods, and things might break in weird ways.

Instead, the **singledispatch** function in **functools** can come to our rescue.


```
@singledispatch
def get_area(shape):
raise NotImplementedError("cannot calculate area for unknown shape",
shape)
```

The "base" implementation for the **get_area** function fails. This makes sure that if we get a new shape, we will fail cleanly instead of returning a nonsense result.


```
@get_area.register(Square)
def _get_area_square(shape):
return shape.side ** 2
@get_area.register(Circle)
def _get_area_circle(shape):
return math.pi * (shape.radius ** 2)
```

One nice thing about doing things this way is that if someone writes a _new_ shape that is intended to play well with our code, they can implement **get_area** themselves.


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

_Calling_ **get_area** is straightforward.


```
`print(get_area(shape))`
```

This means we can change a function that has a long **if isintance()/elif isinstance()** chain to work this way, without changing the interface. The next time you are tempted to check **if isinstance** , try using **singledispatch**!

In the next article in this series, we'll look at **tox** , a tool for automating tests on Python code.

#### Review the previous articles in this series:

  * [Cython][5]
  * [Black][6]
  * [attrs][7]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-singledispatch

作者：[Moshe Zadka ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/singledispatch/
[5]: https://opensource.com/article/19/4/7-python-problems-solved-cython
[6]: https://opensource.com/article/19/4/python-problems-solved-black
[7]: https://opensource.com/article/19/4/python-problems-solved-attrs
