sevenot translated
Install Google’s Material Design Inspired GTK And Icon Theme Paper in Linux
来试试谷歌全新的设计语言Material Design和Linux下的图标主题Paper吧！灵感来源于图形工具包GTK。
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Paper_theme_Material_Design.jpg)

[Paper][1] is a new upcoming GTK and icon theme inspired by Google’s [Material design][2] guidelines. It is developed by Sam Hewitt, the man behind [Moka Project][3]. Moka has always been in the list of [best themes for Ubuntu][4] and looking at Paper, I can say that once it is developed completely, it will surely be listed as one of the [best GTK themes][5].
Paper是一款即将与广大朋友们见面的一个图形工具包和图标主题，它的设计灵感来自于谷歌的设计语言Material design。Paper由Sam Hewitt发起，Sam是Moka项目的一员，Moka总会设计出让人满意的Ubuntu主题。对于Paper，我敢说只要它一经推出，它必将是最好的主题开发包之一。

Yes, you heard it right. The theme is still under development. Therefore I suggest that if you want to install Paper theme in Ubuntu or any other Linux distributions, do it only for experimentation purpose. You may see some broken icons here and there but the over all experience is nice.
对的，你没有听错，Paper主题还在开发阶段。因此我建议，如果你想在你的Ubuntu或者它的衍生版本上安装Paper，最好抱着试一试的实验心态。因为你多多少少会发现一些破损的图标，但这并不影响整个实验的运行。

### Install Paper theme in Ubuntu based distributions via PPA ###
通过PPA在Ubuntu及其衍生版本上安装Paper主题
Sam has a dedicated PPA for Ubuntu based distributions. I recommend that you use this PPA instead of downloading the theme because you’ll be getting the updates on the themes regularly. This PPA is available for Ubuntu 15.04, Ubuntu 14.10, Ubuntu 14.04, Elementary OS Freya, Elementary OS Luna, Linux Mint 17, Linux Mint 16 and other Linux distributions based on Ubuntu.
Sam为Ubuntu和它的衍生版本设置了一个专用的PPA(PresonalPackgeArchives,个人软件包档案)。我会介绍通过PPA安装而不是下载Paper主题，因为你将会定期更新主题。这个PPA可供使用的系统有Ubuntu 15.04, Ubuntu 14.10, Ubuntu 14.04, Elementary OS Freya, Elementary OS Luna, Linux Mint 17, Linux Mint 16 和其它的Ubuntu衍生版本。

Open a terminal and use the following commands:
打开终端，输入下列命令：
    sudo add-apt-repository ppa:snwh/pulp
    sudo apt-get update
    sudo apt-get install paper-gtk-theme paper-icon-theme

### Download Paper GTK and icon theme ###
下载Paper图形工具包和图标主题

If you do not want to use the PPA, you can download the themes and icons manually. As I said previously, you won’t get the updates automatically this way.
如果你不想用PPA，你可以手动下载主题和图标。但是就像刚才所说，这样你就无法自动更新。

- [Download Paper icon themes][6]
- [Download Paper GTK themes][7]
下载Paper图标主题
下载Paper的GTK工具包
#### Using Paper themes and icons ####
把它们用起来吧
I hope that you know how to change or install themes in your respective Linux distributions. If you are not unaware of it, below are few tutorials that could help you to install new themes:
我希望你知道怎么在你的Ubuntu中安装或者更改主题。如果你不知道，下面几个教程将帮助你安装一个新的主题。
- [How to change themes in Ubuntu Unity][8]
- [How to change themes in GNOME Shell][9]
- [How to change themes in Linux Mint][10]
- [How to change theme in Elementary OS Freya][11]
如何在标准Ubuntu中更改主题
如何在GNOME桌面的Ubuntu中更改主题
如何在Ubuntu Mint中更改主题
如何在Elementary OS Freya中更改主题

#### Here is what Paper theme looks like ####
就是这样！

Since I am using [Elementary OS Freya][12] these days, here are some of the screenshots of how Paper theme and icons look like in Elementary OS Freya. I have used a wallpaper with Material design look so that it blends well with the icon and themes.
自从我开始用Elementary OS Freya以来，这里就存有一些Paper主题和图标的截图。我用了Material Design做了一个桌面，这样可以更好的兼容主题和图标。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Material_Design_Paper_Theme_Elementary_OS_Freya_1.jpeg)

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Material_Design_Paper_Theme_Elementary_OS_Freya.jpeg)

How do you find this Material design inspired theme? If you did use it, do share the screenshot of your desktop with rest of us here.
你的Material design 设计灵感是什么呢？如果你在使用Material design ，在评论里和我们分享你的桌面截图吧！


--------------------------------------------------------------------------------

via: http://itsfoss.com/install-paper-theme-linux/

作者：[Abhishek][a]
译者：[sevenot](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://snwh.org/paper/
[2]:http://www.google.fr/design/spec/material-design/introduction.html
[3]:http://mokaproject.com/moka-icon-theme/
[4]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[5]:http://itsfoss.com/gnome-shell-themes-ubuntu-1404/
[6]:https://github.com/snwh/paper-icon-theme
[7]:https://github.com/snwh/paper-gtk-theme
[8]:http://itsfoss.com/how-to-install-themes-in-ubuntu-13-10/
[9]:http://itsfoss.com/install-switch-themes-gnome-shell/
[10]:http://itsfoss.com/install-icon-linux-mint/
[11]:http://itsfoss.com/install-themes-icons-elementary-os-freya/
[12]:http://itsfoss.com/tag/elementary-os-freya/
