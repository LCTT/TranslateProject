如何在Linux Mint 16中正确安装Ubuntu One
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Ubuntu-One-Linux-Mint.jpg)

由于[Linux Mint][1]是基于 Ubuntu 的，所以我认为 Ubuntu One 应该是预装程序之一。不过我错了。我自行从 Software Manager 安装了 Ubuntu One，令我惊讶的是，它居然无法正常运行。在这篇教程中我们会告诉你**如何在 Linux Mint 16中安装 Ubuntu One** 以及如何正常运行它。

### 在Linux Mint 16 中安装 Ubuntu One: ###

当你通过 Software Manager 安装 Ubuntu One 客户端以后，你准备打开并配置它时，你甚至都无法在菜单搜索里面找到它。就像是完全没有安装过一样。但你查看 Software Manager，又显示它已经安装完成了。问题到底出在哪了？

问题的关键是 **Ubuntu One installer** 需要 **ubuntuone-control-panel-qt** 包。这个包没有安装，你的 Ubuntu One 的安装过程就无法运行。要解决这个问题，打开终端 (Ctrl+Alt+T)并运行下面的命令：

    sudo apt-get install ubuntuone-control-panel-qt

现在你在菜单里面搜索，你会发现 Ubuntu One 已经存在了。现在你可以配置账户，选择哪些同步和哪些不同步。现在你可能觉得你已经解决了所有的问题，这时你会发现 **Ubuntu One 指示器并没出现在面板上**。

### 在 Linux Mint 16 中安装 Ubuntu One indicator: ###

你可以通过添加以下的 PPA 在 Linux Mint 中获取 Ubuntu One indicator 程序：

    sudo add-apt-repository ppa:rye/ubuntuone-extras
    sudo apt-get update 
    sudo apt-get install indicator-ubuntuone

注销并重新登录后，你会看到这个指示器已经出现在面板中。与此同时，你的 Ubuntu One 也全部安装完成了。我希望这篇 **在 Linux Mint 中安装 Ubuntu One** 会对你有所帮助。欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntu-one-linux-mint-16/
 
译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxmint.com/
