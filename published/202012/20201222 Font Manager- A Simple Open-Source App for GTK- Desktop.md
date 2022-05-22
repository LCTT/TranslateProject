[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12968-1.html)
[#]: subject: (Font Manager: A Simple Open-Source App for GTK+ Desktop)
[#]: via: (https://itsfoss.com/font-manager/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Font Manager：一个简单的 GTK+ 桌面的开源应用
======

![](https://img.linux.net.cn/data/attachment/album/202012/30/065754mx4363qxabe8y9z0.jpg)

> 一个非常简单的字体管理器应用，让你专注于调整 Linux 系统上的字体。

如果你是一个有经验的 Linux 用户，你可能会利用终端或 [调整工具][1]来管理你的 Linux 系统的字体。

老实说，不管 GNOME 调整工具有多有用，但是用来管理字体可能会不太够用。因此，一个单独的应用可以很好地帮助你管理字体。

### Font Manager：一个帮助管理字体的开源应用

![][2]

Font Manager（这就是应用的字面名称）是一个专门帮助你管理字体的应用。

你可以获得字体族的详细信息、可用的变体，以及根据字体的高度、宽度、间距等进行过滤和调整的功能。考虑到它是一个简单的应用，因此你找不到很多功能，但是我将在下面简要介绍一些功能。

### Font Manager 的功能

![][3]

* 可以添加字体
* 可以删除字体
* 根据字体族、供应商、间距、高度等因素轻松筛选字体
* 调整字体的缩放系数
* 调整字体的抗锯齿（软度/锐度）
* 添加字体源，以便在安装前进行预览
* 提供快速管理的键盘快捷键
* 开箱即用的谷歌字体集成
* 获取关于字体族中可用字符的详细信息、许可证、字体大小、供应商、文件类型、间距、宽度和样式

![][4]

总的来说，你可以轻松安装或删除字体。但是，当你管理字体时，你会得到很多帮助，如上面的截图所示。

### 在 Linux 上安装 Font Manager

你有多种选择（取决于你使用的 Linux 发行版）进行安装。

如果你使用的是基于 Ubuntu 的发行版，你可以通过下面的命令轻松添加 PPA 来安装 Font Manager：

```
sudo add-apt-repository ppa:font-manager/staging
sudo apt update
sudo apt install font-manager
```

如果你不喜欢 [PPA][5]（我更喜欢这样安装），你也可以在任何 Linux 发行版上安装一个[可用的 Flatpak 包][6]。

你只需要在你的 Linux 系统上启用 Flatpak，然后在你的软件中心搜索它（如果它支持 Flatpak 集成的话），或者直接输入下面的命令安装它：

```
flatpak install flathub org.gnome.FontManager
```

如果你是 Arch 用户，你可以在 [AUR][8] 中找到[包][7]。


更多的安装说明，你可以参考它的[官网][9]和 [GitHub 页面][10]。

- [下载 Font Manager][9]

### 总结

Font Manager 是一个简单的解决方案，适用于任何基于 GTK+ 的桌面环境。主要用于 GNOME，但你在其他桌面环境使用它。

你可以得到很多有用的信息，同时可以添加或删除字体，我想这显然是一个真正的字体管理器。

你对 Font Manager 有什么看法？在下面的评论中告诉我你的想法吧!

--------------------------------------------------------------------------------

via: https://itsfoss.com/font-manager/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/gnome-tweak-tool/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager.png?resize=800%2C565&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager-settings.jpg?resize=800%2C569&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager-showcase.png?resize=800%2C571&ssl=1
[5]: https://itsfoss.com/ppa-guide/
[6]: https://flathub.org/apps/details/org.gnome.FontManager
[7]: https://aur.archlinux.org/packages/font-manager/
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://fontmanager.github.io/
[10]: https://github.com/FontManager/font-manager
