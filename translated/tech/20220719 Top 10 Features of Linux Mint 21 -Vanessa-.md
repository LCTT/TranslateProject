[#]: subject: "Top 10 Features of Linux Mint 21 “Vanessa”"
[#]: via: "https://www.debugpoint.com/linux-mint-21-features/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint 21 “Vanessa” 的 10 大顶级特色功能
======

我们总结了即将到来的 Linux Mint 21 “Vanessa” 的 10 大顶级特色功能。找出为你准备了什么。

![Linux Mint 21 Cinnamon Desktop][1]

Linux Mint 21 “Vanessa” 是 [Linux Mint][2] 的第 36 个发布版本，它带来了一份特色功能的列表和桌面上的一些有用改善。特色功能散落在 Cinnamon 桌面、内核更改、Xapps 更新等处。

我已经在这份 Linux Mint 21 顶级特色功能列表中总结出来了。

### Linux Mint 21 “Vanessa” 的顶级特色功能

#### 1. Ubuntu 22.04 及其相关更新

也许最重要的变化就是Linux Mint 21 的基础，它现在基于 [Ubuntu 22.04 “Jammy Jellyfish”][3] 。上一次的主要发布版本，例如 Linux Mint 20 “Ulyana” ，是基于四年前发布的 Ubuntu 20.04 “Focal Fossa” 。沧海桑田，2020 年的世界状态与现在完全不同。

因此，很对软件包、版本升级、新的性能改善 – 所有的这些底层更新都涉及到了 Linux Mint 21 。这包括最新的 LTS [Linux Kernel 5.15][4] ，这带来了更多硬件系列的支持、以及针对编程、开发和网络的工具链的更新。

#### 2. Timeshift 备份工具的主要变化

几个月前，Mint 开发组 [宣布][5] ：他们正在接管著名的备份工具 Timeshift 的开发，并将其继续开发为一个 “XApps” 。因此，这是一个重要的变化。为什么，你可能会询问？

好吧，Timeshift 工具的开发组，Tony George ，正忙于其它的项目。你可能听说过针对于 Linux 的 “[TeeJeeTech][6]” 应用程序。它是由 Tony 创建的，并且有一些很快的应用程序。因此，他没有足够多的时间来专注于 Timeshift 的开发和增强。

![Timeshift creating snapshot][7]

话虽如此，不过，现在有了 Linux Mint 来维护它，一些新的特色功能出现在这个发布版本之中，例如，Timeshift 现在可以在 rsync 模式 (而非 btrfs 模式) 下准确计算出下一次备份时所需要的磁盘空间。此外，如果它看到磁盘空间在备份后小于 1 GB ，它将会停止备份过程。

#### 3. WebP 支持

WebP 图像是谷歌针对网络创建的一种相当新的图像格式。It beings better compression and reduced size while maintaining good quality than traditional JPEG or PNG images.

在 Linux 桌面中支持 WebP (查看图像、缩略图或编辑) 需要一些 [额外安装][8] 的软件包。看着流行的 Linux Mint 开发组在桌面应用程序和衍生程序上带来开箱即用的 WebP 支持

这意味着，在 Nemo 文件管理器中可以显示 WebP 图像的缩略图，并可以在 xviewer 中查看它们。mint 开发组总是优先考虑最终用户的处境，这是因为其它的发行版仍然不默认支持 WebP ，例如 Ubuntu 等等。不仅如此，新的应用程序 [xapp-thumbnailers][9] 现在还能帮助 Nemo 文件管理器来预览文件类型：

* ePub
* 带有专辑封面的 MP3
* RAW 图像
* AppImage

#### 4. 进程监视器

一个名称为 <ruby>进程监视器<rt> process monitor</rt></ruby> 的小巧方便的工具，将会告知你，在你的系统中正在发生什么。在你的系统正在通过 Timeshift 来自动更新或备份时，在系统托盘处的这个小图标将会显示。在这些情况下，你的系统可能会变慢，这些漂亮的图标可以告诉你答案。

#### 5. 改善打印支持

Linux Mint 针对硬件设备配置了各种驱动程序，默认情况下就支持打印机。 这个版本的 Mint 带来 [<ruby>网络打印协议<rt>Internet Printing Protocol (IPP)</rt></ruby>][10] ，可以无线驱动打印机和扫描仪。

另外，也默认安装了 HP 的启动程序 HPLIP 的最新版本 (3.21.12) 。

所有的这些变化都提高了打印机和扫描仪的使用效率。像你这样的最终用户可以轻松地享受打印和扫描。它是一个 Linux 发行版的一个重要的方面，但是它并不是总是有效的。在 [评价很多发行版][11] 时，我发现很多发行版不能自动地检测出打印机，甚至不能使用打印机。

很高兴看到 mint 开发组贡献这个重要的功能。

#### 6. 窗口动画更新

在窗口和桌面动画效果中有一些相当大的变化。第一，现在合并了窗口和桌面的效果设置。先前，效果设置是一些单独的组区，可以对动画进行微观化的控制。

这里是并排对比视图。

![][12]

![][13]

第二，移除了映射窗口和桌面效果选项。

第三，带来一个新的控件，用于更改整体动画的快慢速度。

最后，一个禁用或启用在整个桌面上的所有动画的全局开关，给予你更多的控制选项。

我相信这是一个精心设计的对话框和一些更简洁清晰的高级选项。

#### 7. Mutter 重新构建

让我们讨论一下 [Cinnamon 桌面环境版本 5.4][14] ，它随 Linux Mint 21 而来。它是最新的 Cinnamon 发布版本，Mint 是第一个将其带给用户的的发行版 (而不是传统观念上的 Arch Linux 用户，他们要获取它还有 [一点早][15]) 。

最后，开发者对其窗口管理器 Mutter 完成了重新构建，在 Cinnamon 5.4 中是 Muffin 。即使有一些后期移植的变化，但是由于 Muffin 的原始版本是从 Mutter 复刻出来的，所以它总是落后于上游的 Mutter 特色功能。为使尽可能地接近 Mutter 代码基础。在包含的特色功能、错误修复及清理方面付出了大量的努力。

因此，在未来，在 Muffin 需要的时候很容易从 Mutter 上游移植回来和清理东西。

#### 8. 窗口管理器和 GTK 主题

伴随着 Muffin 的变化，开发组也将 gnomes 控制中心的一些显示设置移动到了 cinnamon 控制中心。此外，在 Cinnamon 5.4 中，也来自 csd-xrandr 的显示配置移动到了 Muffin 窗口管理器。很显然，你不可能在显示设置窗口中看任何的差异。不过，在缩放显示或在高分辨率窗口中时，你可能会看到一些性能的提升和更少的错误或重大问题。

另外一个重大的变化，Mint 开发组通过 Cinnamon 5.4 来尝试在应用程序中实现 GTK 窗口的统一渲染。先前，如果一个 GTK 应用程序使用一个标题栏，那么对话框会是一个 CSD (客户端样式) 和 GTK 主题的混合体.

现在随着 Cinnamon 5.4 的到来，使用的窗口都使用 GTK 主题进行渲染，而不再与它们的设计相关联。于是，传统的 Metacity 主题也被抛弃。

顺便说一句，我喜欢 Metacity 及其 “传统外观” ，在 GNOME 的早期时 [它们是一种东西][16] 。

#### 9. 软件包管理器更新

遵循 Debian、KDE Plasma 桌面的发展趋势，Linux Mint 也开始保护你的系统不会卸载重要的依赖关系软件包。

当你尝试卸载时，Mint 现在会检查依赖关系，并检查重要的桌面软件包是否将会被移除。

如果发现这种情况，你将会得到一条阻止你继续卸载软件包的错误信息。

在另一方面，当成功地卸载一个软件包时，它会清理所有与之同时安装的依赖关系软件包。

#### 10. 禁用 Systemd OOMD (内存溢出守护进程) 服务

自从 Ubuntu 22.04 LTS 发布以来，<ruby>系统内存溢出守护进程<rt>systemd-oomd</rt></ruby>” 有一些不好的反馈。访问网络的用户 [报告][17] ：在没有任何警告或用户交互干涉的情况下，会突然关闭应用程序 (例如 Firefox) 。进一步的调查指明是系统内存溢出守护进程服务的实现“不如预期的好”。

按照理论上来说，[systemd-oomd.service][18] 监视你的系统的内存溢出情况，并且它有权杀死任何多过消耗系统资源的进程。Ubuntu 开发组并没有重要地强调这一点，最后导致了不愉快的用户的体验。

有了这些经验，Linux Mint 21 决定 [不提供][19] 这种服务，并禁用它。因为 Linux Mint 的用户群体是普通用户、学生等等，如果应用程序意外关闭，对用户来说将是一种不好的体验。

![Systemd OOMD service is not enabled][20]

#### 11. 其它变化

最后，让我们归纳一些微小却富有冲击力的变化来总结 Linux Mint 21 特色功能。

* 默认文档阅读器应用程序 Xreader 现在能够进行少量的注释。这是一个很方便的特色功能。
* WebApp 管理器现在可以提供一些自定义的浏览器参数。
* Warpinator 文件传输器实用工具现在可以向你显示来自 Windows 、Android 和 iOS 设备上的其它的源文件。
* Mint 打包 Firefox 网络浏览器为 .deb 版本，而不是在 Ubuntu 22.04 LTS 中的默认 .Snap 版本。感谢 Mint 开发组，用户不必为卸载 Jammy 中的 Firefox 的 .Snap 版本的 [复杂命令集][21] 而忧心。

![Firefox 102 in Linux Mint 21 – Exclusively packaged as deb executable][22]

* 批量重命名应用程序 Thingy 获得一些用户界面上的改善。
* 操作系统侦察引导启动器 GRUB2 现在能够侦察出在你的硬件系统上所有的操作系统 (对双操作系统启动或多操作系统启动有用) 。
* 蓝牙管理器 Blueman 取代了 Blueberry ，为连接和管理你的蓝牙设备带来了其它的特色功能。
* 最后，为你的新桌面而准备的新壁纸也将在这个发布版本中到来。

![New Wallpapers in Linux Mint 21][23]

### 未变化的东西

从一个非常高的层次来看，你可能会觉着 Linux Mint 21 的绝大部分功能与先前的版本相同。默认桌面外观和默认壁纸保存相同。Xfce 和 MATE 桌面没有任何的重要功能的发布。因此，它们是完全一样的。此外，默认图标主题、应用程序菜单等等都可能会给你一种似曾相识燕归来的感觉。

### 总结

总体来说，最终用户需要的是一套完好的特色功能，而不是金玉其外败絮其中的东西。鉴如此，对初学者或最终用户来说，Linux Mint 是当今最好的 Linux 发行版。至此，Linux Mint 21 的特色功能就总结结束了.

正在进行 BETA 版本测试，这里有 [一些错误报告][24] 。最后的发布版本即将在未来几周内到来。

当发布后，你可以下载/更新到 Linux Mint 21 。此外，在官方发布后，也敬请期待我们对于 Linux Mint 21 的详细评价。

你认为 Linux mint 21 的新的特色功能怎么样？在这个发布版本中，是否有一些你所求而未得的特色功能？让我们在下面的评论区讨论这个问题。

--------------------------------------------------------------------------------

via: <https://www.debugpoint.com/linux-mint-21-features/>

作者：[Arindam][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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
