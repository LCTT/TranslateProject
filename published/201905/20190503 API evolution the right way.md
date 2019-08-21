[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10900-1.html)
[#]: subject: (API evolution the right way)
[#]: via: (https://opensource.com/article/19/5/api-evolution-right-way)
[#]: author: (A. Jesse https://opensource.com/users/emptysquare)

API 演进的正确方式
======

> 负责任的库作者与其用户的十个约定。

![Browser of things](https://img.linux.net.cn/data/attachment/album/201905/26/134131jnymeg7t7gmo6qcy.jpg)

想象一下你是一个造物主，为一个生物设计一个身体。出于仁慈，你希望它能随着时间进化：首先，因为它必须对环境的变化作出反应；其次，因为你的智慧在增长，你对这个小东西想到了更好的设计，它不应该永远保持一个样子。

![Serpents][2]

然而，这个生物可能有赖于其目前解剖学的特征。你不能无所顾忌地添加翅膀或改变它的身材比例。它需要一个有序的过程来适应新的身体。作为一个负责任的设计者，你如何才能温柔地引导这种生物走向更大的进步呢？

对于负责任的库维护者也是如此。我们向依赖我们代码的人保证我们的承诺：我们会发布 bug 修复和有用的新特性。如果对库的未来有利，我们有时会删除某些特性。我们会不断创新，但我们不会破坏使用我们库的人的代码。我们怎样才能一次实现所有这些目标呢？

### 添加有用的特性

你的库不应该永远保持不变：你应该添加一些特性，使你的库更适合用户。例如，如果你有一个爬行动物类，并且如果有个可以飞行的翅膀是有用的，那就去添加吧。

```
class Reptile:
    @property
    def teeth(self):
        return 'sharp fangs'

    # 如果 wings 是有用的，那就添加它!
    @property
    def wings(self):
        return 'majestic wings'
```

但要注意，特性是有风险的。考虑 Python 标准库中以下功能，看看它出了什么问题。

```
bool(datetime.time(9, 30)) == True
bool(datetime.time(0, 0)) == False
```

这很奇怪：将任何时间对象转换为布尔值都会得到 True，但午夜时间除外。（更糟糕的是，时区感知时间的规则更加奇怪。）

我已经写了十多年的 Python 了，但直到上周才发现这条规则。这种奇怪的行为会在用户代码中引起什么样的 bug？

比如说一个日历应用程序，它带有一个创建事件的函数。如果一个事件有一个结束时间，那么函数也应该要求它有一个开始时间。

```
def create_event(day,
                 start_time=None,
                 end_time=None):
    if end_time and not start_time:
        raise ValueError("Can't pass end_time without start_time")

# 女巫集会从午夜一直开到凌晨 4 点
create_event(datetime.date.today(),
             datetime.time(0, 0),
             datetime.time(4, 0))
```

不幸的是，对于女巫来说，从午夜开始的事件无法通过校验。当然，一个了解午夜怪癖的细心程序员可以正确地编写这个函数。

```
def create_event(day,
                 start_time=None,
                 end_time=None):
    if end_time is not None and start_time is None:
        raise ValueError("Can't pass end_time without start_time")
```

但这种微妙之处令人担忧。如果一个库作者想要创建一个伤害用户的 API，那么像午夜的布尔转换这样的“特性”很有效。

![Man being chased by an alligator][3]

但是，负责任的创建者的目标是使你的库易于正确使用。

这个功能是由 Tim Peters 在 2002 年首次编写 datetime 模块时造成的。即时是像 Tim 这样的奠基 Python 的高手也会犯错误。[这个怪异之处后来被消除了][4]，现在所有时间的布尔值都是 True。

```
# Python 3.5 以后

bool(datetime.time(9, 30)) == True
bool(datetime.time(0, 0)) == True
```

不知道午夜怪癖的古怪之处的程序员现在可以从这种晦涩的 bug 中解脱出来，但是一想到任何依赖于古怪的旧行为的代码现在没有注意变化，我就会感到紧张。如果从来没有实现这个糟糕的特性，情况会更好。这就引出了库维护者的第一个承诺：

#### 第一个约定：避免糟糕的特性

最痛苦的变化是你必须删除一个特性。一般来说，避免糟糕特性的一种方法是少添加特性！没有充分的理由，不要使用公共方法、类、功能或属性。因此：

#### 第二个约定：最小化特性

特性就像孩子：在充满激情的瞬间孕育，但是它们必须要支持多年（LCTT 译注：我怀疑作者在开车，可是我没有证据）。不要因为你能做傻事就去做傻事。不要画蛇添足！

![Serpents with and without feathers][5]

但是，当然，在很多情况下，用户需要你的库中尚未提供的东西，你如何选择合适的功能给他们？以下另一个警示故事。

### 一个来自 asyncio 的警示故事

你可能知道，当你调用一个协程函数，它会返回一个协程对象：

```
async def my_coroutine():
    pass

print(my_coroutine())
```

```
<coroutine object my_coroutine at 0x10bfcbac8>
```

你的代码必须 “<ruby>等待<rt>await</rt></ruby>” 这个对象以此来运行协程。人们很容易忘记这一点，所以 asyncio 的开发人员想要一个“调试模式”来捕捉这个错误。当协程在没有等待的情况下被销毁时，调试模式将打印一个警告，并在其创建的行上进行回溯。

当 Yury Selivanov 实现调试模式时，他添加了一个“协程装饰器”的基础特性。装饰器是一个函数，它接收一个协程并返回任何内容。Yury 使用它在每个协程上接入警告逻辑，但是其他人可以使用它将协程转换为字符串 “hi!”。

```
import sys

def my_wrapper(coro):
    return 'hi!'

sys.set_coroutine_wrapper(my_wrapper)

async def my_coroutine():
    pass

print(my_coroutine())
```

```
hi!
```

这是一个地狱般的定制。它改变了 “<ruby>异步<rt>async</rt></ruby>" 的含义。调用一次 `set_coroutine_wrapper` 将在全局永久改变所有的协程函数。正如 [Nathaniel Smith 所说][6]：“一个有问题的 API” 很容易被误用，必须被删除。如果 asyncio 开发人员能够更好地按照其目标来设计该特性，他们就可以避免删除该特性的痛苦。负责任的创建者必须牢记这一点：

#### 第三个约定：保持特性单一

幸运的是，Yury 有良好的判断力，他将该特性标记为临时，所以 asyncio 用户知道不能依赖它。Nathaniel 可以用更单一的功能替换 `set_coroutine_wrapper`，该特性只定制回溯深度。

```
import sys

sys.set_coroutine_origin_tracking_depth(2)

async def my_coroutine():
    pass

print(my_coroutine())

```

```
<coroutine object my_coroutine at 0x10bfcbac8>

RuntimeWarning:'my_coroutine' was never awaited

Coroutine created at (most recent call last)
    File "script.py", line 8, in <module>
        print(my_coroutine())
```

这样好多了。没有可以更改协程的类型的其他全局设置，因此 asyncio 用户无需编写防御代码。造物主应该像 Yury 一样有远见。

#### 第四个约定：标记实验特征“临时”

如果你只是预感你的生物需要犄角和四叉舌，那就引入这些特性，但将它们标记为“临时”。

![Serpent with horns][7]

你可能会发现犄角是无关紧要的，但是四叉舌是有用的。在库的下一个版本中，你可以删除前者并标记后者为正式的。

### 删除特性

无论我们如何明智地指导我们的生物进化，总会有一天想要删除一个正式特征。例如，你可能已经创建了一只蜥蜴，现在你选择删除它的腿。也许你想把这个笨拙的家伙变成一条时尚而现代的蟒蛇。

![Lizard transformed to snake][8]

删除特性主要有两个原因。首先，通过用户反馈或者你自己不断增长的智慧，你可能会发现某个特性是个坏主意。午夜怪癖的古怪行为就是这种情况。或者，最初该特性可能已经很好地适应了你的库环境，但现在生态环境发生了变化，也许另一个神发明了哺乳动物，你的生物想要挤进哺乳动物的小洞穴里，吃掉里面美味的哺乳动物，所以它不得不失去双腿。

![A mouse][9]

同样，Python 标准库会根据语言本身的变化删除特性。考虑 asyncio 的 Lock 功能，在把 `await` 作为一个关键字添加进来之前，它一直在等待：

```
lock = asyncio.Lock()

async def critical_section():
    await lock
    try:
        print('holding lock')
    finally:
        lock.release()
```

但是现在，我们可以做“异步锁”：


```
lock = asyncio.Lock()

async def critical_section():
    async with lock:
        print('holding lock')
```

新方法好多了！很短，并且在一个大函数中使用其他 try-except 块时不容易出错。因为“尽量找一种，最好是唯一一种明显的解决方案”，[旧语法在 Python 3.7 中被弃用][10]，并且很快就会被禁止。

不可避免的是，生态变化会对你的代码产生影响，因此要学会温柔地删除特性。在此之前，请考虑删除它的成本或好处。负责任的维护者不会愿意让用户更改大量代码或逻辑。（还记得 Python 3 在重新添加会 `u` 字符串前缀之前删除它是多么痛苦吗？）如果代码删除是机械性的动作，就像一个简单的搜索和替换，或者如果该特性是危险的，那么它可能值得删除。

#### 是否删除特性

![Balance scales][11]

反对 | 支持
---|---
代码必须改变 | 改变是机械性的
逻辑必须改变 | 特性是危险的

就我们饥饿的蜥蜴而言，我们决定删除它的腿，这样它就可以滑进老鼠洞里吃掉它。我们该怎么做呢？我们可以删除 `walk` 方法，像下面一样修改代码：

```
class Reptile:
    def walk(self):
        print('step step step')
```

变成这样：

```
class Reptile:
    def slither(self):
        print('slide slide slide')
```

这不是一个好主意，这个生物习惯于走路！或者，就库而言，你的用户拥有依赖于现有方法的代码。当他们升级到最新库版本时，他们的代码将会崩溃。

```
# 用户的代码，哦，不!
Reptile.walk()
```

因此，负责任的创建者承诺：

#### 第五条预定：温柔地删除

温柔地删除一个特性需要几个步骤。从用腿走路的蜥蜴开始，首先添加新方法 `slither`。接下来，弃用旧方法。 

```
import warnings

class Reptile:
    def walk(self):
        warnings.warn(
                "walk is deprecated, use slither",
                 DeprecationWarning, stacklevel=2)
        print('step step step')

    def slither(self):
        print('slide slide slide')
```

Python 的 warnings 模块非常强大。默认情况下，它会将警告输出到 stderr，每个代码位置只显示一次，但你可以禁用警告或将其转换为异常，以及其它选项。

一旦将这个警告添加到库中，PyCharm 和其他 IDE 就会使用删除线呈现这个被弃用的方法。用户马上就知道该删除这个方法。

> Reptile().~~walk()~~

当他们使用升级后的库运行代码时会发生什么？

```
$ python3 script.py

DeprecationWarning: walk is deprecated, use slither
    script.py:14: Reptile().walk()

step step step
```

默认情况下，他们会在 stderr 上看到警告，但脚本会成功并打印 “step step step”。警告的回溯显示必须修复用户代码的哪一行。（这就是 `stacklevel` 参数的作用：它显示了用户需要更改的调用，而不是库中生成警告的行。）请注意，错误消息有指导意义，它描述了库用户迁移到新版本必须做的事情。

你的用户可能会希望测试他们的代码，并证明他们没有调用弃用的库方法。仅警告不会使单元测试失败，但异常会失败。Python 有一个命令行选项，可以将弃用警告转换为异常。

```
> python3 -Werror::DeprecationWarning script.py

Traceback (most recent call last):
    File "script.py", line 14, in <module>
        Reptile().walk()
    File "script.py", line 8, in walk
        DeprecationWarning, stacklevel=2)
DeprecationWarning: walk is deprecated, use slither
```

现在，“step step step” 没有输出出来，因为脚本以一个错误终止。

因此，一旦你发布了库的一个版本，该版本会警告已启用的 `walk` 方法，你就可以在下一个版本中安全地删除它。对吧？

考虑一下你的库用户在他们项目的 `requirements` 中可能有什么。

```
# 用户的 requirements.txt 显示 reptile 包的依赖关系
reptile
```

下次他们部署代码时，他们将安装最新版本的库。如果他们尚未处理所有的弃用，那么他们的代码将会崩溃，因为代码仍然依赖 `walk`。你需要温柔一点，你必须向用户做出三个承诺：维护更改日志，选择版本化方案和编写升级指南。

#### 第六个约定：维护变更日志

你的库必须有更改日志，其主要目的是宣布用户所依赖的功能何时被弃用或删除。

> **版本 1.1 中的更改**
>
> **新特性**
>
>  * 新功能 Reptile.slither()
>
> **弃用**
>
>  * Reptile.walk() 已弃用，将在 2.0 版本中删除，请使用 slither()

负责任的创建者会使用版本号来表示库发生了怎样的变化，以便用户能够对升级做出明智的决定。“版本化方案”是一种用于交流变化速度的语言。

#### 第七个约定：选择一个版本化方案

有两种广泛使用的方案，[语义版本控制][12]和基于时间的版本控制。我推荐任何库都进行语义版本控制。Python 的风格在 [PEP 440][13] 中定义，像 `pip` 这样的工具可以理解语义版本号。

如果你为库选择语义版本控制，你可以使用版本号温柔地删除腿，例如：

>  1.0: 第一个“稳定”版，带有 `walk()`
>  1.1: 添加 `slither()`，废弃 `walk()`
>  2.0: 删除 `walk()`

你的用户依赖于你的库的版本应该有一个范围，例如：

```
# 用户的 requirements.txt
reptile>=1,<2
```

这允许他们在主要版本中自动升级，接收错误修正并可能引发一些弃用警告，但不会升级到**下**个主要版本并冒着更改破坏其代码的风险。

如果你遵循基于时间的版本控制，则你的版本可能会编号：

> 2017.06.0: 2017 年 6 月的版本
>  2018.11.0: 添加 `slither()`，废弃 `walk()`
>  2019.04.0: 删除 `walk()`

用户可以这样依赖于你的库：

```
# 用户的 requirements.txt，基于时间控制的版本
reptile==2018.11.*
```

这非常棒，但你的用户如何知道你的版本方案，以及如何测试代码来进行弃用呢？你必须告诉他们如何升级。

#### 第八个约定：写一个升级指南

下面是一个负责任的库创建者如何指导用户：

> **升级到 2.0**
> 
> **从弃用的 API 迁移**
>
> 请参阅更改日志以了解已弃用的特性。
>
> **启用弃用警告**
>
> 升级到 1.1 并使用以下代码测试代码：
>
> `python -Werror::DeprecationWarning`
> 
>​​​​​​ 现在可以安全地升级了。

你必须通过向用户显示命令行选项来教会用户如何处理弃用警告。并非所有 Python 程序员都知道这一点 —— 我自己就每次都得查找这个语法。注意，你必须*发布*一个版本，它输出来自每个弃用的 API 的警告，以便用户可以在再次升级之前使用该版本进行测试。在本例中，1.1 版本是小版本。它允许你的用户逐步重写代码，分别修复每个弃用警告，直到他们完全迁移到最新的 API。他们可以彼此独立地测试代码和库的更改，并隔离 bug 的原因。

如果你选择语义版本控制，则此过渡期将持续到下一个主要版本，从 1.x 到 2.0，或从 2.x 到 3.0 以此类推。删除生物腿部的温柔方法是至少给它一个版本来调整其生活方式。不要一次性把腿删掉！

![A skink][14]

版本号、弃用警告、更改日志和升级指南可以协同工作，在不违背与用户约定的情况下温柔地改进你的库。[Twisted 项目的兼容性政策][15] 解释的很漂亮：

> “先行者总是自由的”
>
> 运行的应用程序在没有任何警告的情况下都可以升级为 Twisted 的一个次要版本。
>
> 换句话说，任何运行其测试而不触发 Twisted 警告的应用程序应该能够将其 Twisted 版本升级至少一次，除了可能产生新警告之外没有任何不良影响。
>

现在，我们的造物主已经获得了智慧和力量，可以通过添加方法来添加特性，并温柔地删除它们。我们还可以通过添加参数来添加特性，但这带来了新的难度。你准备好了吗？

### 添加参数

想象一下，你只是给了你的蛇形生物一对翅膀。现在你必须允许它选择是滑行还是飞行。目前它的 `move` 功能只接受一个参数。

```
# 你的库代码
def move(direction):
    print(f'slither {direction}')

# 用户的应用
move('north')
```

你想要添加一个 `mode` 参数，但如果用户升级库，这会破坏他们的代码，因为他们只传递了一个参数。

```
# 你的库代码
def move(direction, mode):
    assert mode in ('slither', 'fly')
    print(f'{mode} {direction}')

# 一个用户的代码，出现错误!
move('north')
```

一个真正聪明的创建者者会承诺不会以这种方式破坏用户的代码。

#### 第九条约定：兼容地添加参数

要保持这个约定，请使用保留原始行为的默认值添加每个新参数。

```
# 你的库代码
def move(direction, mode='slither'):
    assert mode in ('slither', 'fly')
    print(f'{mode} {direction}')

# 用户的应用
move('north')
```

随着时间推移，参数是函数演化的自然历史。它们首先列出最老的参数，每个都有默认值。库用户可以传递关键字参数以选择特定的新行为，并接受所有其他行为的默认值。

```
# 你的库代码
def move(direction,
         mode='slither',
         turbo=False,
         extra_sinuous=False,
         hail_lyft=False):
    # ...

# 用户应用
move('north', extra_sinuous=True)
```

但是有一个危险，用户可能会编写如下代码：

```
# 用户应用，简写
move('north', 'slither', False, True)
```

如果在你在库的下一个主要版本中去掉其中一个参数，例如 `turbo`，会发生什么？

```
# 你的库代码，下一个主要版本中 "turbo" 被删除
def move(direction,
         mode='slither',
         extra_sinuous=False,
         hail_lyft=False):
    # ...

# 用户应用，简写
move('north', 'slither', False, True)
```

用户的代码仍然能编译，这是一件坏事。代码停止了曲折的移动并开始招呼 Lyft，这不是它的本意。我相信你可以预测我接下来要说的内容：删除参数需要几个步骤。当然，首先弃用 `trubo` 参数。我喜欢这种技术，它可以检测任何用户的代码是否依赖于这个参数。

```
# 你的库代码
_turbo_default = object()

def move(direction,
         mode='slither',
         turbo=_turbo_default,
         extra_sinuous=False,
         hail_lyft=False):
    if turbo is not _turbo_default:
        warnings.warn(
                "'turbo' is deprecated",
                DeprecationWarning,
                stacklevel=2)
    else:
        # The old default.
        turbo = False
```

但是你的用户可能不会注意到警告。警告声音不是很大：它们可以在日志文件中被抑制或丢失。用户可能会漫不经心地升级到库的下一个主要版本——那个删除 `turbo` 的版本。他们的代码运行时将没有错误、默默做错误的事情！正如 Python 之禅所说：“错误绝不应该被默默 pass”。实际上，爬行动物的听力很差，所有当它们犯错误时，你必须非常大声地纠正它们。

![Woman riding an alligator][16]

保护用户的最佳方法是使用 Python 3 的星型语法，它要求调用者传递关键字参数。

```
# 你的库代码
# 所有 “*” 后的参数必须以关键字方式传输。
def move(direction,
         *,
         mode='slither',
         turbo=False,
         extra_sinuous=False,
         hail_lyft=False):
    # ...

# 用户代码，简写
# 错误！不能使用位置参数，关键字参数是必须的
move('north', 'slither', False, True)
```

有了这个星，以下是唯一允许的语法：

```
# 用户代码
move('north', extra_sinuous=True)
```

现在，当你删除 `turbo` 时，你可以确定任何依赖于它的用户代码都会明显地提示失败。如果你的库也支持 Python2，这没有什么大不了。你可以模拟星型语法（[归功于 Brett Slatkin][17]）：

```
# 你的库代码，兼容 Python 2
def move(direction, **kwargs):
    mode = kwargs.pop('mode', 'slither')
    turbo = kwargs.pop('turbo', False)
    sinuous = kwargs.pop('extra_sinuous', False)
    lyft = kwargs.pop('hail_lyft', False)

    if kwargs:
        raise TypeError('Unexpected kwargs: %r' 
                        % kwargs)

# ...
```

要求关键字参数是一个明智的选择，但它需要远见。如果允许按位置传递参数，则不能仅在以后的版本中将其转换为仅关键字。所以，现在加上星号。你可以在 asyncio API 中观察到，它在构造函数、方法和函数中普遍使用星号。尽管到目前为止，`Lock` 只接受一个可选参数，但 asyncio 开发人员立即添加了星号。这是幸运的。

```
# In asyncio.
class Lock:
    def __init__(self, *, loop=None):
        # ...
```

现在，我们已经获得了改变方法和参数的智慧，同时保持与用户的约定。现在是时候尝试最具挑战性的进化了：在不改变方法或参数的情况下改变行为。

### 改变行为

假设你创造的生物是一条响尾蛇，你想教它一种新行为。

![Rattlesnake][18]        

横向移动！这个生物的身体看起来是一样的，但它的行为会发生变化。我们如何为这一进化步骤做好准备？

![][19]

*Image by HCA [[CC BY-SA 4.0][20]], [via Wikimedia Commons][21], 由 Opensource.com 修改*

当行为在没有新函数或新参数的情况下发生更改时，负责任的创建者可以从 Python 标准库中学习。很久以前，os 模块引入了 `stat` 函数来获取文件统计信息，比如创建时间。起初，这个时间总是整数。

```
>>> os.stat('file.txt').st_ctime
1540817862
```

有一天，核心开发人员决定在 `os.stat` 中使用浮点数来提供亚秒级精度。但他们担心现有的用户代码还没有做好准备更改。于是他们在 Python 2.3 中创建了一个设置 `stat_float_times`，默认情况下是 `False` 。用户可以将其设置为 True 来选择浮点时间戳。

```
>>> # Python 2.3.
>>> os.stat_float_times(True)
>>> os.stat('file.txt').st_ctime
1540817862.598021
```

从 Python 2.5 开始，浮点时间成为默认值，因此 2.5 及之后版本编写的任何新代码都可以忽略该设置并期望得到浮点数。当然，你可以将其设置为 `False` 以保持旧行为，或将其设置为 `True` 以确保所有 Python 版本都得到浮点数，并为删除 `stat_float_times` 的那一天准备代码。

多年过去了，在 Python 3.1 中，该设置已被弃用，以便为人们为遥远的未来做好准备，最后，经过数十年的旅程，[这个设置被删除][22]。浮点时间现在是唯一的选择。这是一个漫长的过程，但负责任的神灵是有耐心的，因为我们知道这个渐进的过程很有可能于意外的行为变化拯救用户。

#### 第十个约定：逐渐改变行为

以下是步骤：

  * 添加一个标志来选择新行为，默认为 `False`，如果为 `False` 则发出警告
  * 将默认值更改为 `True`，表示完全弃用标记
  * 删除该标志

如果你遵循语义版本控制，版本可能如下：

库版本 | 库 API | 用户代码
---|---|---
1.0 | 没有标志 | 预期的旧行为
1.1 | 添加标志，默认为 `False`，如果是 `False`，则警告 | 设置标志为 `True`，处理新行为
2.0 | 改变默认为 `True`，完全弃用标志 | 处理新行为
3.0 | 移除标志 | 处理新行为

你需要**两**个主要版本来完成该操作。如果你直接从“添加标志，默认为 `False`，如果是 `False` 则发出警告”变到“删除标志”，而没有中间版本，那么用户的代码将无法升级。为 1.1 正确编写的用户代码必须能够升级到下一个版本，除了新警告之外，没有任何不良影响，但如果在下一个版本中删除了该标志，那么该代码将崩溃。一个负责任的神明从不违反扭曲的政策：“先行者总是自由的”。

### 负责任的创建者

![Demeter][23]

我们的 10 个约定大致可以分为三类：

**谨慎发展**

  1. 避免不良功能
  2. 最小化特性
  3. 保持功能单一
  4. 标记实验特征“临时”
  5. 温柔删除功能

**严格记录历史**

  1. 维护更改日志
  2. 选择版本方案
  3. 编写升级指南

**缓慢而明显地改变**

  1. 兼容添加参数
  2. 逐渐改变行为

如果你对你所创造的物种保持这些约定，你将成为一个负责任的造物主。你的生物的身体可以随着时间的推移而进化，一直在改善和适应环境的变化，而不是在生物没有准备好就突然改变。如果你维护一个库，请向用户保留这些承诺，这样你就可以在不破坏依赖该库的代码的情况下对库进行更新。

* * *

_这篇文章最初是在 [A. Jesse Jiryu Davis 的博客上'][24]出现的，经允许转载。_

插图参考：

  * [《世界进步》, Delphian Society, 1913][25]
  * [《走进蛇的历史》, Charles Owen, 1742][26]
  * [关于哥斯达黎加的 batrachia 和爬行动物，关于尼加拉瓜和秘鲁的爬行动物和鱼类学的记录, Edward Drinker Cope, 1875][27]
  * [《自然史》, Richard Lydekker et. al., 1897][28]
  * [Mes Prisons, Silvio Pellico, 1843][29]
  * [Tierfotoagentur / m.blue-shadow][30]
  * [洛杉矶公共图书馆, 1930][31]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/api-evolution-right-way

作者：[A. Jesse][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/emptysquare
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_desktop_website_checklist_metrics.png?itok=OKKbl1UR (Browser of things)
[2]: https://opensource.com/sites/default/files/uploads/praise-the-creator.jpg (Serpents)
[3]: https://opensource.com/sites/default/files/uploads/bite.jpg (Man being chased by an alligator)
[4]: https://bugs.python.org/issue13936
[5]: https://opensource.com/sites/default/files/uploads/feathers.jpg (Serpents with and without feathers)
[6]: https://bugs.python.org/issue32591
[7]: https://opensource.com/sites/default/files/uploads/horns.jpg (Serpent with horns)
[8]: https://opensource.com/sites/default/files/uploads/lizard-to-snake.jpg (Lizard transformed to snake)
[9]: https://opensource.com/sites/default/files/uploads/mammal.jpg (A mouse)
[10]: https://bugs.python.org/issue32253
[11]: https://opensource.com/sites/default/files/uploads/scale.jpg (Balance scales)
[12]: https://semver.org
[13]: https://www.python.org/dev/peps/pep-0440/
[14]: https://opensource.com/sites/default/files/uploads/skink.jpg (A skink)
[15]: https://twistedmatrix.com/documents/current/core/development/policy/compatibility-policy.html
[16]: https://opensource.com/sites/default/files/uploads/loudly.jpg (Woman riding an alligator)
[17]: http://www.informit.com/articles/article.aspx?p=2314818
[18]: https://opensource.com/sites/default/files/uploads/rattlesnake.jpg (Rattlesnake)
[19]: https://opensource.com/sites/default/files/articles/neonate_sidewinder_sidewinding_with_tracks_unlabeled.png
[20]: https://creativecommons.org/licenses/by-sa/4.0
[21]: https://commons.wikimedia.org/wiki/File:Neonate_sidewinder_sidewinding_with_tracks_unlabeled.jpg
[22]: https://bugs.python.org/issue31827
[23]: https://opensource.com/sites/default/files/uploads/demeter.jpg (Demeter)
[24]: https://emptysqua.re/blog/api-evolution-the-right-way/
[25]: https://www.gutenberg.org/files/42224/42224-h/42224-h.htm
[26]: https://publicdomainreview.org/product-att/artist/charles-owen/
[27]: https://archive.org/details/onbatrachiarepti00cope/page/n3
[28]: https://www.flickr.com/photos/internetarchivebookimages/20556001490
[29]: https://www.oldbookillustrations.com/illustrations/stationery/
[30]: https://www.alamy.com/mediacomp/ImageDetails.aspx?ref=D7Y61W
[31]: https://www.vintag.es/2013/06/riding-alligator-c-1930s.html
