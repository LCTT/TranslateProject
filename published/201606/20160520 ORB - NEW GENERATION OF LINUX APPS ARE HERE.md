ORB：新一代 Linux 应用
=============================================

![](http://itsfoss.com/wp-content/uploads/2016/05/ORB-Apps.jpeg)

我们之前讨论过[在 Ubuntu 上离线安装应用][1]。我们现在要再次讨论它。

[Orbital Apps][2] 给我们带来了一种新的软件包类型 **ORB**，它具有便携软件、交互式安装向导支持，以及离线使用的能力。

便携软件很方便。主要是因为它们能够无需任何管理员权限直接运行，也能够带着所有的设置和数据随 U 盘存储。而交互式的安装向导也能让我们轻松地安装应用。

### 开放式可运行的打包（OPEN RUNNABLE BUNDLE） (ORB)

ORB 是一个自由开源的包格式，它和其它包格式在很多方面有所不同。ORB 的一些特性：

- **压缩**：所有的包都经过 squashfs 压缩，体积最多可减少 60%。
- **便携模式**：如果一个便携 ORB 应用是在可移动设备上运行的，它会把所有设置和数据存储在那之上。
- **安全**：所有的 ORB 包使用 PGP/RSA 签名，通过 TLS 1.2 分发。
- **离线**：所有的依赖都打包进软件包，所以不再需要下载依赖。
- **开放式软件包**：ORB 软件包可以作为 ISO 镜像挂载。

### 种类

ORB 应用现在有两种类别：

- 便携软件
- SuperDEB

### 1. 便携 ORB 软件

便携 ORB 软件可以立即运行而不需要任何的事先安装。这意味着它不需要管理员权限，也没有依赖！你可以直接从 Orbital Apps 网站下载下来就能使用。

并且由于它支持便携模式，你可以将它拷贝到 U 盘携带。它所有的设置和数据会和它一起存储在 U 盘。只需将 U 盘连接到任何运行 Ubuntu 16.04 的机器上就行了。

#### 可用便携软件

目前有超过 35 个软件以便携包的形式提供，包括一些十分流行的软件，比如：[Deluge][3]，[Firefox][4]，[GIMP][5]，[Libreoffice][6]，[uGet][7] 以及 [VLC][8]。

完整的可用包列表可以查阅 [便携 ORB 软件列表][9]。

#### 使用便携软件

按照以下步骤使用便携 ORB 软件：

- 从 Orbital Apps 网站下载想要的软件包。
- 将其移动到想要的位置（本地磁盘/U 盘）。
- 打开存储 ORB 包的目录。

	![](http://itsfoss.com/wp-content/uploads/2016/05/using-portable-orb-app-1-1024x576.jpg)
- 打开 ORB 包的属性。

	![给 ORB 包添加运行权限](http://itsfoss.com/wp-content/uploads/2016/05/using-portable-orb-app-2.jpg)

- 在权限标签页添加运行权限。
- 双击打开它。

等待几秒，让它准备好运行。大功告成。

### 2. SuperDEB

另一种类型的 ORB 软件是 SuperDEB。SuperDEB 很简单，交互式安装向导能够让软件安装过程顺利得多。如果你不喜欢从终端或软件中心安装软件，superDEB 就是你的菜。

最有趣的部分是你安装时不需要一个互联网连接，因为所有的依赖都由安装向导打包了。

#### 可用的 SuperDEB

超过 60 款软件以 SuperDEB 的形式提供。其中一些流行的有：[Chromium][10]，[Deluge][3]，[Firefox][4]，[GIMP][5]，[Libreoffice][6]，[uGet][7] 以及 [VLC][8]。

完整的可用 SuperDEB 列表，参阅 [SuperDEB 列表][11]。

#### 使用 SuperDEB 安装向导

- 从 Orbital Apps 网站下载需要的 SuperDEB。
- 像前面一样给它添加**运行权限**（属性 > 权限）。
- 双击 SuperDEB 安装向导并按下列说明操作：

	![点击 OK](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-1.png)

	![输入你的密码并继续](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-2.png)

	![它会开始安装…](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-3.png)

	![一会儿它就完成了…](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-4.png)

- 完成安装之后，你就可以正常使用了。

### ORB 软件兼容性

从 Orbital Apps 可知，它们完全适配 Ubuntu 16.04 [64 位]。

至于其它发行版兼容性则不受保证。但我们可以说，它在所有 Ubuntu 16.04 衍生版（UbuntuMATE，UbuntuGNOME，Lubuntu，Xubuntu 等）以及基于 Ubuntu 16.04 的发行版（比如即将到来的 Linux Mint 18）上都适用。我们现在还不清楚 Orbital Apps 是否有计划拓展它的支持到其它版本 Ubuntu 或 Linux 发行版上。

如果你在你的系统上经常使用便携 ORB 软件，你可以考虑安装 ORB 启动器。它不是必需的，但是推荐安装它以获取更佳的体验。最简短的 ORB 启动器安装流程是打开终端输入以下命令：

```
wget -O - https://www.orbital-apps.com/orb.sh | bash
```

你可以在[官方文档][13]找到更加详细的介绍。

### 如果我需要的软件不在列表里？

如果你需要一个当前并没有可用 ORB 包的软件，你可以[联系][14] Orbital Apps。好消息是，Orbital Apps 正在致力于推出一个创建 ORB 包的工具。所以，不久后我们有希望可以自己制作 ORB 包！

多说一句，这个文章是关于离线安装软件的。如果你感兴趣的话，你可以看看[如何离线更新或升级 Ubuntu][15]。

所以，你怎么看 Orbital Apps 的便携软件和 SuperDEB 安装向导？你会试试吗？


----------------------------------
via: http://itsfoss.com/orb-linux-apps/

作者：[Munif Tanjim][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/munif/
[1]: http://itsfoss.com/cube-lets-install-linux-applications-offline/
[2]: https://www.orbital-apps.com/
[3]: https://www.orbital-apps.com/download/portable_apps_linux/deluge
[4]: https://www.orbital-apps.com/download/portable_apps_linux/firefox
[5]: https://www.orbital-apps.com/download/portable_apps_linux/gimp
[6]: https://www.orbital-apps.com/download/portable_apps_linux/libreoffice
[7]: https://www.orbital-apps.com/download/portable_apps_linux/uget
[8]: https://www.orbital-apps.com/download/portable_apps_linux/vlc
[9]: https://www.orbital-apps.com/download/portable_apps_linux/
[10]: https://www.orbital-apps.com/download/superdeb_installers/ubuntu_16.04_64bits/chromium/
[11]: https://www.orbital-apps.com/superdebs/ubuntu_16.04_64bits/
[12]: http://itsfoss.com/32-bit-64-bit-ubuntu/
[13]: https://www.orbital-apps.com/documentation
[14]: https://www.orbital-apps.com/contact
[15]: http://itsfoss.com/upgrade-or-update-ubuntu-offline-without-internet/
