[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10601-1.html)
[#]: subject: (Schedule a visit with the Emacs psychiatrist)
[#]: via: (https://opensource.com/article/18/12/linux-toy-eliza)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

预约 Emacs 心理医生
======

> Eliza 是一个隐藏于某个 Linux 最流行文本编辑器中的自然语言处理聊天机器人。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-eliza.png?itok=3ioiBik_)

欢迎你，今天时期 24 天的 Linux 命令行玩具的又一天。如果你是第一次访问本系列，你可能会问什么是命令行玩具呢。我们将会逐步确定这个概念，但一般来说，它可能是一个游戏，或任何能让你在终端玩的开心的其他东西。

可能你们已经见过了很多我们之前挑选的那些玩具，但我们依然希望对所有人来说都至少有一件新鲜事物。

今天的选择是 Emacs 中的一个彩蛋：Eliza，Rogerian 心理医生，一个准备好倾听你述说一切的终端玩具。

旁白：虽然这个玩具很好玩，但你的健康不是用来开玩笑的。请在假期期间照顾好你自己，无论时身体上还是精神上，若假期中的压力和焦虑对你的健康产生负面影响，请考虑找专业人士进行指导。真的有用。

要启动 [Eliza][1]，首先，你需要启动 Emacs。很有可能 Emacs 已经安装在你的系统中了，但若没有，它基本上也肯定在你默认的软件仓库中。

由于我要求本系列的工具一定要时运行在终端内，因此使用 `-nw` 标志来启动 Emacs 让它在你的终端模拟器中运行。

```
$ emacs -nw
```

在 Emacs 中，输入 `M-x doctor` 来启动 Eliza。对于像我这样有 Vim 背景的人可能不知道这是什么意思，只需要按下 `escape`，输入 `x` 然后输入 `doctor`。然后，向它倾述所有假日的烦恼吧。

Eliza 历史悠久，最早可以追溯到 1960 年代中期的 MIT 人工智能实验室。[维基百科][2] 上有它历史的详细说明。

Eliza 并不是 Emacs 中唯一的娱乐工具。查看 [手册][3] 可以看到一整列好玩的玩具。

![Linux toy：eliza animated][5]

你有什么喜欢的命令行玩具值得推荐吗？我们时间不多了，但我还是想听听你的建议。请在下面评论中告诉我，我会查看的。另外也欢迎告诉我你们对本次玩具的想法。

请一定要看看昨天的玩具，[带着这个复刻版吃豆人来到 Linux 终端游乐中心][6]，然后明天再来看另一个玩具！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-eliza

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://www.emacswiki.org/emacs/EmacsDoctor
[2]: https://en.wikipedia.org/wiki/ELIZA
[3]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Amusements.html
[4]: /file/417326
[5]: https://opensource.com/sites/default/files/uploads/linux-toy-eliza-animated.gif (Linux toy: eliza animated)
[6]: https://opensource.com/article/18/12/linux-toy-myman
