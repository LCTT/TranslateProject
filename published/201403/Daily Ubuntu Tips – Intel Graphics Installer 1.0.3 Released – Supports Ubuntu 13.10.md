每日 Ubuntu 小技巧——Intel图形安装程序 1.0.3 发布，支持 Ubuntu 13.10
================================================================================

对于那些使用Intel显卡台式机或者笔记本来运行 Ubuntu Linux 13.10 的用户来说，有件事可能想要完成——安装 Linux 版本的Intel图形安装程序。

Linux 版本的Intel图形安装程序允许用户方便地安装最新的Intel图形和视频驱动程序。现在之前，仍不支持 Ubuntu 13.10。

如果你想保持目前Intel卡在你机器中的最新驱动程序，你可能需要这个安装程序。它能增强、优化并提供Intel图形硬件最好的用户体验。

访问官网：[https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux][1]

### 在 Ubuntu 中安装Intel图形安装程序 ###

如果你确定你的计算机有Intel图形卡，而且你正在运行的版本是 Ubuntu 13.10，继续下面的学习如何安装这个包，

有些用户安装和配置驱动程序包后曾造成系统问题，所以你应该在安装前持谨慎态度，并备份你的系统。当你完成后，执行下面的命令来下载32位版本的软件包。

### 32位 Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_i386.deb

对于那些运行64位的 Ubuntu，运行下面的命令来下载64位版本。

### 64位 Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_amd64.deb

下载完成后，运行以下命令进行安装。

    sudo dpkg -i intel-linux-graphics-installer*.deb; sudo apt-get -f install 

安装程序安装完毕后，进入 Unity Dash 搜索安装程序。打开后继续。它会为你的设备搜索并确定正确的驱动程序。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/intelgraphicsinstaller.png)

为了让你的系统信任Intel图形安装程序，您必须运行下面命令来添加 key 到 Ubuntu 的软件库中。

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -

就这么简单。如果你按照以上步骤做了，你的机器应该能正确运行Intel驱动程序。如果不是，可能是你的显卡不兼容，或者是不支持。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-intel-graphics-installer-1-0-3-released-supports-ubuntu-13-10/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux
