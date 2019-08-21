[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10872-1.html)
[#]: subject: (How to Add Application Shortcuts on Ubuntu Desktop)
[#]: via: (https://itsfoss.com/ubuntu-desktop-shortcut/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 桌面手动添加应用快捷方式
===============================

> 在这篇快速指南中，你将学到如何在 Ubuntu 桌面和其他使用 GNOME 桌面的发行版中添加应用图标。

一个经典的桌面操作系统在“桌面屏”上总是有图标的。这些桌面图标包括文件管理器、回收站和应用图标。

当在 Windows 中安装应用时，一些程序会询问你是否在桌面创建一个快捷方式。但在 Linux 系统中不是这样。

但是如果你热衷于这个特点，让我给你展示如何在 Ubuntu 桌面和其他使用 GNOME 桌面的发行版中创建应用的快捷方式。

![Application Shortcuts on Desktop in Ubuntu with GNOME desktop][2]

如果你想知道我的桌面外观，我正在使用 Ant 主题和 Tela 图标集。你可以获取一些 [GTK 主题][3] 和 [为 Ubuntu 准备的图标集][4]并换成你喜欢的。

### 在 Ubuntu 中添加桌面快捷方式

![][5]

个人来讲，我更喜欢为应用图标准备的 Ubuntu 启动器方式。如果我经常使用一个程序，我会添加到启动器。但是我知道不是每个人都有相同的偏好，可能少数人更喜欢桌面的快捷方式。

让我们看在桌面中创建应用快捷方式的最简单方式。

> 免责声明

> 这篇指南已经在 Ubuntu 18.04 LTS 的 GNOME 桌面上测试过了。它可能在其他发行版和桌面环境上也能发挥作用，但你必须自己尝试。一些 GNOME 特定步骤可能会变，所以请在[其他桌面环境][7]尝试时注意。

#### 准备

首先最重要的事是确保你有 GNOME 桌面的图标权限。

如果你跟随 Ubuntu 18.04 自定义提示，你会知道如何安装 GNOME Tweaks 工具。在这个工具中，确保你设置“Show Icons”选项为启用。

![Allow icons on desktop in GNOME][9]

一旦你确保已经设置，是时候在桌面添加应用快捷方式了。

#### 第一步：定位应用的 .desktop 文件

到 “Files -> Other Location -> Computer”。

![Go to Other Locations -> Computer][11]

从这里，到目录 “usr -> share -> applications”。你会在这里看到几个你已经安装的 [Ubuntu 应用][12]。即使你没有看到图标，你应该看到被命名为“应用名.desktop”形式的文件。

![Application Shortcuts][13]

#### 第二步：拷贝 .desktop 文件到桌面

现在你要做的只是查找应用图标（或者它的 desktop 文件）。当你找到后，拖文件到桌面或者拷贝文件（使用 `Ctrl+C` 快捷方式）并在桌面粘贴（使用 `Ctrl+V` 快捷方式）。

![Add .desktop file to the desktop][14]

#### 第三步：运行 desktop 文件

当你这么做，你应该在桌面上看到一个图标的文本文件而不是应用 logo。别担心，一会就不一样了。

你要做的就是双击桌面的那个文件。它将警告你它是一个“未信任的应用启动器’，点击“信任并启动”。

![Launch Desktop Shortcut][15]

这个应用像往常一样启动，好事是你会察觉到 .desktop 文件现在已经变成应用图标了。我相信你喜欢应用图标的方式，不是吗？

![Application shortcut on the desktop][16]

#### Ubuntu 19.04 或者 GNOME 3.32 用户的疑难杂症

如果你使用 Ubuntu 19.04 或者 GNOME 3.32，你的 .desktop 文件可能根本不会启动。你应该右击 .desktop 文件并选择 “允许启动”。

在这之后，你应该能够启动应用并且桌面上的应用快捷方式能够正常显示了。

### 总结

如果你不喜欢桌面的某个应用启动器，选择删除就是了。它会删除应用快捷方式，但是应用仍安全的保留在你的系统中。

我希望你发现这篇快速指南有帮助并喜欢在 Ubuntu 桌面上的应用快捷方式。

如果你有问题或建议，请在下方评论让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-desktop-shortcut/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/app-shortcut-on-ubuntu-desktop.jpeg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/best-gtk-themes/
[4]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/add-ubuntu-desktop-shortcut.jpeg?resize=800%2C450&ssl=1
[6]: https://www.gnome.org/
[7]: https://itsfoss.com/best-linux-desktop-environments/
[8]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/allow-icons-on-desktop-gnome.jpg?ssl=1
[10]: https://itsfoss.com/replace-linux-from-dual-boot/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Adding-desktop-shortcut-Ubuntu-gnome-1.png?resize=800%2C436&ssl=1
[12]: https://itsfoss.com/best-ubuntu-apps/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/application-shortcuts-in-ubuntu.png?resize=800%2C422&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/add-desktop-file-to-desktop.jpeg?resize=800%2C458&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/launch-desktop-shortcut-.jpeg?resize=800%2C349&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/app-shortcut-on-desktop-ubuntu-gnome.jpeg?resize=800%2C375&ssl=1
[17]: https://itsfoss.com/install-nemo-file-manager-ubuntu/
