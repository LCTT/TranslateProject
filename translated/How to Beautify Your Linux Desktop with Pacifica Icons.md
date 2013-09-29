如何使用Pacifica图标美化你的linux桌面
================================================================================

这个指南将会教所有的linux用户如何使用华丽,扁平,现代的Pacifica图标主题来美化当前的桌面环境.


Pacifica 图标主题的灵感来源这个世界最美丽的linux操作系统elementary OS,和精彩的图标主题比如Nitrux, Faenza, Moka and Plastico,它为linxu世界带来了一些新的,我们期待已久的东西.


Francisco Villarroel是Pacifica图标主题的主要开发者和设计者.他用bokehlicia这个名字发布在Deviantart网站上,[他华丽的图标主题诞生之处][1].


现在说说技术细节,我们可以告诉你,我们已经在Arch Linux系统上使用一个纯净的GNOME3桌面环境测试了它,不过,Ubuntu 12.04 LTS (穿山甲)的用户也可以通过elementary OS PPA安装它, 感谢Carlos Gomes.


Pacifica图标主题依赖elementary图标主题,当然默认的gnome和hicolor图标主题可以在任何 Gnome-based linux发行版中找到.因此,如果你具备这些依赖条件,Pacifica 图标主题也可以工作在你的桌面环境或linux发行版上.


![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/pacificaicontheme-large_001.jpg)

让我们在Arch Linux 和Ubuntu上直截了当的安装这个精彩的图标主题.首先,这是Ubuntu 12.04 LTS用户使用的安装指令:


打开一个终端,敲击 **CTRL+ALT+T** 组合键,一条接一条的粘贴下面的命令,每一条后请敲击一下Enter...


    sudo apt-add-repository ppa:elementary-br/projects
    sudo apt-get update
    sudo apt-get install -y pacifica-icon-theme


好了! 你现在可以用GNOME Tweak,或者其它的应用程序来帮助你改变系统图标主题,应用Pacifica图标主题.如果你更喜欢命令行,请使用下面的命令:


    gsettings set org.gnome.desktop.interface icon-theme "Pacifica"


现在来说Arch Linux,使用你最喜欢的AUR助手(译者注:比如yaourt)[安装pacifica-icon-theme包][2].Arch Linux用户也用和上面同样的指令来应用新的Pacifica图标主题.

对于世界上其他的发行版,不要犹豫,手动下载安装Pacifica图标主题在你的Linux系统上,或者在任何地方使用这些图标,只要你愿意.


如果你使用这个指南有任何问题,不要犹豫的在下面写出来.


via: http://news.softpedia.com/news/How-to-Beautify-You-Linux-Desktop-with-Pacifica-Icons-385877.shtml


本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559
[2]:https://aur.archlinux.org/packages/pacifica-icon-theme/

