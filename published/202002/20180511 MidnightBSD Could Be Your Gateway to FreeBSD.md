MidnightBSD：或许是你通往 FreeBSD 的大门
======

![](https://www.linux.com/wp-content/uploads/2019/08/midnight_4_0.jpg)

[FreeBSD][1] 是一个开源操作系统，衍生自著名的 <ruby>[伯克利软件套件][2]<rt>Berkeley Software Distribution</rt></ruby>（BSD）。FreeBSD 的第一个版本发布于 1993 年，并且仍然在继续发展。2007 年左右，Lucas Holt 想要利用 OpenStep（现在是 Cocoa）的 Objective-C 框架、widget 工具包和应用程序开发工具的 [GnuStep][3] 实现，来创建一个 FreeBSD 的分支。为此，他开始开发 MidnightBSD 桌面发行版。

MidnightBSD（以 Lucas 的猫 Midnight 命名）仍然在积极地（尽管缓慢）开发。从 2017 年 8 月开始，可以获得最新的稳定发布版本（0.8.6）（LCTT 译注：截止至本译文发布时，当前是 2019/10/31 发布的 1.2 版）。尽管 BSD 发行版不是你所说的用户友好型发行版，但上手安装是熟悉如何处理 文本（ncurses）安装过程以及通过命令行完成安装的好方法。

这样，你最终会得到一个非常可靠的 FreeBSD 分支的桌面发行版。这需要花费一点精力，但是如果你是一名正在寻找扩展你的技能的 Linux 用户……这是一个很好的起点。

我将带你走过安装 MidnightBSD 的流程，如何添加一个图形桌面环境，然后如何安装应用程序。

### 安装

正如我所提到的，这是一个文本（ncurses）安装过程，因此在这里找不到可以用鼠标点击的地方。相反，你将使用你键盘的 `Tab` 键和箭头键。在你下载[最新的发布版本][4]后，将它刻录到一个 CD/DVD 或 USB 驱动器，并启动你的机器（或者在 [VirtualBox][5] 中创建一个虚拟机）。安装程序将打开并给你三个选项（图 1）。使用你的键盘的箭头键选择 “Install”，并敲击回车键。

![MidnightBSD installer][6]

*图 1: 启动 MidnightBSD 安装程序。*

在这里要经历相当多的屏幕。其中很多屏幕是一目了然的：

1. 设置非默认键盘映射（是/否）
2. 设置主机名称
3. 添加可选系统组件（文档、游戏、32 位兼容性、系统源码代码）
4. 对硬盘分区
5. 管理员密码
6. 配置网络接口
7. 选择地区（时区）
8. 启用服务（例如 ssh）
9. 添加用户（图 2）

![Adding a user][7]

*图 2: 向系统添加一个用户。*

在你向系统添加用户后，你将被进入到一个窗口中（图 3），在这里，你可以处理任何你可能忘记配置或你想重新配置的东西。如果你不需要作出任何更改，选择 “Exit”，然后你的配置就会被应用。

![Applying your configurations][8]

*图 3: 应用你的配置。*

在接下来的窗口中，当出现提示时，选择 “No”，接下来系统将重启。在 MidnightBSD 重启后，你已经为下一阶段的安装做好了准备。

### 后安装阶段

当你最新安装的 MidnightBSD 启动时，你将发现你自己处于命令提示符当中。此刻，还没有图形界面。要安装应用程序，MidnightBSD 依赖于 `mport` 工具。比如说你想安装 Xfce 桌面环境。为此，登录到 MidnightBSD 中，并发出下面的命令：

```
sudo mport index
sudo mport install xorg
```

你现在已经安装好 Xorg 窗口服务器了，它允许你安装桌面环境。使用命令来安装 Xfce ：

```
sudo mport install xfce
```

现在 Xfce 已经安装好。不过，我们必须让它同命令 `startx` 一起启用。为此，让我们先安装 nano 编辑器。发出命令：

```
sudo mport install nano
```

随着 nano 安装好，发出命令：

```
nano ~/.xinitrc
```

这个文件仅包含一行内容：

```
exec startxfce4
```

保存并关闭这个文件。如果你现在发出命令 `startx`, Xfce 桌面环境将会启动。你应该会感到有点熟悉了吧（图 4）。

![ Xfce][9]

*图 4: Xfce 桌面界面已准备好服务。*

因为你不会总是想必须发出命令 `startx`，你希望启用登录守护进程。然而，它却没有安装。要安装这个子系统，发出命令：

```
sudo mport install mlogind
```

当完成安装后，通过在 `/etc/rc.conf` 文件中添加一个项目来在启动时启用 mlogind。在 `rc.conf` 文件的底部，添加以下内容：

```
mlogind_enable=”YES”
```

保存并关闭该文件。现在，当你启动（或重启）机器时，你应该会看到图形登录屏幕。在写这篇文章的时候，在登录后我最后得到一个空白屏幕和讨厌的 X 光标。不幸的是，目前似乎并没有这个问题的解决方法。所以，要访问你的桌面环境，你必须使用 `startx` 命令。

### 安装应用

默认情况下，你找不到很多能可用的应用程序。如果你尝试使用 `mport` 安装应用程序，你很快就会感到沮丧，因为只能找到很少的应用程序。为解决这个问题，我们需要使用 `svnlite` 命令来查看检出的可用 mport 软件列表。回到终端窗口，并发出命令：

```
svnlite co http://svn.midnightbsd.org/svn/mports/trunk mports
```

在你完成这些后，你应该看到一个命名为 `~/mports` 的新目录。使用命令 `cd ~/.mports` 更改到这个目录。发出 `ls` 命令，然后你应该看到许多的类别（图 5）。

![applications][10]

*图 5: mport 现在可用的应用程序类别。*

你想安装 Firefox 吗？如果你查看 `www` 目录，你将看到一个 `linux-firefox` 列表。发出命令：

```
sudo mport install linux-firefox
```

现在你应该会在 Xfce 桌面菜单中看到一个 Firefox 项。翻找所有的类别，并使用 `mport` 命令来安装你需要的所有软件。

### 一个悲哀的警告

一个悲哀的小警告是，`mport` （通过 `svnlite`）仅能找到的一个办公套件的版本是 OpenOffice 3 。那是非常过时的。尽管在 `~/mports/editors` 目录中能找到 Abiword ，但是它看起来不能安装。甚至在安装 OpenOffice 3 后，它会输出一个执行格式错误。换句话说，你不能使用 MidnightBSD 在办公生产效率方面做很多的事情。但是，嘿嘿，如果你周围正好有一个旧的 Palm Pilot，你可以安装 pilot-link。换句话说，可用的软件不足以构成一个极其有用的桌面发行版……至少对普通用户不是。但是，如果你想在 MidnightBSD 上开发，你将找到很多可用的工具可以安装（查看 `~/mports/devel` 目录）。你甚至可以使用命令安装 Drupal ：

```
sudo mport install drupal7
```

当然，在此之后，你将需要创建一个数据库（MySQL 已经安装）、安装 Apache（`sudo mport install apache24`），并配置必要的 Apache 配置。

显然地，已安装的和可以安装的是一个应用程序、系统和服务的大杂烩。但是随着足够多的工作，你最终可以得到一个能够服务于特殊目的的发行版。

### 享受 \*BSD 优良

这就是如何使 MidnightBSD 启动，并使其运行某种有用的桌面发行版的方法。它不像很多其它的 Linux 发行版一样快速简便，但是如果你想要一个促使你思考的发行版，这可能正是你正在寻找的。尽管大多数竞争对手都准备了很多可以安装的应用软件，但 MidnightBSD 无疑是一个 Linux 爱好者或管理员应该尝试的有趣挑战。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/5/midnightbsd-could-be-your-gateway-freebsd

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.freebsd.org/
[2]:https://en.wikipedia.org/wiki/Berkeley_Software_Distribution
[3]:https://en.wikipedia.org/wiki/GNUstep
[4]:http://www.midnightbsd.org/download/
[5]:https://www.virtualbox.org/
[6]:https://lcom.static.linuxfound.org/sites/lcom/files/midnight_1.jpg (MidnightBSD installer)
[7]:https://lcom.static.linuxfound.org/sites/lcom/files/midnight_2.jpg (Adding a user)
[8]:https://lcom.static.linuxfound.org/sites/lcom/files/mightnight_3.jpg (Applying your configurations)
[9]:https://lcom.static.linuxfound.org/sites/lcom/files/midnight_4.jpg (Xfce)
[10]:https://lcom.static.linuxfound.org/sites/lcom/files/midnight_5.jpg (applications)
[11]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
