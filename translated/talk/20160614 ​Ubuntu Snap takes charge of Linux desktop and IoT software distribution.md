

Ubuntu Snap 软件包管理 Linux 桌面和 IoT 的软件安装
===========================================================================


[Canonical][28] 和 [Ubuntu][29] 创始人 Mark Shuttleworth 在一次采访中说他不计划宣布 Ubuntu 的新 [ Snap 程序包格式][30]。但是 
在之后几个月，各种 Linux 发行版的开发者和团队都宣布他们会把 Snap 作为通用 Linux 程序包格式。
![](http://zdnet2.cbsistatic.com/hub/i/r/2016/06/14/a9b2a139-3cd4-41bf-8e10-180cb9450134/resize/770xauto/adc7d16a46167565399ecdb027dd1416/ubuntu-snap.jpg)
>Linux 供应商，独立软件开发商（ISV:Independent Software Vendor）和开发团队都采用 Ubuntu Snap 作为多种 Linux 系统的配置和更新程序包。

为什么呢？因为 Snap 能使一个二进制程序包可以完美、安全地在任何 Linux 台式机、服务器、云或设备上运行。Canonical 的 Ubuntu 客户端产品和版本负责人 Olli Ries 说：


>[ Snap 程序包的安全机制][1] 允许我们为 Snap 应用单独空出一些系统空间，这样我们就可以根据我们自身的情况更高效的进行循环开发。用户安装一个 Snap 的时候也不用担心是否会影响其他的应用程序和操作系统。


当然了，早期的 Linux 内核开发者和 CoreOS 【译注：CoreOS是一种操作系统，于2013年十二月发布，它的设计旨在关注开源操作系统内核的新兴使用——用于大量基于云计算的虚拟服务器。】安全维护者 Matthew Garrett 指出：如果你 [使用带有不安全程序的 Snap 程序包比如 X11 ][2] 视窗系统【译注：X11也叫做 X Window 系统，X Window 系统 ( X11 或 X )是一种位图显示的视窗系统 。它是在 Unix 和类 Unix 操作系统 ，以及 OpenVMS 上建立图形用户界面的标准工具包和协议，并可用于几乎所有已有的现代操作系统。】，实际上你的系统一点也不安全。


Shuttleworth 同意 Garrett 的观点，但是他也说你可以控制 Snap 应用使用多少的系统剩余空间。比如，一个 web 浏览器可以包含一个安全的 Snap 程序包，这个 Snap 使用 Ubuntu 的一个包 [openssl][3]【译注：OpenSSL 是一个强大的安全套接字层密码库，囊括主要的密码算法、常用的密钥和证书封装管理功能及 SSL 协议，并提供丰富的应用程序供测试或其它目的使用。】的安全传输层(TLS,Transport Layer Security)和安全套接字层(SSL,Secure Sockets Layer)二进制文件。除此之外，即使有程序攻破了浏览器的诉讼程序【译注：诉讼程序属于程序性法律程序中的公力救济型程序】，也不能进行底层的系统操作。

很多团队也这样认为。[戴尔][4]，[三星][5]，[Mozilla][6],[krita][7]【译注：Krita 是一个位图形编辑软件，KOffice 套装的一部份。包含一个绘画程式和照片编辑器，Krita 是自由软件，并根据GNU通用公共许可证发布。】，[麦考夫][8]【译注：Mycroft 是一个开源AI智能家居平台，配置 Raspberry Pi 2 和 Arduino 控制器，应该就是以夏洛克福尔摩斯的哥哥为名的。】，以及 [地平线计算][9] 【译注：地平线计算解决方案，为客户提供优质的硬件架构为其运行云平台。】都将使用 Snap。[Arch Linux][10],[Debain][11]，[Gentoo][12]，和 [OpenWrt][13] 【译注：OpenWrt 可以被描述为一个嵌入式的 Linux 发行版】开发团队也已经拥抱了 Snap，也会把 Snap 加入到他们各自开发的分支中。

Snap 包又叫做“ Snaps ”，现在在 Arch、Debian、Fedora、Kubuntu、Lubuntu、Ubuntu GNOME、Ubuntu Kylin、Ubuntu MATE、Ubuntu Unity 和 Xubuntu 上运行。 Snap 正在 CentOS、Elementary、Gentoo、Mint、OpenSUSE 和 Red Hat Enterprise Linux (RHEL) 上予以验证，并且在其他 Linux 发行版上运行也会很容易。 

这些发行版都使用 Snaps，Shuttleworth 声称：“ Snaps 为每个 Linux 台式机、服务器、设备和云机器带来了很多应用程序，也给了用户更大的自由，用户可以选择任何带有最好应用程序的 Linux 发行版本。”

把这些发行版放在一起代表了大多的主流 Linux 桌面、服务器和云系统分支。为什么他们切换到本地包来进行系统管理呢？ Arch Linux 的贡献者 
除过这些 Linux 分支，独立软件开发商（ISV,Independent Software Vendor）也将会因为 Snap 很好的简化了第三方 Linux 应用程序和安全维护问题而拥抱 Snap。例如，[文档基金会][14] 也将会开发出受欢迎的可用开源 office 套件 [LibreOffice][15] 作为一个 Snap 程序包。

文档基金会的联合创始人 Thorsten Behrens 这样说：

>我们的目标是使 LibreOffice 能被大多数人更容易使用成为可能。Snap 使我们的用户能够在不同的桌面系统和分支上更快捷更容易的持续获取最新的 LibreOffice 版本。如上所述，它也会帮助我们的版本开发工程师最终从定期的自产的陈旧 Linux 开发解决方案中解放出来，总之很多东西会被共同维护。

Ｍozilla 的 [火狐][16] 副总裁（VP,Vice President）Nick Nguyen 在这段陈述中提到：

>我们力求为用户提供良好的使用体验，并且使火狐浏览器能够在更多平台、设备和操作系统上运行。随着对 Snaps 的介绍，我们也会对火狐浏览器进行持续优化，使它可以为 Linux 用户提供最新特性。

基于 KDE 的图形程序的 [Krita Foundation][17] 项目领导 Boudewijn Rempt 说：


>正在维护的 DEB 包在一个私有仓库，这很复杂也很耗费时间。Snaps 更容易维护、打包和配置。把 Snap 放进软件商店也特别容易，我已经把软件发布在最合适的软件商店了。[Krita 3.0][18] 刚刚作为一个 snap 程序包发行，它作为最新的版本能够自动更新。

不仅 Linux 桌面系统程序使用 Snap。物联网(IoT)和嵌入式开发者也双手拥抱了 Snap。 


Snaps 彼此隔离开来，以确保安全性，它们还可以自动更新或回滚，这对于硬件设备是极好的。多种厂商都在他们的物联网设备上运行着 snappy【译注：Snap 基于 snappy进行构建。】，能够生产带有物联网应用程序商店的新的“智能边缘”设备。Snappy 设备能够自动接收系统更新，并且连同安装在设备上的应用程序也会得到更新。

戴尔公司根据最早的物联网厂商之一的创始人 Shuttleworth 看到的 Snap 的巨大潜力决定在他们的设备上使用 Snap。

戴尔公司的物联网战略和合作伙伴主管 Jason Shepherd 说：“我们认为，Snaps 能够报告安全风险，也能解决在单一物联网网关上部署和运行多个第三方应用程序所带来的安全风险和可管理性挑战。这种课信赖的通用的应用程序格式才是戴尔真正需要的，我们的物联网解决方案合作伙伴和产品客户都对物联网应用程序的充满活力的生态系统有极大的兴趣。”


OpenWrt 的开发者 Matteo Croce 说：“这很简单，在脱离无变化的核心操作系统的时候 Snaps 会为 OpenWrt 递送大量的软件...Snaps 是通过点和路由为 OpenWrt 提供大量软件的最快方式。”

Shuttleworth 认为 Snaps 不会取代已经存在的 Linux 程序包比如 [RPM][19] 和 [DEB][20]。相反，他认为他们将会相辅相成。Snaps 将会与现有包共存。每个发行版都有为系统内核提供更新的相应机制，这种机制也在不断更新。Snap 为桌面系统带来的是通用的应用程序，这些应用程序不会影响基本的系统操作。

每个 Snap 使用大量的独立核心和安全机制时也会有所限制，这是 Snap 应用程序的特色，谨慎的重览过程确保 Snap 仅仅得到其完成请求操作的权限。用户在安装 Snap 的时候也不必考虑复杂的安全问题。

Snap实际上是独立式zip文件，能够非常迅速地在原地执行，很受欢迎的[中标麒麟][21]团队的负责人 Jack Yu 称：“Snaps 比传统的 Linux 包更容易构建，允许我们对这种基本的系统的操作的独立性产生依赖，所以我们可以为所有的分支用户开发更好的最新国产 Linux 应用程序。”

Snap 程序包格式由 Canonical 设计，基于 [snapd][22] 。这是GitHub上的一个软件项目。大多 Linux 发行版的部分 snapd 已经被证明是容易理解的，社区里也加入了新的有大量 Linux 经验的贡献者。 


Snap 程序包使用 snapcraft 工具来构建。项目基地是 [snapcraft.io][24] 网站，附有构建 Snap 的预览和逐步指南，不包括项目开发者和使用者的文件。Snap可能基于现有的发行版程序包，但更常使用源代码来构建，为了优化和规模效率。

如果你不是 Ubuntu 的忠实粉丝或者一个偏执的 Linux 开发者你可能不知道 Snap。未来，在任何平台上需要用 Linux 完成工作的任何人都会知道这个软件。用它的方法完成工作会成为主流 -- 尤其在这些方面将更重要 --  Linux 应用程序的安装和更新机制。  


#### 相关内容：


- [Linux 专家 Matthew Garrett：Ubuntu 16.04 的新 Snap 程序包格式存在安全风险 ][25]
- [Ubuntu Linux 16.04 ]
- [Microsoft 和 Canonical 合作使 Ubuntu 可以在 Windows 10 上运行 ]


--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/ubuntu-snap-takes-charge-of-linux-desktop-and-iot-software-distribution/

作者：[Steven J. Vaughan-Nichols][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[校对者ID](https://github.com/校对者ID)

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


