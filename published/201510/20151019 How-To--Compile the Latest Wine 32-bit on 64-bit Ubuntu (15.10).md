如何在 64 位 Ubuntu 15.10 中编译最新版 32 位 Wine
================================================================================
Wine 发布了最新的1.7.53版本。此版本带来的大量性能提升，包括**XAudio**，**Direct3D**代码清理，改善**OLE对象嵌入**技术，更好的** Web Services dll**的实现，还有其他大量更新。

![](http://www.tuxarena.com/wp-content/uploads/2015/10/wine1753a.jpg)

虽然有一个官方 [Wine][1] PPA，但目前只提供1.7.44版本，所以安装最新版本可以从源码编译安装。

[下载源码包][2]（[直接下载地址在此][3]）并解压 `tar -xf wine-1.7.53`。然后，安装如下依赖。

    sudo apt-get install build-essential gcc-multilib libx11-dev:i386 libfreetype6-dev:i386 libxcursor-dev:i386 libxi-dev:i386 libxshmfence-dev:i386 libxxf86vm-dev:i386 libxrandr-dev:i386 libxinerama-dev:i386 libxcomposite-dev:i386 libglu1-mesa-dev:i386 libosmesa6-dev:i386 libpcap0.8-dev:i386 libdbus-1-dev:i386 libncurses5-dev:i386 libsane-dev:i386 libv4l-dev:i386 libgphoto2-dev:i386 liblcms2-dev:i386 gstreamer0.10-plugins-base:i386 libcapi20-dev:i386 libcups2-dev:i386 libfontconfig1-dev:i386 libgsm1-dev:i386 libtiff5-dev:i386 libmpg123-dev:i386 libopenal-dev:i386 libldap2-dev:i386 libgnutls-dev:i386 libjpeg-dev:i386

现在切换到 wine-1.7.53 解压后的文件夹，并输入：

    ./configure
    make
    sudo make install

同样地，你也可以给配置脚本指定 prefix 参数。以普通用户安装 wine：

    ./configure --prefix=$HOME/usr/bin
    make
    make install

这种情况下，Wine 将会安装在`$HOME/usr/bin/wine`，所以请检查`$HOME/usr/bin`在你的`PATH`变量中。

--------------------------------------------------------------------------------

via: http://www.tuxarena.com/2015/10/how-to-compile-latest-wine-32-bit-on-64-bit-ubuntu-15-10/

作者：Craciun Dan
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://launchpad.net/~ubuntu-wine/+archive/ubuntu/ppa
[2]:https://www.winehq.org/announce/1.7.53
[3]:http://prdownloads.sourceforge.net/wine/wine-1.7.53.tar.bz2
