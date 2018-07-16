如何在Ubuntu 14.04中默认关闭蓝牙
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Bluetooth_Ubuntu.jpeg)

我最近新买了一台Dell Inspiron 7437，我第一时间做的一些事情之一就是[让预装的Windows 8和Ubuntu 14.04双启动][1]。我旧的笔记本没有蓝牙，听起来很奇怪但事实就是这样。这就是我为何从来没有注意到**蓝牙总是在Ubuntu的每次启动时自动开启**。

从节能和安全目的来说这都不是件好事。而且，我几乎不使用蓝牙，所以我为何要让蓝牙默认启用？尽管在Ubuntu中只要一次点击就能关闭蓝牙，但每次登录都要这样重复地做一遍真是件令人泄气的任务。更简单的解决方案是**在Ubuntu启动的时候关闭蓝牙**。

在今天的帖子中，我将与您分享如何在每次启动是默认禁用蓝牙。

### 在Ubuntu 14.04中默认关闭蓝牙： ###

打开一个终端并使用以下命令来安装[gksu][2]（如果你还没有安装它的话）（译注：如果你已经有了gksu，那么可以使用它；如果还没有，也不想安装，那你使用sudo一样可以）。

    sudo apt-get install gksu

gksu是用来在以root权限运行程序时输入密码的程序。当你已经安装了gksu之后，使用下列命令：

    gksudo gedit /etc/rc.local

它会打开rc.local这个文件。只需在文件中的exit 0之前加入下列命令：

    rfkill block bluetooth

就这样，你的rc.local文件看起来就像这样：

![](http://itsfoss.com/wp-content/uploads/2014/05/rfkill_Bluetooth.png)

这就是全部步骤了。重新启动电脑，您应该能够看到蓝牙已经被禁用了。当然您需要使用它的时候可以从指示器面板的蓝牙标志打开它。

### 小说明： ###

这一小部分只是对我们做了什么进行简短的解释。您并不一定要阅读完这一部分。您可以直接跳到评论部分留下您的建议和感谢 :)

rc.local文件是用来记录在系统启动的时候运行的各种shell命令的。这些命令是用户定义的。在一个新的安装中，rc.local文件中没有任何命令。我们做的就是在这里面加入命令 **rfkill block bluetooth**。[rfkill][3]是一个用来查询各种开关，按钮和底层系统接口状态的工具。我们在rc.local中使用这个命令来在每次启动的时候软关闭（译注：与其对应的是硬关闭，指通过硬件开关来关闭）蓝牙。我希望这些能把原理解释的清楚一点。

--------------------------------------------------------------------------------

via: http://itsfoss.com/turn-off-bluetooth-by-default-in-ubuntu-14-04/

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]:https://wiki.gnome.org/action/show/Apps/Attic/gksu?action=show&redirect=gksu
[3]:http://wireless.kernel.org/en/users/Documentation/rfkill
