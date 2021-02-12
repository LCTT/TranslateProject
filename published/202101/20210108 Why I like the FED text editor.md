[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13019-1.html)
[#]: subject: (Why I like the FED text editor)
[#]: via: (https://opensource.com/article/21/1/fed-editor)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

我为什么喜欢 FED 文本编辑器
======

> FED 编辑器让我可以轻松有效地对我的 FreeDOS 项目进行编码。学习如何充分利用这个灵活的 Linux、Windows 和 DOS 编辑器。

![](https://img.linux.net.cn/data/attachment/album/202101/16/114344hgra9oq4q45mgz9r.jpg)

当我不[在我的 Linux 桌面上工作][2]的时候，我通常是在为一个旧版的 16 位系统写代码。[FreeDOS][3] 是一个开源的 DOS 兼容操作系统，你可以用它来玩经典的 DOS 游戏，运行旧版的商业软件，或者开发嵌入式系统。任何在 MS-DOS 上运行的程序在 FreeDOS 上也应该可以运行。

我是和 DOS 一起长大的。我家的第一台个人电脑是一台 Apple II 兼容机，但我们最终升级到了一台运行 DOS 的 IBM PC。从 1980 年代早期到 1993 年我[发现 Linux][4] 这段时间，我做了十多年的 DOS 用户。

Linux 和开源软件所提供的自由度给我留下了深刻的印象。所以当微软在 1994 年宣布 DOS 的终结，以及即将推出的 Windows 95 时，我决定编写自己的开源 DOS。这就是 [FreeDOS 的开始][4]。

这么多年过去了，我还在继续研究 FreeDOS。它是一个很好的业余兴趣系统，在这里我可以运行我最喜欢的 DOS 应用和游戏。是的，我仍然在为 FreeDOS 写代码。

我最喜欢的 DOS 编程编辑器是 FED 编辑器。FED 是一个极简的文本编辑器，没有太多的视觉效果。这种精简的方法帮助我充分利用了 DOS 中标准的 80x25 屏幕。当编辑一个文件时，FED 会在屏幕底部显示一行状态行，让你在剩下的 24 行来编写你的代码。FED 还支持彩色语法高亮显示，以不同的颜色显示代码的不同部分，使你更容易发现错别字，以免它们变成错误。

![Writing a Solitaire game with FED][5]

*用 FED 写一个纸牌游戏*

当你需要菜单时，按下键盘上的 `Alt` 键，FED 就会在最上面一行显示一个菜单。FED 也支持键盘快捷键，但要注意默认值。例如，`Ctrl-C` 会关闭文件，`Ctrl-V` 会改变视图。如果你不喜欢这些默认键，你可以在 **Config** 菜单中更改键位映射。

![Tap the Alt key to bring up the menu][6]

*按下 Alt 键弹出菜单*

如果你不喜欢默认的白底黑字显示，你可以在 **Config** 菜单下更改颜色。我更喜欢蓝底白字的正文，关键词用亮白色，注释用亮蓝色，特殊字符用青色，数字用绿色。FED 可以很容易地设置你想要的颜色。

![My preferred colors when programming on DOS][7]

*我在 DOS 上编程时喜欢的颜色*

FED 也是一个折叠式文本编辑器，这意味着它可以折叠或展开我的部分代码，以便我可以看到更多的文件。在函数名上按下 `Ctrl-F`，FED 会折叠整个函数。折叠在其他代码上也可以使用。我也使用折叠来隐藏 `for` 和 `while` 循环或其他流程控制，如 `if` 和 `switch` 块。

![Folding a function lets you see more of the file][8]

*折叠函数可以让你看到更多的文件*

Shawn Hargreaves 从 1994 年至 2004 年编写并维护 FED。Robert Riebisch 从那时起就开始维护 FED。FED 在 GNU GPL 许可下发布，支持 DOS、Linux 和 Windows。

你可以在 <https://www.bttr-software.de/products/fed/> 下载 FED。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/fed-editor

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/19/9/business-creators-open-source-tools
[3]: https://opensource.com/article/19/6/freedos-anniversary
[4]: https://opensource.com/article/17/5/how-i-got-started-linux-jim-hall-freedos
[5]: https://opensource.com/sites/default/files/1-fed.png
[6]: https://opensource.com/sites/default/files/2-fed.png
[7]: https://opensource.com/sites/default/files/3-fed.png
[8]: https://opensource.com/sites/default/files/4-fed.png
