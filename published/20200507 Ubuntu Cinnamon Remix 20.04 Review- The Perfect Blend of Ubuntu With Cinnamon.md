[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12316-1.html)
[#]: subject: (Ubuntu Cinnamon Remix 20.04 Review: The Perfect Blend of Ubuntu With Cinnamon)
[#]: via: (https://itsfoss.com/ubuntu-cinnamon-remix-review/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Ubuntu Remix Cinnamon 20.04 评测：Ubuntu 与 Cinnamon 的完美融合
======

![](https://img.linux.net.cn/data/attachment/album/202006/15/113226uq8ohzycrrc52q52.jpeg)

推出于 2011 年的 GNOME 3，其 GNOME Shell 迎来了社区的赞扬的同时，也招致了一些人的反对。很多用户和开发者都很喜欢原来的 GNOME 界面，以至于有几个小组复刻了它，其中的一个小组 —— Linux Mint 团队创建了 [Cinnamon 桌面环境][1]。

Cinnamon 桌面成为了 Linux Mint 的标志型产品。多年来，Cinnamon 一直是 [Linux Mint][2] 的代名词。在过去的几年里，随着 Cinnamon 的普及，这种情况略有改变。现在其他发行版也开始提供 Cinnamon 桌面环境，[Manjaro][3] 就是这样一个例子。

几个月前，我们向大家介绍了一个[新 Ubuntu 变体][4]，它提供了开箱即用的 Cinnamon 桌面体验，今天就让我们来深入了解一下 [Ubuntu Cinnamon Remix][5]。

### 为什么是 Ubuntu Cinnamon Remix 而不是 Linux Mint？

的确，Linux Mint 是基于 Ubuntu 的，很多 Linux Mint 的用户都会有这样的疑问：既然 Linux Mint 已经如此成熟，而且用户体验也大致相同，那么换成 Ubuntu 有什么意义吗？

Ubuntu Cinnamon Remix 与 Linux Mint 有很多小的区别，但有一个关键的区别是 Linux 爱好者不能忽视的。

Linux Mint 是基于 “LTS”（长期支持）版本的 Ubuntu，这意味着它一直落后于 Canonical 的 6 个月的更新节奏。Ubuntu Cinnamon Remix 则可以得益于较新的内核以及其他 6 个月周期内的功能升级和较新的软件。

另一个关键的区别是，Ubuntu Cinnamon Remix 将 “继承” [Snap 支持][6]，而 Linux Mint 则拥抱 [FlatPak][7]。Ubuntu Cinnamon Remix 使用 Ubuntu 软件中心而不是 Mint 软件管理器。

我是 Cinnamon 的忠实粉丝，所以我选择了评测这款 Ubuntu 和 Cinnamon 的混合版，在这里我分享一下我的体验。

### 体验 Ubuntu Cinnamon Remix

只要有机会，我总会提到 [Calamares 安装程序][8]有多快，感谢 Ubuntu Cinnamon Remix 团队如此选择。

![Calamares Installer][9]

新安装的 Ubuntu Cinnamon Remix 会消耗大约 750 MB 的内存。这与 Linux Mint Cinnamon 非常相似。

![An idle Cinnamon takes 750 MB of RAM][10]

美丽的 [Kimmo 主题][11]和橙色调的 Ubuntu 壁纸也给我留下了深刻的印象，看来这是一个非常细致的努力的结果。

![Ubuntu Cinammon Remix 20.04 Desktop][12]

#### 足够让你开始的工具

和其他 Ubuntu 发行版一样，Ubuntu Cinnamon Remix 也包含了一些重要的生产力工具，下面是其中一些：

* 火狐浏览器
* Thunderbird - 电子邮件客户端
* LibreOffice套件
* Celluloid - 多媒体播放器
* [GIMP][13] - 图像处理软件
* Synaptic 软件包管理器
* Gnome 软件中心
* [Gparted][14] - 分区管理器

使用 Ubuntu Cinnamon Remix 作为我的主要平台已经有几天了，它满足了我的高期望。Ubuntu 稳定如磐石，速度非常快，在日常工作中我没有遇到任何问题。

#### 给 Linux Mint 爱好者的 Ubuntu

你是否热衷于 Ubuntu Cinnamon，却习惯了 Linux Mint 主题？点击下面的内容，看看如何获得一个完整的 Linux Mint 主题包，以及如何配置它来保持 Ubuntu 的传统。

给 Ubuntu Cinnamon Remix 以真正的 Mint 感受：

首先你必须下载并解压以下内容，通过终端很容易完成。

获取 Linux Mint-X 图标包：

```
wget http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_1.5.5_all.deb
```

获取 Linux Mint-Y 图标包：

```
wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.3.9_all.deb
```

获取 Linux Mint 主题：

```
wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_1.8.4_all.deb
```

安装下载的软件包：

```
sudo dpkg -i ./mint-x-icons_1.5.5_all.deb ./mint-y-icons_1.3.9_all.deb ./mint-themes_1.8.4_all.deb
```

完成后，点击左下角的菜单按钮，输入 “themes”。你也可以在系统设置中找到“主题”功能。

![Accessing Themes][15]

打开后更换 kimmo 图标和主题，如下图所示。Linux Mint 默认的“绿色”是普通的 Mint-Y，而橙色是 Ubuntu 的最佳选择。

![Linux Mint Theme Settings][16]

#### 为 Cinnamon 迷们准备的美食

让我们承认吧，审美很重要。Cinnamon 拥有简洁优雅的外观、易于阅读的字体和漂亮的色彩对比主题。Cinnamon 提供了一个整洁的桌面，只需进入系统设置下的桌面菜单，即可轻松配置桌面图标。你也可以选择桌面图标只显示在主显示器上、只显示在副显示器上，或者同时显示在两个显示器上。这也适用于超过两台显示器的设置。

![Ubuntu Cinnamon Remix Desklets][17]

桌面组件和小程序是一种小型的、单一用途的应用程序，可以分别添加到你的桌面或面板上。在众多的应用程序中，最常用的是 CPU 或资源监控器、天气小程序、便签和日历。

Cinnamon 控制中心集中提供许多桌面配置选项。通过访问 “主题” 部分，你可以选择桌面基本方案和图标、窗口边框、鼠标指针和控件外观。字体对桌面的整体外观有很大的影响，而 Cinnamon 让改变字体比以往任何时候都要容易。

Cinnamon 控制中心配置对新用户来说也足够简单，相比之下，KDE Plasma 会因为大量的配置选项而导致新用户感到困惑。

![][18]

Cinnamon 面板包含用于启动程序的菜单、基本的系统托盘和应用程序选择器。面板的配置很简单，添加新的程序启动器只需在主菜单中找到你要添加的程序，右击图标，选择 “添加到面板” 即可。你也可以将启动程序图标添加到桌面，以及 Cinnamon 的 “收藏夹” 启动栏中。如果你不喜欢面板上图标的顺序，只需在面板栏上点击右键，进入面板的 “编辑” 模式，重新排列图标即可。

### 结论

无论你是决定给你的桌面 “加点料”，还是考虑从 [Windows 迁移到 Linux][19]，Cinnamon 社区都为你制作了大量的香料。

传统而又优雅，可定制而又简单，Ubuntu Cinnamon Remix 是一个有趣的项目，前途无量，对于喜欢 Ubuntu 的 Cinnamon 桌面爱好者来说，这可能是一个不二之选。

你觉得 Ubuntu Cinnamon Remix 怎么样？你已经使用过它了吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-cinnamon-remix-review/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Cinnamon_(desktop_environment)
[2]: https://www.linuxmint.com/
[3]: https://manjaro.org/
[4]: https://itsfoss.com/ubuntudde/
[5]: https://ubuntucinnamon.org/
[6]: https://snapcraft.io/
[7]: https://flatpak.org/
[8]: https://calamares.io/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/Calamares-Installer.png?resize=800%2C426&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/htop-running-on-Ubuntu-Cinnamon-Remix-20.04.png?ssl=1
[11]: https://github.com/Ubuntu-Cinnamon-Remix/kimmo-gtk-theme
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/Ubuntu-Cinammon-Remix-20.04-desktop.png?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/gimp-2-10-release/
[14]: https://itsfoss.com/gparted/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/accessing-themes.png?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/Linux-Mint-theme-settings.png?ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-cinnamon-remix-desklets.jpg?fit=800%2C450&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-cinnamon-control.jpg?fit=800%2C450&ssl=1
[19]: https://itsfoss.com/windows-like-linux-distributions/
