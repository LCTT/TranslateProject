[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11696-1.html)
[#]: subject: (3 easy steps to update your apps to Python 3)
[#]: via: (https://opensource.com/article/19/12/update-apps-python-3)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

将你的应用迁移到 Python 3 的三个步骤
======

> Python 2 气数将尽，是时候将你的项目从 Python 2 迁移到 Python 3 了。

![](https://img.linux.net.cn/data/attachment/album/201912/20/095224r0kp79s0cnc0z77p.jpg)

Python 2.x 很快就要[失去官方支持][2]了，尽管如此，从 Python 2 迁移到 Python 3 却并没有想象中那么难。我在上周用了一个晚上的时间将一个 3D 渲染器的前端代码及其对应的 [PySide][3] 迁移到 Python 3，回想起来，尽管在迁移过程中无可避免地会遇到一些牵一发而动全身的修改，但整个过程相比起痛苦的重构来说简直是出奇地简单。

每个人都别无选择地有各种必须迁移的原因：或许是觉得已经拖延太久了，或许是依赖了某个在 Python 2 下不再维护的模块。但如果你仅仅是想通过做一些事情来对开源做贡献，那么把一个 Python 2 应用迁移到 Python 3 就是一个简单而又有意义的做法。

无论你从 Python 2 迁移到 Python 3 的原因是什么，这都是一项重要的任务。按照以下三个步骤，可以让你把任务完成得更加清晰。

### 1、使用 2to3

从几年前开始，Python 在你或许还不知道的情况下就已经自带了一个名叫 [2to3][4] 的脚本，它可以帮助你实现大部分代码从 Python 2 到 Python 3 的自动转换。

下面是一段使用 Python 2.6 编写的代码：

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-
mystring = u'abcdé'
print ord(mystring[-1])
```

对其执行 2to3 脚本：


```
$ 2to3 example.py
RefactoringTool: Refactored example.py
--- example.py     (original)
+++ example.py     (refactored)
@@ -1,5 +1,5 @@
 #!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
-mystring = u'abcdé'
-print ord(mystring[-1])
+mystring = 'abcdé'
+print(ord(mystring[-1]))
RefactoringTool: Files that need to be modified:
RefactoringTool: example.py
```

在默认情况下，`2to3` 只会对迁移到 Python 3 时必须作出修改的代码进行标示，在输出结果中显示的 Python 3 代码是直接可用的，但你可以在 2to3 加上 `-w` 或者 `--write` 参数，这样它就可以直接按照给出的方案修改你的 Python 2 代码文件了。

```
$ 2to3 -w example.py
[...]
RefactoringTool: Files that were modified:
RefactoringTool: example.py
```

`2to3` 脚本不仅仅对单个文件有效，你还可以把它用于一个目录下的所有 Python 文件，同时它也会递归地对所有子目录下的 Python 文件都生效。

### 2、使用 Pylint 或 Pyflakes

有一些不良的代码在 Python 2 下运行是没有异常的，在 Python 3 下运行则会或多或少报出错误，这种情况并不鲜见。因为这些不良代码无法通过语法转换来修复，所以 `2to3` 对它们没有效果，但一旦使用 Python 3 来运行就会产生报错。

要找出这种问题，你需要使用 [Pylint][5]、[Pyflakes][6]（或 [flake8][7] 封装器）这类工具。其中我更喜欢 Pyflakes，它会忽略代码风格上的差异，在这一点上它和 Pylint 不同。尽管代码优美是 Python 的一大特点，但在代码迁移的层面上，“让代码功能保持一致”无疑比“让代码风格保持一致”重要得多。

以下是 Pyflakes 的输出样例：

```
$ pyflakes example/maths
example/maths/enum.py:19: undefined name 'cmp'
example/maths/enum.py:105: local variable 'e' is assigned to but never used
example/maths/enum.py:109: undefined name 'basestring'
example/maths/enum.py:208: undefined name 'EnumValueCompareError'
example/maths/enum.py:208: local variable 'e' is assigned to but never used
```

上面这些由 Pyflakes 输出的内容清晰地给出了代码中需要修改的问题。相比之下，Pylint 会输出多达 143 行的内容，而且多数是诸如代码缩进这样无关紧要的问题。

值得注意的是第 19 行这个容易产生误导的错误。从输出来看你可能会以为 `cmp` 是一个在使用前未定义的变量，实际上 `cmp` 是 Python 2 的一个内置函数，而它在 Python 3 中被移除了。而且这段代码被放在了 `try` 语句块中，除非认真检查这段代码的输出值，否则这个问题很容易被忽略掉。

```
    try:
        result = cmp(self.index, other.index)
    except:
        result = 42
       
    return result
```

在代码迁移过程中，你会发现很多原本在 Python 2 中能正常运行的函数都发生了变化，甚至直接在 Python 3 中被移除了。例如 PySide 的绑定方式发生了变化、`importlib` 取代了 `imp` 等等。这样的问题只能见到一个解决一个，而涉及到的功能需要重构还是直接放弃，则需要你自己权衡。但目前来说，大多数问题都是已知的，并且有[完善的文档记录][8]。所以难的不是修复问题，而是找到问题，从这个角度来说，使用 Pyflake 是很有必要的。

### 3、修复被破坏的 Python 2 代码

尽管 `2to3` 脚本能够帮助你把代码修改成兼容 Python 3 的形式，但对于一个完整的代码库，它就显得有点无能为力了，因为一些老旧的代码在 Python 3 中可能需要不同的结构来表示。在这样的情况下，只能人工进行修改。

例如以下代码在 Python 2.6 中可以正常运行：

```
class CLOCK_SPEED:
        TICKS_PER_SECOND = 16
        TICK_RATES = [int(i * TICKS_PER_SECOND)
                      for i in (0.5, 1, 2, 3, 4, 6, 8, 11, 20)]

class FPS:
        STATS_UPDATE_FREQUENCY = CLOCK_SPEED.TICKS_PER_SECOND
```

类似 `2to3` 和 Pyflakes 这些自动化工具并不能发现其中的问题，但如果上述代码使用 Python 3 来运行，解释器会认为 `CLOCK_SPEED.TICKS_PER_SECOND` 是未被明确定义的。因此就需要把代码改成面向对象的结构：

```
class CLOCK_SPEED:
        def TICKS_PER_SECOND():
                TICKS_PER_SECOND = 16
                TICK_RATES = [int(i * TICKS_PER_SECOND)
                        for i in (0.5, 1, 2, 3, 4, 6, 8, 11, 20)]
                return TICKS_PER_SECOND

class FPS:
        STATS_UPDATE_FREQUENCY = CLOCK_SPEED.TICKS_PER_SECOND()
```

你也许会认为如果把 `TICKS_PER_SECOND()` 改写为一个构造函数（用 `__init__` 函数设置默认值）能让代码看起来更加简洁，但这样就需要把这个方法的调用形式从 `CLOCK_SPEED.TICKS_PER_SECOND()` 改为 `CLOCK_SPEED()` 了，这样的改动或多或少会对整个库造成一些未知的影响。如果你对整个代码库的结构烂熟于心，那么你确实可以随心所欲地作出这样的修改。但我通常认为，只要我做出了修改，都可能会影响到其它代码中的至少三处地方，因此我更倾向于不使代码的结构发生改变。

### 坚持信念

如果你正在尝试将一个大项目从 Python 2 迁移到 Python 3，也许你会觉得这是一个漫长的过程。你可能会费尽心思也找不到一条有用的报错信息，这种情况下甚至会有将代码推倒重建的冲动。但从另一个角度想，代码原本在 Python 2 中就可以运行，要让它能在 Python 3 中继续运行，你需要做的只是对它稍加转换而已。

但只要你完成了迁移，你就得到了这个模块或者整个应用程序的 Python 3 版本，外加 Python 官方的长期支持。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/update-apps-python-3

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd "Hands on a keyboard with a Python book "
[2]: https://linux.cn/article-11629-1.html
[3]: https://pypi.org/project/PySide/
[4]: https://docs.python.org/3.1/library/2to3.html
[5]: https://opensource.com/article/19/10/python-pylint-introduction
[6]: https://pypi.org/project/pyflakes/
[7]: https://opensource.com/article/19/5/python-flake8
[8]: https://docs.python.org/3.0/whatsnew/3.0.html

