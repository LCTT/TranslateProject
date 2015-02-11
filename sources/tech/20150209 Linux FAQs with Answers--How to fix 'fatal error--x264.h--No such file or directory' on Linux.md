translating----geekpi

Linux FAQs with Answers--How to fix “fatal error: x264.h: No such file or directory” on Linux
================================================================================
> **Question**: I am trying to build a video encoding application from the source on Linux. However, during compilation, I am encountering the error: "fatal error: x264.h: No such file or directory" How can I fix this error?

The following compilation error indicates that you do not have x264 library's development files installed on your Linux system.

    fatal error: x264.h: No such file or directory

[x264][1] is an H.264/MPEG-4 AVC encoder library licensed with GNU GPL. The x264 library is popularly used by many video encoder/transcoder programs such as Avidemux, [FFmpeg][2], [HandBrake][3], OpenShot, MEncode and more.

To solve the above compilation error, you need to install development files for x264 library. Here is how you can do it.

### Install x264 Library and its Development Files on Debian, Ubuntu or Linux Mint ###

On Debian based systems, x264 library is already included in the base repositories. Thus its installation is straightforward with apt-get as follows.

     $ sudo apt-get install libx264-dev

### Install x264 Library and its Development Files on Fedora, CentOS/RHEL ###

On Red Hat based distributions such as Fedora or CentOS, the x264 library is available via the free repository of RPM Fusion. Thus, you need to install [RPM Fusion (free)][4] first.

Once RPM Fusion is set up, you can install x264 development files as follows.

     $ sudo yum --enablerepo=rpmfusion-free install x264-devel 

Note that RPM Fusion repository is not available for CentOS 7 yet, so the above method does not work for CentOS 7. In case of CentOS 7, you can build and install x264 library from the source, which is explained below.

### Compile x264 Library from the Source on Debian, Ubuntu or Linux Mint ###

If the libx264 package that comes with your distribution is not up-to-date, you can compile the latest x264 library from the source as follows.

    $ sudo apt-get install g++ automake autoconf libtool yasm nasm git
    $ git clone git://git.videolan.org/x264.git
    $ cd x264
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

The x264 library will be installed in /usr/local/lib. To allow the library to be used by other applications, you need to complete the last step:

Open /etc/ld.so.conf with a text editor, and append the following line.

    $ sudo vi /etc/ld.so.conf 

----------

    /usr/local/lib

Finally reload all shared libraries by running:

    $ sudo ldconfig

### Compile x264 Library from the Source on Fedora, CentOS/RHEL ###

If the x264 library is not available on your Linux distribution (e.g., CentOS 7) or the x264 library is not up-to-date, you can build the latest x264 library from the source as follows.

    $ sudo yum install gcc gcc-c++ automake autoconf libtool yasm nasm git
    $ git clone git://git.videolan.org/x264.git
    $ cd x264
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

Finally, to allow other applications to use x264 library installed in /usr/local/lib, add the following line in /etc/ld.so.conf:

    $ sudo vi /etc/ld.so.conf 

----------

    /usr/local/lib

and reload all shared libraries by running:

    $ sudo ldconfig 

![](https://farm8.staticflickr.com/7350/16453197512_7c18c5c09e_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-x264-h-no-such-file-or-directory.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.videolan.org/developers/x264.html
[2]:http://ask.xmodulo.com/compile-ffmpeg-centos-fedora-rhel.html
[3]:http://xmodulo.com/how-to-install-handbrake-on-linux.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
