How-To: Compile the Latest Wine 32-bit on 64-bit Ubuntu (15.10)
================================================================================
Wine 1.7.53 was released a few hours ago, and, as with each new version, it comes with several improvements, including support for **XAudio**, **Direct3D** code cleanups, improved **OLE object embedding**, further implementation of **Web Services DLL**, and a bunch of bug fixes.

![](http://www.tuxarena.com/wp-content/uploads/2015/10/wine1753a.jpg)

There is an official PPA for Wine [here][1], but it only comes with 1.7.44, so to install the latest version you can compile from source following the instructions below.

Download the source tarball from [here][2] (direct link [here][3]) and uncompress it (**tar -xf wine-1.7.53**). Next, install the dependencies:

    sudo apt-get install build-essential gcc-multilib libx11-dev:i386 libfreetype6-dev:i386 libxcursor-dev:i386 libxi-dev:i386 libxshmfence-dev:i386 libxxf86vm-dev:i386 libxrandr-dev:i386 libxinerama-dev:i386 libxcomposite-dev:i386 libglu1-mesa-dev:i386 libosmesa6-dev:i386 libpcap0.8-dev:i386 libdbus-1-dev:i386 libncurses5-dev:i386 libsane-dev:i386 libv4l-dev:i386 libgphoto2-dev:i386 liblcms2-dev:i386 gstreamer0.10-plugins-base:i386 libcapi20-dev:i386 libcups2-dev:i386 libfontconfig1-dev:i386 libgsm1-dev:i386 libtiff5-dev:i386 libmpg123-dev:i386 libopenal-dev:i386 libldap2-dev:i386 libgnutls-dev:i386 libjpeg-dev:i386

Now change the working directory to **wine-1.7.53** and type:

    ./configure
    make
    sudo make install

Alternatively, you can specify a prefix to the configure script and install Wine as normal user:

    ./configure --prefix=$HOME/usr/bin
    make
    make install

In this case, Wine will be installed as **$HOME/usr/bin/wine**, so make sure $HOME/usr/bin is in your PATH variable.

--------------------------------------------------------------------------------

via: http://www.tuxarena.com/2015/10/how-to-compile-latest-wine-32-bit-on-64-bit-ubuntu-15-10/

作者：Craciun Dan
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://launchpad.net/~ubuntu-wine/+archive/ubuntu/ppa
[2]:https://www.winehq.org/announce/1.7.53
[3]:http://prdownloads.sourceforge.net/wine/wine-1.7.53.tar.bz2