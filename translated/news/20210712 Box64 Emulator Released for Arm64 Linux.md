[#]: subject: (Box64 Emulator Released for Arm64 Linux)
[#]: via: (https://news.itsfoss.com/box64-emulator-released/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Box64模拟器发布Arm64 Linux版本
======

[Box86][1]是一个流行的X86模拟器，刚进行了一次巨大的升级。发布了[Box64][2]，也就是对应的ARM64版本。

可能你还不了解这个模拟器，Box64_86允许你在ARM系统上运行32或64位的X86/64 Linux程序。换句话说，它能让你在树莓派或者[树莓派替代品][3]上运行Linux桌面程序。

幸运的是，现在我们有Box86和Box64的支援，无论你有什么样的ARM系统.

### Box64是什么?

![][4]

你可能听说过苹果的Rosetta 2，它是一个翻译层，允许为老款mac(Intel X86处理器)设计的应用程序在新的M1(ARM处理器)驱动的mac上运行。Box64与之类似，允许为X86设计的应用程序运行在ARM Linux设备上。

由于它的Dynarec模块，它可以以100%开源、免费和令人惊讶地速度完成这一切。它通过重新编译ARM程序来提升速度，这意味着和其他ARM原生应用一样快。

但是，即使Box64无法重新编译应用，它仍然可以使用即时模拟，也有令人印象深刻的结果。

许多树莓派用户很熟悉Box86，一个约一年前发布的类似程序。二者最大的区别是Box86只兼容Arm32，而Box64只兼容Arm64。

这就是Box64，一个非常棒的兼容层，允许在ARM电脑上运行x86_64应用。

### 包装

如果你问我认为Box64怎么样，我会说这是一个绝对的游戏规则改变者。在难以置信的性能和具大的潜力之间，这个兼容层肯定会在未来的ARM电脑中扮演一个重要角色。

如果你想知道它的工作原理，以及如何开始使用它，请查看其[GitHub页面][5]

说到这一点，我现在就离开，去潜入其中并自己测试啦。

你觉得Box64怎样?写下你的评论让我知道。


#### 大型技术网站获得百万收入，这里是自由开源软件FOSS！

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
