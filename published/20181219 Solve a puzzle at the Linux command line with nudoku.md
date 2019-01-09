[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10426-1.html)
[#]: subject: (Solve a puzzle at the Linux command line with nudoku)
[#]: via: (https://opensource.com/article/18/12/linux-toy-nudoku)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 命令行中使用 nudoku 解决谜题
======

> 数独是简单的逻辑游戏，它可以在任何地方玩，包括在 Linux 终端中。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-nudoku.png?itok=OS2o4Rot)

欢迎回到我们为期 24 天的 Linux 命令行玩具日历。如果这是你第一次访问该系列，你甚至可能会问什么是命令行玩具。我们在考虑中，但一般来说，它可能是一个游戏，或任何简单的消遣，可以帮助你在终端玩得开心。

很可能你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新事物。

每年圣诞节，我的岳母都会给我妻子一本数独日历。它接着会在我们的咖啡桌上呆上一年。每天都是一张单独的表格（星期六和星期日除外，它们合并在一页上），这样你每天都有一个新的谜题，同时还有一本能用的日历。

问题在于在实际中它是一本很好的谜题，但不是一本好的日历，因为事实证明有些日子的题目比其他日子更难，我们没有以每天一个的速度解决它们。然后，我们会在懒散的周日来解决这周堆积的谜题。

既然我在这个系列的一部分中介绍过[日历][1]，那么在这里介绍数独也是公平的，除了我们的命令行版本是解耦的，因此将来很容易就能完成它。

我在 Fedora 的默认仓库中找到了 `nudoku`，因此安装它就像下面这样简单：

```
$ sudo dnf install nudoku
```

安装完后，只需输入 `nudoku` 即可启动它，之后的操作就很明了。如果你以前从未玩过数独，它它很容易：你只需要确保每行、每列、每个 3x3 构成的方块里都包含了 1-9 的所有数字。

你可在 [Github][2] 中找到 GPLv3 许可的 `nudoku` 源码

![](https://opensource.com/sites/default/files/uploads/linux-toy-nudoku-animated.gif)

你有特别喜欢的命令行小玩具需要我介绍的吗？我们的日历基本上满了，但我们仍然希望在新的一年中展示一些很酷的命令行玩具。请在评论中留言，我会查看的。记得让我知道你对今天玩具的看法。

一定要看看昨天的玩具，[使用 Linux 终端庆祝丰年][3]，记得明天回来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-nudoku

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-cal
[2]: https://github.com/jubalh/nudoku
[3]: https://opensource.com/article/18/12/linux-toy-figlet
