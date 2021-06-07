[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10384-1.html)
[#]: subject: (Play Tetris at your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-tetris)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 终端上玩俄罗斯方块
======

> 用每个人最喜欢的砖块配对游戏“俄罗斯方块”重新创造 20 世纪 80 年代的魔力。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-tetris.png?itok=_UXtpgzN)

感谢你来浏览我们今天的 Linux 命令行玩具日历。如果这是你第一次访问该系列，你可能会问自己，什么是命令行玩具。即使我不太确定，但一般来说，它可能是一个游戏或任何消遣，可以帮助你在终端获得乐趣。

很可能你们中的一些人之前会看到过我们日历中的各种推荐，但我们希望每个人至少遇到一件新事物。

我承诺在我开始这个系列时，我会介绍游戏，但到目前为止，我忽略了它，所以我们今天的选择就是游戏：俄罗斯方块。

俄罗斯方块和我差不多年纪，都在 1984 年夏天来到世界。不过，俄罗斯方块不是来自北卡罗来纳州的农村地区，而是来自当时苏联的莫斯科。

在风靡世界之后，俄罗斯方块被克隆过很多次。我怀疑你可以找到任何你想找的任何语言、操作系统的俄罗斯方块的克隆。说真的，去看看吧。会有一些有趣的。

我今天带来的命令行[版本][1]是[用 Haskell 编写][1]的，它是我见过的做得更好的版本之一，有屏幕预览、得分、帮助、干净的外观。

如果你愿意从不受信任的来源运行已编译的二进制文件（我不推荐它），你可以直接获取它，但有个更安全的方法，使用 [dex][2] 的容器化版本也很容易，或者使用 [stack][3] 从源代码安装。

这个俄罗斯方块克隆版是由 Sam Tay 编写的，并且在 BSD 许可证下发布。[请看这里获取][1]！

![](https://opensource.com/sites/default/files/uploads/linux-toy-tetris-animated.gif)

如果你有自己喜欢的俄罗斯方块克隆版（或者你自己写的？），请告诉我们！

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

查看昨天的玩具，[在 Linux 命令行中计划你自己的假期日历][4]，明天再回来查看！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-tetris

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/samtay/tetris
[2]: https://github.com/dockerland/dex
[3]: https://docs.haskellstack.org/en/stable/README/#how-to-install
[4]: https://opensource.com/article/18/12/linux-toy-cal
