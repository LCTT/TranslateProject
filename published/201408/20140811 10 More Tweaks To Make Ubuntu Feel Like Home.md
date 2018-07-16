10个调整让Ubuntu宾至如归
================================================================================
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/08/ubuntu-home-840x420.jpg?15f1a2)

不久前我提供给大家[12个调整Ubuntu的小建议][1]。 然而，已经是一段时间以前的事情了，现在我们又提出了另外10个建议，能够使你的Ubuntu宾至如归。

这10个建议执行起来十分简单方便，那就让我们开始吧！

### 1. 安装 TLP ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/01/tlp_stat.jpg?15f1a2)

[我们不久前涉及到了TLP][2], 这是一款优化电源设置的软件，可以让你享受更长的电池寿命。之前我们深入的探讨过TLP， 并且我们也在列表中提到这软件真不错。要安装它，在终端运行以下命令：

    sudo add-apt-repository -y ppa:linrunner/tlp && sudo apt-get update && sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-tools && sudo tlp start

上面的命令将添加必要的仓库，更新包的列表以便它能包含被新仓库提供的包，安装TLP并且开启这个服务。

### 2. 系统负载指示器 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_systemload.jpg?15f1a2)

给你的Ubuntu桌面添加一个系统负载指示器能让你快速了解到你的系统资源占用率。 如果你不想在桌面上添加这个技术图表，那么可以不要添加， 但是对于那些对它感兴趣的人来说，这个扩展真是很好。 你可以运行这个命令去安装它：

    sudo apt-get install indicator-multiload

然后在Dash里面找到它并且打开。 

### 3. 天气指示器 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_weatherind.jpg?15f1a2)

Ubuntu过去提供内置的天气指示器，但是自从它切换到Gnome 3以后，就不再默认提供了。你需要安装一个独立的指示器来代替。 你可以通过以下命令安装它：

    sudo add-apt-repository -y ppa:atareao/atareao && sudo apt-get update && sudo apt-get install -y my-weather-indicator

这将添加另外一个仓库，更新包的列表，并且安装这个指示器。然后在Dash里面找到并开启它。

### 4. 安装 Dropbox 或其他云存储解决方案 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/Dropbox-2.png?15f1a2)

我在我所有的Linux系统里面都安装过的一个软件，那就是Dropbox。没有它，真的就找不到家的感觉，主要是因为我所有经常使用的文件都储存在Dropbox中。安装Dropbox非常直截了当，但是要花点时间执行一个简单的命令。 在开始之前，为了你能在系统托盘里看到Dropbox的图标，你需要运行这个命令：

    sudo apt-get install libappindicator1

然后你需要去Dropbox的下载页面，接着安装你已下载的.deb文件。现在你的Dropbox应该已经运行了。

如果你有点讨厌Dropbox, 你也可以尝试使用Copy [或者OneDrive][3]。两者提供更多免费存储空间，这是考虑使用它们的很大一个原因。比起OneDrive我更推荐使用Copy，因为Copy能工作在所有的Linux发行版上。

### 5. 安装Pidgin和Skype ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/12/skype_linux_conversation.jpg?15f1a2)

和朋友们保持联系特别好，并且如果你使用即时通讯，那么你很幸运。 Pidgin和Skype在Linux都十分出色，它们都能连接所有主要网络。安装Pidgin就像运行这个命令一样简单：

    sudo apt-get install pidgin

安装Skype也很简单 — 你仅仅需要去Skype的下载页面并且下载你Ubuntu12.04对应架构的.deb文件就可以了。

### 6. 移除键盘指示器 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_keyboard_indicator.jpg?15f1a2)

在桌面上显示键盘指示器可能让一些人很苦恼。对于讲英语的人来说，它仅仅显示一个“EN”，这可能是恼人的，因为很多人不需要改变键盘布局或者被提醒他们正在使用英语。要移除这个指示器，选择系统设置，然后文本输入，接着去掉“在菜单栏显示当前输入源”的勾。
（译注:国人可能并不适合这个建议。）

### 7. 回归传统菜单###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_classicmenu.jpg?15f1a2)

在Ubuntu切换到Unity之前，它使用Gnome 2 作为默认的桌面环境。 这包含一个简单的菜单去访问已安装的应用，菜单包含的很多分类，比如： 游戏，办公， 互联网，等等。 你可以用另外一个简单的包找回这个“传统菜单” 。要安装它，运行这个命令：

    sudo add-apt-repository -y ppa:diesch/testing && sudo apt-get update && sudo apt-get install -y classicmenu-indicator

### 8. 安装Flash和Java ###

在之前的文章中我提到了安装解码器和Silverlight，我应该也提到了Flash和Java是它们所需要的主要插件，虽然有时可能它们可能被遗忘。要安装它们只需运行这个命令：

    sudo add-apt-repository -y ppa:webupd8team/java && sudo apt-get update && sudo apt-get install oracle-java7-installer flashplugin-installer

安装Java需要新增仓库，因为Ubuntu不再包含它的专利版本（大多数人为了最好的性能推荐使用这个版本），而是使用开源的OpenJDK。

### 9. 安装VLC ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweaks_vlc.jpg?15f1a2)

默认的媒体播放器Totem十分优秀但是它依赖很多独立安装的解码器才能很好的工作。我个人推荐你安装VLC媒体播放器， 因为它包含所有解码器并且实际上它支持世界上每一种媒体格式。要安装它，仅仅需要运行如下命令：

    sudo apt-get install vlc

### 10. 安装PuTTY (或者不) ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweaks_putty.jpg?15f1a2)

最近，如果你出于SSH的需要而使用PuTTY，你有两个选择：为Linux安装PuTTY，或者直接使用终端。如果你想使用终端安装PuTTY，需要用到这个命令： 

    sudo apt-get install putty

然而，并不需要直接安装它，因为你可以使用这个命令来连接任何远程主机。

    ssh username@this.domain.here

用你想要连接的用户名来替换掉“username”，然后用主机的直接域名或者IP地址替换掉“this.domain.here” 都可以。

### 你推荐如何调整？ ###

补充了这10个调整，你应该感觉你的Ubuntu真的有家的感觉，这很容易建立起或击溃你的Linux体验。有许多不同的方式去定制你自己的体验去让它更适合你的需要；你只需自己寻找来发现你想要的东西。

**您有什么其它的调整和建议想和读者分享？**在评论中告诉我们吧！

*图片致谢: Home doormat Via Shutterstock*

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/10-tweaks-make-ubuntu-feel-like-home/

作者：[Danny Stieben][a]
译者：[guodongxiaren](https://github.com/guodongxiaren)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.makeuseof.com/tag/author/danny/
[1]:http://www.makeuseof.com/tag/11-tweaks-perform-ubuntu-installation/
[2]:http://www.makeuseof.com/tag/easily-increase-battery-life-tlp-linux/
[3]:http://www.makeuseof.com/tag/synchronize-files-ubuntu-onedrive/
