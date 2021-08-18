[#]: subject: (4 cool new projects to try in Copr from July 2021)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-july-2021/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13673-1.html)

COPR 仓库中 4 个很酷的新项目（2021.07）
======

![][1]

COPR 是个人软件仓库 [集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Wike

[Wike][5] 是一个用于 GNOME 桌面的维基百科阅读器，在 GNOME Shell 中集成了搜索功能。它提供了对 [在线百科全书][6] 的无干扰访问。它的界面很简约，但它支持在多种语言之间切换文章、书签、文章目录、黑暗模式等。

![][7]

#### 安装说明

该 [仓库][9] 目前为 Fedora 33、34 和 Fedora Rawhide 提供了 Wike。要安装它，请使用这些命令：

```
sudo dnf copr enable xfgusta/wike
sudo dnf install wike
```

### DroidCam

我们正生活在一个混乱的时代，被隔离在家中，我们与朋友和同事的大部分互动都发生在一些视频会议平台上。如果你已经有一部手机，就不要把钱浪费在价格过高的网络摄像头上。[DroidCam][11] 让你将手机与电脑配对，并将其作为专用网络摄像头使用。通过 USB 线或通过 WiFi 进行连接。DroidCam 提供对摄像头的远程控制，并允许缩放、使用自动对焦、切换 LED 灯和其他便利功能。

![][12]

#### 安装说明

该 [仓库][14] 目前为 Fedora 33 和 34 提供了 DroidCam。在安装之前，请更新你的系统并重新启动，或者确保你运行的是最新的内核版本，并安装了适当版本的 `kernel-headers`。

```
sudo dnf update
sudo reboot
```

Droidcam 依赖 `v4l2loopback`，必须从 [RPM Fusion 自由软件仓库][15] 手动安装。

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install v4l2loopback
sudo modprobe v4l2loopback
```

现在安装 `droidcam` 软件包：

```
sudo dnf copr enable meeuw/droidcam
sudo dnf install droidcam
```

### Nyxt

[Nyxt][17] 是一个面向键盘、可无限扩展的 Web 浏览器，专为高级用户设计。它在很大程度上受到 Emacs 的启发，因此用 Common Lisp 实现和配置，提供熟悉的按键绑定（[Emacs][18]、[vi][19]、[CUA][20]）。

其他不能错过的杀手锏是一个内置的 REPL、[树形历史][21]、[缓冲区代替标签][22]，还有[更多][17]。

Nyxt 与网络引擎无关，所以不用担心页面会以意外的方式呈现。

![][23]

#### 安装说明

该 [仓库][25] 目前为 Fedora 33、34 和 Fedora Rawhide 提供了 Nyxt。要安装它，请使用这些命令：

```
sudo dnf copr enable teervo/nyxt
sudo dnf install nyxt
```

### Bottom

[Bottom][27] 是一个具有可定制界面和多种功能的系统监控器，它从 [gtop][28]、[gotop][29] 和 [htop][30] 获得了灵感。因此，它支持 [进程][31] 监控、[CPU][32]、[RAM][33] 和 [网络][34] 使用监控。除了这些，它还提供了更多奇特的小部件，如 [磁盘容量][35] 使用情况，[温度传感器][36]，和 [电池][37] 使用情况。

由于小部件的可自定义布局以及 [可以只关注一个小部件并最大化它][38]，Bottom 可以非常有效地利用屏幕空间。

![][39]

#### 安装说明

该 [仓库][41] 为 Fedora 33、34 和 Fedora Rawhide 提供了 Bottom。它也可用于 EPEL 7 和 8。要安装它，请使用这些命令：

```
sudo dnf copr enable opuk/bottom
sudo dnf install bottom
```

使用 `btm` 命令来运行该程序。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-july-2021/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#wike
[5]: https://github.com/hugolabe/Wike
[6]: https://en.wikipedia.org/wiki/Main_Page
[7]: https://fedoramagazine.org/wp-content/uploads/2021/07/wike.png
[8]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions
[9]: https://copr.fedorainfracloud.org/coprs/xfgusta/wike/
[10]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#droidcam
[11]: https://www.dev47apps.com/
[12]: https://fedoramagazine.org/wp-content/uploads/2021/07/droidcam.png
[13]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-1
[14]: https://copr.fedorainfracloud.org/coprs/meeuw/droidcam
[15]: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/#proc_enabling-the-rpmfusion-repositories-using-command-line-utilities_enabling-the-rpmfusion-repositories
[16]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#nyxt
[17]: https://nyxt.atlas.engineer/
[18]: https://en.wikipedia.org/wiki/Emacs
[19]: https://en.wikipedia.org/wiki/Vim_(text_editor)
[20]: https://en.wikipedia.org/wiki/IBM_Common_User_Access
[21]: https://nyxt.atlas.engineer/#tree
[22]: https://nyxt.atlas.engineer/#fuzzy
[23]: https://fedoramagazine.org/wp-content/uploads/2021/07/nyxt.png
[24]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-2
[25]: https://copr.fedorainfracloud.org/coprs/teervo/nyxt/
[26]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#bottom
[27]: https://github.com/ClementTsang/bottom
[28]: https://github.com/aksakalli/gtop
[29]: https://github.com/xxxserxxx/gotop
[30]: https://github.com/htop-dev/htop/
[31]: https://clementtsang.github.io/bottom/nightly/usage/widgets/process/
[32]: https://clementtsang.github.io/bottom/nightly/usage/widgets/cpu/
[33]: https://clementtsang.github.io/bottom/nightly/usage/widgets/memory/
[34]: https://clementtsang.github.io/bottom/nightly/usage/widgets/network/
[35]: https://clementtsang.github.io/bottom/nightly/usage/widgets/disk/
[36]: https://clementtsang.github.io/bottom/nightly/usage/widgets/temperature/
[37]: https://clementtsang.github.io/bottom/nightly/usage/widgets/battery/
[38]: https://clementtsang.github.io/bottom/nightly/usage/general-usage/#expansion
[39]: https://fedoramagazine.org/wp-content/uploads/2021/07/bottom.png
[40]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-july.md#installation-instructions-3
[41]: https://copr.fedorainfracloud.org/coprs/opuk/bottom/
