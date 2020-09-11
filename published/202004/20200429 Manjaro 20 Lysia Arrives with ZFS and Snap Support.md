[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12166-1.html)
[#]: subject: (Manjaro 20 Lysia Arrives with ZFS and Snap Support)
[#]: via: (https://itsfoss.com/manjaro-20-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Manjaro 20 Lysia 到来，支持 ZFS 和 Snap
======

![](https://img.linux.net.cn/data/attachment/album/202004/29/232925j8paomvp11pfu12v.jpg)

> Manjaro Linux 刷新了其 Manjaro 20 “Lysia” 的 ISO。现在在 Pamac 中支持了 Snap 和 Flatpak 软件包。在 Manjaro Architect 安装程序中增加了 ZFS 选项，并使用最新的内核 5.6 作为基础。

最近新的发行版的发布像下雨一样。在上周发布了 [Ubuntu 20.04 LTS](https://linux.cn/article-12142-1.html) ，紧接着 [Fedora 32](https://linux.cn/article-12164-1.html) 也刚刚发布，而现在 [Manjaro 发布了版本 20][1]，代号为 Lysia。

### Manjaro 20 Lysia 有什么新东西？

其实有很多。让我给大家介绍一下 Manjaro 20 中的一些主要新功能。

#### 新的抹茶主题

Manjaro 20 有一个新的默认主题，名为 Matcha（抹茶）。它让桌面看起来更有质感。

![][2]

#### 对 Snap 和 Flatpak 的支持

Snap 和 Flatpak 软件包的支持得到了改进。如果你愿意，你可以在命令行中使用它们。

你还可以在 Pamac 图形界面包管理器中启用 Snap 和 Flatpak 支持。

![Enable Snap support in Pamac Manjaro][3]

启用后，你可以在 Pamac 软件管理器中找到并安装 Snap/Flatpak 应用程序。

![Snap applications in Pamac][4]

#### Pamac 提供了基于搜索安装新软件的方式（在 GNOME 中）

在 GNOME 变种中，如果你搜索某个东西，Pamac 软件管理器会提供安装符合查询的软件。在其他使用  GNOME 桌面的发行版中，GNOME 软件中心也会这样做。

#### ZFS 支持登陆了 Manjaro Architect

现在，你可以在 Manjaro Linux 中轻松地使用 ZFS 作为根文件系统。在 [Manjaro Architect][6] 中提供了对 [ZFS 文件系统][5]的支持。

请注意，我说的是 Manjaro Architect，即基于终端的安装程序。它和普通的图形化的 [Calamares 安装程序][7]不一样。

![][8]

#### Linux kernel 5.6

最新的稳定版 [Linux 内核 5.6][9] 带来了更多的硬件支持，如 thunderbolt、Nvidia 和 USB4。你也可以使用 [WireGuard VPN][10]。

![][11]

#### 其他杂项变化

  * 新的桌面环境版本：Xfce 4.14、GNOME 3.36 和 KDE Plasma 5.18。
  * 新的默认 shell 是 zsh。
  * Display-Profiles 允许你存储一个或多个配置文件，用于你的首选显示配置。
  * 改进后的 Gnome-Layout-Switcher。
  * 最新的驱动程序。
  * 改进和完善了 Manjaro 工具。

### 如何取得 Manjaro 20 Lysia？

如果你已经在使用 Manjaro，只需更新你的 Manjaro Linux 系统，你就应该已经在使用 Lysia 了。

Manjaro 采用了滚动发布模式，这意味着你不必手动从一个版本升级到另一个版本。只要有新的版本发布，不需要重新安装就可以使用了。

既然 Manjaro 是滚动发布的，为什么每隔一段时间就会发布一个新版本呢？这是因为他们要刷新 ISO，这样下载 Manjaro 的新用户就不用再安装过去几年的更新了。这就是为什么 Arch Linux 也会每个月刷新一次 ISO 的原因。

Manjaro 的“ISO 刷新”是有代号和版本的，因为它可以帮助开发者清楚地标明每个开发阶段的发展方向。

所以，如果你已经在使用它，只需使用 Pamac 或命令行[更新你的 Manjaro Linux 系统][12]即可。

如果你想尝试 Manjaro 或者想使用 ZFS，那么你可以通过从它的网站上[下载 ISO][14] 来[安装 Manjaro][13]。

愿你喜欢新的 Manjaro Linux 发布。

--------------------------------------------------------------------------------

via: https://itsfoss.com/manjaro-20-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://forum.manjaro.org/t/manjaro-20-0-lysia-released/138633
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/manjaro-20-lysia.jpeg?resize=800%2C440&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-snap-in-pamac-manjaro.jpg?resize=800%2C490&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/snap-app-pacman.jpg?resize=800%2C489&ssl=1
[5]: https://itsfoss.com/what-is-zfs/
[6]: https://itsfoss.com/manjaro-architect-review/
[7]: https://calamares.io/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/pacman-prompts-install-apps.jpg?resize=800%2C331&ssl=1
[9]: https://itsfoss.com/linux-kernel-5-6/
[10]: https://itsfoss.com/wireguard/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/manjaro-20-neofetch-screen.jpg?resize=800%2C495&ssl=1
[12]: https://itsfoss.com/update-arch-linux/
[13]: https://itsfoss.com/install-manjaro-linux/
[14]: https://manjaro.org/download/
