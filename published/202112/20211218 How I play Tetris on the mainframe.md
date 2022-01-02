[#]: subject: "How I play Tetris on the mainframe"
[#]: via: "https://opensource.com/article/21/12/mainframe-tetris"
[#]: author: "Elizabeth K. Joseph https://opensource.com/users/pleia2"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14127-1.html"

我在大型机上玩俄罗斯方块
======

> 下面是我如何通过访问虚拟 Linux 服务器，在大型机上编译和玩我最喜欢的游戏。

![](https://img.linux.net.cn/data/attachment/album/202112/29/102337wl9sx335t3gxguc5.jpg)

可以 [在现代大型机上运行 Linux][2] 的能力为在该平台上做各种事情打开了大门。一个 Apache HTTP 服务器？很简单！一个数据库？你想用 SQL 还是 NoSQL？Kubernetes？当然没问题！正如我在 [大型机上的 Linux：过去和现在][3] 中总结的那样，今天所有最流行的服务器 Linux 发行版都有大型机的版本。

这对那些在大型机上运行关键任务基础设施的公司来说是个好消息，但如果你只是想玩玩大型机呢？我第一次在 IBM LinuxONE 上使用 bash shell 时，安装了 irssi 聊天客户端，向 IRC 上的所有朋友展示了 `/proc/cpuinfo` 的输出，以炫耀这是一个 s390x 架构的系统。

一开始，我对下一步该做什么感到茫然。然后我想，用这台巨大的计算机来玩游戏会很有趣。我首先想到的是 [NetHack][4]，但事实证明，我可以用简单的 `apt install nethack-console` 来安装它。不，我应该编译一些东西才好玩！对于每一种计算机架构，你都需要为其编写的编译器和解释器。Linux 在大型机上已有 20 多年的历史，你通常期望的大多数编译器和解释器都已经被移植了。

在我的成长过程中，我最喜欢的游戏之一是俄罗斯方块，所以它是我进行实验的合理选择。我找到了一个用 C 语言编写的开源俄罗斯方块游戏，叫做 [vitetris][5]，并试了试。这就像在任何其他 Linux 服务器上编译一个 C 语言程序一样。

首先，我需要安装一些依赖项。这台主机运行的是 Linux，所以我可以用我的包管理器来 [安装构建需求][6]，然后我就顺利完成了。

接下来，就是获取代码和构建的问题了：

```
curl -LO https://github.com/vicgeralds/vitetris/archive/v0.58.0.tar.gz
tar xvf v0.58.0.tar.gz
cd vitetris-0.58.0/
./configure
make
```

不一会儿，我就开始玩我最喜欢的游戏了！

```
./tetris
```

![Screenshot of an open source Tetris game in progress, running on Linux][7]

正如我所说，这与在 Linux 服务器上构建其他 C 程序完全一样，但你是在大型机上做的。

不幸的是，我的车库里还没有一台大型机。相反，我是在马里斯特学院通过 [IBM LinuxONE 社区云][9] 计划托管的虚拟服务器上完成了这一切。它让你免费访问一个 s390x 架构的 Linux 服务器，你可以选择最流行的发行版。通过这个虚拟服务器，你可以在 120 天内进行实验。

如果你是一个开源项目的代表，正在考虑在 s390x 上为 Linux 构建你的应用，也有一个项目适合你。当我不玩俄罗斯方块的时候，我在 IBM 的实际工作就是与开源社区合作来做这件事。你可以请求一个永久的 Linux 虚拟服务器供你的社区用于开发，无论是进行手动测试以查看你的应用是否会构建，或正式将其添加到项目的持续集成系统中都行。我建议从社区云开始做一些实验，然后你可以填写 [这个表格][10] 来启动获得永久虚拟服务器的流程。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/mainframe-tetris

作者：[Elizabeth K. Joseph][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pleia2
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f (Gaming artifacts with joystick, GameBoy, paddle)
[2]: https://opensource.com/article/19/9/linux-mainframes-part-1
[3]: https://opensource.com/article/19/9/linux-mainframes-part-2
[4]: https://www.nethack.org/
[5]: http://victornils.net/tetris/
[6]: https://opensource.com/article/21/11/compiling-code
[7]: https://opensource.com/sites/default/files/uploads/tetris_osdotcom.png (Tetris)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://developer.ibm.com/gettingstarted/ibm-linuxone/
[10]: https://www.ibm.com/community/z/open-source/virtual-machines-request/
