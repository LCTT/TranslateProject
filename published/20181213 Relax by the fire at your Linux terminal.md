[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10387-1.html)
[#]: subject: (Relax by the fire at your Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-aafire)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 终端中观看火焰
======

> 何不在命令行中进行一次“烧烤”呢？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-aafire.png?itok=pAttiVvG)

这里是《24 天了解 Linux 命令行小玩意》。如果你未曾读过本系列的文章，可以在本文的结尾部分获取上一篇文章的链接，以了解本系列的大概内容。我们所介绍的命令行小玩意可供你消遣无聊时光。

你或许知道它们其中的一些，也可能不曾知晓它们。无论如何，我们都希望你能度过一段愉快的时光。

如果你住在北半球的非热带地区，可能冬季来临时你会被冻得满脸通红。住在这里的我，最喜欢的事情便是在火炉旁惬意地边喝茶边读书。

不幸的是，我家刚好缺个放火炉的地方。不过，多亏了今天我要介绍的 `aafire` ，我仍然可以假装我坐在火炉旁。

在我所使用的系统里， `aafire` 被打包进了 aalib 。 aalib 是一个受人喜爱的库，它可以很方便地将图像转换成 ASCII 图并输出到终端（或其它任何地方）。 aalib 将多种多样的图像带入了 Linux 终端。你可以看看本系列的其它文章，了解一下其它小程序，以便配合使用并充分利用它们。在 Fedora 中，你可以通过以下命令来安装 aalib ：

```
$ sudo dnf install aalib
```

接着，试着运行 `aafire` 命令。 `aalib` 默认会使用 GUI 模式，我们要进行一些操作来让它在终端中运行（毕竟这一系列文章都讲的是命令行）。十分幸运的是，仅需安装 [curses][1] 就能实现我们想要的效果。请执行：

```
$ aafire -driver curses
```

![](https://opensource.com/sites/default/files/uploads/linux-toy-aafire-animated.gif)

如果你觉得 aalib 挺有意思，可以在 [Sourceforge][2] 上找到它的源码（以 LGPLv2 许可证开源）。

欢迎将你觉得有意思的命令行小程序投稿到原作者处，只需在原文下留言即可。

如果有兴趣，可以查看原作者的上一篇文章： [在命令行中步入黑客帝国][3] 。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-aafire

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Curses_(programming_library)
[2]: http://aa-project.sourceforge.net/aalib/
[3]: https://opensource.com/article/18/12/linux-toy-cmatrix
