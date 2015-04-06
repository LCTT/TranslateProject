Linux 有问必答：如何在Linux 中修复“fatal error: x264.h: No such file or directory”的错误
================================================================================
> **提问**: 我想在Linux中从源码编译视频编码程序。到那时，在编译时，我遇到了一个错误“fatal error: x264.h: No such file or directory”，我该如何修复？

下面的编译错误错明你系统中没有x264开发库文件。

    fatal error: x264.h: No such file or directory

[x264][1]是GNU GPL授权的H.264/MPEG-4 AVC编码库。x264库被广泛用于视频编码/转码程序比如Avidemux、[FFmpeg][2]、 [HandBrake][3]、 OpenShot、 MEncode等等。

要解决这个问题，你需要安装x264的开发库文件。你可以如下做。

###在 Debian、 Ubuntu 或者 Linux Mint 中安装像x264库和开发文件 ###

在基于Debian的系统中，x264库已经包含在基础仓库中。可以直接用apt-get来安装。

     $ sudo apt-get install libx264-dev

### 在 Fedora、 CentOS/RHEL中安装像x264库和开发文件 ###

在基于Red Hat的发行版比如Fedora或者CentOS，x264库在免费的RPM Fusion仓库中有。那么，你需要首先安装[RPM Fusion (免费)][4] 。

RPM Fusion设置完成后，你可以使用下面的命令安装x264开发文件。

     $ sudo yum --enablerepo=rpmfusion-free install x264-devel 

注意RPM Fusion仓库在CentOS 7中还没有，因此上面的方法在CentOS 7中还不可行。万一是CentOS 7 ，你可以从源码编译并安装x264，下面会解释的。

### 在Debian、 Ubuntu 或者 Linux Mint中源码编译x264库 ###

如果libx264包在你的发行版中并没有，那么你可以按照下面的方法编译最新的x264库。

    $ sudo apt-get install g++ automake autoconf libtool yasm nasm git
    $ git clone git://git.videolan.org/x264.git
    $ cd x264
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

x264库将会安装在/usr/local/lib。要让其他程序可以使用这个库，你需要完成最后一步。

打开/etc/ld.so.conf，并添加下面的行。

    $ sudo vi /etc/ld.so.conf 

----------

    /usr/local/lib

最后运行下面的命令重新加载共享库：

    $ sudo ldconfig

### 在 Fedora, CentOS/RHEL 中源码编译x264库 ###

如果你Linux的发行版中没有x264库（比如:CentOS 7）或者x264库并不是最新的，你可以如下编译最新的x264库。

    $ sudo yum install gcc gcc-c++ automake autoconf libtool yasm nasm git
    $ git clone git://git.videolan.org/x264.git
    $ cd x264
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

最后，要让其他的程序可以访问到位于 /usr/local/lib的x264库，在 /etc/ld.so.conf加入下面的行。

    $ sudo vi /etc/ld.so.conf 

----------

    /usr/local/lib

最后运行下面的命令重新加载共享库：

    $ sudo ldconfig 

![](https://farm8.staticflickr.com/7350/16453197512_7c18c5c09e_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-x264-h-no-such-file-or-directory.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.videolan.org/developers/x264.html
[2]:http://ask.xmodulo.com/compile-ffmpeg-centos-fedora-rhel.html
[3]:http://xmodulo.com/how-to-install-handbrake-on-linux.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
