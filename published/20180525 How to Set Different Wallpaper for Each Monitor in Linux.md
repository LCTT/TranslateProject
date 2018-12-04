如何在 Linux 中为每个屏幕设置不同的壁纸
======

> 如果你想在 Ubuntu 18.04 或任何其他 Linux 发行版上使用 GNOME、MATE 或 Budgie 桌面环境在多个显示器上显示不同的壁纸，这个小工具将帮助你实现这一点。

多显示器设置通常会在 Linux 上出现多个问题，但我不打算在本文中讨论这些问题。我有另外一篇关于 Linux 上多显示器支持的文章。

如果你使用多台显示器，也许你想为每台显示器设置不同的壁纸。我不确定其他 Linux 发行版和桌面环境，但是 [GNOME 桌面][1] 的 Ubuntu 本身并不提供此功能。

不要烦恼！在本教程中，我将向你展示如何使用 GNOME 桌面环境为 Linux 发行版上的每个显示器设置不同的壁纸。

### 在 Ubuntu 18.04 和其他 Linux 发行版上为每个显示器设置不同的壁纸

![Different wallaper on each monitor in Ubuntu][2]

我将使用一个名为 [HydraPaper][3] 的小工具在不同的显示器上设置不同的背景。HydraPaper 是一个基于 [GTK][4] 的应用，用于为 [GNOME 桌面环境][5]中的每个显示器设置不同的背景。

它还支持 [MATE][6] 和 [Budgie][7] 桌面环境。这意味着 Ubuntu MATE 和 [Ubuntu Budgie][8] 用户也可以从这个应用中受益。

#### 使用 FlatPak 在 Linux 上安装 HydraPaper

使用 [FlatPak][9] 可以轻松安装 HydraPaper。Ubuntu 18.04 已 经提供对 FlatPaks 的支持，所以你需要做的就是下载应用文件并双击在 GNOME 软件中心中打开它。

你可以参考这篇文章来了解如何在你的发行版[启用 FlatPak 支持][10]。启用 FlatPak 支持后，只需从 [FlatHub][11] 下载并安装即可。

- [下载 HydraPaper][12]

#### 使用 HydraPaper 在不同的显示器上设置不同的背景

安装完成后，只需在应用菜单中查找 HydraPaper 并启动应用。你将在此处看到“图片”文件夹中的图像，因为默认情况下，应用会从用户的“图片”文件夹中获取图像。

你可以添加自己的文件夹来保存壁纸。请注意，它不会递归地查找图像。如果你有嵌套文件夹，它将只显示顶部文件夹中的图像。

![Setting up different wallpaper for each monitor on Linux][13]

使用 HydraPaper 很简单。只需为每个显示器选择壁纸，然后单击顶部的应用按钮。你可以轻松地用 HDMI 标识来识别外部显示器。

![Setting up different wallpaper for each monitor on Linux][14]

你还可以将选定的壁纸添加到“收藏夹”以便快速访问。这样做会将“最喜欢的壁纸”从“壁纸”选项卡移动到“收藏夹”选项卡。

![Setting up different wallpaper for each monitor on Linux][15]

你不需要在每次启动时启动 HydraPaper。为不同的显示器设置不同的壁纸后，设置将被保存，即使重新启动后你也会看到所选择的壁纸。这当然是预期的行为，但我想特别提一下。

HydraPaper 的一大缺点在于它的设计工作方式。你可以看到，HydraPaper 将你选择的壁纸拼接成一张图像并将其拉伸到屏幕上，给人的印象是每个显示器上都有不同的背景。当你移除外部显示器时，这将成为一个问题。

例如，当我尝试使用没有外接显示器的笔记本电脑时，它向我展示了这样的背景图像。

![Dual Monitor wallpaper HydraPaper][16]

很明显，这不是我所期望的。

#### 你喜欢它吗？

HydraPaper 使得在不同的显示器上设置不同的背景变得很方便。它支持超过两个显示器和不同的显示器方向。只有所需功能的简单界面使其成为那些总是使用双显示器的人的理想应用。

如何在 Linux 上为不同的显示器设置不同的壁纸？你认为 HydraPaper 是值得安装的应用吗？

请分享您的观点，另外如果你看到这篇文章，请在各种社交媒体渠道上分享，如 Twitter 和 [Reddit][17]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/wallpaper-multi-monitor/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://www.gnome.org/
[2]:https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/05/multi-monitor-wallpaper-setup.jpeg?w=800&ssl=1
[3]:https://github.com/GabMus/HydraPaper
[4]:https://www.gtk.org/
[5]:https://itsfoss.com/gnome-tricks-ubuntu/
[6]:https://mate-desktop.org/
[7]:https://budgie-desktop.org/home/
[8]:https://itsfoss.com/ubuntu-budgie-18-review/
[9]:https://flatpak.org
[10]:https://flatpak.org/setup/
[11]:https://flathub.org
[12]:https://flathub.org/apps/details/org.gabmus.hydrapaper
[13]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-2.jpeg?w=800&ssl=1
[14]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-1.jpeg?w=799&ssl=1
[15]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-3.jpeg?w=799&ssl=1
[16]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/05/hydra-paper-dual-monitor.jpeg?w=800&ssl=1
[17]:https://www.reddit.com/r/LinuxUsersGroup/
