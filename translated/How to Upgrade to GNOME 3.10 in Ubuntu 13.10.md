How to Upgrade to GNOME 3.10 in Ubuntu 13.10
================================================================================

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/header-bars.jpg)

**Ubuntu 13.10 在它的归档（archives是这么翻译吗？）中搭载可用的GNOME 3.8桌面。 尽管对于Unity这是一个可靠稳定以及有特色的替代品，但这个版本还是过时了。**

GNOME桌面的最新版本在2013年9月被发布了，随之而来的是一系列改进的功能、应用程序和可用性的调整。从对高分辨率屏幕的支持到应用窗口上全新的客户端美化，GNOME 3.10是一个引人注目的升级版本。

好消息是：假设你正在运行Ubuntu 13.10，拥有不错的网络连接和命令行功能（一语双关），那么你无需继续使用一个过时版本的GNOME。

### 在Ubuntu 13.10 上升级到GNOME 3.10 ###

为了那些关注点在我会重申的地方上的普通读者的利益（skim未翻译），你**需要运行Ubuntu 13.10来安装GNOME 3.10**.

首先，让我们添加GNOME 3 的PPA到Ubuntu的软件资源中。这个操作可以使用图形界面完成，但使用命令行会更容易归档一些。

打开一个新的*终端*窗口，键入下列命令，在被要求的时候输入你的用户密码：

    sudo add-apt-repository ppa:gnome3-team/gnome3-next && sudo apt-get update

添加完PPA和更新包列表后，我们就可以转向安装GNOME 3.10了。运行下列命令，当弹出提示时再次输入你的用户密码：
    
    sudo apt-get update && sudo apt-get install gnome-shell ubuntu-gnome-desktop

获取并安装所有必要的包和部件会花一点时间，所以请耐心一点。

在安装过程中，在终端可能会弹出一个提示，要求你选择一种显示管理器，默认使用的是“登录窗口”。

这个决定完全取决于你；UBuntu的Unity Greeter和**GNOME的显示管理器**都能让你很轻松地在桌面会话之间切换（如果你想保持在Unity界面或者另一个桌面将很方便），但仅仅只有GDM提供给GNOME特定的功能，譬如锁屏通知。

当你准备好你的选择后，使用上下键选择，然后敲击‘确认\返回’键以确认选择。安装便会继续进行。

### 增加额外的功能 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/gnome-music.jpg)

GNOME 3.10还有一些不错的新特性，应用-[包括GNOME天气，音乐盒地图][1] 以及其它各种各样的改变。
因为并不是所有的特性都足够稳定以致于可以被包含在我们之前添加的GNOME 3 PPA中，所以如果你想使用它们，就需要利用到一对额外的GNOME PPA。

现在-你需要意识到很重要的是-在这些仓库里的一些包据说已经有了稳定的发行版。它们中的大部分是次要的，譬如应用程序崩溃和损坏的特性。但对于更多主要的发行版来说，像使得GNOME完全崩溃是有可能的。

除开这个警告，在终端里打开一个新的选项卡，输入下列命令：

    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo add-apt-repository ppa:gnome3-team/gnome3
    sudo apt-get update && sudo apt-get dist-upgrade

为了添加一些之前提到的很酷的应用，运行这个命令：

    sudo apt-get install gnome-weather gnome-music gnome-maps cheese gnome-documents

这样之后，就搞定了！

你可能会想先注销然后重新登录（记得选择“GNOME”会话）以确保改动都已经正确生效了。

### 细小的差别 ###

如果你在不卸载Unity的情况下安装GNOME 3.10，那么有一些注意事项你需要记下来。

首先，你会发现**在系统设置里“Online Accounts”有两个入口**。其中，有key-themed（不知道怎么翻译）的图标是Unity版的，另一个有插件符号的是GNOME版的。

一些应用程序可能会要求你往Unity中添加账户（Shotwell, Gwibber, Empathy），有一些可能是要求往GNOME中添加(Evolution, Documents, Contacts)。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/online-accounts.jpg)

“通知”和“搜索”入口是GNOME指定的，它们让你挑选哪些应用程序和资源能够显示通知或出现在活动区。

### 卸载GNOME 3.10 ###

既然你已经尝试了GNOME 3.10，但不喜欢它。这时该怎么办？

假设我们使用一个叫做“PPA Purge”的命令行工具，那么移除GNOME 3.10 是一个相当简单的过程。这个工具可以在Ubuntu软件中心里找到，是目前为止自动移除或降级从PPA安装的包的最容易的方法。

- [Install PPA Purge from Ubuntu Software Center][2]

为了使用这个工具，我们需要返回终端然后键入下面命令，要留意任何出现在降级过程中的提示。
   
    sudo ppa-purge ppa:gnome3-team/gnome3-next

如果你也添加了其它可选的PPA，你也需要清楚它们：

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3

一旦完成，你应该在GNOME 3.8 桌面中离开（stock不知怎么翻译）。如果你不再想保留GNOME Shell了，你可以执行下列命令去卸载它：

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

最后，手动移除任何在降级之后可能残留的应用程序（譬如，Epiphany and GNOME Documents），然后重启。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/12/upgrade-gnome-3-10-ubuntu-13-10

译者：[KAyGuoWhu](https://github.com/KayGuoWhu) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2013/09/gnome-3-10-released-with-new-apps-experimental-wayland-support
[2]:apt:ppa-purge