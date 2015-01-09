如何在 Linux 中使用屏幕键盘
================================================================================

屏幕键盘可以作为实体键盘输入的替代方案。在某些时候，屏幕键盘显得非常需要。 比如， 你的键盘刚好坏了；你的机器太多，没有足够的键盘；你的机器没有多余的接口来连接键盘；你是个残疾人，打字有困难；或者你正在组建基于触摸屏的信息服务站。

屏幕键盘也可以作为一种防范实体键盘记录器的保护手段，键盘记录器会悄悄记录按键来获取密码等敏感信息。一些网上银行页面实际上会强制你使用屏幕键盘来增强交易的安全性。

在 linux 中有几个可用的开源键盘软件， 比如 [GOK (Gnome 的屏幕键盘)][1]，[kvkbd][2]，[onboard][3]，[Florence][4]。

我会在这个教程中集中讲解 Florence， 告诉你**如何用 Florence 设置一个屏幕键盘**。 Florence 有着布局方案灵活、输入法多样、自动隐藏等特性。作为教程的一部分，我也将会示范**如何只使用鼠标来操作 Ubuntu 桌面**。

### 在 Linux 中安装 Florence 屏幕键盘 ###

幸运的是，Florence 存在于大多数 Linux 发行版的基础仓库中。

在 Debian，Ubuntu 或者 Linux Mint 中：

    $ sudo apt-get install florence 

在 Fedora，CentOS 或者 RHEL (CentOS/RHEL 需要[EPEL 仓库][5]) 中：

    $ sudo yum install florence

在 Mandriva 或者 Mageia 中：

    $ sudo urpmi florence 

对于 Archlinux 用户，Florence 存在于 [AUR][6] 中。

### 配置和加载屏幕键盘 ###

当你安装好 Florence 之后，你只需要简单的输入以下命令就能加载屏幕键盘：

    $ florence

默认情况下，屏幕键盘总是在其他窗口的顶部，让你能够在任意活动的窗口上进行输入。

在键盘的左侧点击工具按键来改变 Florence 的默认配置。

![](https://farm4.staticflickr.com/3923/14873468448_216c794244_z.jpg)

在 Florence 的 "样式 (style)" 菜单中，你能够自定义键盘样式，启用/取消声音效果。

![](https://farm6.staticflickr.com/5563/14873470478_de81aac39b_o.png)

在“窗口 (window)”菜单中，你能够调整键盘背景透明度、按键不透明度，以及控制键盘比例、工具栏、尺寸和总是置顶等特性。如果你的桌面分辨率不是非常高，透明度调整就显得非常有用，因为屏幕键盘会挡住其他窗口。在这个例子中，我切换到透明键盘，并且设置不透明度为 50%。

![](https://farm6.staticflickr.com/5556/15060050245_1534127d1c_z.jpg)

在“行为 (behaviour)”菜单中，你能够改变输入方法。Florence 支持几种不同的输入法: 鼠标 (mouse)、触摸屏 (touch screen)、计时器 (timer) 和漫步 (ramble)。鼠标输入是默认输入法。最后的两种输入法不需要按鼠标键。 计时器输入通过将指针滞留在按键上一定时间来触发按键。漫步输入的原理跟**计时器**输入差不多，但是经过训练和灵巧使用，能够比**计时器**输入更加迅速。

![](https://farm4.staticflickr.com/3843/14873384900_82baef4c22_o.png)

在“布局 (layout)”菜单中，你能够改变键盘布局。比如，你能够扩展键盘布局来增加导航键，数字键和功能键。

![](https://farm6.staticflickr.com/5556/15057015461_e611b6ee25_z.jpg)

### 只使用鼠标来操作 Ubuntu 桌面

我将示范如何将 Florence 集成到 Ubuntu 桌面中，然后我们不需要实体键盘就能够进入桌面。这个教程使用 LightDM (Ubuntu 的默认显示管理器) 来进入 Ubuntu，其他桌面环境也能设置类似的环境。

初始设置时需要实体键盘，但是一旦设置完成，你只需要一个鼠标，而不是键盘。

当你启动 Ubuntu 桌面时，启动程序最后会停在显示管理器 (或者登录管理器) 的欢迎界面。在这个界面上你需要输入你的登录信息。默认的情况下，Ubuntu 桌面会使用 LightDM 显示管理器和 Unity 欢迎界面。如果没有实体键盘， 你就不能在登录界面输入用户名和密码。

为了能够在登录界面加载屏幕键盘，安装配备了屏幕键盘支持的 GTK+ 欢迎界面。

     $ sudo apt-get install lightdm-gtk-greeter 

然后用编辑器打开欢迎界面配置文件 (/etc/lightdm/lightdm-gtk-greeter.conf)，指定 Florence 作为屏幕键盘来使用。如果你愿意，你也能够使用 Ubuntu 的默认屏幕键盘 onboard 来代替 Florence。

     $ sudo vi /etc/lightdm/lightdm-gtk-greeter.conf 

----------

    [greeter]
    keyboard=florence --no-gnome --focus &

![](https://farm6.staticflickr.com/5554/15056999361_180dc724b2_z.jpg)

重启 Ubuntu 桌面，然后看看你是否能够在登录界面使用屏幕键盘。

启动之后当你看到 GTK+ 欢迎界面时, 点击右上角的人形符号。你会看到“使用屏幕键盘 (On Screen Keyboard)”菜单选项，如下：

![](https://farm6.staticflickr.com/5554/14873314399_e48bd6eb84_z.jpg)

点击这个选项，屏幕键盘就会在登录界面弹出。现在你应该能够用屏幕键盘来登录了。

![](https://farm6.staticflickr.com/5572/14873460568_02480cccb7_z.jpg)

对于 GDM2/GDM3 用户怎么在 GDM2/GDM3 界面上使用屏幕键盘，Florence 官方网页提供了 [文档 (documentation)][7]。

Ubuntu 桌面完全无键盘化的最后一步是让屏幕键盘在登录后自动启动，这样我们在登录后能够不使用实体键盘就操作桌面，为了做到这一点，创建以下桌面文件：

    $ mkdir -p ~/.config/autostart
    $ vi ~/.config/autostart/florence.desktop 

----------

    [Desktop Entry]
    Type=Application
    Name=Virtual Keyboard
    Comment=Auto-start virtual keyboard
    Exec=florence --no-gnome

这样可以让你在登录到桌面的时候就看到屏幕键盘。

![](https://farm4.staticflickr.com/3873/15037038376_f8359f3a65_z.jpg)

希望这个教程对你有用。与你所看到的一样，Florence 是非常强大的屏幕键盘，可以用于不同目的。请和我分享你使用屏幕键盘的经验。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/onscreen-virtual-keyboard-linux.html

作者：[Dan Nanni][a]
译者：[forsil](https://github.com/forsil)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://developer.gnome.org/gok/
[2]:http://homepage3.nifty.com/tsato/xvkbd/
[3]:https://launchpad.net/onboard
[4]:http://florence.sourceforge.net/
[5]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[6]:https://aur.archlinux.org/packages/florence/
[7]:http://florence.sourceforge.net/english/how-to.html