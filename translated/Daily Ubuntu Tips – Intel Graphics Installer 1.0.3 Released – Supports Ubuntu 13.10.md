每日 Ubuntu 小贴士 – 英特尔图形安装程序1.0.3发布 – 支持Ubuntu 13.10
================================================================================
对于那些台式机或笔记本电脑采用英特尔显卡运行Ubuntu 13.10的用户来说，这里的东西，他们可能想要做的 - 安装英特尔图形安装程序的Linux版本。

英特尔图形安装程序的Linux版本允许用户方便地安装最新的英特尔图形和视频驱动程序。直到最近，仍没有支持Ubuntu 13.10。

如果你想保持目前的英特尔卡在你的机器的最新驱动程序，你可能需要这个安装程序。它增强，优化并提供与您的英特尔图形硬件最好的用户体验。

[https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux][1]

### 在Ubuntu中安装英特尔图形安装程序 ###

如果你确定知道你的计算机有英特尔图形卡以及你正在运行的是Ubuntu13.10的版本，继续下面的学习如何安装这个包，

有些用户安装和配置驱动程序包后曾造成系统问题，所以你应该在安装前持谨慎态度，并备份你的系统。当你完成后，执行下面的命令来下载32位版本的软件包。

### 32-bit Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_i386.deb

对于那些运行64位的Ubuntu，运行下面的命令来下载64位版本。

### 64-bit Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_amd64.deb

下载完成后，运行以下命令进行安装。

    sudo dpkg -i intel-linux-graphics-installer*.deb; sudo apt-get -f install

安装安装程序后，进入Unity Dash搜索安装程序。打开它后，继续。它会为你的设备搜索并确定正确的驱动程序。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/intelgraphicsinstaller.png)

为了让你的系统信任英特尔图形安装程序，您必须添加以下key到Ubuntu的软件库中。运行下面的命令来添加它。

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -

就是这样。如果你按照以上步骤做了，你的机器应该能正确运行英特尔驱动程序。如果不是，可能是你的显卡不兼容，或者它不支持。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-intel-graphics-installer-1-0-3-released-supports-ubuntu-13-10/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux
