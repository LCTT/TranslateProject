5个让Cinnamon桌面环境完美运行在ubuntu上的方法
=======================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/des.jpg)

**Cinnamon桌面环境最新稳定版本发行了，[ubuntu用户可以去安装使用了][1]**

在已经安装好的基础上，我们可以做一些微调来拥有更棒的体验 。

你的Ubuntu如果没有安装Cinnamon，你可以参照我们[之前的文章进行安装][1]。

###更改Mint菜单图标###

Mint菜单图标是Cinnamon的特色之一，它给予用户一种简单、快速、熟悉的方式来搜索、打开、组织应用程序，默认情况下，菜单使用启动程序项中的Linux Mint Logo。既然你是在ubuntu系统下使用它，而不是Mint，为什么不使用ubuntu熟悉的橙色朋友圈logo来替换原有的菜单图标呢？

实现很简单：

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/min-menu.jpg)

想要将Cinnamon菜单图标改变为ubuntu风格的，只需点击applet，选择‘config‘，在设置窗口，就会出现‘Use
a custom icon‘，然后你就输入下面的路径来使用ubuntu logo了：

    /usr/share/icons/ubuntu-mono-dark/actions/24/package-supported.svg

你可以使用任何支持的图片类型，只需要在刚才的填写区域写入正确的图片路径，或者点击后面的方框来打开文件选择器，选择你要使用的图标。

###尝试Cinnamon主题###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/cinnamon-themes-zukitwo.jpg)

和GNOME Shell一样，Cinnamon也支持自定义主题，我所说的主题并不只是应用程序的GTK主题和简单的窗口装饰，而是将面板，菜单，程序等等结合为一个整体的视觉风格。

不用离开桌面就可以浏览、下载Cinnamon主题。打开Cinnamon Settings tool中的Appearance
pane，然后选择‘Online Themes‘。

下面是一些受欢迎的主题：

- [**Android Holo**][2] — Android 4.x style theme
- [**Zukitwo**][3] — Sleek, stylish and light
- [**Minty**][4] — Dark theme with bold green accents
- [**Metro**][5] — Based on the visual style of Windows 8.

###找出你最喜欢的布局###

Unity认为应用程序启动器永远只应该固定地待在屏幕的一侧，但是Cinnamon并不这样认为，它可以让你重新设计最符合你的桌面布局。

手动面板可以增加，编辑和移动，或选择三种预设的布局。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/traditional.jpg)

打开`Settings > Panel > Layout Options > Panel Layout`，然后下面这几个中选择：

- Traditional — 这是默认的布局，控制面板在屏幕的顶部
- Flipped ——和Traditional一样，控制面板在屏幕顶部
- Classic ——两个控制面板，一个在顶部，一个在底部

你需要注销或者重启Cinnamon才能生效。

###添加面板小程序###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/weather-applet.png)

Cinnamon和GNOE Shell一样具有可扩展性，丰富的社区插件和扩展程序提供了额外的特性和功能，比如天气，系统监测，窗口管理工具等，这些都可以被浏览，安装并能从桌面直接启动。

选择控制面板，右键点击要添加小程序，选择 ‘…Add Appls to the Panel‘，一些著名的小程序如下：

- [**Weather**][6] - does what it forecasts (ho ho)
- [**Stark Menu**][7] - Clone of the Windows 7 Start Menu
- [**Screenshot**][8] — Easy way to grab screenshots with delay

###改变日期的显示格式###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/applet.jpg)

Cinnamon的时间日期程序很方便，它可以让你很容易就记住日期

但是它显示时间的默认格式是24小时制，但是我们很容易就能调整时钟格式

右击然后选择‘Configure‘，在设置窗口中出现“Use a custom date
format“的选择框上打勾，或者使用下面的几种格式（复制粘帖粗体字段）

- **%B %e, %I:%M %p** (July 13, 7:19 PM)
- **%m/%d/%Y** (07/13/2014)
- **%l:%M %p** (7:19 PM)

改变立马生效，如果中途发生了错误，你可以取消自定义时间格式选项恢复到默认状态

###更多###

在Cinnamon桌面环境中只有少部分定制选择供使用者使用，但是我们认为上述所讲的调整是不断探索的很好跳板，通过下面的评论栏让我们了解你最喜欢的调整是什么吧，你可以通过Facebook或者Google+

----------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/07/5-things-installing-cinnamon-ubuntu

译者：[su-kaiyao](https://github.com/su-kaiyao) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/07/new-cinnamon-ubuntu-14-04-ppa-stable
[2]:http://cinnamon-spices.linuxmint.com/themes/view/122
[3]:http://cinnamon-spices.linuxmint.com/themes/view/219
[4]:http://cinnamon-spices.linuxmint.com/themes/view/25
[5]:http://cinnamon-spices.linuxmint.com/themes/view/188
[6]:http://cinnamon-spices.linuxmint.com/applets/view/17
[7]:http://cinnamon-spices.linuxmint.com/applets/view/168
[8]:http://cinnamon-spices.linuxmint.com/applets/view/35
