如何在 Linux 上管理字体
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_main.jpg?itok=qcJks7-c)

我不仅写技术文档，还写小说。并且因为我对 GIMP 等工具感到满意，所以我也（LCTT 译注：此处应指使用 GIMP）为自己的书籍创作了封面（并为少数客户做了图形设计）。艺术创作取决于很多东西，包括字体。

虽然字体渲染已经在过去的几年里取得了长足进步，但它在 Linux 平台上仍是个问题。如果你在 Linux 和 macOS 平台上比较相同字体的外观，差别是显而易见的，尤其是你要盯着屏幕一整天的时候。虽然在 Linux 平台上尚未找到完美的字体渲染方案，但开源平台做的很好一件事的就是允许用户轻松地管理他们的字体。通过选择、添加、缩放和调整，你可以在 Linux 平台上相当轻松地使用字体。

此处，我将分享一些这些年来我的一些技巧，可以帮我在 Linux 上扩展“字体能力”。这些技巧将对那些在开源平台上进行艺术创作的人有特别的帮助。因为 Linux 平台上有非常多可用的桌面界面（每种界面以不同的方式处理字体），因此当桌面环境成为字体管理的中心时，我将主要聚焦在 GNOME 和 KDE 上。

话虽如此，让我们开始吧。

### 添加新字体

在相当长的一段时间里，我都是一个字体收藏家，甚至有些人会说我有些痴迷。从我使用 Linux 的早期开始，我就总是用相同的方法向我的桌面添加字体。有两种方法可以做到这一点：

  * 使字体按用户可用；
  * 使字体在系统范围内可用。

因为我的桌面从没有其他用户（除了我自己），我只使用了按用户可用的字体设置。然而，我会向你演示如何完成这两种设置。首先，让我们来看一下如何向用户添加新字体。你首先要做的是找到字体文件，True Type 字体（TTF）和 Open Type 字体（OTF）都可以添加。我选择手动添加字体，也就是说，我在 `~/` 目录下新建了一个名为 `~/.fonts` 的隐藏目录。该操作可由以下命令完成：

```
mkdir ~/.fonts
```

当此文件夹新建完成，我将所有 TTF 和 OTF 字体文件移动到此文件夹中。也就是说，你在此文件夹中添加的所有字体都可以在已安装的应用中使用了。但是要记住，这些字体只会对这一个用户可用。

如果你想要使这个字体集合对所有用户可用，你可以如下操作：

  1. 打开一个终端窗口；
  2. 切换路径到包含你所有字体的目录中；
  3. 使用 `sudo cp *.ttf *.TTF /usr/share/fonts/truetype/` 和 `sudo cp *.otf *.OTF /usr/share/fonts/opentype` 命令拷贝所有字体。

当下次用户登录时，他们就将可以使用所有这些漂亮的字体。

### 图形界面字体管理

在 Linux 上你有许多方式来管理你的字体，如何完成取决于你的桌面环境。让我们以 KDE 为例。使用以 KDE 作为桌面环境的 Kubuntu 18.04，你能够找到一个预装的字体管理工具。打开此工具，你就能轻松地添加、移除、启用或禁用字体（当然也包括获得所有已安装字体的详细信息）。这个工具也能让你轻松地针对每个用户或在系统范围内添加和删除字体。假如你想要为用户添加一个特定的字体，你需要下载该字体并打开“字体管理”工具。在此工具中（图 1），点击“个人字体”并点击“+”号添加按钮。

![添加字体][2]

*图 1: 在 KDE 中添加个人字体。*

导航至你的字体路径，选择它们，然后点击打开。你的字体就会被添加进了个人区域，并且立即可用（图 2）。

![KDE 字体管理][5]

*图 2: 使用 KDE 字体管理添加字体*

在 GNOME 中做同样的事需要安装一个应用。打开 GNOME 软件中心或者 Ubuntu 软件中心（取决于你使用的发行版）并搜索字体管理器。选择“字体管理器”并点击安装按钮。一但安装完成，你就可以从桌面菜单中启动它，然后让我们安装个人字体。下面是如何安装：

  1. 从左侧窗格选择“用户”（图 3）；
  2. 点击窗口顶部的 “+” 按钮；
  3. 浏览并选择已下载的字体；
  4. 点击“打开”。

![添加字体][7]

*图 3: 在 GNOME 中添加字体*

### 调整字体

首先你需要理解 3 个概念：

  * **字体提示：** 使用数学指令调整字体轮廓显示，使其与光栅化网格对齐。
  * **抗锯齿：** 一种通过使曲线和斜线锯齿状边缘光滑化，提高数字图像真实性的技术。
  * **缩放因子：** 一个允许你倍增字体大小的缩放单元。也就是说如果你的字体是 12pt 并且缩放因子为 1，那么字体大小将会是 12pt。如果你的缩放因子为 2，那么字体将会是 24pt。

假设你已经安装好了你的字体，但它们看起来并不像你想的那么好。你将如何调整字体的外观？在 KDE 和 GNOME 中，你都可以做一些调整。在调整字体时需要考虑的一件事是，关于字体的口味是非常主观的。你也许会发现你只得不停地调整，直到你得到了看起来确实满意的字体（由你的需求和特殊口味决定）。让我们先看一下 KDE 下的情况吧。

打开“系统设置”工具并点击“字体”。在此节中，你不仅能切换不同字体，你也能够启用或配置抗锯齿或启用字体缩放因子（图 4）。

![配置字体][9]

*图 4: 在 KDE 中配置字体*

要配置抗锯齿，在下拉菜单中选择“启用”并点击“配置”。在结果窗口中（图 5），你可以配置“排除范围”、“子像素渲染类型”和“提示类型”。

一但你做了更改，点击“应用”。重启所有正在运行的程序，然后新的设置就会生效。

要在 GNOME 中这么做，你需要安装“字体管理器”或 GNOME Tweaks。在此处，GNOME Tweaks 是更好的工具。如果你打开 GNOME Dash 菜单但没有找到 Tweaks，打开 GNOME “软件”（或 Ubuntu “软件”）并安装 GNOME Tweaks。安装完毕，打开并点击“字体”，此处你可以配置提示、抗锯齿和缩放因子（图 6）。

![调整字体][11]

*图 6: 在 GNOME 中调整字体*

### 美化你的字体

以上便是使你的 Linux 字体尽可能漂亮的要旨。你可能得不到像 macOS 那样渲染的字体，但你一定可以提升字体外观。最后，你选择的字体会很大程度地影响视觉效果，因此请确保你安装的字体是干净并且完整适配的，否则你将输掉这次对抗。

通过 The Linux Foundation 和 edX 平台的免费课程 [初识 Linux][12] 了解更多关于 Linux 的信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/5/how-manage-fonts-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[2]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_1.jpg?itok=7yTTe6o3 (adding fonts)
[3]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_2.jpg?itok=_g0dyVYq (KDE Font Manager)
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_3.jpg?itok=8o884QKs (Adding fonts )
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_4.jpg?itok=QJpPzFED (Configuring fonts)
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_6.jpg?itok=4cQeIW9C (Tweaking fonts)
[12]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
