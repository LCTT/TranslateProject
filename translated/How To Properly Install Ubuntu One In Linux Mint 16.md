在Linux Mint 16中如何正确安装Ubuntu One
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Ubuntu-One-Linux-Mint.jpg)

[Linux Mint][1]是基于Ubuntu的，所以我认为Ubuntu One应该是预装程序之一。不过我错了。所以我自行从 Software Manager安装Ubuntu One，但是令人震惊的是，居然无法正常运行。在这篇教程里我们会告诉你**在Linux Mint 16中如何安装Ubuntu One**以及如何正常运行它。

### 在Linux Mint 16中安装Ubuntu One: ###

当你通过Software Manager安装Ubuntu One以后，你准备打开并配置它时，你甚至都无法在菜单搜索里面找到它。就像是它完全没有安装过一样。但你查看Software Manager，又显示它已经安装完成了。问题到底出在哪了？

问题的关键是**Ubuntu One installer**已经转交**ubuntuone-control-panel-qt**包了。这个包没有安装，你的Ubuntu One就无法运行。要解决这个问题，打开terminal (Ctrl+Alt+T)并运行下面的命令：

    sudo apt-get install ubuntuone-control-panel-qt

现在你在菜单里面搜索，你会发现Ubuntu One已经存在了。现在你可以配置账户，进行同步。现在你可能觉得你已经解决了所有的问题了，但事实上**Ubuntu One indicator并没出现在面板上**。

### 在Linux Mint 16中安装Ubuntu One indicator: ###

你可以通过添加以下的PPA来获取Ubuntu One indicator程序：

    sudo add-apt-repository ppa:rye/ubuntuone-extras
    sudo apt-get update 
    sudo apt-get install indicator-ubuntuone

注销并重新登录后，你会看到indicator出现在面板中。与此同时，你的Ubuntu One也全部安装完成了。我希望这篇**在Linux Mint中安装Ubuntu One**对你有所帮助。欢迎提出你的问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntu-one-linux-mint-16/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxmint.com/
