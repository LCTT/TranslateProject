如何给任意一款 Linux 发行版添加漂亮的字体
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Add-Beautiful-Fonts-to-Any-Linux-Distribution-434835-2.jpg)

**接下来的教程将指导所有 Linux 用户怎么简单的将漂亮的字体添加到自己的操作系统。我们已经为 Debian、Arch Linux、openSUSE、Slackware 和 Fedora 发行版编写了详细的介绍。**

正如许多用户所知，几乎所有基于 Linux 的操作系统主要缺点就是默认选择的字体并不令终端用户满意，尤其是那些从 Windows 或者 Mac OS X 等操作系统迁移过来的用户。

除了使用自己的一套字体的Ubuntu，从一开始就看起来就相当漂亮，其它所有 Linux 发行版都有字体丑陋的缺点。正因如此，许多用户试图创建一种新的方法来增强文字在各个发行版中渲染效果。

这就是 Infinality 项目产生的原因，其主要目的是通过添加补丁来为使用任何基于 Linux 操作系统的用户提供最好的字体渲染效果。

### Infinality for Arch Linux ###

1. 将infinality-bundle，infinality-bundle-multilib （用于使用64位系统的用户）和infinality-bundle-fonts仓库添加到你的 /etc/pacman.conf文件中：
 
    	[infinality-bundle]
    	Server = http://bohoomil.com/repo/$arch

    	[infinality-bundle-multilib]
   	 	Server = http://bohoomil.com/repo/multilib/$arch

    	[infinality-bundle-fonts]
    	Server = http://bohoomil.com/repo/fonts

2. 执行 sudo pacman -Syu 命令用来刷新仓库，然后运行 

    	sudo pacman -S infinality-bundle infinality-bundle-multilib ibfonts-meta-extended （用于64位系统） 

		sudo pacman -S infinality-bundle ibfonts-meta-extended （用于32位系统）


3. 当被询问是否替换 fontconfig 软件包的 freetype2 时，回答YES。完成后重启你的计算机。

### Infinality for Fedora ### 

1. 在终端窗口中执行如下命令

    	sudo rpm -Uvh http://www.infinality.net/fedora/linux/infinality-repo-1.0-1.noarch.rpm
    	sudo yum install freetype-infinality fontconfig-infinality

2. 重启你的机器。

### Infinality for openSUSE ###

1. 添加 Infinality 官方仓库：


		http://download.opensuse.org/repositories/home:/namtrac:/subpixel/openSUSE_13.1/
打开YaST中的库选项卡，选择namtrac:subpixel仓库，并打击“切换系统包的版本到这个仓库”。

2. 标记 namtrac:subpixel 中所有还没有安装的包来进行安装，然后从 openSUSE 官方软件仓库中安装 fontconfig-infinality 包。

3. 在字体设置选项里将 Subpixel Hinting 选择为“使用系统设置”，或者设置为带有微调的 RGB 顺序。重启你的系统。

### Infinality for Slackware ###

详细的安装指南：[http://someslack.wordpress.com/infinality-on-slackware/][1]

### Infinality for Debian ###

1. 在终端中执行下面的命令（一个一个执行，每一行之后敲击回车）：

    	echo “deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu raring main” | sudo tee /etc/apt/sources.list.d/infinality.list
    	echo “deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu raring main” | sudo tee -a /etc/apt/sources.list.d/infinality.list
    	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B

2. 执行以下命令来升级你的系统并安装 Infinality 包：

    	sudo apt-get update
   	 	sudo apt-get upgrade
    	sudo apt-get install fontconfig-infinality

3. 重启你的计算机。

对于任何文中没有提到的其它 Linux 发行版，请使用官方的介绍：[https://github.com/Infinality/fontconfig-infinality/tree/master/infinality][2]。跟以往一样，当你使用本教程过程中遇到任何问题都可以在下面评论，不要犹豫。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Add-Beautiful-Fonts-to-Any-Linux-Distribution-434835.shtml

译者：[SCUSJS](https://github.com/scusjs) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://someslack.wordpress.com/infinality-on-slackware/
[2]:https://github.com/Infinality/fontconfig-infinality/tree/master/infinality
