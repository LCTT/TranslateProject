[#]: subject: (Box64 Emulator Released for Arm64 Linux)
[#]: via: (https://news.itsfoss.com/box64-emulator-released/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Box64模拟器发布Arm64-Linux版本
======

[Box86][1]是一个流行的X86模拟器，刚进行了一次大的升级。发布了[Box64][2]，也就是对应的ARM64版本。

可能你还不了解这个模拟器，Box64_86让你在ARM系统上运行32或者64位的X86/64-Linux软件。换句话说，它能让你在树莓派或者[Raspberry Pi alternatives][3]上运行Linux桌面程序。

幸运的是，现在我们有Box86和Box64的支援，无论你有什么样的ARM系统.

### Box64是什么?

![][4]

你可能听说过苹果的Rosetta 2，它是一个翻译层，允许为老款mac（Intel X86处理器）设计的应用程序在新的M1（ARM处理器）驱动的mac上运行。Box64与之类似，允许为X86设计的应用运行在ARM-Linux上。

由于它的Dynarec模块，它可以以100%开源、免费和令人吃惊地速度完成这所有。它为ARM进行重新编译来提升速度，这意味着和其他ARM原生应用一样快。

但是，即使Box64不能重新编译应用，它仍然可以使用飞行模拟，也有令人印象深刻的结果。

许多树莓派用户对Box86很熟悉，约一年前发布的一个类似程序。二者最大的区别是Box86只兼容Arm32，而Box64只兼容Arm64。

这就是Box64，一个非常棒的兼容层，允许在ARM电脑上运行x86_64应用。

### 包装

如果你问我认为Box64怎么样，我会说这是一个绝对改变了游戏规则。具有难以置信的性能和具大的潜力，这个兼容层肯定在未来的ARM电脑中扮演一个重要角色。

如果你对它如何工作，怎么开始使用感到好奇，可以看下它的[GitHub页面][5]

有那，你将会沉浸其中和自己测试。

_你觉得Box64怎样?写下你的评论让我知道。_


#### 大型技术网站获得百万收，这里是自由开源软件FOSS！

如果你喜欢我们FOSS所做的事，请考虑为我们的独立出版物做点贡献。你的支持将帮助我们持续出版关于桌面Linux和开源软件的内容。


--------------------------------------------------------------------------------

via: https://news.itsfoss.com/box64-emulator-released/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[zde200572](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: http://github.com/ptitseb/box86
[2]: http://github.com/ptitseb/box64
[3]: https://itsfoss.com/raspberry-pi-alternatives/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIxOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://github.com/ptitseb/box64
