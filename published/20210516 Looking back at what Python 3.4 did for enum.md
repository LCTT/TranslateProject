[#]: subject: (Looking back at what Python 3.4 did for enum)
[#]: via: (https://opensource.com/article/21/5/python-34-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13443-1.html)

回顾一下 Python 3.4 中的枚举
======

> 另外探索一些未被充分利用但仍然有用的 Python 特性。

![](https://img.linux.net.cn/data/attachment/album/202105/30/230947j19r2772m12tccrh.jpg)

这是 Python 3.x 首发特性系列文章的第五篇。Python 3.4 在 2014 年首次发布，尽管它已经发布了很长时间，但它引入的许多特性都没有被充分利用，而且相当酷。下面是其中的三个。

### 枚举

我最喜欢的逻辑谜题之一是自我描述的 [史上最难的逻辑谜题][2]。在其中，它谈到了三个“神”，他们被称为 A、B 和 C，他们的身份是真、假和随机，按一定顺序排列。你可以问他们问题，但他们只用神的语言回答，其中 “da” 和 “ja” 表示 “是” 和 “不是”，但你不知道哪个是哪个。

如果你决定使用 Python 来解决这个问题，你将如何表示神的名字和身份以及神的语言中的词语？传统的答案是使用字符串。然而，字符串的拼写错误可能会带来灾难性的后果。

如果在解题的关键部分，你用字符串 “jaa” 而不是 “ja” 进行比较，你就会得到一个错误的答案。虽然谜题没有说明风险是什么，但这可能是最好的避免方式。

`enum` 模块让你能够以一种可调试但安全的方式来定义这些东西：

```
import enum

@enum.unique
class Name(enum.Enum):
    A = enum.auto()
    B = enum.auto()
    C = enum.auto()
   
@enum.unique
class Identity(enum.Enum):
    RANDOM = enum.auto()
    TRUE = enum.auto()
    FALSE = enum.auto()

       
@enum.unique
class Language(enum.Enum):
    ja = enum.auto()
    da = enum.auto()
```

枚举的一个好处是，在调试日志或异常中，枚举的呈现方式是有帮助的：

```
name = Name.A
identity = Identity.RANDOM
answer = Language.da
print("I suspect", name, "is", identity, "because they answered", answer)
```

```
    I suspect Name.A is Identity.RANDOM because they answered Language.da
```

### functools.singledispatch

在开发游戏的“基础设施”层时，你想通用地处理各种游戏对象，但仍然允许这些对象自定义动作。为了使这个例子更容易解释，假设这是一个基于文本的游戏。当你使用一个对象时，大多数情况下，它只会打印 `You are using <x>`。但是使用一把特殊的剑可能需要随机滚动，否则会失败。

当你获得一个物品时，它通常会被添加到库存中。然而，一块特别重的石头会砸碎一个随机物品。如果发生这种情况，库存中会失去该物体。

处理这个问题的一个方法是在物品上设置 `use` 和 `acquire` 方法。随着游戏复杂性的增加，这些方法会越来越多，使游戏对象变得难以编写。

相反，`functools.singledispatch` 允许你以安全和尊重命名空间的方式追溯性地添加方法。

你可以定义没有行为的类：

```
class Torch:
    name="torch"

class Sword:
    name="sword"

class Rock:
    name="rock"
```

```
import functools

@functools.singledispatch
def use(x):
    print("You use", x.name)

@functools.singledispatch
def acquire(x, inventory):
    inventory.add(x)
```

对于火炬来说，这些通用的实现已经足够了：

```
inventory = set()

def deploy(thing):
    acquire(thing, inventory)
    use(thing)
    print("You have", [item.name for item in inventory])

deploy(Torch())
```

```
    You use torch
    You have ['torch']
```

然而，剑和石头需要一些专门的功能：

```
import random

@use.register(Sword)
def use_sword(sword):
    print("You try to use", sword.name)
    if random.random() < 0.9:
        print("You succeed")
    else:
        print("You fail")

deploy(sword)
```

```
    You try to use sword
    You succeed
    You have ['sword', 'torch']
```

```
import random

@acquire.register(Rock)
def acquire_rock(rock, inventory):
    to_remove = random.choice(list(inventory))
    inventory.remove(to_remove)
    inventory.add(rock)

deploy(Rock())
```

```
    You use rock
    You have ['sword', 'rock']
```

岩石可能压碎了火炬，但你的代码更容易阅读。

### pathlib

从一开始，Python 中文件路径的接口就是“智能字符串操作”。现在，通过 `pathlib`，Python 有了一种面向对象的方法来操作路径。

```
import pathlib
```

```
gitconfig = pathlib.Path.home() / ".gitconfig"
text = gitconfig.read_text().splitlines()
```

诚然，用 `/` 作为操作符来生成路径名有点俗气，但在实践中却不错。像 `.read_text()` 这样的方法允许你从小文件中获取文本，而不需要手动打开和关闭文件句柄。

这使你可以集中精力处理重要的事情：

```
for line in text:
    if not line.strip().startswith("name"):
        continue
    print(line.split("=")[1])
```

```
     Moshe Zadka
```

### 欢迎来到 2014 年

Python 3.4 大约在七年前就发布了，但是在这个版本中首次出现的一些功能非常酷，而且没有得到充分利用。如果你还没使用，那么将他们添加到你的工具箱中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-34-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://en.wikipedia.org/wiki/The_Hardest_Logic_Puzzle_Ever
