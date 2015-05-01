Linux 有问必答：如何在Linux中修复“fatal error: lame/lame.h: No such file or directory”
================================================================================
> **提问**: 我尝试着在Linux中编译视频编码器，但是编译提示出错：“fatal error: lame/lame.h: No such file or directory”， 我该如何修复这个错误？ 

下面的编译错误说明你的系统没有安装LAME库和它的开发文件。

    fatal error: lame/lame.h: No such file or directory

[LAME][1]（"LAME Ain't an MP3 Encoder"）是一个流行的LPGL授权的MP3编码器。许多视频编码工具使用或者支持LAME，如 [FFmpeg][2]、 VLC、 [Audacity][3]、 K3b、 RipperX等。

要修复这个编译错误，你需要安装LAME库和开发文件，按照下面的来。

### 在Debian、Ubuntu或者Linux Mint上安装LAME库和安装文件 ###

Debian和它的衍生版在基础库中已经提供了LAME库，因此可以用apt-get直接安装。

    $ sudo apt-get install libmp3lame-dev 

### 在Fedora、CentOS/RHEL上安装LAME库和安装文件 ###

在基于RED HAT的版本中，LAME在RPM Fusion的免费仓库中就有，那么你需要先设置[RPM Fusion (免费)仓库][4]。

RPM Fusion设置完成后，如下安装LAME开发包。

    $ sudo yum --enablerepo=rpmfusion-free-updates install lame-devel 

在2015年1月，RPM Fusion仓库已经不可以在CentOS/RHEL 7中可用了。因此，这个方法不能用在CentOS/RHEL 7 中。这时你就要从源码安装LAME库了（下面会描述）。

### 在Debian、Ubuntu或者Linux Mint中从源码编译LAME库 ###

如果你希望用不同的编译选项安装自定义的LAME库，你需要自己编译。下面是怎样在基于Debian的系统中编译和安装LAME库（和它的头文件）。

    $ sudo apt-get install gcc git
    $ wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
    $ tar -xzf lame-3.99.5.tar.gz
    $ cd lame-3.99.5
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

注意当你运行上面的配置步骤时，你可以根据你的需求启用会禁止不同的选项。运行下面的命令查看不同的编译选项。

    $ ./configure --help 

共享/静态的LAME库默认安装在 /usr/local/lib。要让共享库可以被其他程序使用，完成最后一步：

用编辑器打开 /etc/ld.so.conf，加入下面这行。

    /usr/local/lib

接着运行下面的命令，这会将/usr/local/lib中的共享库添加到动态加载缓存中，因此LAME库就可以被其他程序调用了。

    $ sudo ldconfig 

### 在Fedora或者CentOS/RHEL中从源码编译LAME库 ###

如果你的发行版（比如 CentOS 7）没有提供预编译的LAME库，或者你想要自定义LAME库，你需要从源码自己编译。下面是在基于Red Hat的系统中编译安装LAME库的方法。

    $ sudo yum install gcc git
    $ wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
    $ tar -xzf lame-3.99.5.tar.gz
    $ cd lame-3.99.5
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

运行make之前，你可以在configure中带上合适的选项自定义编译选项。你可以用下面的命令检查可用的选项：

    $ ./configure --help 

最后你需要完成最后一步，因为安装在/usr/local/lib的LAME共享库可能在其他程序中不可用。

在/etc/ld.so.conf中添加下面这行：

    /usr/local/lib

接着运行下面的命令。这会添加 /usr/local/lib中的共享库(包括LAME)到动态加载缓存中，让其他程序可以访问到。

    $ sudo ldconfig 

![](https://farm8.staticflickr.com/7340/16534478445_abc97cb65a_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-lame-no-such-file-or-directory.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://lame.sourceforge.net/
[2]:http://ask.xmodulo.com/compile-ffmpeg-ubuntu-debian.html
[3]:http://xmodulo.com/how-to-cut-split-or-edit-mp3-file-on-linux.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
