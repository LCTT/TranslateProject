[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11752-1.html)
[#]: subject: (An advanced look at Python interfaces using zope.interface)
[#]: via: (https://opensource.com/article/19/9/zopeinterface-python-package)
[#]: author: (Moshe Zadka https://opensource.com/users/moshezhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/sethhttps://opensource.com/users/drmjg)

借助 zope.interface 深入了解 Python 接口
======

> Zope.interface 可以帮助声明存在哪些接口，是由哪些对象提供的，以及如何查询这些信息。

![Snake charmer cartoon with a yellow snake and a blue snake][1]

`zope.interface` 库可以克服 Python 接口设计中的歧义性。让我们来研究一下。

### 隐式接口不是 Python 之禅

[Python 之禅][2] 很宽松，但是有点自相矛盾，以至于你可以用它来例证任何东西。让我们来思考其中最著名的原则之一：“显示胜于隐式”。

传统上，在 Python 中会隐含的一件事是预期的接口。比如函数已经记录了它期望一个“类文件对象”或“序列”。但是什么是类文件对象呢？它支持 `.writelines`吗？`.seek` 呢？什么是一个“序列”？是否支持步进切片，例如 `a[1:10:2]`？

最初，Python 的答案是所谓的“鸭子类型”，取自短语“如果它像鸭子一样行走，像鸭子一样嘎嘎叫，那么它可能就是鸭子”。换句话说，“试试看”，这可能是你能得到的最具隐式的表达。

为了使这些内容显式地表达出来，你需要一种方法来表达期望的接口。[Zope][3] Web 框架是最早用 Python 编写的大型系统之一，它迫切需要这些东西来使代码明确呈现出来，例如，期望从“类似用户的对象”获得什么。

`zope.interface` 由 Zope 开发，但作为单独的 Python 包发布。`Zope.interface` 可以帮助声明存在哪些接口，是由哪些对象提供的，以及如何查询这些信息。

想象编写一个简单的 2D 游戏，它需要各种东西来支持精灵界面（LCTT 译注：“<ruby>精灵<rt> Sprite</rt></ruby>”是指游戏面板中各个组件）。例如，表示一个边界框，但也要表示对象何时与一个框相交。与一些其他语言不同，在 Python 中，将属性访问作为公共接口一部分是一种常见的做法，而不是实现 getter 和 setter。边界框应该是一个属性，而不是一个方法。

呈现精灵列表的方法可能类似于：

```
def render_sprites(render_surface, sprites):
    """
    sprites 应该是符合 Sprite 接口的对象列表：
    * 一个名为 "bounding_box" 的属性，包含了边界框
    * 一个名为 "intersects" 的方法，它接受一个边界框并返回 True 或 False
    """
    pass # 一些做实际渲染的代码
```

该游戏将具有许多处理精灵的函数。在每个函数中，你都必须在随附文档中指定预期。

此外，某些函数可能期望使用更复杂的精灵对象，例如具有 Z 序的对象。我们必须跟踪哪些方法需要 Sprite 对象，哪些方法需要 SpriteWithZ 对象。

如果能够使精灵是显式而直观的，这样方法就可以声明“我需要一个精灵”，并有个严格定义的接口，这不是很好吗？来看看 `zope.interface`。

```
from zope import interface

class ISprite(interface.Interface):

    bounding_box = interface.Attribute(
        "边界框"
    )

    def intersects(box):
        "它和一个框相交吗？"
```

乍看起来，这段代码有点奇怪。这些方法不包括 `self`，而包含 `self` 是一种常见的做法，并且它有一个**属性**。这是在 `zope.interface` 中声明接口的方法。这看起来很奇怪，因为大多数人不习惯严格声明接口。

这样做的原因是接口显示了如何调用方法，而不是如何定义方法。因为接口不是超类，所以它们可以用来声明数据属性。

下面是一个能带有圆形精灵的接口的一个实现：

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
        # 当且仅当至少一个角在圆内时，方框与圆相交
        top_left, bottom_right = box[:2], box[2:]
        for choose_x_from (top_left, bottom_right):
            for choose_y_from (top_left, bottom_right):
                x = choose_x_from[0]
                y = choose_y_from[1]
                if (((x - self.x) ` 2 + (y - self.y) ` 2) &lt;=
                    self.radius ` 2):
                     return True
        return False
```

这**显式**声明了实现了该接口的 `CircleSprite` 类。它甚至能让我们验证该类是否正确实现了接口：

```
from zope.interface import verify

def test_implementation():
    sprite = CircleSprite(x=0, y=0, radius=1)
    verify.verifyObject(ISprite, sprite)
```

这可以由 pytest、nose 或其他测试框架运行，它将验证创建的精灵是否符合接口。测试通常是局部的：它不会测试仅在文档中提及的内容，甚至不会测试方法是否可以在没有异常的情况下被调用！但是，它会检查是否存在正确的方法和属性。这是对单元测试套件一个很好的补充，至少可以防止简单的拼写错误通过测试。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/zopeinterface-python-package

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshezhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/sethhttps://opensource.com/users/drmjg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Snake charmer cartoon with a yellow snake and a blue snake)
[2]: https://en.wikipedia.org/wiki/Zen_of_Python
[3]: http://zope.org
