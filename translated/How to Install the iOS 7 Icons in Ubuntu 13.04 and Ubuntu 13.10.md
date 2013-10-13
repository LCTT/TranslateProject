如何在Ubuntu中用上iOS 7的图标
================================================================================
**这个简单的教程，将会教你，如何在你的Ubuntu（12.04、13.04、13.10）上使用高端大气上档次的苹果iOS 7系统新图标。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-the-iOS-7-Icons-in-Ubuntu-13-04-and-Ubuntu-13-10-387709-2.jpg)

上面是效果图，安装完的图标虽然看起来有些不像。但是对于Ubuntu的每一次发行版都使用相同的图标来说，这已经让我们的审美得到升华了。


以前在Ubuntu安装主题、图标甚至是鼠标光标，那叫一个麻烦，但是近几年这事变得容易多了。想要安装新的图标，只需要输入几条命令就行。


在开始之前，请注意一下。本文使用的PPA(Personal Package Archives)只能在Ubuntu 12.04上运行。这是因为，在复制iOS的图标时候是在Ubuntu 12.04版本上建立的。

当然，正如开始提到的，这些图标可以在Ubuntu 13.04 和 Ubuntu 13.10上使用，只是需要改变一点小小的操作。

除此之外，你需要一个小软件使这些图标生效。我们推荐使用GNOME Tweak Tool，当然你也可以根据自己的习惯选择。

下面教程开始：

打开终端，安装GNOME Tweak Tool：

    sudo apt-get install gnome-tweak-tool

你会发现这个软件在Ubuntu下是以Tweak Tool命名的。

安装PPA，然后更新一下：

    sudo add-apt-repository ppa:elementary-br/projects
    sudo apt-get update

Ubuntu 12.04安装iOS图标：

    sudo apt-get install ieos7-icons

Ubuntu 13.04、Ubuntu 13.10安iOS装图标：

    wget -c https://launchpad.net/~elementary-br/+archive/projects/+files/ieos7-icons_0.1-0~13~ubuntu12.04.1_all.deb
    sudo dpkg -i ieos7-icons_0.1-0~13~ubuntu12.04.1_all.deb

	如果你发现deb包安装失败，无论什么原因，只需要运行：

		sudo apt-get install -f

	修复完依赖关系，再次运行：

		sudo dpkg -i ieos7-icons_0.1-0~13~ubuntu12.04.1_all.deb


这个图标集大概有300个，所以有些应用程序的图标还是老样子。

享受你的新图标吧！
--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-the-iOS-7-Icons-in-Ubuntu-13-04-and-Ubuntu-13-10-387709.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Vic___](https://github.com/vic020) 校对：[校对者ID](https://github.com/校对者ID)