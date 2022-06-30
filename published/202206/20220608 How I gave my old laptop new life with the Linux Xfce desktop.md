[#]: subject: "How I gave my old laptop new life with the Linux Xfce desktop"
[#]: via: "https://opensource.com/article/22/6/linux-xfce-old-laptop"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "lightchaserhy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14735-1.html"

我如何利用 Xfce 桌面为旧电脑赋予新生
======

![](https://img.linux.net.cn/data/attachment/album/202206/20/143325vfdibhvv22qvddiv.jpg)

> 当我为了在一场会议上做演示，用笔记本电脑安装 Linux 系统后，发现 Linux 和 Xfce 桌面让我的这台旧电脑健步如飞。

几周前，我要在一个会议上简要演示自己在 Linux 下编写的一款小软件。我需要带一台 Linux 笔记本电脑参会，因此我翻出一台旧笔记本电脑，并且安装上 Linux 系统。我使用的是 Fedora 36 Xfce 版，使用还不错。

这台我用的笔记本是在 2012 年购买的。1.70 GHZ 的 CPU、4 GB 的 内存、128 GB 的硬盘，也许和我现在的桌面电脑比性能很弱，但是 Linux 和 Xfce 桌面赋予了这台旧电脑新的生命。

### Linux 的 Xfce 桌面

Xfce 桌面是一个轻量级桌面，它提供一个精美、现代的外观。熟悉的界面，有任务栏或者顶部“面板”可以启动应用程序，在系统托盘可以改变虚拟桌面，或者查看通知信息。屏幕底部的快速访问停靠区让你可以启动经常使用的应用程序，如终端、文件管理器和网络浏览器。

![Image of Xfce desktop][6]

要开始一个新应用程序，点击左上角的应用程序按钮。这将打开一个应用程序启动菜单，顶部有常用的应用程序，比如终端和文件管理。其它的应用程序会分组排列，这样你可以找到所需要的应用。

![Image of desktop applications][7]

### 管理文件

Xfce 的文件管理器时叫 Thunar，它能很好地管理我的文件。我喜欢 Thunar 可以连接远程系统，在家里，我用一个开启 SSH 的树莓派作为个人文件服务器。Thunar 可以打开一个 SSH 文件传输窗口，这样我可以在笔记本电脑和树莓派之间拷贝文件。

![Image of Thunar remote][9]

另一个访问文件和文件夹的方式是通过屏幕底部的快速访问停靠区。点击文件夹图标可以打开一个常用操作的菜单，如在终端窗口打开一个文件夹、新建一个文件夹或进入指定文件夹等。

![Image of desktop with open folders][10]

### 其它应用程序

我喜欢探索 Xfce 提供的其他应用程序。Mousepad 看起来像一个简单的文本编辑器，但是比起纯文本编辑，它包含更多有用的功能。Mousepad 支持许多文件类型，程序员和其他高级用户也许会非常喜欢。可以在文档菜单中查看一下部分编程语言的列表。

![Image of Mousepad file types][11]

如果你更喜欢一个不同的外观和感觉，可以用视图菜单调整界面选项，如字体、配色方案以及行号。

![Image of Mousepad in color scheme solarized][12]

磁盘工具可以让你管理储存设备。虽然我不需要修改我的系统磁盘，磁盘工具是一个初始化或重新格式化 USB 闪存设备的好方式。我认为这个界面非常简单好用。

![Image of disk utility][13]

Geany 集成开发环境也给我留下了深刻印象，我有点惊讶于一个完整的集成开发软件（IDE）可以在一个旧系统可以如此流畅地运行。Geany 宣称自己是一个“强大、稳定和轻量级的程序员文本编辑器，提供大量有用的功能，而不会拖累你的工作流程”。而这正是 Geany 所提供的。

我用一个简单的 “hello world” 程序测试 Geany，当我输入每一个函数名称时，很高兴地看到 IDE 弹出语法帮助，弹出的信息并不特别显眼，且刚好提供了我需要的信息。虽然我能很容易记住 `printf` 函数，但总是忘记诸如 `fputs` 和 `realloc` 之类的函数的选项顺序，这就是我需要弹出语法帮助的地方。

![Image of Geany workspace][14]

深入了解 Xfce 的菜单，寻找其它应用程序，让你的工作更简单，你将找到可以播放音乐、访问终端或浏览网页的应用程序。

当我在笔记本电脑上安装了 Linux，在会议上做了一些演示后，我发现 Linux 和 Xfce 桌面让这台旧电脑变得相当敏捷。这个系统运行得如此流畅，以至于当会议结束后，我决定把这台笔记本电脑作为备用机。

我确实喜欢在 Xfce 中工作和使用这些应用程序，尽管系统开销不大，使用也很简单，但我并没有感觉到不够用，我可以用 Xfce 和上面的应用程序做任何事情。如果你有一台需要翻新的旧电脑，试试安装 Linux，给旧硬件带来新的生命。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-xfce-old-laptop

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[lightchaserhy](https://github.com/lightchaserhy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://spins.fedoraproject.org/xfce/download/index.html
[5]: https://opensource.com/article/19/12/xfce-linux-desktop
[6]: https://opensource.com/sites/default/files/2022-06/Linuxlaptop1.png
[7]: https://opensource.com/sites/default/files/2022-06/linuxlaptopDesktopApps.png
[8]: https://opensource.com/article/20/3/personal-file-server-ssh
[9]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopThunarremote.png
[10]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopDesk.png
[11]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopMousepadfiletype.png
[12]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopmousepadsolarized.png
[13]: https://opensource.com/sites/default/files/2022-06/linuxlaptopdisks.png
[14]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopgeany.png
