[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12586-1.html)
[#]: subject: (Customize your GNOME desktop theme)
[#]: via: (https://opensource.com/article/20/8/gnome-themes)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

自定义你的 GNOME 桌面主题
======

> 使用“优化”和它的用户主题扩展来改变你的 Linux UI。

![](https://img.linux.net.cn/data/attachment/album/202009/06/110116kmufkkc31akwfp1w.jpg)

GNOME 是一个相当简单和精简的 Linux 图形用户界面（GUI），很多用户喜欢它的简约外观。虽然它基本上是开箱即用的，但你可以根据自己的喜好来定制 [GNOME][2] 。有了 GNOME “优化” 和用户主题扩展，你可以改变顶部栏、窗口标题栏、图标、光标和许多其他 UI 选项的外观。

### 开始使用

在你改变你的 GNOME 主题之前，你必须安装 “<ruby>[优化][3]<rt>Tweaks</rt></ruby>” 并启用用户主题扩展。

#### 安装 GNOME “优化”

你可以在 GNOME “软件”中找到“优化”，只需点击一个按钮就可以快速安装。

![Install Tweaks in Software Center][4]

如果你喜欢命令行，请使用你的软件包管理器。例如，在 Fedora 或 CentOS 上：

```
$ sudo dnf install gnome-tweaks
```

在 Debian 或类似的发行版：

```
$ sudo apt install gnome-tweaks
```

#### 启用用户主题

要启用用户主题扩展，启动“优化”并选择“<ruby>扩展<rt>Extensions</rt></ruby>”。找到 “用户主题<rt>User themes</rt></ruby>”，点击滑块启用。

![Enable User Themes Extension][6]

### 获取主题

现在你已经完成了这些预先条件，你已经准备好寻找和下载一些主题了。一个寻找新主题的好网站是 [GNOME-Look.org][7]。

在页面的左侧有一个主题类别的列表。当你找到一个你想要的主题，你需要下载它。我直接把 `.tar` 文件下载到我的家目录下的 `.themes` 目录（你可能需要先创建这个目录）。

```
$ mkdir ~/.themes
```

如果你想让所有用户都能使用这个主题，请把它放在 `/usr/share/themes` 中。

```
$ tar xvf theme_archive.tar.xz
```

下载后，解压压缩包。你可以删除 `.tar.xz` 文件以节省一些磁盘空间。

### 应用主题

要应用你的新主题，在“优化”中进入“<ruby>外观<rt>Appearance</rt></ruby>”。在这里，你可以为你的桌面的每个方面选择不同的选项。

![Apply a theme][8]

### 多样性是生活的调剂品

自从第一个图形界面面市以来，能够用不同的墙纸、颜色、字体等个性化电脑桌面一直是一个受欢迎的功能。GNOME “优化”和用户主题扩展可以在所有 GNU/Linux 操作系统上的 GNOME 桌面环境中实现这种自定义。而且开源社区还在持续提供广泛的主题、图标、字体和壁纸，任何人都可以下载、尝试和定制。

你最喜欢的 GNOME 主题是什么，你为什么喜欢它们？请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/gnome-themes

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/custom_gnomes.png?itok=iG98iL8d (Gnomes in a window.)
[2]: https://www.gnome.org/
[3]: https://wiki.gnome.org/Apps/Tweaks
[4]: https://opensource.com/sites/default/files/uploads/gnome-install_tweaks_gui.png (Install Tweaks in Software Center)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/gnome-enable_user_theme_extension.png (Enable User Themes Extension)
[7]: https://www.gnome-look.org
[8]: https://opensource.com/sites/default/files/uploads/gnome-apply_theme.png (Apply a theme)
