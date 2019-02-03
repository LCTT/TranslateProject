[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10474-1.html)
[#]: subject: (Head to the arcade in your Linux terminal with this Pac-man clone)
[#]: via: (https://opensource.com/article/18/12/linux-toy-myman)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

用这个吃豆人游戏在你的终端中玩街机
======

> 想要重现你最喜欢的街机游戏的魔力么？今天的命令行玩具将带你回到过去。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-myman.png?itok=9j1DFgH0)

欢迎来到今天的 Linux 命令行玩具日历。如果这是你第一次访问该系列，你会问什么是命令行玩具。基本上，它们是游戏和简单的消遣，可以帮助你在终端玩得开心。

有些是新的，有些是古老的经典。我们希望你喜欢。

今天的玩具，MyMan，是经典街机游戏<ruby>[吃豆人][1]<rt>Pac-Man</rt></ruby>（你不会认为这是[类似命名的][2] Linux 包管理器对吧？）的有趣克隆。 如果你和我一样，为了在吃豆人游戏中取得高分，你过去在其中花费了很多时间，那么有机会的话，你应该试试这个。

MyMan 并不是 Linux 终端上唯一的吃豆人克隆版，但是我选择介绍它，因为 1）我喜欢它与原版一致的视觉风格，2）它为我的 Linux 发行版打包了，因此安装很容易。但是你也应该看看其他的克隆。这是[另一个][3]看起来可能不错的，但我没有尝试过。

由于 MyMan 已为 Fedora 打包，因此安装非常简单：

```
$ dnf install myman
```

MyMan 在 MIT 许可下可用，你可以在 [SourceForge][4] 上查看源代码。

![](https://opensource.com/sites/default/files/uploads/linux-toy-myman-animated.gif)

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

了解一下昨天的玩具，[Linux 终端能做其他事][5]，还有记得明天再来！

--------------------------------------------------------------------------------
via: https://opensource.com/article/18/12/linux-toy-myman

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Pac-Man
[2]: https://wiki.archlinux.org/index.php/pacman
[3]: https://github.com/YoctoForBeaglebone/pacman4console
[4]: https://myman.sourceforge.io/
[5]: https://opensource.com/article/18/12/linux-toy-ponysay
