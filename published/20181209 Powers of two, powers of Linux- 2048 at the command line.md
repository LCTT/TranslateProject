[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10447-1.html)
[#]: subject: (Powers of two, powers of Linux: 2048 at the command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-2048)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

2 的威力，Linux 的威力：终端中的 2048
======

> 正在寻找基于终端的游戏来打发时间么？来看看 2048-cli 吧。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-2048.png?itok=3M6S-n1a)

你好，欢迎来到今天的 Linux 命令行玩具日历。每天，我们会为你的终端带来一个不同的玩具：它可能是一个游戏或任何简单的消遣，可以帮助你获得乐趣。

很可能你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新事物。

今天的玩具是我最喜欢的休闲游戏之一 [2048][2] （它本身就是另外一个克隆品的克隆）的[命令行版本][1]。

要进行游戏，你只需将滑块向上、向下、向左、向右移动，组合成对的数字，并增加数值，直到你得到数字为 2048 的块。最吸引人的地方（以及挑战）是你不能只移动一个滑块，而是需要移动屏幕上的每一块。（LCTT 译注：不知道有没有人在我们 Linux 中国的网站上遇到过 404 页面？那就是一个 2048 游戏，经常我错误地打开一个不存在的页面时，本应该去修复这个问题，却不小心沉迷于其中……）

它简单、有趣，很容易在里面沉迷几个小时。这个 2048 的克隆 [2048-cli][1] 是 Marc Tiehuis 用 C 编写的，并在 MIT 许可下开源。你可以在 [GitHub][1] 上找到源代码，你也可在这找到适用于你的平台的安装说明。由于它已为 Fedora 打包，因此我来说，安装就像下面那样简单：

```
$ sudo dnf install 2048-cli
```

这是这样，玩得开心！

![](https://opensource.com/sites/default/files/uploads/linux-toy-2048-animated_0.gif)

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

查看昨天的玩具，[在 Linux 终端中玩俄罗斯方块][3]，记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-2048

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://github.com/tiehuis/2048-cli
[2]: https://github.com/gabrielecirulli/2048
[3]: https://opensource.com/article/18/12/linux-toy-tetris
