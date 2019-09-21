[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Say goodbye to boilerplate in Python with attrs)
[#]: via: (https://opensource.com/article/19/5/python-attrs)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez/users/moshez)

使用 attrs 来告别 Python 中的样板
======

> 在我们覆盖 7 个 PyPI 库的系列文章中了解更多解决 Python 问题的信息。

![Programming at a browser, orange hands](https://img.linux.net.cn/data/attachment/album/201905/18/211211lhqqbemqwkeqc2bb.jpg)

Python是当今使用最多[流行的编程语言][2]之一，因为：它是开源的，它具有广泛的用途（例如 Web 编程、业务应用、游戏、科学编程等等），它有一个充满活力和专注的社区支持它。这个社区是我们在 [Python Package Index][3]（PyPI）中提供如此庞大、多样化的软件包的原因，用以扩展和改进 Python。并解决不可避免的问题。

在本系列中，我们将介绍七个可以帮助你解决常见 Python 问题的 PyPI 库。今天，我们将研究 [attrs][4]，这是一个帮助你快速编写简洁、正确的代码的 Python 包。

### attrs

如果你已经写过一段时间的 Python，那么你可能习惯这样写代码：

```
class Book(object):

    def __init__(self, isbn, name, author):
        self.isbn = isbn
        self.name = name
        self.author = author
```

接着写一个 `__repr__` 函数。否则，很难记录 `Book` 的实例：


```
def __repr__(self):
    return f"Book({self.isbn}, {self.name}, {self.author})"
```

接下来你会写一个好看的 docstring 来记录期望的类型。但是你注意到你忘了添加 `edition` 和 `published_year` 属性，所以你必须在五个地方修改它们。

如果你不必这么做如何？

```
@attr.s(auto_attribs=True)
class Book(object):
    isbn: str
    name: str
    author: str
    published_year: int
    edition: int
```

使用新的类型注释语法注释类型属性，`attrs` 会检测注释并创建一个类。

ISBN 有特定格式。如果我们想强行使用该格式怎么办？

```
@attr.s(auto_attribs=True)
class Book(object):
    isbn: str = attr.ib()
    @isbn.validator
    def pattern_match(self, attribute, value):
        m = re.match(r"^(\d{3}-)\d{1,3}-\d{2,3}-\d{1,7}-\d$", value)
        if not m:
            raise ValueError("incorrect format for isbn", value)
    name: str 
    author: str
    published_year: int
    edition: int
```

`attrs` 库也对[不可变式编程][5]支持良好。将第一行改成 `@attr.s(auto_attribs=True, frozen=True)` 意味着 `Book` 现在是不可变的：尝试修改一个属性将会引发一个异常。相反，比如，如果希望将发布日期向后一年，我们可以修改成 `attr.evolve(old_book, published_year=old_book.published_year+1)` 来得到一个*新的*实例。

本系列的下一篇文章我们将来看下 `singledispatch`，一个能让你向 Python 库添加方法的库。

#### 查看本系列先前的文章

* [Cython][6]
* [Black][7]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-attrs

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y (Programming at a browser, orange hands)
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/attrs/
[5]: https://opensource.com/article/18/10/functional-programming-python-immutable-data-structures
[6]: https://linux.cn/article-10859-1.html
[7]: https://linux.cn/article-10864-1.html
