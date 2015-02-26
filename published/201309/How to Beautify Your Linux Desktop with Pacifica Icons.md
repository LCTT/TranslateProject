如何使用Pacifica图标美化你的linux桌面
==============================


这个教程将会指导所有的linux用户如何使用华丽的、扁平化以及现代化的Pacifica图标主题来美化当前桌面环境。


Pacifica 图标主题的灵感来源这个世界最美丽的linux操作系统elementary OS，像Nitrux、Faenza、Moka以及Plastico这些精美的图标主题，为linxu世界带来了一些我们期待已久的新元素。


Francisco Villarroel是Pacifica图标主题的主要开发者和设计者。他用bokehlicia这个名字发布在Deviantart网站上，[而bokehlicia正是这款超凡的图标主题诞生之处][1].


现在说说技术细节,可以告诉你们,我们已经在Arch Linux系统上使用一个纯净的GNOME3桌面环境测试了它，不过，感谢Carlos Gomes，Ubuntu 12.04 LTS (穿山甲)的用户也可以通过elementary OS PPA安装。


Pacifica图标主题依赖elementary图标主题，当然默认的gnome和hicolor图标主题可以在任何 Gnome-based linux发行版中找到。因此，如果你有需求，Pacifica 图标主题也可以在你的桌面环境或linux发行版上工作。


![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/pacificaicontheme-large_001.jpg)

让我们开始在Arch Linux 和Ubuntu上安装这个精美的图标主题。首先，这是Ubuntu 12.04 LTS用户使用的安装指令：


通过敲击 **CTRL+ALT+T** 组合键打开一个终端，接着一条一条粘贴以下命令，注意，每粘贴一条后敲击Enter。


    sudo apt-add-repository ppa:elementary-br/projects
    sudo apt-get update
    sudo apt-get install -y pacifica-icon-theme


好了！你现在可以用GNOME Tweak或者其它的应用程序来帮助你改变系统图标主题，应用Pacifica图标主题。如果你更喜欢命令行,请使用下面的命令：


    gsettings set org.gnome.desktop.interface icon-theme "Pacifica"


对于Arch Linux用户，使用你们最喜欢的AUR助手（译者注:比如yaourt）[安装pacifica-icon-theme包][2]。Arch Linux用户也使用上面的指令来设置新的Pacifica图标主题。

对于其他用户，不要犹豫，在你的Linux系统上手动下载安装Pacifica图标主题，或者用这些图标做你想做的任何事情。

如果你在学习本教程中有任何问题，请在下面写下评论。

via: http://news.softpedia.com/news/How-to-Beautify-You-Linux-Desktop-with-Pacifica-Icons-385877.shtml


本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf01]:http://linux.cn/space/译者ID
[Caroline]:http://linux.cn/space/14763

[1]:http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559
[2]:https://aur.archlinux.org/packages/pacifica-icon-theme/

