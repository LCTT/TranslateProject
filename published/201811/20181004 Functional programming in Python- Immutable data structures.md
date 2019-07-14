Python 函数式编程：不可变数据结构
======

> 不可变性可以帮助我们更好地理解我们的代码。下面我将讲述如何在不牺牲性能的条件下来实现它。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D)

在这个由两篇文章构成的系列中，我将讨论如何将函数式编程方法论中的思想引入至 Python 中，来充分发挥这两个领域的优势。

本文（也就是第一篇文章）中，我们将探讨不可变数据结构的优势。第二部分会探讨如何在 `toolz` 库的帮助下，用 Python 实现高层次的函数式编程理念。

为什么要用函数式编程？因为变化的东西更难推理。如果你已经确信变化会带来麻烦，那很棒。如果你还没有被说服，在文章结束时，你会明白这一点的。

我们从思考正方形和矩形开始。如果我们抛开实现细节，单从接口的角度考虑，正方形是矩形的子类吗？

子类的定义基于[里氏替换原则][1]。一个子类必须能够完成超类所做的一切。

如何为矩形定义接口？

```
from zope.interface import Interface

class IRectangle(Interface):
    def get_length(self):
        """正方形能做到"""
    def get_width(self):
        """正方形能做到"""
    def set_dimensions(self, length, width):
        """啊哦"""
```

如果我们这么定义，那正方形就不能成为矩形的子类：如果长度和宽度不等，它就无法对 `set_dimensions` 方法做出响应。

另一种方法，是选择将矩形做成不可变对象。

```
class IRectangle(Interface):
    def get_length(self):
        """正方形能做到"""
    def get_width(self):
        """正方形能做到"""
    def with_dimensions(self, length, width):
        """返回一个新矩形"""
```

现在，我们可以将正方形视为矩形了。在调用 `with_dimensions` 时，它可以返回一个新的矩形（它不一定是个正方形），但它本身并没有变，依然是一个正方形。

这似乎像是个学术问题 —— 直到我们认为正方形和矩形可以在某种意义上看做一个容器的侧面。在理解了这个例子以后，我们会处理更传统的容器，以解决更现实的案例。比如，考虑一下随机存取数组。

我们现在有 `ISquare` 和 `IRectangle`，而且 `ISequere` 是 `IRectangle` 的子类。

我们希望把矩形放进随机存取数组中：

```
class IArrayOfRectangles(Interface):
    def get_element(self, i):
        """返回一个矩形"""
    def set_element(self, i, rectangle):
        """'rectangle' 可以是任意 IRectangle 对象"""
```

我们同样希望把正方形放进随机存取数组：

```
class IArrayOfSquare(Interface):
    def get_element(self, i):
        """返回一个正方形"""
    def set_element(self, i, square):
        """'square' 可以是任意 ISquare 对象"""
```

尽管 `ISquare` 是 `IRectangle` 的子集，但没有任何一个数组可以同时实现 `IArrayOfSquare` 和 `IArrayOfRectangle`.

为什么不能呢？假设 `bucket` 实现了这两个类的功能。

```
>>> rectangle = make_rectangle(3, 4)
>>> bucket.set_element(0, rectangle) # 这是 IArrayOfRectangle 中的合法操作
>>> thing = bucket.get_element(0) # IArrayOfSquare 要求 thing 必须是一个正方形
>>> assert thing.height == thing.width
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError
```

无法同时实现这两类功能，意味着这两个类无法构成继承关系，即使 `ISquare` 是 `IRectangle` 的子类。问题来自 `set_element` 方法：如果我们实现一个只读的数组，那 `IArrayOfSquare` 就可以是 `IArrayOfRectangle` 的子类了。

在可变的 `IRectangle` 和可变的 `IArrayOf*` 接口中，可变性都会使得对类型和子类的思考变得更加困难 —— 放弃变换的能力，意味着我们的直觉所希望的类型间关系能够成立了。

可变性还会带来作用域方面的影响。当一个共享对象被两个地方的代码改变时，这种问题就会发生。一个经典的例子是两个线程同时改变一个共享变量。不过在单线程程序中，即使在两个相距很远的地方共享一个变量，也是一件简单的事情。从 Python 语言的角度来思考，大多数对象都可以从很多位置来访问：比如在模块全局变量，或在一个堆栈跟踪中，或者以类属性来访问。

如果我们无法对共享做出约束，那我们可能要考虑对可变性来进行约束了。

这是一个不可变的矩形，它利用了 [attr][2] 库：

```
@attr.s(frozen=True)
class Rectange(object):
    length = attr.ib()
    width = attr.ib()
    @classmethod
    def with_dimensions(cls, length, width):
        return cls(length, width)
```

这是一个正方形：

```
@attr.s(frozen=True)
class Square(object):
    side = attr.ib()
    @classmethod
    def with_dimensions(cls, length, width):
        return Rectangle(length, width)
```

使用 `frozen` 参数，我们可以轻易地使 `attrs` 创建的类成为不可变类型。正确实现 `__setitem__` 方法的工作都交给别人完成了，对我们是不可见的。

修改对象仍然很容易；但是我们不可能改变它的本质。

```
too_long = Rectangle(100, 4)
reasonable = attr.evolve(too_long, length=10)
```

[Pyrsistent][3] 能让我们拥有不可变的容器。

```
# 由整数构成的向量
a = pyrsistent.v(1, 2, 3)
# 并非由整数构成的向量
b = a.set(1, "hello")
```

尽管 `b` 不是一个由整数构成的向量，但没有什么能够改变 `a` 只由整数构成的性质。

如果 `a` 有一百万个元素呢？`b` 会将其中的 999999 个元素复制一遍吗？`Pyrsistent` 具有“大 O”性能保证：所有操作的时间复杂度都是 `O(log n)`. 它还带有一个可选的 C 语言扩展，以在“大 O”性能之上进行提升。

修改嵌套对象时，会涉及到“变换器”的概念：

```
blog = pyrsistent.m(
    title="My blog",
    links=pyrsistent.v("github", "twitter"),
    posts=pyrsistent.v(
        pyrsistent.m(title="no updates",
                     content="I'm busy"),
        pyrsistent.m(title="still no updates",
                     content="still busy")))
new_blog = blog.transform(["posts", 1, "content"],
                          "pretty busy")
```

`new_blog` 现在将是如下对象的不可变等价物：

```
{'links': ['github', 'twitter'],
 'posts': [{'content': "I'm busy",
            'title': 'no updates'},
           {'content': 'pretty busy',
            'title': 'still no updates'}],
 'title': 'My blog'}
```

不过 `blog` 依然不变。这意味着任何拥有旧对象引用的人都没有受到影响：转换只会有局部效果。

当共享行为猖獗时，这会很有用。例如，函数的默认参数：

```
def silly_sum(a, b, extra=v(1, 2)):
    extra = extra.extend([a, b])
    return sum(extra)
```

在本文中，我们了解了为什么不可变性有助于我们来思考我们的代码，以及如何在不带来过大性能负担的条件下实现它。下一篇，我们将学习如何借助不可变对象来实现强大的程序结构。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/functional-programming-python-immutable-data-structures

作者：[Moshe Zadka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[1]: https://en.wikipedia.org/wiki/Liskov_substitution_principle
[2]: https://www.attrs.org/en/stable/
[3]: https://pyrsistent.readthedocs.io/en/latest/
