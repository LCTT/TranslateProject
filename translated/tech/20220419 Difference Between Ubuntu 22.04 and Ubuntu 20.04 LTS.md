[#]: subject: "Difference Between Ubuntu 22.04 and Ubuntu 20.04 LTS"
[#]: via: "https://www.debugpoint.com/2022/04/difference-ubuntu-22-04-20-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu 22.04 LTS 与20.04 LTS 的变化
======
以下将为准备从 20.04 LTS 迁移到 22.04 LTS 的用户带来十个最重要的变化。
如果你是一位 [Ubuntu 20.04 LTS Focal Fossa][1] 用户并准备迁移到 [Ubuntu 22.04 LTS “Jammy Jellyfish”][2] 这篇文章将为你提供一些指引。在这两个 LTS 版本之间存在巨大的结构性变化，这在LTS分支中一般比较罕见。对比下来不难发现本次更新一次性改变了大量的内容。

了解了这一点之后，本文将针对普通用户关切的方面，支出十个发生根本性变化的特性，并为用户提供一些指引。

### Ubuntu 22.04 LTS 与 Ubuntu 20.04 LTS – 特性变化

#### 1\. Logo，颜色和 Plymouth

第一个你会注意到的视觉变化便是基调颜色从之前另外两个“棕橙色”变为了“橙色”。 同时 Canonical 将 logo 进行了修改，这一点可以体现在开机时 Plymouth 动画中。新的 logo 乍一看会显得有些怪异，但看久了会比较顺眼，至少我认为这是一个十分与众不同的 logo 。

![New Ubuntu logo and Plymouth][3]

#### 2\. 安装

Ubuntu 的默认安装器并没有显著的变化。我们其实更希望最新的 [基于 Flutter 的安装器][4] 能够最终落地，但并没有发生变化。基于此，整体安装流程并未发生变化。我仅能够观察到确认框和按钮的基调颜色发生了变化。从功能角度而言安装流程并未发生任何变化。

![Colour differences between two LTS Versions][5]

#### 3\. 锁屏与登陆界面、桌面的初始界面以及壁纸

锁屏与登陆界面变得更为精细和无边界化，主要包括密码框以及按钮。初次登录时的布局和壁纸发生了很大的变化。桌面的 “Home” 快捷方式被重命名为“Home”而并非你的用户名，但回收站快捷方式则移到了左侧的任务栏中并被隔断与其他任务栏图标隔开了。

除此之外的顶部状态栏并未大改。系统托盘目录则进行了细微的修正，布局更为宽松。这些变化主要来自于 [GNOME 42][6] 的变化。

日历菜单并未发生变化。

![Ubuntu 20.04 Vs Ubuntu 22.04 – Login Screen][7]

![Ubuntu 20.04 Vs Ubuntu 22.04 – Lock Screen][8]

![Difference between Ubuntu 20.04 and Ubuntu 22.04 – default look][9]

#### 4\. 桌面布局和 GNOME 版本升级

一个十分明显的变化就是 GNOME 版本由 GNOME 3.36 升级到了 GNOME 42。这是所有升级用户都会看到的显而易见的升级。 Ubuntu 22.04 LTS 搭载的 GNOME 42 带来了水平的工作区视图以及水平的应用视图。所以迁移之后手势从垂直转变为水平会有一些不习惯，但用一段时间就好了。

如果你的设备是笔记本电脑或触控屏，经过一点学习之后新的 GNOME 42 手势会给你十分顺滑的使用体验。以下是桌面、应用和工作区的对比图。

![Activities View Difference – Ubuntu 20.04 and 22.04][10]

![Application View Difference – Ubuntu 20.04 and 22.04][11]

#### 5\. 新的基调颜色与显示样式

有一个我非常喜欢的变化是最新的明亮和暗黑主题。早先 Ubuntu 有三个选择，明亮、暗黑和混合（标准）。这在 GNOME 42 中发生了改变因为其本身就带有内建的明亮和暗黑模式。另一方面，一个新的基调颜色选项允许用户在全局进行自定义（这并不是 GNOME 42 的一部分）。

当然你还不能像 KDE Plasma 一样自定义颜色的具体参数，而仅能从预设的几种颜色中进行选择。这些变化大多来自于最近的 libadwaita 和 GTK4 对 GNOME Shell 和本地应用程序的移植。

而当你在 Ubuntu 22.04 LTS 中打开暗黑模式，他会自动应用于所有的支持的应用，这是一个与老版本十分显著的区别。

![Accent Color and other changes][12]

![How Accent colour change impact looks in Ubuntu 22.04 LTS][13]

#### 6\. 文件管理

文件管理器的版本由 3.36.x 升级到了 42。区别是你能看到更为紧凑的设计、在文字和选项之间更为合理的布局以及顶部控制栏的小工具风格，这一切都归功于 GTK4 和对已有错误的修正。文件中的地址栏有些不同，目录之间有一个分隔符，而汉堡菜单在最后。当然，这些变化都较为细微，你也不会感受到他们带来太多的影响。

![Files Difference – Ubuntu 20.04 vs 22.04][14]

#### 7\. 截图工作流的变化

另一个值得注意并且需要用户进行学习的是截图方式的改变。这一功能被完全重做。早先你按下截图键时，会自动截图并保存到图片文件夹中。现在基于内建于 GNOME 42 的截图工具和录屏工具，这一方式被完全改变。

[][15]

另见： Ubuntu Budgie 22.04 LTS 新特性和发布细节

当你在截图时，你会发现有三个选项，你将可以选择全屏截图或者只截一部分。更重要的你还能选择是否让光标出现在截图中，此外还有录屏功能可选。选择完成之后点击捕捉键，这张图片将在被保存到图片文件夹的同时复制到你的剪切板。

![New Screenshot tool in Ubuntu 22.04 LTS][16]

总体而言，相较于之前多了一个步骤。

在所有应用程序窗口顶部的右键菜单上，增添了一个新的截图键选项。

![Take Screenshot option in top bar menu][17]

#### 8\. 火狐浏览器成为了一个 Snap 程序版本

此外，火狐浏览器在本次更新中变成了一个 Snap 程序版本。而此前在 20.04 LTS 中火狐浏览器以 deb 包形式呈现。所以对于一般用户而言区别不大。

但是火狐浏览器的 Snap 沙箱运行模式使得安装 GNOME 扩展工具时会产生问题，同时在同等硬件条件之下相较于之前的版本会显得更慢。

这个最为常用的应用的 Snap 迁移所带来的后续影响我们拭目以待。

#### 9\. 不同的窗口设置

在设置中出现了一个新的面板，多任务。多任务选项允许你调整触发角以及激活窗口边缘。此外你可以制定工作区的数量，并设置自动删除空的工作区。而针对多屏幕用户，现在可以选择仅在主屏幕上显示工作区或是在所有屏幕上显示工作区。

![New Multitasking Panel in Settings][18]

#### 10\. 主题和应用更新

此外，软件的变化带来了不同的响应外观并能够适应任何形式。应用商店同时带来了新的界面，包含了按照类别分类的软件视图以及编辑之选栏目。

应用详情页面变得更加易读，重要的信息例如总下载大小、评分、安全标记以及应用截图都以更可辨别地方式呈现。

![GNOME Software – Home page difference][19]

![GNOME Software – Details page difference][20]

最后，这两个版本的核心差异分为软件包、官方桌面环境主题和错误修正上。下面是对重要软件包版本变化的一个对比。

**20.04** | **22.04**
---|---
GCC 10.3 | GCC 11.2
Hplip 3.20.3 | Hplip 3.21.12
LibreOffice 6.4.7 | LibreOffice 7.3.2
[not introduced] | Pipewire 0.3.48
Python3 3.8.2 | Python3 3.10.1
Samba 4.13 | Samba 4.15
Systemd 245.4 | Systemd 249.11

### 总结

总而言之，这是 Ubuntu LTS 分支历次更新中变化最大的一次，不论是从视觉上还是特性角度。

我希望这个指南能够令读者了解两个版本之间的主要区别以及应当预期什么样的使用体验。

祝好

via: https://www.debugpoint.com/2022/04/difference-ubuntu-22-04-20-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/08/ubuntu-20-04-3-release/
[2]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/01/New-Ubuntu-logo-and-playmouth.jpg
[4]: https://github.com/canonical/ubuntu-desktop-installer
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Colour-differences-between-two-LTS-Versions.jpg
[6]: https://www.debugpoint.com/2022/03/gnome-42-release/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-20.04-Vs-Ubuntu-22.04-Lock-and-Login-Screen-1024x431.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-20.04-Vs-Ubuntu-22.04-Lock-Screen-1024x408.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Difference-between-Ubuntu-20.04-and-Ubuntu-22.04-default-look-1024x421.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Activities-View-Difference-Ubuntu-20.04-and-22.04-1024x425.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/04/Application-View-Difference-Ubuntu-20.04-and-22.04-1024x420.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/04/Accent-Color-and-other-changes-1024x417.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/04/How-Accent-colour-change-impact-looks-in-Ubuntu-22.04-LTS.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/04/Files-Difference-Ubuntu-20.04-vs-22.04-1024x359.jpg
[15]: https://www.debugpoint.com/2022/04/ubuntu-budgie-22-04-lts/
[16]: https://www.debugpoint.com/wp-content/uploads/2022/04/New-Screenshot-tool-in-Ubuntu-22.04-LTS.jpg
[17]: https://www.debugpoint.com/wp-content/uploads/2022/04/Take-Screenshot-option-in-top-bar-menu.jpg
[18]: https://www.debugpoint.com/wp-content/uploads/2022/04/New-Multitasking-Panel-in-Settings.jpg
[19]: https://www.debugpoint.com/wp-content/uploads/2022/04/GNOME-Software-Home-page-difference-1024x416.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2022/04/GNOME-Software-Details-page-difference-1024x417.jpg
[21]: https://t.me/debugpoint
[22]: https://twitter.com/DebugPoint
[23]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[24]: https://facebook.com/DebugPoint
