我们可以在同一个虚拟机中运行 Python 2 和 3 代码而不需要更改代码吗？
=====

从理论上来说，可以。Zed Shaw 说过一句著名的话，如果不行，那么 Python 3 一定不是图灵完备的。但在实践中，这是不现实的，我将通过给你们举几个例子来说明原因。

### 对于字典（dict）来说，这意味着什么？

让我们来想象一台拥有 Python 6 的虚拟机，它可以读取 Python 3.6 编写的 `module3.py`。但是在这个模块中，它可以导入 Python 2.7 编写的 `module2.py`，并成功使用它，没有问题。这显然是实验代码，但假设 `module2.py` 包含以下的功能：

```
def update_config_from_dict(config_dict):
    items = config_dict.items()
    while items:
        k, v = items.pop()
        memcache.set(k, v)

def config_to_dict():
    result = {}
    for k, v in memcache.getall():
        result[k] = v
    return result

def update_in_place(config_dict):
    for k, v in config_dict.items():
        new_value = memcache.get(k)
        if new_value is None:
            del config_dict[k]
        elif new_value != v:
            config_dict[k] = v
```

现在，当我们想从 `module3` 中调用这些函数时，我们遇到了一个问题：Python 3.6 中的字典类型与 Python 2.7 中的字典类型不同。在 Python 2 中，字典是无序的，它们的 `.keys()`, `.values()`, `.items()` 方法返回了正确的序列，这意味着调用 `.items()` 会在字典中创建状态的副本。在 Python 3 中，这些方法返回字典当前状态的动态视图。

这意味着如果 `module3` 调用 `module2.update_config_from_dict(some_dictionary)`，它将无法运行，因为 Python 3 中 `dict.items()` 返回的值不是一个列表，并且没有 `.pop()` 方法。反过来也是如此。如果 `module3` 调用 `module2.config_to_dict()`，它可能会返回一个 Python 2 的字典。现在调用 `.items()` 突然返回一个列表，所以这段代码无法正常工作（这对 Python 3 字典来说工作正常）：

```
def main(cmdline_options):
    d = module2.config_to_dict()
    items = d.items()
    for k, v in items:
        print(f'Config from memcache: {k}={v}')
    for k, v in cmdline_options:
        d[k] = v
    for k, v in items:
        print(f'Config with cmdline overrides: {k}={v}')
```

最后，使用 `module2.update_in_place()` 会失败，因为 Python 3 中 `.items()` 的值现在不允许在迭代过程中改变。

对于字典来说，还有很多问题。Python 2 的字典在 Python 3 上使用 `isinstance(d, dict)` 应该返回 `True` 吗？如果是的话，这将是一个谎言。如果没有，代码将无法继续。

### Python 应该神奇地知道类型并会自动转换！

为什么我们的 Python 6 的虚拟机无法识别 Python 3 的代码，在 Python 2 中调用 `some_dict.keys()` 时，我们还有别的意思吗？好吧，Python 不知道代码的作者在编写代码时，她所认为的 `some_dict` 应该是什么。代码中没有任何内容表明它是否是一个字典。在 Python 2 中没有类型注释，因为它们是可选的，即使在 Python 3 中，大多数代码也不会使用它们。

在运行时，当你调用 `some_dict.keys()` 的时候，Python 只是简单地在对象上查找一个属性，该属性恰好隐藏在  `some_dict` 名下，并试图在该属性上运行 `__call__()`。这里有一些关于方法绑定，描述符，slots 等技术问题，但这是它的核心。我们称这种行为为“鸭子类型”。

由于鸭子类型，Python 6 的虚拟机将无法做出编译时决定，以正确转换调用和属性查找。

### 好的，让我们在运行时做出这个决定

Python 6 的虚拟机可以标记每个属性，通过查找“来自 py2 的调用”或“来自 py3 的调用”的信息来实现这一点，并使对象发送正确的属性。这会让它变得很慢，并且使用更多的内存。这将要求我们在内存中保留两种版本的代码，并通过代理来使用它们。我们需要加倍付出努力，在用户背后同步这些对象的状态。毕竟，新字典的内存表示与 Python 2 不同。

如果你已经被字典问题绕晕了，那么再想想 Python 3 中的 Unicode 字符串和 Python 2 中的字节（byte）字符串的各种问题吧。

### 没有办法了吗？Python 3 根本就不能运行旧代码吗？

不会。每天都会有项目移植到 Python 3。将 Python 2 代码移植到两个版本的 Python 上推荐方法是在你的代码上运行 [Python-Modernize][1]。它会捕获那些在 Python 3 上不起作用的代码，并使用 [six][2] 库将其替换，以便它在 Python 2 和 Python 3 上运行。这是 `2to3` 的一个改编版本，用于生成仅针对 Python 3 代码。`Modernize` 是首选，因为它提供了更多的增量迁移路线。所有的这些在 Python 文档中的 [Porting Python 2 Code to Python 3][3]文档中都有很好的概述。

但是，等一等，你不是说 Python 6 的虚拟机不能自动执行此操作吗？对。`Modernize` 查看你的代码，并试图猜测哪些是安全的。它会做出一些不必要的改变，还会错过其他必要的改变。但是，它不会帮助你处理字符串。如果你的代码没有在“来自外部的二进制数据”和“流程中的文本数据”之间保持界限，那么这种转换就不会那么轻易。

因此，大项目的迁移不能自动完成，并且需要人类进行测试，发现问题并修复它们。它工作吗？是的，我曾帮助[将一百万行代码迁移到 Python 3][4]，并且这种切换没有造成事故。这一举措让我们重新获得了 1/3 的服务器内存，并使代码运行速度提高了 12％。那是在 Python 3.5 上，但是 Python 3.6 的速度要快得多，根据你的工作量，你甚至可以达到 [4 倍加速][5]。

