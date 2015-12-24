动态壁纸给linux发行版添加活力背景
================================================================================
**我们知道你想拥有一个有格调的ubuntu桌面来炫耀一下 ：）**

![Live Wallpaper](http://i.imgur.com/9JIUw5p.gif)

*Live Wallpaper*

在linxu上费一点点劲搭建一个出色的工作环境是很简单的。今天，我们（[重新][2]）着重来探讨长驻你脑海中那些东西 ：一款自由，开源，能够给你的截图增添光彩的工具。

它叫 **Live Wallpaper** (正如你猜的那样) ，它用由OpenGL驱动的一款动态桌面背景来代替标准的静态桌面背景。

最好的一点是：在ubuntu上安装它很容易。

### 动态壁纸主题 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/animated-wallpaper-ubuntu-750x383.jpg)

Live Wallpaper 不是此类软件唯一的一款，但它是最好的一款之一。

它附带很多不同的开箱即用的主题。

从精细的(‘noise’)到狂热的 (‘nexus’)，包罗万象，甚至有受到Ubuntu Phone欢迎屏幕启发的obligatory锁屏壁纸。

- Circles — 带着‘evolving circle’风格的时钟，灵感来自于Ubuntu Phone
- Galaxy — 支持自定义大小，位置的旋转星系
- Gradient Clock — 放在倾斜面上的polar时钟
- Nexus — 亮色粒子火花穿越屏幕
- Noise — 类似于iOS动态壁纸的Bokeh设计
- Photoslide — 由文件夹（默认为 ~/Photos）内照片构成的动态网格相册

Live Wallpaper **完全开源**，所以没有什么能够阻挡天马行空的艺术家们用诀窍（当然还有耐心）来创造他们自己的精美主题。

### 设置 & 特点 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/live-wallpaper-gui-settings.jpg)

虽然某些主题与其它主题相比有更多的选项，但每款主题都可以通过某些方式来配置或者定制。

例如，Nexus主题中 (上图所示) 你可以更改脉冲粒子的数量，颜色，大小和出现频率。

首选项提供了 **通用选项** 适用于所有主题，包括:

- 设置登录界面的动态壁纸
- 自定义动画背景
- 调节 FPS (包括在屏幕上显示FPS)
- 指定多显示器的行为

有如此多的选项，diy适用于你自己的桌面背景是很容易的。

### 缺陷 ###

#### 没有桌面图标 ####

Live Wallpaper在运行时，你无法在桌面添加，打开或者是编辑文件和文件夹。

首选项程序提供了一个选项来让你这样做（只是猜测）。也许是它只能在老版本中使用，在我们的测试中－测试环境为Ununtu 14.10，它不工作。但在测试中发现当把桌面壁纸设置成格式为png的图片文件时，这个选项有用，不需要是透明的png图片文件，只要是png图片文件就行了。

#### 资源占用 ####

动态壁纸与标准的壁纸相比要消耗更多的系统资源。

我们并不是说任何时候都会消耗大量资源，但至少在我们的测试中是这样，所以低配置机器和笔记本用户要谨慎使用这款软件。可以使用 [系统监视器][2] 来追踪CPU 和GPU的负载。

#### 退出程序 ####

对我来说最大的“bug”绝对是没有“退出”选项。

当然，动态壁纸可以通过托盘图标和首选项完全退出，那退出托盘图标呢？没办法。只能在终端执行命令‘pkill livewallpaper’。

### 怎么在 Ubuntu 14.04 LTS+ 上安装 Live Wallpaper ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/terminal-command-750x146.jpg)

要想在Ubuntu 14.04 LTS 和更高版本中安装 Live Wallpaper，你首先需要把官方PPA添加进你的软件源。
最快的方法是在终端中执行下列命令:

    sudo add-apt-repository ppa:fyrmir/livewallpaper-daily

    sudo apt-get update && sudo apt-get install livewallpaper

你还需要安装 indicator applet，这样可以方便快速的打开或是关闭动态壁纸，从菜单选择主题，另外图形配置工具可以让你基于你自己的口味来配置每款主题。

    sudo apt-get install livewallpaper-config livewallpaper-indicator

所有都安装好之后你就可以通过Unity Dash来启动它和它的首选项工具了。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/05/live-wallpaper-app-launcher.png)

让人不爽的是，安装完成后，程序不会自动打开托盘图标，而仅仅将它自己加入自动启动项，所以，快速来个注销 -> 登陆它就会出现啦。

### 总结 ###

如果你正处在无聊呆板的桌面中，幻想有一个更有活力的生活，不妨试试。另外，告诉我们你想看到什么样的动态壁纸！

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/05/animated-wallpaper-adds-live-backgrounds-to-linux-distros

作者：[Joey-Elijah Sneddon][a]
译者：[Love-xuan](https://github.com/Love-xuan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2012/11/live-wallpaper-for-ubuntu
[2]:http://www.omgubuntu.co.uk/2011/11/5-system-monitoring-tools-for-ubuntu
