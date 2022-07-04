[#]: subject: "openSUSE Leap 15.4 Release Adds Leap Micro 5.2, Updated Desktop Environments, and More"
[#]: via: "https://news.itsfoss.com/opensuse-leap-15-4-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14695-1.html"

openSUSE Leap 15.4 发布版本添加了 Leap Micro 5.2、更新桌面环境等等
======

> 为奋起直追 SUSE Linux Enterprise 的 SP 4 ，openSUSE Leap 15.4 到来了，带来了新的升级和极其重要的改善。

![opensuse 15.4][1]

即将到来的 openSUSE 小发布版本终于来了。如果你使用 openSUSE 作为你日常使用的桌面或服务器版本，你现在可能已经测试候选版本好几周了。

openSUSE Leap 15.4 的重点是软件包的更新，用以奋起直追 SUSE Linux Enterprise 的 SP 4 。因此，你将注意到一些弃用的软件包，以及可用于替换它们的新的升级。

当然，你应该有一些可用的软件包来确保兼容性。但是，大多数较旧的版本已经被移除。

### openSUSE Leap 15.4: 有什么新的变化？

为与最新的 SUSE Linux Enterprise（SLE）相适应，像 Python 2 和 KDE 4 一样的软件包已经被移除。你可以在这次的发布版本中找到较新的桌面环境。

此外，在容器和 AI/ML 用例方面，更新了 Podman、Containerd、Tensorflow 和 Grafana。

#### Leap Micro 5.2

Leap Micro 是针对容器和虚拟化工作负载定制的轻量级操作系统的最新版本。它也是 Leap 版的 [MicroOS][2]，是 Tumbleweed 的一种变体，提供了自动管理和修补。

#### 桌面环境

Xfce 4.16 继续保留，但你可以找到主要功能的一些新补充，包括新图标和调色板。

Xfce 4.16 中的设置管理器也获得了视觉上的刷新。类似地，文件管理器（Thunar）也有一些改善，新的状态托盘插件的深色模式支持等等。

KDE 4 软件包已经被弃用，Plasma 5.24 LTS 已经作为长期支持版本中包含于其中。

要深入了解这些变化，你可以查看我们之前针对 [KDE Plasma 5.24 LTS][3] 的报道。总体来说，新的 KDE Plasma 体验应该会令桌面用户赞叹。

说到 GNOME，你可以发现包含在 openSUSE Leap 15.4 中的 GNOME 41 带来了一系列的改善和新的特色功能。了解更多关于 [GNOME 41][4] 的信息，你可以期待它的一些新的特色功能。

对于其它的可用的桌面环境来说，Leap 15.4 包括：

* MATE 桌面环境 1.26
* Enlightenment 桌面环境0.25.3
* 深度桌面环境 20.3

#### 弃用的软件包

移除了一些基础的软件包，包括 Python 2（生命终结）、Digikam、TensorFlow 1.x 和 Qt 4 等软件包。

在更新系统后，你可以使用 Qt 5 和 Plasma 5 。

#### 更新的软件包

很多重要的软件包在 Leap 15.4 中得到了更新，包含一些流行的软件包：

* TensorFlow 2.6.2
* Podman 3.4.4
* GNU Health 4.0
* sudo 1.9.9
* systemd 249.10
* AppArmor 3.04
* DNF 4.10.0
* LibreOffice 7.2.5

因此，你应该会注意到一些针对服务器用户和桌面用户的各种应用程序的有用更新。很多多媒体应用程序，像 VLC、GNOME MPV 等，都得到了升级。

#### 其它改善

随着基本软件的更新和清理，你也可以找到一个由 SUSE 维护的较新的 Linux 内核 5.14.21。

更新后的内核对硬件的支持应该会有改善。

更多信息，你可以参考针对 [openSUSE Leap 15.4][5] 的发布版本说明。

> **[下载 openSUSE Leap 15.4][6]**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/opensuse-leap-15-4-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/opensuse-leap-15-4.jpg
[2]: https://microos.opensuse.org/
[3]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[4]: https://news.itsfoss.com/gnome-41-release/
[5]: https://doc.opensuse.org/release-notes/x86_64/openSUSE/Leap/15.4/#rnotes
[6]: https://get.opensuse.org/leap/15.4/
