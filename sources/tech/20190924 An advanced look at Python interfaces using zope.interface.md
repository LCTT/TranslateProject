[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An advanced look at Python interfaces using zope.interface)
[#]: via: (https://opensource.com/article/19/9/zopeinterface-python-package)
[#]: author: (Moshe Zadka https://opensource.com/users/moshezhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/sethhttps://opensource.com/users/drmjg)

An advanced look at Python interfaces using zope.interface
======
Zope.interface helps declare what interfaces exist, which objects
provide them, and how to query for that information.
![Snake charmer cartoon with a yellow snake and a blue snake][1]

The **zope.interface** library is a way to overcome ambiguity in Python interface design. Let's take a look at it.

### Implicit interfaces are not zen

The [Zen of Python][2] is loose enough and contradicts itself enough that you can prove anything from it. Let's meditate upon one of its most famous principles: "Explicit is better than implicit."

One thing that traditionally has been implicit in Python is the expected interface. Functions have been documented to expect a "file-like object" or a "sequence." But what is a file-like object? Does it support **.writelines**? What about **.seek**? What is a "sequence"? Does it support step-slicing, such as **a[1:10:2]**?

Originally, Python's answer was the so-called "duck-typing," taken from the phrase "if it walks like a duck and quacks like a duck, it's probably a duck." In other words, "try it and see," which is possibly the most implicit you could possibly get.

In order to make those things explicit, you need a way to express expected interfaces. One of the first big systems written in Python was the [Zope][3] web framework, and it needed those things desperately to make it obvious what rendering code, for example, expected from a "user-like object."

Enter **zope.interface**, which is developed by Zope but published as a separate Python package. **Zope.interface** helps declare what interfaces exist, which objects provide them, and how to query for that information.

Imagine writing a simple 2D game that needs various things to support a "sprite" interface; e.g., indicate a bounding box, but also indicate when the object intersects with a box. Unlike some other languages, in Python, attribute access as part of the public interface is a common practice, instead of implementing getters and setters. The bounding box should be an attribute, not a method.

A method that renders the list of sprites might look like:


```
def render_sprites(render_surface, sprites):
    """
    sprites should be a list of objects complying with the Sprite interface:
    * An attribute "bounding_box", containing the bounding box.
    * A method called "intersects", that accepts a box and returns
      True or False
    """
    pass # some code that would actually render
```

The game will have many functions that deal with sprites. In each of them, you would have to specify the expected contract in a docstring.

Additionally, some functions might expect a more sophisticated sprite object, maybe one that has a Z-order. We would have to keep track of which methods expect a Sprite object, and which expect a SpriteWithZ object.

Wouldn't it be nice to be able to make what a sprite is explicit and obvious so that methods could declare "I need a sprite" and have that interface strictly defined? Enter **zope.interface**.


```
from zope import interface

class ISprite(interface.Interface):

    bounding_box = interface.Attribute(
        "The bounding box"
    )

    def intersects(box):
        "Does this intersect with a box"
```

This code looks a bit strange at first glance. The methods do not include a **self**, which is a common practice, and it has an **Attribute** thing. This is the way to declare interfaces in **zope.interface**. It looks strange because most people are not used to strictly declaring interfaces.

The reason for this practice is that the interface shows how the method will be called, not how it is defined. Because interfaces are not superclasses, they can be used to declare data attributes.

One possible implementation of the interface can be with a circular sprite:


```
@implementer(ISprite)
@attr.s(auto_attribs=True)
class CircleSprite:
    x: float
    y: float
    radius: float

    @property
    def bounding_box(self):
        return (
            self.x - self.radius,
            self.y - self.radius,
            self.x + self.radius,
            self.y + self.radius,
        )

    def intersects(self, box):
        # A box intersects a circle if and only if
        # at least one corner is inside the circle.
        top_left, bottom_right = box[:2], box[2:]
        for choose_x_from (top_left, bottom_right):
            for choose_y_from (top_left, bottom_right):
                x = choose_x_from[0]
                y = choose_y_from[1]
                if (((x - self.x) ** 2 + (y - self.y) ** 2) &lt;=
                    self.radius ** 2):
                     return True
        return False
```

This _explicitly_ declares that the **CircleSprite** class implements the interface. It even enables us to verify that the class implements it properly:


```
from zope.interface import verify

def test_implementation():
    sprite = CircleSprite(x=0, y=0, radius=1)
    verify.verifyObject(ISprite, sprite)
```

This is something that can be run by **pytest**, **nose**, or another test runner, and it will verify that the sprite created complies with the interface. The test is often partial: it will not test anything only mentioned in the documentation, and it will not even test that the methods can be called without exceptions! However, it does check that the right methods and attributes exist. This is a nice addition to the unit test suite and—at a minimum—prevents simple misspellings from passing the tests.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/zopeinterface-python-package

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshezhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/sethhttps://opensource.com/users/drmjg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Snake charmer cartoon with a yellow snake and a blue snake)
[2]: https://en.wikipedia.org/wiki/Zen_of_Python
[3]: http://zope.org
