[#]: subject: "How to install a Desktop Environment (GUI) on Ubuntu Server"
[#]: via: "https://itsfoss.com/install-gui-ubuntu-server/"
[#]: author: "Chris Patrick Carias Stas https://itsfoss.com/author/chris/"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13408-1.html"

如何在 Ubuntu 服务器上安装桌面环境（GUI）
======

![](https://img.linux.net.cn/data/attachment/album/202105/20/110026zm3mmam0iztaaczz.jpg)

你想在你的 Ubuntu 服务器上安装 GUI 吗？大部分情况下你是可以安装的，在本教程中我会详细介绍安装的步骤。

在正式开始之前，我来告诉你为什么服务器版的 Ubuntu 不带 GUI，以及在什么情况下你可以在服务器上安装 GUI。

### 为什么 Ubuntu 服务器没有 GUI？

你对比过 Ubuntu 的桌面版和服务器版会发现，两者的主要区别是服务器版缺少 GUI（比如 [桌面环境][1]）。Ubuntu 服务器基本上就是桌面版去掉图形模块后的降级版本。

这是刻意为之的。Linux 服务器需要占用系统资源来运行服务。图形化桌面环境会消耗大量的系统资源，因此服务器操作系统默认不包含桌面环境。

你可以在只有 512 MB RAM 的机器上使用 Ubuntu 服务器，但是 Ubuntu 桌面需要至少 2 GB 的 RAM 才能提供正常的功能。在服务器运行桌面环境被认为是浪费资源。

作为一个服务器使用者（或系统管理员），你应该通过命令行来使用和管理你的系统。为了达到这个水平，你需要掌握丰富的 Linux 命令相关的知识。

![Typically, you have to manage a server from the command line][2]

### 你是否真正需要在你的服务器上安装 GUI？

有些用户可能不太习惯在终端下使用命令行来完成工作。毕竟大部分用户是有条件通过图形界面操作计算机的。

你可能会在你的服务器上安装桌面环境并使用图形界面。大部分人不会这么干，但这是可行的。

但是这只有在你可以直接操作服务器时才行得通。假设你是在物理机器上运行它，比如服务器、台式机或笔记本电脑，抑或类似树莓派的设备。如果你可以直接操作宿主机系统，那么你还可以在运行在虚拟机上的服务器上安装。

如果你是通过 [云服务器提供商如 Linode、DigitalOcean 或 AWS][3] 部署的服务器，那么安装 GUI 就行不通了。如果你想通过图形界面来管理你的远程服务器，你可以使用 Webmin 或 [Cockpit][4] 等工具。你可以在 Web 浏览器中通过这些工具使用和管理你的服务器。相比于成熟的桌面环境，它能大大降低资源消耗。

![Tools like Cockpit allow managing Linux servers graphically][5]

### 如何在 Ubuntu 服务器上安装 GUI？

当你了解了基础知识后，我们一起来看看在 Ubuntu 服务器上安装桌面环境的步骤。

你需要做以下准备：

  * 已经配置好 Ubuntu 服务器，且 RAM 至少 2 GB
  * 管理员权限（你需要用 `sudo` 执行命令）
  * 网络连接正常（你需要下载和安装新包）

我是在虚拟机上安装的 Ubuntu 服务器，并且我可以直接操作宿主机器。我使用同样的方法[在树莓派上安装了 Ubuntu 服务器][6]。

> 注意！
>
> 如果你是出于学习和调研等实验性的目的，那么你可以进行这些操作。请不要在生产环境的服务器上添加 GUI。后续删除 GUI 时可能会导致依赖问题，有些情况会破坏系统。

#### 准备系统

首先，因为你将要做一些系统级的修改，因此先进行更新和升级以确保我们系统的包是最新的：

```
sudo apt update && sudo apt upgrade
```

#### 安装桌面环境

更新结束后，你就可以安装桌面环境了。

有两种方法：

  * 使用 [apt][7] 来安装包
  * 使用一个名为 [tasksel][8] 的 Debian 工具，这个工具可以通过一条龙处理（任务）方式来安装多个包

任何一种方法都可以用完整包的方式来安装完整的桌面环境，就跟你从头安装桌面版本一样。我的意思是你可以得到跟桌面版本一样的所有的默认应用程序和工具。

如果你想使用 `tasksel`，需要先用下面的命令安装它：

```
sudo apt install tasksel
```

执行结束后，你就可以用 `tasksel` 来安装桌面环境（也叫 DE）了。

你可能知道有 [很多可用的桌面环境][9]。你可以选择自己喜欢的一个。有些桌面环境对系统资源占用得多（像 GNOME），有些占用得少（像 Xfce、MATE 等等）。

你可以自己决定使用哪个 DE。我会安装 [GNOME 桌面][10]，因为它是 Ubuntu 默认的桌面。之后我也会介绍其他桌面的安装。

如果你使用的是 `tasksel`，执行下面这条命令：

```
sudo tasksel install ubuntu-desktop
```

如果你使用 `apt`，执行下面这条命令：

```
sudo apt install ubuntu-desktop
```

这个过程可能会持续几分钟到一个小时，执行速度取决于你的网速和硬件。

我想提醒下，上面两个命令执行后都会安装完整的 GNOME 桌面环境。在本文中我两个命令都会执行，两个命令的结果是一样的。

#### 安装和配置显示管理器

安装完成后，你需要一个名为 [显示管理器][11] 或“登录管理器”的组件。这个工具的功能是在管理用户对话和鉴权时启动 [显示服务器][12] 并加载桌面。

GNOME 桌面默认使用 GDM3 作为显示管理器，但从资源角度考虑它有点重。你可以使用更轻量级和资源友好的管理器。这里我们使用一个平台无关的显示管理器 [lightdm][13]。使用 `apt` 安装它：

```
sudo apt install lightdm
```

安装 lightdm 时系统会让我们选择默认的显示管理器，因为即使你可以安装多个管理器，也只能运行一个。

![Use the arrow key to select an option and then use the tab key to select <OK> and press enter][14]

选择列表中的 “lightdm” 并点击 “\<Ok>”。这应该用不了几分钟。完成后你可以用下面的命令启动显示管理器并加载 GUI：

```
sudo service lightdm start
```

你可以使用下面的命令来检查当前的显示管理器：

```
cat /etc/X11/default-display-manager
```

运行后得到的结果类似这样：

![Checking the default Display Manager][15]

如果一切顺利，你现在会来到欢迎界面。

![Greetings screen of GNOME Desktop with LightDM on an Ubuntu server][16]

输入你的凭证，你的桌面就运行起来了。

![GNOME Desktop fully loaded on Ubutnu server][17]

如果你想关闭 GUI，那么打开一个终端并输入：

```
sudo service lightdm stop
```

#### 安装其他的桌面环境（可选）

前面我说过我们可以选择不同的桌面。我们一起来看看一些其他的选项：

##### MATE

[MATE][18] 是基于 GNOME2 源码的轻量级桌面，它完全开源，是一个不错的选项。

用下面的命令来安装 MATE：

```
sudo tasksel install ubuntu-mate-core
```

或

```
sudo apt install ubuntu-mate-core
```

##### Lubuntu / LXDE/LXQT

如果你的系统资源有限或者电脑很旧，那么我推荐另一个轻量级的 [Lubuntu][19]。使用下面的命令安装它：

```
sudo tasksel install lubuntu-core
```

或

```
sudo apt install lubuntu-core
```

##### Xubuntu / Xfce

[Xubuntu][20] 是基于 [Xfce][21] 的 Ubuntu 衍生版，轻量、简单、稳定但可高度定制。如果你想使用它，执行下面的命令：

```
sudo tasksel install xubuntu-core
```

或

```
sudo apt install xubuntu-core
```

还有一些桌面没有列出来，像 [KDE][22]，[Cinnamon][23] 和 [Budgie][24]，不代表它们不好，它们也都是非常卓越的，你可以自己尝试安装它们。

### 如何从 Ubuntu 服务器上删除 GUI？

如果你觉得桌面环境占用了太多的计算资源，你可以把之前安装的包删除掉。

请注意在某些情况下删除 GUI 可能会带来依赖问题，因此请备份好重要数据或创建一个系统快照。

- [如何从 Ubuntu 上删除包][25]

```
sudo apt remove ubuntu-desktop
sudo apt remove lightdm
sudo apt autoremove
sudo service lightdm stop
```

现在重启你的系统。你应该回到了正常的命令行登录。

### 结语

在大多数场景下是可以安装桌面 GUI 的。如果你不适应命令行，那么请使用类似 [YunoHost][26] 的发行版的服务器，YunoHost 基于 Debian 系统，你可以通过 GUI 来管理服务器。

上面说了，如果你是从头安装系统，那么我建议你使用桌面版本以避免后续的步骤。

如果你有任何问题，请在评论区留言。你会在服务器上使用 GUI 吗？参照本文后你遇到了什么问题吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-gui-ubuntu-server/

作者：[Chris Patrick Carias Stas][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chris/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-desktop-environment/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/system-restart-required.png?resize=800%2C469&ssl=1
[3]: https://linuxhandbook.com/free-linux-cloud-servers/
[4]: https://linuxhandbook.com/cockpit/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/cockpit-2-2.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://manpages.ubuntu.com/manpages/bionic/man8/tasksel.8.html
[9]: https://itsfoss.com/best-linux-desktop-environments/
[10]: https://www.gnome.org/
[11]: https://itsfoss.com/display-manager/
[12]: https://itsfoss.com/display-server/
[13]: https://wiki.debian.org/LightDM
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-select-dm.png?resize=799%2C354&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-default.png?resize=800%2C68&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop-greet.png?resize=798%2C600&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop.png?resize=792%2C597&ssl=1
[18]: https://mate-desktop.org/
[19]: https://lubuntu.net/
[20]: https://xubuntu.org/
[21]: https://www.xfce.org/
[22]: https://itsfoss.com/install-kde-on-ubuntu/
[23]: https://itsfoss.com/install-cinnamon-on-ubuntu/
[24]: https://itsfoss.com/install-budgie-ubuntu/
[25]: https://itsfoss.com/uninstall-programs-ubuntu/
[26]: https://yunohost.org/