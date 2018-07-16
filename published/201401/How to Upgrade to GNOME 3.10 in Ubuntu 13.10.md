如何在Ubuntu 13.10中升级GNOME 到 3.10?
================================================================================

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/header-bars.jpg)

**Ubuntu 13.10 中配备了GNOME 3.8桌面。 尽管它相比Unity是一个可靠稳定以及有特色的替代品，但这个版本还是过时了。**

GNOME桌面的最新版本在2013年9月发布，随之而来的是一系列改进的功能、应用程序和可用性的调整。从对高分辨率屏幕的支持到客户端应用窗口上的美化，GNOME 3.10无疑是一个引人注目的升级版本。

好消息是：假设你正在运行Ubuntu 13.10，拥有不错的网络操作和命令行水平，那么你无需继续使用一个过时版本的GNOME。

### 在Ubuntu 13.10 上如何升级到GNOME 3.10 ###

为了那些爱略过前言直奔主题的读者，我还要重申两点: 

**要使用本方法安装GNOME 3.10，需运行 Ubuntu 13.10版本。**

**GNOME 3.10还未在 Ubuntu 13.10上测试，所以升级风险自负。**

首先，让我们添加GNOME 3 的PPA到Ubuntu的软件资源中。这个操作可以使用图形界面完成，但使用命令更容易一些。

打开一个新的*终端*窗口，键入下列命令，在需要时输入你的用户密码：

    sudo add-apt-repository ppa:gnome3-team/gnome3-next && sudo apt-get update

添加完PPA并更新包列表后，我们就可以继续，开始安装GNOME 3.10了。运行下列命令，当弹出提示时再次输入你的用户密码：
  
    sudo apt-get update && sudo apt-get install gnome-shell ubuntu-gnome-desktop

获取并安装所有必要的包和组件会花一点时间，所以请耐心一点。

在安装过程中，在终端将会弹出一个提示，要求你选择一种显示管理器，默认使用的是“登录窗口”。

这个决定完全取决于你；UBuntu的Unity Greeter和**GNOME的显示管理器**都能让你很轻松地在桌面会话之间切换（如果你想保持在Unity界面或者另一个桌面将很方便），但仅仅只有GDM提供给GNOME特定的功能，譬如锁屏通知。

当你确定选择后，使用上下键选择，然后敲击‘确认/返回’键以确认。安装便会继续进行。

### 增加额外的功能 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/gnome-music.jpg)

GNOME 3.10还有一些不错的新特性和应用-[包括GNOME天气，音乐盒及地图][1] 以及其它各种各样的改变。因为并不是所有的特性都足够稳定以致于可以被包含在我们之前添加的GNOME 3 PPA中，所以如果你想使用它们，就需要利用到两个额外的GNOME PPA。

现在，你需要意识到很重要的是，在这些仓库里的一些包据说有稳定性问题。这些问题大多是小问题，譬如应用程序崩溃和损坏。但还是有潜在的可能，导致像使GNOME完全崩溃这样的重大问题。

除开这个警告不说，在终端里打开一个新的选项卡，输入下列命令：

    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo add-apt-repository ppa:gnome3-team/gnome3
    sudo apt-get update && sudo apt-get dist-upgrade

为了添加一些之前提到的很酷的应用，运行这个命令：

    sudo apt-get install gnome-weather gnome-music gnome-maps cheese gnome-documents

这样之后，就搞定了！

你可能会想先注销然后重新登录（记得选择“GNOME”会话）以确保改动都已经正确生效了。

### 细小的差别 ###

如果你在不卸载Unity的情况下安装GNOME 3.10，那么有一些注意事项。

首先，你会发现**在系统设置里“Online Accounts”有两个入口**。其中，有钥匙图标的是Unity版的，另一个有插孔符号的是GNOME版的。

一些应用程序可能会要求你往Unity中添加账户（Shotwell, Gwibber, Empathy），有一些可能是要求往GNOME中添加(Evolution, Documents, Contacts)。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/online-accounts.jpg)

“通知”和“搜索”入口是GNOME专有的，它们让你挑选哪些应用程序和资源能够显示通知或出现在活动区。

### 卸载GNOME 3.10 ###

假如你已经尝试了GNOME 3.10，但不喜欢它。这时该怎么办？

使用一个叫做“PPA Purge”的命令行工具，移除GNOME 3.10 是一个相当简单的过程。这个工具可以在Ubuntu软件中心里找到，是目前为止自动移除或降级从PPA安装的包的最容易的方法。

- [从Ubuntu软件中心安装PPA Purge][2]

为了使用这个工具，我们需要返回终端然后键入下面命令，要留意任何出现在降级过程中的提示。
  
    sudo ppa-purge ppa:gnome3-team/gnome3-next

如果你也添加了其它可选的PPA，你也需要清除它们：

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3

完成后，你就剩下了原来的 GNOME 3.8 桌面。如果你不再想保留GNOME Shell了，你可以执行下列命令去卸载它：

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

最后，手动移除任何在降级之后可能残留的应用程序（譬如，Epiphany and GNOME Documents），然后重启。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/12/upgrade-gnome-3-10-ubuntu-13-10

译者：[KAyGuoWhu](https://github.com/KayGuoWhu) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2013/09/gnome-3-10-released-with-new-apps-experimental-wayland-support
[2]:apt:ppa-purge