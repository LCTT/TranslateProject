[#]: subject: "Customize GNOME Desktop in Ubuntu with a Clean Look"
[#]: via: "https://www.debugpoint.com/2022/03/customize-gnome-clean-look-2022-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14393-1.html"

在 Ubuntu 中定制简洁的 GNOME 桌面
======

> 本教程为你提供了一些简单的步骤来自定义 GNOME 桌面，用最少的努力打造干净的外观。下面如何做的。

![](https://img.linux.net.cn/data/attachment/album/202203/25/095452nw8pt6pxu9owwsks.jpg)

如果你对最喜欢的 GNOME 桌面的样子已经看厌烦了，那么你就来对了。让我们安装一些主题图标并进行一些调整以提升你的桌面格调。我们将转换如下桌面（GNOME 40.5 和 Ubuntu 21.10）。

![Ubuntu Desktop with GNOME – Before Customization][1]

这个定制教程将使用漂亮的 Colloid GTK 主题、Mkos-Big-Sur 图标、一个带有额外扩展的酷炫光标主题，以及 Conky。

### 自定义 GNOME 桌面，用简洁的外观提升它的形象

#### 安装

首先，通过在终端运行以下命令来设置 GNOME Shell 扩展。

```
sudo apt install chrome-gnome-shell
```

然后 [打开这个页面][2]，将 GNOME 扩展的插件添加到你的浏览器（Chrome/Firefox）。

![Add Browser Add-on for GNOME Shell Extension][3]

安装“扩展”应用（[Flatpak][4]），你可能需要它来改变 GNOME 扩展的设置。

之后，从终端使用以下命令安装 <ruby>GNOME 优化工具<rt>GNOME Tweaks</rt></ruby>。我们将使用这个工具来改变主题和其他设置。

```
sudo apt install gnome-tweaks
```

[下载 Colloid GTK 主题][5]。下载后解压文件。然后将解压后的文件夹复制到你主目录下的 `~/.themes`。如果文件夹不存在，请创建它。完成这些后，打开终端，运行 `install.sh` 文件。

[下载 Mkos-Big-Sur 图标主题][6]。下载完成后，解压文件并将父文件夹复制到你的主目录中的 `~/.icons`。

[下载 Vimix 光标主题][7]，并按照上述步骤操作。将提取的文件夹复制到 `~/.icons` 目录中。然后打开一个终端，运行 `install.sh` 文件。

现在，安装 Conky 和一些扩展，这些扩展最终会给你的 GNOME 桌面一个干净的外观。要安装 Conky 和 Conky 管理器，打开终端提示符并运行以下命令。

```
sudo apt install conky
sudo add-apt-repository ppa:tomtomtom/conky-manager
sudo apt update && sudo apt install conky-manager2
```

现在，打开下面每个扩展的链接，依次安装它们。要安装时，打开页面，点击 ON/OFF 切换开关（见下图）。它将要求你提供管理员密码和安装许可。

* [Move Clock][8]
* [Dash to Dock][9]
* [Tray Icons][10]
* [Arc Menu][11]
* [User Themes][12]

![GNOME Extension – Page][13]

#### 配置

在你完成上述步骤后，做一些基本配置。你可能会看到在你安装上面的 GNOME 扩展时，有些变化已经生效了。例如，在安装上面的 Move Clock 扩展时，时钟应该已经被移到了右边。

##### 优化工具

打开<ruby>优化<rt>GNOME Tweaks</rt></ruby>工具（从应用菜单中搜索“Tweaks”），进入“<ruby>外观<rt>Apperance</rt></ruby>”。

将应用主题改为 “Colloid Dark”，光标主题为 “Vimix Cursors”，图标主题为 “Mkos-big-sur”，Shell 主题为 “Colloid Dark”。如果你愿意，你可以选择浅色主题和不同的选项。

![Apply Themes][15]

##### Arc 菜单

打开“<ruby>扩展<rt>Extension</rt></ruby>”应用，进入 <ruby>Arc 菜单设置<rt>Arc Menu Settings</rt></ruby>。

将菜单布局改为 “<ruby>替代菜单布局<rt>Alternative Menu Layout</rt></ruby> > Raven”。

将应用的菜单按钮改成你喜欢的一些图标。在本指南中，我从 [这里][16] 下载了一个 GNOME 图标。并通过 Arc 菜单的 “<ruby>设置<rt>Settings</rt></ruby> > <ruby>按钮外观<rt>Button Appearance</rt></ruby> > <ruby>浏览图标<rt>Browse Icon</rt></ruby>”应用它。它应该看起来像这样。

![Arc Menu – Raven][17]

从“<ruby>扩展<rt>Extension</rt></ruby>”程序中打开 “Dash to Dock” 设置。在“<ruby>外观<rt>Appearance</rt></ruby>”选项卡中，改变以下项目：

* 启用收缩到 Dash 的功能
* 自定义窗口计数指示器为 Dash
* 启用自定义 Dash 颜色
* 自定义不透明度为固定
* 不透明度为 12%

在位置和大小选项卡中，将停靠区位置改为底部，图标大小限制为 39px。

如果你喜欢，你可以启动 Conky，并下载一张与 Colloid 主题相配的漂亮墙纸。在这个演示中，我[选择了一张漂亮的灰色墙纸][18]，它与深色主题搭配看起来非常漂亮。

### 结果

在所有的配置之后，如果一切顺利，你的桌面应该是这样的。

![GNOME Customization in Ubuntu with a simple look-1][19]

![GNOME Customization in Ubuntu with a simple look-2][20]

![GNOME Customization in Ubuntu with a simple look-3][21]

你可以通过多种设置组合来玩转这个主题的不同变体。并创造一个更适合你的外观。

我希望这个指南能帮助你把你的 GNOME 桌面改造成简洁的外观。如果你喜欢这个设置，请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/customize-gnome-clean-look-2022-1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/03/Ubuntu-Desktop-with-GNOME-Before-Customization-1024x582.jpg
[2]: https://extensions.gnome.org/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/Add-Browser-Add-on-for-GNOME-Shell-Extension.jpg
[4]: https://dl.flathub.org/repo/appstream/org.gnome.Extensions.flatpakref
[5]: https://github.com/vinceliuice/Colloid-gtk-theme/archive/refs/heads/main.zip
[6]: https://github.com/zayronxio/Mkos-Big-Sur/archive/refs/heads/master.zip
[7]: https://github.com/vinceliuice/Vimix-cursors
[8]: https://extensions.gnome.org/extension/2/move-clock/
[9]: https://extensions.gnome.org/extension/307/dash-to-dock/
[10]: https://extensions.gnome.org/extension/2890/tray-icons-reloaded/
[11]: https://extensions.gnome.org/extension/3628/arcmenu/
[12]: https://extensions.gnome.org/extension/19/user-themes/
[13]: https://www.debugpoint.com/wp-content/uploads/2018/05/GNOME-Extension-Page.png
[15]: https://www.debugpoint.com/wp-content/uploads/2022/03/Apply-Themes.jpg
[16]: https://icons.iconarchive.com/icons/tatice/operating-systems/32/Gnome-icon.png
[17]: https://www.debugpoint.com/wp-content/uploads/2022/03/Arch-Menu-Raven.jpg
[18]: https://i.redd.it/1ttvv79apo851.png
[19]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-1-1024x579.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-2-1024x580.jpg
[21]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-3-1024x576.jpg
[22]: https://t.me/debugpoint
[23]: https://twitter.com/DebugPoint
[24]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[25]: https://facebook.com/DebugPoint