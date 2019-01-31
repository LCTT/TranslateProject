[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10488-1.html)
[#]: subject: (The Linux terminal is no one-trick pony)
[#]: via: (https://opensource.com/article/18/12/linux-toy-ponysay)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Linux 终端上的漂亮小马
======

> 将小马宝莉的魔力带到终端

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-ponysay.png?itok=ehl6pTr_)

欢迎再次来到 Linux 命令行玩具日历。如果这是你第一次访问该系列，你甚至可能会问自己什么是命令行玩具。我们正在思考中，但一般来说，它可能是一个游戏，或任何简单的消遣，可以帮助你在终端玩得开心。

很可能你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新事物。

读者 [Lori][1] 在我之前关于 [cowsay][2] 的文章的评论中提出了今天玩具的建议：

“嗯，我一直在玩一个叫 ponysay 的东西，它似乎是你的 cowsay 的彩色变种。”

我对此感到好奇，并去看了一下，发现没有让我失望。

简而言之，[ponysay][3] 的 cowsay 的重写，它包括了来自[小马宝莉][4]中的许多全彩色人物，你可以用它在 Linux 命令行输出短句。它实际上是一个非常完善的项目，拥有超过 400 个字符和字符组合，它还有让人难以置信的的 [78 页的 PDF 文档][5]涵盖了所有的用法。

要安装 `ponysay`，你需要查看项目的 [README][6] 来选择最适合你的发行版和情况的安装方法。由于 `ponysay` 似乎没有为我的 Fedora 发行版打包，我选择试用 Docker 容器镜像，但你可以选择最适合你的方法。从源码安装可能也适合你。

作为一个业余容器用户，我很想试试 [podman][7] 来代替 docker。至少对于我而言，它可以正常工作。

```
$ podman run -ti --rm mpepping/ponysay 'Ponytastic'
```

输出很神奇，我建议你也试下，然后告诉我你最喜欢的。这是我其中一个：

![](https://opensource.com/sites/default/files/uploads/linux-toy-ponysay-output.png)

它的开发人员选择用 [Pony][8] 来编写代码。（更新：很遗憾我写错了。虽然 Gihutb 根据它的文件扩展名认为它是 Pony，但是它是用 Python 写的。）Ponysay 使用 GPLv3 许可，你可以在 [GitHub][3] 中获取它的源码。

你有特别喜欢的命令行小玩具需要我介绍的吗？这个系列要介绍的小玩具大部分已经有了落实，但还预留了几个空位置。如果你有特别想了解的可以评论留言，我会查看的。如果还有空位置，我会考虑介绍它的。如果没有，但如果我得到了一些很好的意见，我会在最后做一些有价值的提及。

查看昨天的玩具，[在 Linux 终端中用火焰放松][9]，记得明天再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-ponysay

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/n8chz
[2]: https://opensource.com/article/18/12/linux-toy-cowsay
[3]: https://github.com/erkin/ponysay
[4]: https://en.wikipedia.org/wiki/My_Little_Pony
[5]: https://github.com/erkin/ponysay/blob/master/ponysay.pdf?raw=true
[6]: https://github.com/erkin/ponysay/blob/master/README.md
[7]: https://opensource.com/article/18/10/podman-more-secure-way-run-containers
[8]: https://opensource.com/article/18/5/pony
[9]: https://opensource.com/article/18/12/linux-toy-aafire
