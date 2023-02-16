[#]: subject: "Top 10 Features of Linux Mint 21 “Vanessa”"
[#]: via: "https://www.debugpoint.com/linux-mint-21-features/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14894-1.html"

Linux Mint 21 “Vanessa” 的 10 大特色
======

> 我们总结了 Linux Mint 21 “Vanessa” 的 10 大特色，你可以看看有哪些是为你而准备的。

![](https://www.debugpoint.com/wp-content/uploads/2022/07/mint21feature.jpg)

Linux Mint 21 “Vanessa” 是 [Linux Mint][2] 的第 36 个发布版本，它带来了一系列特色，以及对桌面上的有用改善。这些特色散落在 Cinnamon 桌面、内核变化、Xapps 更新等处。

我在这份 Linux Mint 21 的重要特色列表对它们做了个总结。

### Linux Mint 21 “Vanessa” 的重要特色

![Linux Mint 21 Cinnamon Desktop][1]

#### 1、Ubuntu 22.04 及其相关更新

也许最重要的变化就是 Linux Mint 21 的基础了，它现在基于 [Ubuntu 22.04 “Jammy Jellyfish”][3] 。上一次的主要版本，即 Linux Mint 20 “Ulyana” ，是基于四年前发布的 Ubuntu 20.04 “Focal Fossa” 。沧海桑田，现在与 2020 年的世界已然完全不同。

因此，大量的软件包、版本升级、新的性能改善 —— 所有的这些底层更新都来到了 Linux Mint 21 。这包括最新的长期支持的 [Linux 内核 5.15][4] ，这带来了更多硬件系列的支持、以及针对编程、开发和网络的工具链的更新。

#### 2、Timeshift 备份工具的重大变化

几个月前，Mint 开发团队 [宣布][5] ：他们将接管著名的备份工具 Timeshift，并将其作为一个 “XApps” 继续开发。这是一个重大变化。你可能会问为什么？

好吧，Timeshift 工具的开发者 Tony George 正忙于其它的项目。你可能听说过 Linux 的 “[TeeJeeTech][6]” 应用。它是由 Tony 创建的，并且有一些很酷的应用。因此，他没有足够多的时间来专注于 Timeshift 的开发和改进。

![Timeshift creating snapshot][7]

说到这里，由于 Linux Mint 现在在维护它，这个发布版本带来了一些新的功能，例如，在 rsync 模式（不是 btrfs 模式）时，现在 Timeshift 可以确定进行下一次备份需要多少磁盘空间。此外，如果它看到磁盘空间在备份后小于 1 GB ，会停止备份过程。

#### 3、WebP 支持

WebP 图像是谷歌为 Web 创建的一种相当新的图像格式。它带来了更好的压缩率，在保持与传统的 JPEG 和 PNG 图片相当的良好质量的同时，减少了文件大小。

在 Linux 桌面支持 WebP（如查看图像、缩略图或编辑）需要 [额外安装][8] 一些软件包。考虑到其流行程度，Linux Mint 开发团队为桌面应用及这个衍生发行版带来了开箱即用的 WebP 支持。

这意味着，在 Nemo 文件管理器中可以显示 WebP 图像的缩略图，并可以在 xviewer 中查看它们。Mint 开发团队总是优先考虑到最终用户，而诸如 Ubuntu 之类的其它发行版在默认支持 WebP 方面仍然落后。不仅如此，新的应用程序 [xapp-thumbnailers][9] 现在还能帮助 Nemo 文件管理器预览更多的文件类型，如：

* ePub
* 带有专辑封面的 MP3
* RAW 图像
* AppImage

#### 4、进程监视器

一个名称为 <ruby>进程监视器<rt>process monitor</rt></ruby> 的小巧方便的工具，将会告知你系统中正在发生什么。当你的系统正在自动更新或通过 Timeshift 备份时，系统托盘上的这个小图标就会显示出来。在这些情况下，你的系统可能会变慢，而这个漂亮的图标可以告诉你原因。

#### 5、改善打印支持

Linux Mint 针对硬件设备配置了各种驱动程序，默认情况下就支持打印机。这个版本的 Mint 带来 <ruby>[网络打印协议][10]<rt>Internet Printing Protocol</rt></ruby>（IPP）支持，可以免驱动进行打印和扫描。

另外，它也默认安装了 HP 的驱动程序 HPLIP 的最新版本 3.21.12 。

所有的这些变化都简化了打印机和扫描仪的使用，而像你这样的最终用户可以轻松地打印和扫描。这是一个 Linux 发行版的一个重要的方面，但并不是总是能顺利工作的。在 [点评过很多发行版][11] 后，我发现很多发行版无法检测到打印机，乃至不能打印。

很高兴看到 Mint 开发团队对这个关键功能做出了贡献。

#### 6、窗口动画更新

窗口和桌面动画效果有一些相当大的变化。首先，合并了窗口和桌面的效果设置。先前，是在不同的部分对动画进行细微的控制。

这里是对比视图：

![][12]

![][13]

其次，取消了映射窗口和桌面效果选项。

第三，带来一个新的控件，用于更改整体动画的快慢速度。

最后，还有一个可以禁用或启用在整个桌面上的所有动画的全局开关，给予你更多的控制选项。

我相信这是一个经过精心设计的、可以让人更清楚地了解的对话框和高级选项。

#### 7、Mutter 重新构建

让我们来看一下随 Linux Mint 21 而来的 [Cinnamon 桌面环境版本 5.4][14]。它是最新的 Cinnamon 发布版本，Mint 是第一个将其带给用户的的发行版（除了传统的 Arch Linux 用户，他们得到它 [有点超早][15]）。

最后，开发团队对 Cinnamon 5.4 中的窗口管理器 Muffin 根据上游的 Mutter 进行了重新构建。由于 Muffin 最初是从 Mutter 复刻出来的，所以它总是落后于上游的 Mutter 的功能，即使是有一些后期移植的改变。为使 Muffin 尽可能地接近 Mutter 代码库，团队在包含的特色功能、错误修复及清理方面付出了大量的努力。

因此，在未来，更容易从 Mutter 上游移植变化和在需要的时候清理 Muffin。

#### 8、窗口管理器和 GTK 主题

伴随着 Muffin 的变化，开发团队也将 GNOME 控制中心的一些显示设置移动到了 Cinnamon 控制中心。此外，在 Cinnamon 5.4 中，来自 csd-xrandr 的显示配置移动到了 Muffin 窗口管理器中。显然，你不会在显示设置窗口中看到什么不同。不过，在缩放显示或在高分辨率窗口中时，你可能会发现一些性能的提升，以及错误或问题更少一些。

Mint 开发团队在 Cinnamon 5.4 引入的另外一个关键变化是，在应用程序中实现 GTK 窗口的统一渲染。先前，如果一个 GTK 应用程序使用了标题栏，那么对话框会是一个 CSD （客户端样式）和 GTK 主题的混合体.

现在随着 Cinnamon 5.4 的到来，所有的窗口都使用 GTK 主题进行渲染，而不再与它们的设计相关联。于是，传统的 Metacity 主题也被抛弃。

顺便说一句，我喜欢 Metacity 及其 “传统外观”，它们是 GNOME 的早期 [产物][16] 。

#### 9、软件包管理器更新

跟随 Debian、KDE Plasma 桌面的趋势，Linux Mint 也开始保护你的系统不会卸载重要的依赖关系软件包。

当你尝试卸载软件包时，Mint 现在会检查依赖关系，并检查重要的桌面软件包是否将会被移除。

如果发现这种情况，你将会得到一条阻止你继续卸载软件包的错误信息。

在另一方面，当成功地卸载一个软件包时，它会清理所有与之同时安装的依赖软件包。

#### 10、禁用 systemd OOMD 服务

自从 Ubuntu 22.04 LTS 发布以来，有一些对内存不足守护进程（`systemd-oomd`）不好的反馈。网上的很多用户都 [报告][17] 说：在没有任何警告或用户干预的情况下，会突然关闭应用程序（例如 Firefox）。进一步的调查表明，`systemd-oomd` 的实现情况“不是很好”。

理论上说，[systemd-oomd.service][18] 会监视你的系统的内存不足的情况，并且它有权杀死任何多过消耗系统资源的进程。Ubuntu 开发团队并没有和用户强调这一点，最后导致了不愉快的用户的体验。

基于这一认识，Linux Mint 21 决定 [不提供][19] 这种服务，禁用它。因为 Linux Mint 的用户群体是普通用户、学生等，如果应用程序意外关闭，对用户来说将是一种不好的体验。

![Systemd OOMD service is not enabled][20]

#### 11、其它变化

最后，让我们归纳一些微小却有影响的变化来结束这篇 Linux Mint 21 特色介绍。

* 默认的文档阅读器应用程序 Xreader 现在能够进行微小注释。这是一个很方便的功能。
* WebApp 管理器现在带来了一些自定义的浏览器参数。
* Warpinator 文件传输器实用工具现在可以向你显示来自 Windows 、Android 和 iOS 设备上的其它的源文件。
* Mint 将 Firefox 浏览器打包为 .deb 版本，而不是 Ubuntu 22.04 LTS 中的默认 .Snap 版本。感谢 Mint 开发团队，用户不必为卸载 Jammy 中的 Firefox 的 .Snap 版本的而运行 [一套复杂的命令][21]。

    ![Firefox 102 in Linux Mint 21 – Exclusively packaged as deb executable][22]

* 批量重命名应用程序 Thingy 在用户界面上做了一些改善。
* GRUB2 的操作系统检测程序（`os-prober`）现在能够检测出你的硬件系统上所有的操作系统（对双启动或多启动有用）。
* 蓝牙管理器 Blueman 取代了 Blueberry ，为连接和管理你的蓝牙设备带来了其它的功能。
* 最后，在这个发布版本中也有为你的新桌面而准备的新壁纸。

    ![New Wallpapers in Linux Mint 21][23]

### 没有变化的部分

从表明上来看，你可能会觉着 Linux Mint 21 的绝大部分功能与先前的版本相同。默认桌面外观和默认壁纸保持不变。Xfce 和 MATE 桌面也没有发布任何重要的功能。因此，它们是完全一样的。此外，默认图标主题、应用程序菜单等等都可能会给你一种似曾相识的感觉。

### 总结

总体来说，最终用户需要的是一套完好的特色功能，而不是花哨的手势之类的东西。鉴于此，对初学者或最终用户来说，Linux Mint 是当今最好的 Linux 发行版。至此，这篇 Linux Mint 21 特色的总结就此结束了。

你认为 Linux mint 21 的新特色怎么样？在这个发布版本中，是否有一些你所求而未得的特色？让我们在下面的评论区讨论这个问题。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-mint-21-features/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/07/Linux-Mint-21-Cinnamon-Desktop.jpg
[2]: https://www.debugpoint.com/linux-mint/
[3]: https://www.debugpoint.com/web-stories/ubuntu-22-04-review/
[4]: https://www.debugpoint.com/linux-kernel-5-15/
[5]: https://blog.linuxmint.com/?p=4323
[6]: https://teejeetech.com/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/07/Timeshift-creating-snapshot.jpg
[8]: https://www.debugpoint.com/view-webp-ubuntu-linux/
[9]: https://github.com/linuxmint/xapp-thumbnailers
[10]: https://datatracker.ietf.org/doc/html/rfc8011
[11]: https://www.debugpoint.com/tag/linux-distro-review/
[12]: https://www.debugpoint.com/wp-content/uploads/2022/07/Effects-in-Linux-Mint-20.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/07/Effects-in-Linux-Mint-21.jpg
[14]: https://github.com/linuxmint/cinnamon-desktop/releases/tag/5.4.0
[15]: https://www.debugpoint.com/cinnamon-arch-linux-install/
[16]: https://www.debugpoint.com/gnome-classic-ubuntu-22-04/
[17]: https://askubuntu.com/questions/1404888/how-do-i-disable-the-systemd-oom-process-killer-in-ubuntu-22-04
[18]: https://www.freedesktop.org/software/systemd/man/systemd-oomd.service.html
[19]: https://debugpointnews.com/linux-mint-21-systemd-oom/
[20]: https://www.debugpoint.com/wp-content/uploads/2022/07/Systemd-OOMD-service-is-not-enabled.jpg
[21]: https://www.debugpoint.com/remove-firefox-snap-ubuntu/
[22]: https://www.debugpoint.com/wp-content/uploads/2022/07/Firefox-102-in-Linux-Mint-21-Exclusively-packaged-as-deb-executable.jpg
[23]: https://www.debugpoint.com/wp-content/uploads/2022/07/New-Wallpapers-in-Linux-Mint-21.jpg
[24]: https://github.com/linuxmint/mint21-beta/issues
