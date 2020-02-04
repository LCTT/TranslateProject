MidnightBSD 可能是你通往 FreeBSD 的大门
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_4_0.jpg?itok=T2gpLVui)

[FreeBSD][1] 是一个开源操作系统，衍生自著名的 [Berkeley Software Distribution，伯克利软件套件][2]。FreeBSD 的第一个版本在 1993 年发布，并且仍然很强大。2007 年左右，Lucas Holt 想创建一个 FreeBSD 的分支，利用 OpenStep (现在是 Cocoa) 的 Objective-C 框架，widget 工具包和应用程序开发工具的 [GnuStep][3] 的实现。为此，他开始开发 MidnightBSD 桌面发行版。

MidnightBSD (以 Lucas 的猫命名，Midnight) 仍然在积极地(尽管缓慢)开发。自2017年8月可以获得最新的稳定发布版本 (0.8.6) 。尽管 BSD 发行版不是你所说的用户友好型发行版，通过命令行来加速它们的安装速度是一个你自己熟悉如何处理一个文本（ ncurses ）安装和最后完成安装的非常好的方法。

为此，你最终会得到一个非常可靠的 FreeBSD 分支的桌面发行版。但是如果你是一名 Linux 用户正在寻找扩展你的技能的方法，它将做一点工作，… 这是一个很好的起始地方。

我想带你走过安装 MidnightBSD 的工艺流程，如何添加一个图形桌面环境，然后如何安装应用程序。

### 安装

正如我所提到的，这是一个文本( ncurses ) 安装过程，因此在这里没有找到可用的鼠标。相反，你将使用你键盘的 Tab 和箭头按键。在你下载 [最新的发布版本][4] 后，将它刻录到一个 CD/DVD 或 USB 驱动器，并启动你的机器(或者在 [VirtualBox][5] 中创建一个虚拟机)。安装器将打开并给你三个选项(图 1)。选择安装(使用你的键盘的箭头按键)，并敲击 Enter 键。


![MidnightBSD installer][6]

图 1: 启动 MidnightBSD 安装器。


在这点上，在这里要经历相当多的屏幕。其中很多屏幕是一目了然的：

  1. 设置非默认键盘映射(是/否)

  2. 设置主机名称

  3. 添加可选系统组件(文档，游戏，32位兼容性，系统源码代码)

  4. 分区硬盘

  5. 管理员密码

  6. 配置网络接口

  7. 选择地区(时区)

  8. 启用服务(例如获得 shell)

  9. 添加用户(图 2)




![Adding a user][7]

图 2: 向系统添加一个用户。


在你向系统添加用户后，你将被拖拽到一个窗口中(图 3)，在这里，你可以处理任何你可能忘记的或你想重新配置的东西。如果你不需要作出任何更改，选择 Exit ，然后你的配置将被应用。

![Applying your configurations][8]

图 3: 应用你的配置。

在接下来的窗口中，当出现提示时，选择 No ，接下来系统将重启。在 MidnightBSD 重启后，你已经为下一阶段的安装做好了准备。

### Post 安装

当你最新安装的 MidnightBSD 启动时，你将发现你自己在一个命令提示符中。在这一点上，在这里未找到图形界面。我安装应用程序，MidnightBSD 依赖于 mport 工具。比如说你想安装 Xfce 桌面环境。为此，登录到 MidnightBSD 中，并发出下面的命令：
```
sudo mport index

sudo mport install xorg

```

你现在有已经安装的 Xorg 窗口服务器，它将允许你来安装桌面环境。使用命令来安装 Xfce ：
```
sudo mport install xfce

```

现在已经安装 Xfce 。不过，我们需要和命令 startx 一起运行来启用它。为此，让我们先安装 nano 编辑器。发出命令：
```
sudo mport install nano

```

随着 nano 已安装，发出命令：
```
nano ~/.xinitrc

```

