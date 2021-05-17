[#]: subject: (Looking back at what Python 3.4 did for enum)
[#]: via: (https://opensource.com/article/21/5/python-34-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Looking back at what Python 3.4 did for enum
======
Plus explore some of the underutilized but still useful Python features.
![old school calculator][1]

This is the fifth in a series of articles about features that first appeared in a version of Python 3.x. Python 3.4 was first released in 2014, and even though it has been out for a long time, many of the features it introduced are underused and pretty cool. Here are three of them.

### enum

One of my favorite logic puzzles is the self-descriptive [Hardest Logic Puzzle Ever][2]. Among other things, it talks about three gods who are called A, B, and C. Their identities are True, False, and Random, in some order. You can ask them questions, but they only answer in the god language, where "da" and "ja" mean "yes" and "no," but you do not know which is which.

If you decide to use Python to solve the puzzle, how would you represent the gods' names and identities and the words in the god language? The traditional answer has been to use strings. However, strings can be misspelled with disastrous consequences.

If, in a critical part of your solution, you compare to the string `jaa` instead of `ja`, you will have an incorrect solution. While the puzzle does not specify what the stakes are, that's probably best avoided.

The `enum` module gives you the ability to define these things in a debuggable yet safe manner:


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

One advantage of enums is that in debugging logs or exceptions, the enum is rendered helpfully:


```
name = Name.A
identity = Identity.RANDOM
answer = Language.da
print("I suspect", name, "is", identity, "because they answered", answer)

[/code] [code]`    I suspect Name.A is Identity.RANDOM because they answered Language.da`
```

### functools.singledispatch

While developing the "infrastructure" layer of a game, you want to deal with various game objects generically but still allow the objects to customize actions. To make the example easier to explain, assume it's a text-based game. When you use an object, most of the time, it will just print `You are using <x>`. But using a special sword might require a random roll, and it will fail otherwise.

When you acquire an object, it is usually added to the inventory. However, a particularly heavy rock will smash a random object; if that happens, the inventory will lose that object.

One way to approach this is to have methods `use` and `acquire` on objects. More and more of these methods will be added as the game's complexity increases, making game objects unwieldy to write.

Instead, `functools.singledispatch` allows you to add methods retroactively—in a safe and namespace-respecting manner.

You can define classes with no behavior:


```
class Torch:
    name="torch"

class Sword:
    name="sword"

class Rock:
    name="rock"

[/code] [code]

import functools

@functools.singledispatch
def use(x):
    print("You use", x.name)

@functools.singledispatch
def acquire(x, inventory):
    inventory.add(x)
```

For the torch, those generic implementations are enough:


```
inventory = set()

def deploy(thing):
    acquire(thing, inventory)
    use(thing)
    print("You have", [item.name for item in inventory])

deploy(Torch())

[/code] [code]

    You use torch
    You have ['torch']
```

However, the sword and the rock need some specialized functionality:


```
import random

@use.register(Sword)
def use_sword(sword):
    print("You try to use", sword.name)
    if random.random() &lt; 0.9:
        print("You succeed")
    else:
        print("You fail")

deploy(sword)

[/code] [code]

    You try to use sword
    You succeed
    You have ['sword', 'torch']

[/code] [code]

import random

@acquire.register(Rock)
def acquire_rock(rock, inventory):
    to_remove = random.choice(list(inventory))
    inventory.remove(to_remove)
    inventory.add(rock)

deploy(Rock())

[/code] [code]

    You use rock
    You have ['sword', 'rock']
```

The rock might have crushed the torch, but your code is much easier to read.

### pathlib

The interface to file paths in Python has been "smart-string manipulation" since the beginning of time. Now, with `pathlib`, Python has an object-oriented way to manipulate paths:


```
`import pathlib`[/code] [code]

gitconfig = pathlib.Path.home() / ".gitconfig"
text = gitconfig.read_text().splitlines()
```

Admittedly, using `/` as an operator to generate path names is a little cutesy, but it ends up being nice in practice. Methods like `.read_text()` allow you to get text out of small files without needing to open and close file handles manually.

This lets you concentrate on the important stuff:


```
for line in text:
    if not line.strip().startswith("name"):
        continue
    print(line.split("=")[1])

[/code] [code]`     Moshe Zadka`
```

### Welcome to 2014

Python 3.4 was released about seven years ago, but some of the features that first showed up in this release are cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-34-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://en.wikipedia.org/wiki/The_Hardest_Logic_Puzzle_Ever
