怎样在ubuntu 14.04上安装轻量级的Budgie桌面
================================================================================
**如果你在推特上关注了我们，你可能看见了我们最近分享的一张截图，和这张截图一起的还有对它所展示的桌面进行命名的邀请。 **

你猜对了吗?  答案就是budgie ——  一种为基于openSUSE 的linux发行版Evolve OS所设计，但不仅仅只能用于 Evolve OS的简易桌面环境。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/BsCvTxJIcAAPjUR.png-large.png)

我们第一次描写Budgie是在三月份，当时我们被它的整洁，小巧的美感，灵活的架构，还有重复使用在当今大多数发行版中所使用的GNOME 3.10 成熟技术中的公共部分和标堆栈的决定所折服。

我对此项目的领导者LKey Doherty所作出的开发选择非常佩服。无可否认另起炉灶有它的优点，但决定从上游的项目获取帮助将可以整个项目进展得更快，无论是在发展方面（更轻的技术负担）还是在用户可使用方面（更容易在其它发行版上运行）。

政治因素选择除外，这款桌面以干净，小巧向谷歌Chrome OS的Ash桌面表示敬意。如果你不介意有些许粗糙的边缘，那它值得你玩玩。那么怎样在Ubuntu安装Budgie呢？

###非官方的PPA是不正式的 ###

开源意味着如果你有一点终端使用知识的话，你就可以在获得Budgie桌面的源代码后进行编译，然后运行。

但如果你很懒，想不费周折就在Ubuntu 14.04 LTS（或者一个基于它的发行版）运行Budgie，那么你可以通过比较容易的途径来实现。

添加一个非官方的Unofficial PPA，刷新你的软件源然后进行安装。几分钟后在这个家庭中你将有一位名叫Bob的新叔叔，并且有一个新的桌面可以玩耍。

###添加Budgie PPA ###

将以下命令复制进一个打开的终端窗口，在提示过后输入你的密码（如果需要的话）

    sudo add-apt-repository ppa:sukso96100/budgie-desktop
    sudo apt-get update && sudo apt-get install budgie-desktop

### 登入Budgie会话 ###

安装完成后你就可以在Unity欢迎界面的会话选择器中选择Budgie会话了。（别忘了以后要把选择项改回到稳定的桌面环境）

### 注意 ###

**budgie是不稳定，不完善的，它在Ubuntu上也没有被正式支持。它正在积极开发中，缺少一些特性，包括(但不仅仅只有这些）:不支持网络管理，没有音量控制小程序（键盘工作良好），没有通知系统，无法将应用程序“固定”在任务栏。**

它对UBUNTU的叠加滚动条和一些GTK主题的支持也不是很好，而且在使用upstart的发行版（例如ubuntu，即使它正在改变之中）中会话管理器（例如，注销，重启等等）将无法工作。 

一个应变方法是：禁用叠加滚动条，设置一个默认主题，通过在终端中使用以下命名来退出会话。

    gnome-session-quit

想着脑海中所有的这些警告，我建议想使用稳定的，可靠的系统的人现在暂时不要使用它。

而作为狂热一族的业余体验呢？请在下面评论，让我们了解你的想法。我将退出而让Bob来接手。
--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/07/install-budgie-evolve-os-desktop-ubuntu-14-04

译者：[Love-xuan](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/03/budgie-desktop-chrome-os-like
[2]:http://en.wikipedia.org/wiki/Bob
[3]:http://www.omgubuntu.co.uk/2014/02/ubuntu-debian-switching-systemd