这个文件仅包含一行：
```
exec startxfce4

```

保存并关闭这个文件。如果你现在发出命令 startx, Xfce 桌面环境将启动。你应该会感到一点在家里的感觉(图 4).

![ Xfce][9]

图 4: Xfce桌面界面已准备好服务。

因为你不想总是必需发出命令 startx ，你希望启用登录守护进程。然而，却没有安装。要安装这个子系统，发出命令：
```
sudo mport install mlogind

```

当完成安装后，通过在 /etc/rc.conf 文件中添加一个项目来在启动时启用 mlogind 。在 rc.conf 文件的底部，添加以下内容：
```
mlogind_enable=”YES”

```

保存并关闭该文件。现在，当你启动(或重启)机器时，你应该会看到图形登录屏幕。在写这篇文章的时候，在登录后，我最后得到一个空白屏幕和不想要的 X 光标。不幸的是，目前似乎并没有这个问题的解决方法。所以，要访问你的桌面环境，你必需使用 startx 命令。

### 安装

开箱即用，你将不能找到很多能使用的应用程序。如果你尝试安装应用程序(使用 mport )，你将很快发现你自己的沮丧，因为只能找到很少的应用程序。为解决这个问题，我们需要使用 svnlite 命令来查看检查出可用的 mport 软件列表。回到终端窗口，并发出命令：
```
svnlite co http://svn.midnightbsd.org/svn/mports/trunk mports

```

在你完成这些后，你应该看到一个命名为 ~/mports 的新的命令。 更改到这个目录(使用命令 cd ~/.mports 。发出 ls 命令，然后你应该看到许多的类别(图 5)。

![applications][10]

图 5: 对于 mport 现在可用的应用程序类别。

你想安装 Firefox ？如果你查看 www 目录，你将看到一个 linux-firefox 列表。发出命令：
```
sudo mport install linux-firefox

```

现在你应该会在 Xfce 桌面菜单中看到一个 Firefox 项目。翻找所有的类别，并使用 mport 命令来安装你需要的所有软件。

### 一个悲哀的警告

一个悲哀的小警告是， mport (通过via svnlite) 仅能找到的一个 office 套件的版本是 OpenOffice 3 。那是非常过时的。尽管  在 ~/mports/editors 目录中找到 Abiword ，但是它看起来不可用于安装。甚至在安装 OpenOffice 3 后，它会输出一个 Exec 格式错误。换句话说，你将不能使用 MidnightBSD 在 office 生产效率方面做很多的事情。但是，嘿嘿，如果你周围躺有一个旧的 Palm 导航器，你也安装 pilot 链接。换句话说，可用的软件不能生成一个极其有用的桌面发行版… 至少对普通用户不是。但是，如果你想在 MidnightBSD 上开发，你将找到很多可用的工具，准备安装(查看 ~/mports/devel 目录)。你甚至可以使用命令安装 Drupal ：

```
sudo mport install drupal7
```

当然，在此之后，你将需要创建一个数据库( MySQL 已经安装)，安装 Apache (sudo mport install apache24) ，并配置必需的 Apache 指令。

显然地，已安装的和能够安装什么是一个已经应用程序，系统和服务的大杂烩。但是随着足够多的工作，你最终可以得到一个能够服务特殊目的的发行版。

### 享受 *BSD 优良

这就是你如何使 MidnightBSD 启动，并在一个有点用的桌面发行版中运行。它不像很多其它的 Linux 发行版一样快速容易，但是如果你想要一个你想要的发行版，这可能正是你正在寻找的。尽管很多竞争对手有很多为安装而准备的可用的软件标题，MidnightBSD 无疑是一个 Linux 爱好者或管理员应该尝试的有趣的挑战。

通过来自 Linux 基金会和 edX 的免费的[" Linux 简介" ][11]课程学习更多关于 Linux 的信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/5/midnightbsd-could-be-your-gateway-freebsd

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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
