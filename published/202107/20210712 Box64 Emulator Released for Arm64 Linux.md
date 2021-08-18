[#]: subject: (Box64 Emulator Released for Arm64 Linux)
[#]: via: (https://news.itsfoss.com/box64-emulator-released/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13591-1.html)

Box64 模拟器发布 Arm64 Linux 版本
======

> 在 Box64 模拟器的帮助下，在 ARM 设备上运行 x64 Linux 程序。想试试吗？

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/07/box64-arm.jpg?w=1200&ssl=1)

[Box86][1] 是一个流行的 X86 模拟器，刚进行了一次巨大的升级。发布了 [Box64][2]，也就是对应的 ARM64 版本。

可能你还不了解这个模拟器，Box64_86 允许你在 ARM 系统上运行 32 或 64 位的 X86/64 Linux 程序。换句话说，它能让你在树莓派或者 [树莓派替代品][3] 上运行 Linux 桌面程序。

幸运的是，现在我们有 Box86 和 Box64 的支持，无论你的 ARM 系统是什么类型。

### Box64 是什么?

![][4]

你可能听说过苹果的 Rosetta 2，它是一个翻译层，允许为老款 Mac（Intel X86 处理器）设计的应用程序在新的 M1（ARM 处理器）驱动的 Mac 上运行。Box64 与之类似，允许为 X86 设计的应用程序运行在 ARM Linux 设备上。

由于它的 Dynarec 模块，它能够做到这一点，同时又是 100% 开源的、免费的，而且速度惊人。它通过重新编译 ARM 程序来提升速度，这意味着和其他 ARM 原生应用一样快。

但是，即使 Box64 无法重新编译应用，它仍然可以使用即时模拟，也有令人印象深刻的结果。

许多树莓派用户很熟悉 Box86，这是一个大约一年前发布的类似程序。二者最大的区别是 Box86 只兼容 Arm32，而 Box64 只兼容 Arm64。

这就是 Box64，一个非常棒的兼容层，允许你在 ARM 电脑上运行 x86_64 应用。

### 总结

如果你问我认为 Box64 怎么样，我会说这是一个绝对的游戏规则改变者。在难以置信的性能和巨大的潜力之间，这个兼容层肯定会在未来的 ARM 电脑中扮演一个重要角色。

如果你想知道它的工作原理，以及如何开始使用它，请查看其 [GitHub 页面][5]。

就这样吧，现在你自己去潜入其中并测试吧。

你觉得 Box64 怎样？写下你的评论让我知道。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/box64-emulator-released/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[zde200572](https://github.com/zd200572)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: http://github.com/ptitseb/box86
[2]: http://github.com/ptitseb/box64
[3]: https://itsfoss.com/raspberry-pi-alternatives/
[4]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/07/Box64Logo-1024x287-1.png?w=1024&ssl=1
[5]: https://github.com/ptitseb/box64
