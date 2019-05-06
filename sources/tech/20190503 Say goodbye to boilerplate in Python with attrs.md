[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Say goodbye to boilerplate in Python with attrs)
[#]: via: (https://opensource.com/article/19/5/python-attrs)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/moshez)

Say goodbye to boilerplate in Python with attrs
======
Learn more about solving common Python problems in our series covering
seven PyPI libraries.
![Programming at a browser, orange hands][1]

Python is one of the most [popular programming languages][2] in use today—and for good reasons: it's open source, it has a wide range of uses (such as web programming, business applications, games, scientific programming, and much more), and it has a vibrant and dedicated community supporting it. This community is the reason we have such a large, diverse range of software packages available in the [Python Package Index][3] (PyPI) to extend and improve Python and solve the inevitable glitches that crop up.

In this series, we'll look at seven PyPI libraries that can help you solve common Python problems. Today, we'll examine [**attrs**][4], a Python package that helps you write concise, correct code quickly.

### attrs

If you have been using Python for any length of time, you are probably used to writing code like:


```
class Book(object):

def __init__(self, isbn, name, author):
self.isbn = isbn
self.name = name
self.author = author
```

Then you write a **__repr__** function; otherwise, it would be hard to log instances of **Book** :


```
def __repr__(self):
return f"Book({self.isbn}, {self.name}, {self.author})"
```

Next, you write a nice docstring documenting the expected types. But you notice you forgot to add the **edition** and **published_year** attributes, so you have to modify them in five places.

What if you didn't have to?


```
@attr.s(auto_attribs=True)
class Book(object):
isbn: str
name: str
author: str
published_year: int
edition: int
```

Annotating the attributes with types using the new type annotation syntax, **attrs** detects the annotations and creates a class.

ISBNs have a specific format. What if we want to enforce that format?


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

The **attrs** library also has great support for [immutability-style programming][5]. Changing the first line to **@attr.s(auto_attribs=True, frozen=True)** means that **Book** is now immutable: trying to modify an attribute will raise an exception. Instead, we can get a _new_ instance with modification using **attr.evolve(old_book, published_year=old_book.published_year+1)** , for example, if we need to push publication forward by a year.

In the next article in this series, we'll look at **singledispatch** , a library that allows you to add methods to Python libraries retroactively.

#### Review the previous articles in this series

  * [Cython][6]
  * [Black][7]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/python-attrs

作者：[Moshe Zadka ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y (Programming at a browser, orange hands)
[2]: https://opensource.com/article/18/5/numbers-python-community-trends
[3]: https://pypi.org/
[4]: https://pypi.org/project/attrs/
[5]: https://opensource.com/article/18/10/functional-programming-python-immutable-data-structures
[6]: https://opensource.com/article/19/4/7-python-problems-solved-cython
[7]: https://opensource.com/article/19/4/python-problems-solved-black
