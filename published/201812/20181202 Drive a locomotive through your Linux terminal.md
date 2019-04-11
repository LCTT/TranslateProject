[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Drive a locomotive through your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-sl)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: (https://linux.cn/article-10357-1.html)

在 Linux 终端中开火车
======

> 使用 sl 命令，你可以让自己驾驶火车，带来一个有趣的命令行体验。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-sl.png?itok=WPTj0Ga9)

现在是 12 月，每个 Linux 终端用户都值得这一年的奖励。因此，我们将为你带来一个 Linux 命令行玩具的日历。什么是命令行玩具？它可能是一个游戏、一个小的无意义的打发时间的东西，或者为你在终端带来快乐的东西。

今天的 Linux 命令行玩具来自 Opensource.com 社区版主 [Ben Cotton][1] 的建议。Ben 建议 `sl`，它是<ruby>蒸汽机车<rt>steam locomotive</rt></ruby>的简称。

而对于 Linux `ls` 命令来说，`sl` 也是一个常见的拼写错误，这并不是巧合（LCTT 译注：意即 `sl` 是专门用来设计提醒 `ls` 打错的）。想要不再打错吗？尝试安装 `sl`。它可能已经在默认仓库中打包。对我而言，在 Fedora 中，这意味着安装起来很简单：

```
$ sudo dnf install sl -y
```

现在，只需键入 `sl` 即可测试。

![](https://opensource.com/sites/default/files/uploads/linux-toy-sl-animated.gif)

你可能会像我一样注意到，`Ctrl+C` 不会让你的火车脱轨，所以你必须等待整列火车通过。这会让你知道打错了 `ls`！

想查看 `sl` 源码？它已经在[在 GitHub 上][2]。

`sl` 也是分享我个人关于开源许可证的见解的绝佳机会。虽然它的[许可证][3]“足够开源”能够打包到我的发行版，但技术上而言，它并不是 [OSI 批准][4]的许可证。在其版权行之后，许可证的内容很简单：

> 每个人都可以在这个程序上做任何事情，包括复制，修改和改进，除非你试图假装你写了它。
> 
> 即，上述版权声明必须出现在所有副本中。
>
> 作者对本软件不承担任何责任。

遗憾的是，当你选择未经 OSI 批准的许可证时，你可能会意外地为你的用户带来额外的工作，因为他们必须要弄清楚你的许可证是否适用于他们的情况。他们的公司政策是否允许他们做贡献？甚至他们可以合法地使用该程序吗？许可证是否与他们希望与之集成的其他程序的许可证相匹配？

除非你是律师（也许，即使你是律师），否则在非标准许可证范围内选择可能会很棘手。因此，如果你仍在寻找新年的方案，为什么不把仅 OSI 批准的许可证作为你 2019 年新项目的选择呢。

这并不是对作者的不尊重。`sl` 仍然是一个很棒的小命令行玩具。

你有一个你认为我应该介绍的最喜欢的命令行玩具吗？这个系列的日历大部分已经完成，但我还剩下几个空余。请在下面的评论中告诉我，我会了解一下。如果有空间，我会尝试包含它。如果没有，但我得到了一些好的投稿，我会在最后做一些荣誉介绍。

了解昨天的玩具，[在 Linux 命令行中装饰字符][5]，还有记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-sl

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/bcotton
[2]: https://github.com/mtoyoda/sl
[3]: https://github.com/mtoyoda/sl/blob/master/LICENSE
[4]: https://opensource.org/licenses
[5]: https://opensource.com/article/18/12/linux-toy-boxes
