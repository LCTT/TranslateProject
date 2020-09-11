[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11040-1.html)
[#]: subject: (5 tiny Linux distros to try before you die)
[#]: via: (https://opensource.com/article/19/6/linux-distros-to-try)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/marcobravo)

不容错过的 5 个微型 Linux 发行版
======

> 这些微型 Linux 发行版可以让你的老爷机复活，可以启动一个损坏的系统，或者是确保在公共电脑上进行安全的操作。

![](https://img.linux.net.cn/data/attachment/album/201907/01/123700uva8cagcqywwj8jv.jpg)

可供日常使用的 Linux 发行版比比皆是，不过其中有一些发行版常常被我们忽视，因为它们实在是太小了。但这些微型 Linux 发行版其实是一种非常强大的创新：使用一套完整的操作系统驱动一台只有不到 1 GB 存储空间和 512 MB 内存的计算机，真的是终极的黑客作风。

微型发行版的用法有很多种，比如说：

  * 从垃圾桶边挽救回那些又老又慢的电脑。你可以继续使用那些本来已经计划报废的机器，直到它们彻底解体（而不是在刚开始感觉有点儿慢的时候就扔掉）。
  * 使用 U盘启动一个损坏的系统来恢复数据或者修复启动分区。
  * 确保在安全和隐私的操作环境下使用公共电脑。如果使用 U 盘启动酒店大厅或者图书馆里的一台公共电脑，你是可以确定操作环境是安全的。

轻量级发行版有很多种，比如说 [Lubuntu][2]、[Peppermint OS][3] 和 [Bodhi][4]，但是那些真正微型的发行版又有一些独到之处。下面就是你不容错过的五个微型发行版：

### Tiny Core

![Tiny Core Linux][5]

[Tiny Core Linux][6] 小得近乎不可思议：终端版本只有 11 MB，图形界面版本只有 16 MB。我翻了一下之前收集的旧 U盘，最小的一个是 128 MB 的，也有 Tiny Core 镜像文件的八倍之大呢。

Tiny Core 默认包括只包括了基本的操作系统，你需要通过以太网下载需要的应用程序。由于设计得极端精简，甚至安装完整操作系统的应用程序都没有被包含在内（不过需要的话可以从 Tiny Core 的软件仓库下载）。

我使用过一个 128 MB 的 U盘在一台只有 512 MB 内存的机器上运行了 Tiny Core，对于一个只有 16 MB 的操作系统来说，效果算是非常棒了。只有在使用网页浏览器的时候速度才会变慢，但这主要是由于大部分现代网站太过复杂，而不是 Tiny Core 的问题。

如果不使用图形界面，运行 Tiny Core 就只需要 64 MB 的内存了。

#### 安装

[下载 Tiny Core][7] 并使用 `dd` 或者 [Etcher][8] 写入 U盘。

你只需要点击屏幕底部启动栏上的 **Apps** 图标下载 **tc-install** 或者 **tc-install-GUI** 应用，就可以轻松安装 Tiny Core了。

![Tiny Core installer][9]

安装 Tiny Core 有几种不同的方式。你可以把它安装在一个格式化为 Linux 驱动器的 U盘里（这要求你的电脑支持使用 USB 驱动启动。大多数现代电脑都支持，但是在老一些的电脑上不太常见），或者安装在微软 FAT 文件系统的 U 盘里（这对于大多数不支持从 USB 驱动启动的电脑来说非常管用），或者甚至安装在一个现有 Linux 分区的一个文件夹里。

安装过程非常快，完成之后就可以重启计算机，进入到 Tiny Core Linux 系统中啦。

#### 应用程序

由于系统自带程序基本上只有一个文本编辑器和一个终端，你所要做的第一件事情就应该是安装一些应用程序。底部启动栏上的 **Apps** 图标展示了 Tiny Core 提供的所有软件包。**Apps** 软件仓库同时包含了一些重要的驱动程序，对于使用 WiFi 网卡或者是打印机等等都很有帮助。

在安装一个新的应用程序或者实用程序的时候，你可以选择在 Tiny Core 启动的时候就加载软件包，或者是需要的时候才加载。如果选择启动时加载，那么不仅该软件立即就可以使用，并且（不出所料地）下次重启之后也依然可用；如果选择需要时加载，那么在软件包下载完成之后仍然可以马上使用，但是重启之后就不会被自动加载到内存中了。这样可以保持很快的开机速度，并且只占用很少的内存，但同时也意味着每次开机之后，该应用的软件包只有在第一次被使用的时候才会被加载到内存中。

可供选择的应用程序同时包括像 office 和图像应用之类的用户端应用，以及像 [Samba][10] 和网站服务器这种的服务端应用。

当然了，随着你在 Tiny Core 上添加的应用程序越来越多，它就不那么“微型”了。不过在 Tiny Core 的网站上我们可以看到，即使是包括了所有 WiFi 驱动程序的 **Tiny Core Plus** 镜像文件也只有大约 100 MB，所以“不那么微型”也仍然很可能比 256 MB 要小很多。

#### 结论

Tiny Core 非常适合性能不佳的老爷机、用来通过网络启动的镜像文件，以及任何更看重应用而不是操作系统的人。Tiny Core 可以作为一个很好的周末工程来实践：从 16 MB 开始一步步搭建操作系统，直到你感觉这个操作系统已经足够满足你的需求了。

### SliTaz

![SliTaz Linux][11]

[SliTaz Linux][12] 的镜像文件有大约 51 MB 大小，差不多是 Tiny Core 的四倍，但是包含一整套出色的驱动程序和应用程序。事实上，如果事先不知道的话，你可能会以为是通过一个 1 GB 的 Ubuntu 镜像启动的，因为能想到的任何一个基本启动镜像应该有的东西都在这儿：文本编辑器、网页浏览器、绘画工具、表格工具等等。

我使用过一个 128 MB 的 U盘 在一个 512 MB 内存的机器上运行了 SliTaz，效果非常不错。浏览复杂网站的时候性能会下降，但是系统包含的轻量级浏览器 [Midori][13] 可以快速加载绝大多数网站。

你可以在启动的时候选择进入没有图形界面的 SliTaz，这样在仅仅只有 64 MB 的机器上也可以很好地运行。

#### 安装

可供下载的 SliTaz 有很多种，因为它的开发者和社区针对可能存在的限制提供了非常多的版本。比如说，有一种低内存版本可以在只有 24 MB 内存的机器上运行；有一种版本使用 Firefox 而不是 Midori；还有一种版本没有包含额外的应用程序，等等。

如果你挑花了眼，只想赶紧选择一个版本尝试一下的话，那就 [下载滚动发布版本吧][14]。这个版本有差不多 50 MB 大小，每周都会更新。如果你爱上了 SliTaz，而滚动发布版本又更新得 *过快* 了的话，可以再选择一个更符合你需求的版本。

下载好你选择的 SliTaz 镜像文件之后，你就可以用 `dd` 或者 [Etcher][8] 将它写入 U 盘，然后重启。

将 SliTaz 安装在 U 盘或者硬盘上需要通过 **TazPanel** 这个应用程序来实现。它会引导你对硬盘进行需要的分区，然后将 SliTaz 安装在你选择的地方。

![SliTaz installer][15]

#### 应用程序

SliTaz 的控制中心是 **TazPanel** 这个应用程序。如果你喜欢 OpenSUSE 或者 Mageia (最初被称为 Mandrake)，那 TazPanel 对你来说应该不会陌生（至少在核心思想上）：包括系统设置、硬件监测、用户和用户组的管理、系统升级、安装应用程序在内的这些功能，都在这一个应用程序内实现。

SliTaz 提供的应用程序可以满足大多数基本需求，如果你不是非常在意完成某一项任务必须使用哪一个应用程序的话，那么在 SliTaz 的软件仓库里应该可以找到你想要的应用。如果你有一些特别的需求（比如说想要使用 GIMP 2.10 而不是 GIMP 2.8），那么就需要学习如何生成 SliTaz 软件包了。好消息是，**tazpkg** 命令支持从好几种软件包格式转换过来，包括：

  * Debian 软件包（.deb，.udeb）
  * RPM 软件包（.rpm）
  * Slackware 软件包（.tgz）
  * Puppy 软件包（.sfs，.pet）
  * NuTyX 软件包（.cards.tar.xz）
  * Arch 和 Alpine Linux 软件包（.apk，.pkg.tar.gz，.pkg.tar.xz）
  * OpenWrt 软件包（.ipk，.opk）
  * Paldo 软件包（.tar.bz2）
  * Void 软件包（.xbps）
  * Tiny Core 软件包（.tce，.tcel，.tcem， .tcz）

#### 结论

SliTaz 是一个快速而小巧的 Linux 发行版，并且非常容易上手（因为有一个中心化的控制面板）。由于它的软件包工具支持从其它格式的 Linux 软件包转换成自己的格式，它的应用程序理论上来说是非常丰富的，你可以很容易地使用喜欢的工具搭建自己的工作环境。SliTaz 很小，但是也非常具有杀伤力，正如它的蜘蛛 logo 所暗示的那样。

### Porteus

![Porteus Linux][16]

[Porteus][17] 提供了不同的桌面环境可供选择，最小的镜像文件大约在 270 MB 左右，最大的有 350 MB。它是微型 Linux 中镜像文件最大的一个，但是这些额外的空间都被用来确保一个非常顺畅的 Linux 桌面环境的体验，以至于你很可能会忘了自己是在使用一个 live 版本。如果将 Porteus 安装到 SSD 或者是在启动的时候加载到内存里的话，你就会得到一个如此天衣无缝地顺畅的环境，以至于不会相信你的操作系统所占用的空间只有不到半个 CD-ROM 的大小。

Porteus 的基础镜像文件相对来说比较小，因此被称为是“微型”，但是根据你选择的桌面环境版本，Porteus 有可能会需要 1 GB 之多的内存才可以运行。尽管其它微型 Linux 发行版倾向于通过精简应用程序来节约空间和资源，Porteus 却希望你像普通发行版一样来使用它。忘掉你是在使用一个微型的压缩根文件系统，尽情安装所有你喜欢的应用程序吧。

#### 安装

可以在 [离你最近的 Porteus 镜像网站][18] 上下载 Porteus，并且从 MATE、LXQT、LXDE、OpenBox、XFCE、Cinnamon 或者 KDE 里选择自己喜欢的桌面环境。如果没有特殊偏好，MATE 或者是 KDE 桌面都是不错的选择，他们可以提供熟悉的桌面环境体验，并且镜像文件又不至于太大。

![Porteus installer][19]

你可以根据 [官方的安装指南][20] 将 Porteus 安装到一个 U盘 或者是内部硬盘里。这两种方式非常相似，都会使用一个不可变的压缩根文件系统。这是一种稳定的、受限制的文件系统，会根据你的使用被修改。你所做的变更和安装的应用程序在重启的时候都会被加载到内存里，从而还原你关机前的使用环境。

#### 应用程序

应用程序在 Porteus 里被称为“模块”，由 [Slackware 软件包统一管理器][21]（USM）提供。USM 的资源涵盖五个不同的 Slackware 软件仓库，所以可供选择的应用还是很丰富的。

#### 结论

Porteus 可以提供完整的 Linux 使用体验，却只使用了正常 Linux 所需要空间的一小部分。这是一个配备了很多种可供选择的桌面环境和很多应用程序的出色的便携式 Linux 发行版。

### Bodhi Linux

![Bodhi Linux][22]

[Bodhi Linux][4] 的 ISO 镜像文件有 740 MB 大小，初看之下并不是很“微型”，不过一旦安装完成之后，你就会惊讶于它是多么微型了。Bodhi 在 512 MB 大小的内存上也可以顺畅运行，并且它的桌面环境看起来就像是来自未来一样。Bodhi 使用的是 [Enlightenment][23] 桌面，这是一个精心制作的优美的用户界面，小巧而强悍。

不过 Bodhi 并不只是简单地使用 Enlightenment，而是在此基础上增色不少。Bodhi 在配置型应用程序和系统设置面板上都进行了界面处理，避免了 Enlightenment 有时显得过于繁复的选项。Bodhi 替你做了一些很好的默认选择，并且只显示全部选项的一部分。如果你是一个 Enlightenment 狂热分子，那么 Bodhi 这样的做法对你来说可能显得不是很纯粹，但是对于大多数用户来说，Bodhi 这样做可以让人更加专注于 Enlightenment 桌面本身。

#### 安装

[下载 Bodhi Linux][24]，通过 `dd` 或者 [Etcher][8] 写入 U盘，然后重启。

Bodhi 安装器可以在 **设置** 页面的 **应用程序** 菜单里找到。安装程序用的是 **Ubiquity**，所以整个过程和安装 Ubuntu 是一样的。如果你没有安装过 Ubuntu 也不必担心，因为这是最好安装的发行版之一了。

![Bodhi installer][25]

#### 应用程序

Bodhi 是基于最新的 Ubuntu 长期维护发布版的，所以可供使用的应用程序简直数不胜数。只要是在 Ubuntu 上可以使用的应用，Bohdi 上就同样可以找到。

#### 结论

Bodhi Linux 相比一个标准的 Ubuntu 来说要小不少，但是相比其它微型 Ubuntu 环境来说又好一些（因为使用了 Enlightenment）。如果你在找一个比大多数发行版更轻量的 Linux 发行版，但是又不想使用 OverlayFS 或者是应用程序模块的话，那么 Bodhi 就是一个不错的选择了。

### Puppy Linux

![Puppy Linux][26]

早在 Tiny Core、SliTaz、[AntiX][27] 或者是 Porteus 诞生之前，就已经有 [Puppy Linux][28] 了。作为最早的微型 Linux 发行版之一，Puppy 已经历经了十五年风霜，并且无论是对于老爷机还是新用户来说始终都是一个可靠的、可启动的操作系统。

为了保证正常运行，Puppy 会在第一次启动之后引导用户完成必要的设置步骤。整个过程涉及很多个窗口，但是一旦完成，你就会对一切功能了如指掌，然后再决定是否需要安装。

Puppy 几乎有 300 MB 大小，并且在我测试的 1 GB 内存的机器上并不能正常运行，所以它并不是一个特别微型的 Linux 发行版。尽管如此，它仍然是一个非常棒的 1 GB 以下的操作系统，并且在该类系统里算是非常友好的一个。

#### 安装

[下载 Puppy Linux][29]，然后通过 `dd` 或 [Etcher][8] 写入 U 盘，或者是刻录到 CD 或者 DVD 里，然后重启。

![Puppy installer][30]

Puppy 几乎可以安装在支持任何一种数据格式的载体上。你可以在顶部启动栏里找到 **Puppy Installer** 安装程序，这个程序负责安装 Puppy 以及 Puppy 的应用程序。

Puppy 安装器会一步步引导你将系统安装在你提供的任何一种媒介上。Puppy 可以从 U盘、光盘、硬盘，或者甚至是 SD 卡上启动。我曾经在一台没有硬盘、光驱出了故障，并且也无法从 USB 启动的计算机上成功运行了 Puppy。由于 Puppy 支持在任何载体上写入你的配置选项，我甚至可以在一个拥有长期数据存储的外部设备上使用它。

#### 应用程序

**Puppy 安装器** 这个应用同样被用来在 Puppy 上安装应用。由于 Puppy 是基于 Ubuntu 的，它的软件仓库几乎不会缺少任何一个 Linux 软件包，并且如果真的出现了这种情况的话，你也可以使用 [Flatpak][31]。

#### 结论

Puppy 是最早的微型 Linux。尽管它已经不是最微型的了，却是目前最易用的一个。

### 附赠：Silverblue

![SilverBlue, not tiny, but tiny-adjacent][32]

微型 Linux 这个概念是随着时间不断变化的。很久以前，微型 Linux 发行版意味着需要下载到 CD-R 里，从光驱启动，然后将修改写入外部媒介中。后来，你可以从 U 盘启动它，并且有专门用来记录永久修改的空间。现在的微型 Linux 不仅支持上面两种方法，还可以被直接安装在内部驱动或者文件夹里。

大家都没有想到 Linux 开创了容器的热潮 —— 容器里应用程序是在半虚拟化的环境中运行的一套独立的 Linux 系统。曾经只是属于喜欢优化硬盘空间或者重新利用老爷机的人们的小众爱好，很快成为了那些想要开发容器但又不想在应用程序上添加太多负载的人的强烈需求。那些在极简化的、不起眼的 Linux 发行版上所付出的辛苦，一夜之间以一种意想不到的方式得到了回报。

立足于根文件系统这个概念，Fedora 项目发起的 [Silverblue][33] 试验旨在创造一个不可修改的操作系统。该操作系统主要通过容器的形式来更新系统以及安装应用，系统本身永远不会改变。

2.1 GB 的 Silverblue 可不是一个微型 Linux 发行版，但是从某种程度上来说，它是微型 Linux 和容器运动的产物。

#### 安装

[下载 Silverblue][34]，然后通过 `dd` 琥或 [Etcher][8] 写入 U 盘，或者是刻录到 CD 或者 DVD 里，然后重启。

启动到 Silverblue 之后，使用 [Anaconda][35]（标准的、友好的 Fedora 安装器）将它安装在一个内部硬盘里。

![Anaconda installer][36]

#### 应用程序

Silverblue 安装应用的方式和传统意义上不同：它是在基础操作系统之上运行容器。具体来说，它使用 Flatpak 运行 GUI 应用程序，使用 [Toolbox][37] 运行命令。

由于 Flatpak 并非像传统的 Fedora RPM 软件包一样常见，Silverblue 也提供了一种可以将 Fedora RPM 软件包转换成 Silverblue 形式的方法：**软件包分层**。

#### 结论

Silverblue 可能是一个用来尝试前沿科技的有趣实验，或者也可能是桌面操作系统的未来。它之所以被称为微型，只是因为根文件系统的大小不会随着系统升级或者安装应用而改变。不过，透过 Silverblue 来看看对微型 Linux 的迷恋在带领着 Linux 社区和行业往哪个方向走，也是一件挺有意思的事情。对了，走之前不要忘了向 11 MB 大小的微型 Linux 先驱们脱帽致敬。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/linux-distros-to-try

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: http://lubuntu.net
[3]: http://peppermintos.com
[4]: https://www.bodhilinux.com/
[5]: https://opensource.com/sites/default/files/uploads/tinycore.jpg (Tiny Core Linux)
[6]: http://tinycorelinux.net/
[7]: http://tinycorelinux.net/welcome.html
[8]: https://www.balena.io/etcher/
[9]: https://opensource.com/sites/default/files/uploads/tc-install-gui.png (Tiny Core installer)
[10]: https://www.samba.org/
[11]: https://opensource.com/sites/default/files/uploads/slitaz.jpg (SliTaz Linux)
[12]: http://www.slitaz.org/en/
[13]: https://github.com/midori-browser/core
[14]: http://slitaz.org/en/get/#rolling
[15]: https://opensource.com/sites/default/files/uploads/slitaz-install.jpg (SliTaz installer)
[16]: https://opensource.com/sites/default/files/uploads/porteus.jpg (Porteus Linux)
[17]: http://www.porteus.org/
[18]: http://porteus.org/porteus-mirrors.txt
[19]: https://opensource.com/sites/default/files/images/porteus-installer.png (Porteus installer)
[20]: http://www.porteus.org/component/content/article/26-tutorials/general-info-tutorials/114-official-porteus-installation-guide.html
[21]: http://www.porteus.org/tutorials/9-modules/149-usm.html
[22]: https://opensource.com/sites/default/files/uploads/bodhi.jpg (Bodhi Linux)
[23]: https://www.enlightenment.org/
[24]: https://www.bodhilinux.com/download
[25]: https://opensource.com/sites/default/files/uploads/bodhi-install.jpg (Bodhi installer)
[26]: https://opensource.com/sites/default/files/uploads/puppy.jpg (Puppy Linux)
[27]: https://antixlinux.com/
[28]: http://puppylinux.com/
[29]: http://puppylinux.com/index.html#download
[30]: https://opensource.com/sites/default/files/uploads/puppy-install.jpg (Puppy installer)
[31]: https://docs.fedoraproject.org/en-US/fedora-silverblue/getting-started/#flatpak
[32]: https://opensource.com/sites/default/files/uploads/silverblue.jpg (SilverBlue, not tiny, but tiny-adjacent)
[33]: https://silverblue.fedoraproject.org/
[34]: https://silverblue.fedoraproject.org/download
[35]: https://fedoraproject.org/wiki/Anaconda
[36]: https://opensource.com/sites/default/files/uploads/silverblue-install.jpg (Anaconda installer)
[37]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