### 亲爱的 Zed

hi，伙计，我关注你已经超过 10 年了。我一直在观察，当你感到沮丧的时候，你对 Mongrel 没有任何信任，尽管 Rails 生态系统几乎全部都在上面运行。当你重新设计它并开始 Mongrel 2 项目时，我一直在观察。我一直在关注你使用 Fossil 这一令人惊讶的举动。随着你发布 “Rails 是一个贫民窟”的帖子，我看到你突然离开了 Ruby 社区。当你开始编写《笨方法学 Python》并且开始推荐它时，我感到非常兴奋。2013 年我在 [DjangoCon Europe][6] 见过你，我们谈了很多关于绘画，唱歌和倦怠的内容。[你的这张照片][7]是我在 Instagram 上的第一个帖子。

你几乎把另一个“贫民区”的行动与 [“反对 Python 3” 案例][8] 文章拉到一起。我认为你本意是好的，但是这篇文章引起了很多混淆，包括许多人觉得你认为 Python 3 不是图灵完整的。我花了好几个小时让人们相信，你是在开玩笑。但是，鉴于你对《笨方法学 Python》的重大贡献，我认为这是值得的。特别是你为 Python 3 更新了你的书。感谢你做这件事。如果我们社区中真的有人因你的帖子为由要求将你和你的书列入黑名单，而请他们出去。这是一个双输的局面，这是错误的。

说实话，没有一个核心 Python 开发人员认为 Python 2 到 Python 3 的转换过程会顺利而且计划得当，[包括 Guido van Rossum][9]。真的，可以看那个视频，这有点事后诸葛亮的意思了。从这个意义上说，*我们实际上是积极地相互认同的*。如果我们再做一次，它会看起来不一样。但在这一点上，[在 2020 年 1 月 1 日，Python 2 将会到达终结][10]。大多数第三方库已经支持 Python 3，甚至开始发布只支持 Python 3 的版本（参见 [Django][11] 或 [科学项目关于 Python 3 的声明][12]）。

我们也积极地就另一件事达成一致。就像你于 Mongrel 一样，Python 核心开发人员是志愿者，他们的工作没有得到报酬。我们大多数人在这个项目上投入了大量的时间和精力，因此[我们自然而然敏感][13]于那些对他们的贡献不屑一顾和激烈的评论。特别是如果这个信息既攻击目前的事态，又要求更多的自由贡献。

我希望到 2018 年你会让忘记 2016 发布的帖子，有一堆好的反驳。[我特别喜欢 eevee][14]（LCTT 译注：eevee 是一个为 Blender 设计的渲染器）。它特别针对“一起运行 Python 2 和 Python 3 ”的场景，这是不现实的，就像在同一个虚拟机中运行 Ruby 1.8 和 Ruby 2.x 一样，或者像 Lua 5.3 和 Lua 5.1 同时运行一样。你甚至不能用 libc.so.6 运行针对 libc.so.5 编译的 C 二进制文件。然而，我发现最令人惊讶的是，你声称 Python 核心开发者是“有目的地”创造诸如 2to3 之类的破坏工具，这些由 Guido 创建，其最大利益就是让每个人尽可能顺利，快速地迁移。我很高兴你在之后的帖子中放弃了这个说法，但是你必须意识到你会激怒那些阅读了原始版本的人。对蓄意伤害的指控最好有强有力的证据支持。

但看起来你仍然会这样做。[就在今天][15]你说 Python 核心开发者“忽略”尝试解决 API 的问题，特别是 `six`。正如我上面写的那样，Python 文档中的官方移植指南涵盖了 `six`。更重要的是，`six` 是由 Python 2.7 的发布管理者 Benjamin Peterson 编写。很多人学会了编程，这要归功于你，而且由于你在网上有大量的粉丝，人们会阅读这样的推文，他们会相信它的价值，这是有害的。

我有一个建议，让我们把 “Python 3 管理不善”的争议搁置起来。Python 2 正在死亡，这个过程会很慢，并且它是丑陋而血腥的，但它是一条单行道。争论那些没有用。相反，让我们专注于我们现在可以做什么来使 Python 3.8 比其他任何 Python 版本更好。也许你更喜欢看外面的角色，但作为这个社区的成员，你会更有影响力。请说“我们”而不是“他们”。


--------------------------------------------------------------------------------

via: http://lukasz.langa.pl/13/could-we-run-python-2-and-python-3-code-same-vm/

作者：[Łukasz Langa][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://lukasz.langa.pl
[1]:https://python-modernize.readthedocs.io/
[2]:http://pypi.python.org/pypi/six
[3]:https://docs.python.org/3/howto/pyporting.html
[4]:https://www.youtube.com/watch?v=66XoCk79kjM
[5]:https://twitter.com/llanga/status/963834977745022976
[6]:https://www.instagram.com/p/ZVC9CwH7G1/
[7]:https://www.instagram.com/p/ZXtdtUn7Gk/
[8]:https://learnpythonthehardway.org/book/nopython3.html
[9]:https://www.youtube.com/watch?v=Oiw23yfqQy8
[10]:https://mail.python.org/pipermail/python-dev/2018-March/152348.html
[11]:https://pypi.python.org/pypi/Django/2.0.3
[12]:http://python3statement.org/
[13]:https://www.youtube.com/watch?v=-Nk-8fSJM6I
[14]:https://eev.ee/blog/2016/11/23/a-rebuttal-for-python-3/
[15]:https://twitter.com/zedshaw/status/977909970795745281
