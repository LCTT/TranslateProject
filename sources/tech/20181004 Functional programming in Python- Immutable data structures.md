Translating by Ryze-Borgia
Functional programming in Python: Immutable data structures
======
Immutability can help us better understand our code. Here's how to achieve it without sacrificing performance.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D)

In this two-part series, I will discuss how to import ideas from the functional programming methodology into Python in order to have the best of both worlds.

This first post will explore how immutable data structures can help. The second part will explore higher-level functional programming concepts in Python using the **toolz** library.

Why functional programming? Because mutation is hard to reason about. If you are already convinced that mutation is problematic, great. If you're not convinced, you will be by the end of this post.

Let's begin by considering squares and rectangles. If we think in terms of interfaces, neglecting implementation details, are squares a subtype of rectangles?

The definition of a subtype rests on the [Liskov substitution principle][1]. In order to be a subtype, it must be able to do everything the supertype does.

How would we define an interface for a rectangle?

```
from zope.interface import Interface

class IRectangle(Interface):
    def get_length(self):
        """Squares can do that"""
    def get_width(self):
        """Squares can do that"""
    def set_dimensions(self, length, width):
        """Uh oh"""
```

If this is the definition, then squares cannot be a subtype of rectangles; they cannot respond to a `set_dimensions` method if the length and width are different.

A different approach is to choose to make rectangles immutable.

```
class IRectangle(Interface):
    def get_length(self):
        """Squares can do that"""
    def get_width(self):
        """Squares can do that"""
    def with_dimensions(self, length, width):
        """Returns a new rectangle"""
```

Now, a square can be a rectangle. It can return a new rectangle (which would not usually be a square) when `with_dimensions` is called, but it would not stop being a square.

This might seem like an academic problem—until we consider that squares and rectangles are, in a sense, a container for their sides. After we understand this example, the more realistic case this comes into play with is more traditional containers. For example, consider random-access arrays.

We have `ISquare` and `IRectangle`, and `ISquare` is a subtype of `IRectangle`.

We want to put rectangles in a random-access array:

```
class IArrayOfRectangles(Interface):
    def get_element(self, i):
        """Returns Rectangle"""
    def set_element(self, i, rectangle):
        """'rectangle' can be any IRectangle"""
```

We want to put squares in a random-access array too:

```
class IArrayOfSquare(Interface):
    def get_element(self, i):
        """Returns Square"""
    def set_element(self, i, square):
        """'square' can be any ISquare"""
```

Even though `ISquare` is a subtype of `IRectangle`, no array can implement both `IArrayOfSquare` and `IArrayOfRectangle`.

Why not? Assume `bucket` implements both.

```
>>> rectangle = make_rectangle(3, 4)
>>> bucket.set_element(0, rectangle) # This is allowed by IArrayOfRectangle
>>> thing = bucket.get_element(0) # That has to be a square by IArrayOfSquare
>>> assert thing.height == thing.width
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError
```

Being unable to implement both means that neither is a subtype of the other, even though `ISquare` is a subtype of `IRectangle`. The problem is the `set_element` method: If we had a read-only array, `IArrayOfSquare` would be a subtype of `IArrayOfRectangle`.

Mutability, in both the mutable `IRectangle` interface and the mutable `IArrayOf*` interfaces, has made thinking about types and subtypes much more difficult—and giving up on the ability to mutate meant that the intuitive relationships we expected to have between the types actually hold.

Mutation can also have non-local effects. This happens when a shared object between two places is mutated by one. The classic example is one thread mutating a shared object with another thread, but even in a single-threaded program, sharing between places that are far apart is easy. Consider that in Python, most objects are reachable from many places: as a module global, or in a stack trace, or as a class attribute.

If we cannot constrain the sharing, we might think about constraining the mutability.

Here is an immutable rectangle, taking advantage of the [attrs][2] library:

```
@attr.s(frozen=True)
class Rectange(object):
    length = attr.ib()
    width = attr.ib()
    @classmethod
    def with_dimensions(cls, length, width):
        return cls(length, width)
```

Here is a square:

```
@attr.s(frozen=True)
class Square(object):
    side = attr.ib()
    @classmethod
    def with_dimensions(cls, length, width):
        return Rectangle(length, width)
```

Using the `frozen` argument, we can easily have `attrs`-created classes be immutable. All the hard work of writing `__setitem__` correctly has been done by others and is completely invisible to us.

It is still easy to modify objects; it's just nigh impossible to mutate them.

```
too_long = Rectangle(100, 4)
reasonable = attr.evolve(too_long, length=10)
```

The [Pyrsistent][3] package allows us to have immutable containers.

```
# Vector of integers
a = pyrsistent.v(1, 2, 3)
# Not a vector of integers
b = a.set(1, "hello")
```

While `b` is not a vector of integers, nothing will ever stop `a` from being one.

What if `a` was a million elements long? Is `b` going to copy 999,999 of them? Pyrsistent comes with "big O" performance guarantees: All operations take `O(log n)` time. It also comes with an optional C extension to improve performance beyond the big O.

For modifying nested objects, it comes with a concept of "transformers:"

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

`new_blog` will now be the immutable equivalent of

```
{'links': ['github', 'twitter'],
 'posts': [{'content': "I'm busy",
            'title': 'no updates'},
           {'content': 'pretty busy',
            'title': 'still no updates'}],
 'title': 'My blog'}
```

But `blog` is still the same. This means anyone who had a reference to the old object has not been affected: The transformation had only local effects.

This is useful when sharing is rampant. For example, consider default arguments:

```
def silly_sum(a, b, extra=v(1, 2)):
    extra = extra.extend([a, b])
    return sum(extra)
```

In this post, we have learned why immutability can be useful for thinking about our code, and how to achieve it without an extravagant performance price. Next time, we will learn how immutable objects allow us to use powerful programming constructs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/functional-programming-python-immutable-data-structures

作者：[Moshe Zadka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[1]: https://en.wikipedia.org/wiki/Liskov_substitution_principle
[2]: https://www.attrs.org/en/stable/
[3]: https://pyrsistent.readthedocs.io/en/latest/
