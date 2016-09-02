Ubuntu Snap 软件包接管 Linux 桌面和 IoT 软件的发行
===========================================================================

[Canonical][28] 和 [Ubuntu][29] 创始人 Mark Shuttleworth 在一次采访中说他不准备宣布 Ubuntu 的新 [ Snap 程序包格式][30]。但是就在几个月之后，很多 Linux 发行版的开发者和公司都宣布他们会把 Snap 作为通用 Linux 程序包格式。

![](http://zdnet2.cbsistatic.com/hub/i/r/2016/06/14/a9b2a139-3cd4-41bf-8e10-180cb9450134/resize/770xauto/adc7d16a46167565399ecdb027dd1416/ubuntu-snap.jpg)

*Linux 供应商，独立软件开发商和公司门全都采用 Ubuntu Snap 作为多种 Linux 系统的配置和更新程序包。*

为什么呢？因为 Snap 能使一个单一的二进制程序包可以完美、安全地运行在任何 Linux 台式机、服务器、云或物联网设备上。据 Canonical 的 Ubuntu 客户端产品和版本负责人 Olli Ries 说：

>[Snap 程序包的安全机制][1]让我们在更快的跨发行版的应用更新中打开了新的局面，因为 Snap 应用是与系统的其它部分想隔离的。用户可以安装一个 Snap 而不用担心是否会影响其他的应用程序和操作系统。

当然了，如 Linux 内核的早期开发者和 CoreOS 安全维护者 Matthew Garrett 指出的那样：如果你[将 Snap 用在不安全的程序中，比如 X11 窗口系统][2]，实际上您并不会获得安全性。（LCTT 译注：X11 也叫做 X Window 系统，X Window 系统 ( X11 或 X )是一种位图显示的视窗系统 。它是在 Unix 和类 Unix 操作系统 ，以及 OpenVMS 上建立图形用户界面的标准工具包和协议，并可用于几乎所有已有的现代操作系统。）

Shuttleworth 同意 Garrett 的观点，但是他也说你可以控制 Snap 应用是如何与系统的其它部分如何交互的。比如，一个 web 浏览器可以包含在一个安全的 Snap 程序包中，这个 Snap 使用 Ubuntu 打包的 [openssl][3] TLS 和 SSL 库。除此之外，即使有些东西影响到了浏览器实例内部，也不能进入到底层的操作系统。

很多公司也这样认为。戴尔、三星、Mozilla、[krita][7]（LCTT 译注：Krita 是一个位图形编辑软件，KOffice 套装的一部份。包含一个绘画程式和照片编辑器，Krita 是自由软件，并根据GNU通用公共许可证发布）、[Mycroft][8]（LCTT 译注：Mycroft 是一个开源AI智能家居平台，配置 Raspberry Pi 2 和 Arduino 控制器），以及 [Horizon Computing][9]（LCTT 译注：为客户提供优质的硬件架构为其运行云平台）都将使用 Snap。Arch Linux、Debain、Gentoo 和 OpenWrt 开发团队也已经拥抱了 Snap，也会把 Snap 加入到他们各自的发行版中。

Snap 包又叫做“Snaps”，现在已经可以原生的运行在 Arch、Debian、Fedora、Kubuntu、Lubuntu、Ubuntu GNOME、Ubuntu Kylin、Ubuntu MATE、Ubuntu Unity 和 Xubuntu 之上。 Snap 也在 CentOS、Elementary、Gentoo、Mint、OpenSUSE 和 Red Hat Enterprise Linux (RHEL) 上取得了验证，并且也很容易运行在其他 Linux 发行版上。 

这些发行版正在使用 Snaps，Shuttleworth 声称：“Snaps 为每个 Linux 台式机、服务器、设备和云机器带来了很多应用程序，在让用户使用最好的应用的同时也给了用户选择发行版的自由。”

这些发行版共同代表了 Linux 桌面、服务器和云系统发行版的主流。为什么它们从现有的软件包管理系统换了过来呢？ Arch Linux 的贡献者 Tim Jester-Pfadt 解释说，“Snaps 最棒的一点是它支持先锐和测试通道，这可以让用户选择使用预发布的开发者版本或跟着最新的稳定版本。”

除过这些 Linux 分支，独立软件开发商也将会因为 Snap 很好的简化了第三方 Linux 应用程序分发和安全维护问题而拥抱 Snap。例如，[文档基金会][14]也将会让流行的开源办公套件 [LibreOffice][15] 支持 Snap 程序包。

文档基金会的联合创始人 Thorsten Behrens 这样说：

> 我们的目标是尽可能的使 LibreOffice 能被大多数人更容易使用。Snap 使我们的用户能够在不同的桌面系统和发行版上更快捷、更容易、持续地获取最新的 LibreOffice 版本。更好的是，它也会帮助我们的发布工程师最终从周而复始的、自产的、陈旧的 Linux 开发解决方案中解放出来，很多东西都可以一同维护了。

Ｍozilla 的 Firefix 副总裁 Nick Nguyen 在该声明中提到：

> 我们力求为用户提供良好的使用体验，并且使火狐浏览器能够在更多平台、设备和操作系统上运行。随着引入 Snaps ，对火狐浏览器的持续优化成为可能，使它可以为 Linux 用户提供最新的特性。

[Krita 基金会][17] （基于 KDE 的图形程序）项目领导 Boudewijn Rempt 说：

> 在一个私有仓库中维护 DEB 包是复杂而耗时的。Snaps 更容易维护、打包和分发。把 Snap 放进软件商店也特别容易，这是我发布软件用过的最舒服的软件商店了。[Krita 3.0][18] 刚刚作为一个 snap 程序包发行，新版本出现时它会自动更新。

不仅 Linux 桌面系统程序为 Snap 而激动。物联网（IoT）和嵌入式开发者也以双手拥抱了 Snap。 

由于 Snaps 彼此隔离，带来了数据安全性，它们还可以自动更新或回滚，这对于硬件设备是极好的。多个厂商都发布了运行着 snappy 的设备（LCTT 译注：Snap 基于 snappy进行构建），这带来了一种新的带有物联网应用商店的“智能新锐”设备。Snappy 设备能够自动接收系统更新，并且连同安装在设备上的应用程序也会得到更新。

据 Shuttleworth 说，戴尔公司是最早一批认识到 Snap 的巨大潜力的物联网供应商之一，也决定在他们的设备上使用 Snap 了。

戴尔公司的物联网战略和合作伙伴主管 Jason Shepherd 说：“我们认为，Snaps 能解决在单一物联网网关上部署和运行多个第三方应用程序所带来的安全风险和可管理性挑战。这种可信赖的通用的应用程序格式才是戴尔真正需要的，我们的物联网解决方案合作伙伴和商业客户都对构建一个可扩展的、IT 级的、充满活力的物联网应用生态系统有极大的兴趣。”

OpenWrt 的开发者 Matteo Croce 说：“这很简单， Snaps 可以在保持核心系统不变的情况下递送新的应用... Snaps 是为 OpenWrt AP 和路由器提供大量软件的最快方式。”

Shuttleworth 并不认为 Snaps 会取代已经存在的 Linux 程序包比如 [RPM][19] 和 [DEB][20]。相反，他认为它们将会相辅相成。Snaps 将会与现有软件包共存。每个发行版都有其自己提供和更新核心系统及其更新的机制。Snap 为桌面系统带来的是通用的应用程序，这些应用程序不会影响到操作系统的基础。

每个 Snap 都通过使用大量的内核隔离和安全机制而限制，以满足 Snap 应用的需求。谨慎的审核过程可以确保 Snap 仅仅得到其完成请求操作的权限。用户在安装 Snap 的时候也不必考虑复杂的安全问题。

Snap 本质上是一个自包容的 zip 文件，能够快速地在包内执行。流行的[优麒麟][21]团队的负责人 Jack Yu 称：“Snaps 比传统的 Linux 包更容易构建，允许我们独立于操作系统解决依赖性，所以我们很容易地跨发行版为所有用户提供最好、最新的中国 Linux 应用。”

由 Canonical 设计的 Snap 程序包格式由 [snapd][22] 所处理。它的开发工作放在 GitHub 上。将其移植到更多的 Linux 发行版已经被证明是很简单的，社区还在不断增长，吸引了大量具有 Linux 经验的贡献者。 

Snap 程序包使用 snapcraft 工具来构建。项目官网是 [snapcraft.io][24]，其上有构建 Snap 的指导和逐步指南，以及给项目开发者和使用者的文档。Snap 能够基于现有的发行版程序包构建，但通常使用源代码来构建，以获得优化和减小软件包大小。

如果你不是 Ubuntu 的忠实粉丝或者一个专业的 Linux 开发者，你可能还不知道 Snap。未来，在任何平台上需要用 Linux 完成工作的任何人都会知道这个软件。它会成为主流，尤其是在 Linux 应用程序的安装和更新机制方面。  

### 相关内容：

- [Linux 专家 Matthew Garrett：Ubuntu 16.04 的新 Snap 程序包格式存在安全风险 ][25]
- [Ubuntu Linux 16.04 ]
- [Microsoft 和 Canonical 合作使 Ubuntu 可以在 Windows 10 上运行 ]

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/ubuntu-snap-takes-charge-of-linux-desktop-and-iot-software-distribution/

作者：[Steven J. Vaughan-Nichols][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[28]: http://www.canonical.com/
[29]: http://www.ubuntu.com/
[30]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[1]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[2]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[3]: https://www.openssl.org/
[4]: http://www.dell.com/en-us/
[5]: http://www.samsung.com/us/
[6]: http://www.mozilla.com/
[7]: https://krita.org/en/
[8]: https://mycroft.ai/
[9]: http://www.horizon-computing.com/
[10]: https://www.archlinux.org/
[11]: https://www.debian.org/
[12]: https://www.gentoo.org/
[13]: https://openwrt.org/
[14]: https://www.documentfoundation.org/
[15]: https://www.libreoffice.org/download/libreoffice-fresh/
[16]: https://www.mozilla.org/en-US/firefox/new/
[17]: https://krita.org/en/about/krita-foundation/
[18]: https://krita.org/en/item/krita-3-0-released/
[19]: http://rpm5.org/
[20]: https://www.debian.org/doc/manuals/debian-faq/ch-pkg_basics.en.html
[21]: http://www.ubuntu.com/desktop/ubuntu-kylin
[22]: https://launchpad.net/ubuntu/+source/snapd
[23]: https://github.com/snapcore/snapd
[24]: http://snapcraft.io/
[25]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[26]: http://www.zdnet.com/article/ubuntu-linux-16-04-is-here/
[27]: http://www.zdnet.com/article/microsoft-and-canonical-partner-to-bring-ubuntu-to-windows-10/


