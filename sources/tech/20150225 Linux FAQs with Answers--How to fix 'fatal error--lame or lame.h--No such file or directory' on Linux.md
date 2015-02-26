Translating----geekpi

Linux FAQs with Answers--How to fix “fatal error: lame/lame.h: No such file or directory” on Linux
================================================================================
> **Question**: I am trying to compile video encoder software on Linux, but the compilation fails with a message saying "fatal error: lame/lame.h: No such file or directory." How can I fix this error? 

The following compilation error suggests that your Linux system does not have LAME library and its development files installed.

    fatal error: lame/lame.h: No such file or directory

[LAME][1] (short for "LAME Ain't an MP3 Encoder") is a popular MP3 encoding codec licensed with LGPL. Many video encoding/ripping tools use or support LAME. Among them are [FFmpeg][2], VLC, [Audacity][3], K3b, RipperX, and many more.

To fix the compilation error, you need to install LAME library and its development files, as shown in the following.

### Install LAME Library and its Development Files on Debian, Ubuntu or Linux Mint ###

Debian and its derivative systems offer LAME library in their base repositories, so it is easy to install LAME with apt-get. 

    $ sudo apt-get install libmp3lame-dev 

### Install LAME Library and its Development Files on Fedora, CentOS/RHEL ###

On Red Hat based distributions, the LAME encoder library is available via the RPM Fusion's free repository. Thus you first need to set up [RPM Fusion (free) repository][4] before proceeding.

Once RPM Fusion is set up, install LAME development files as follows.

    $ sudo yum --enablerepo=rpmfusion-free-updates install lame-devel 

As of February, 2015, RPM Fusion repository is not yet available for CentOS/RHEL 7. So this method will not be applicable on CentOS/RHEL 7. In that case, you can install LAME library by building it from the source (which is described below).

### Compile LAME Library from the Source on Debian, Ubuntu or Linux Mint ###

If you want to install customized LAME library with different compilation options, you need to build it yourself. Here is how you can compile and install LAME library (along with its header files) on your Debian-based system.

    $ sudo apt-get install gcc git
    $ wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
    $ tar -xzf lame-3.99.5.tar.gz
    $ cd lame-3.99.5
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

Note that when you run configure in the above steps, you can enable or disable various options based on your needs. Run the following command to see all available compilation options.

    $ ./configure --help 

The shared/static LAME libraries are installed in /usr/local/lib by default. To make the shared library accessible to other applications, complete this last step:

Open /etc/ld.so.conf with your favorite text editor, and append the following line.

    /usr/local/lib

and then run the command below. This will add shared libraries in /usr/local/lib to the dynamic loader cache, thereby making shared LAME library accessible to other applications.

    $ sudo ldconfig 

### Compile LAME Library from the Source on Fedora or CentOS/RHEL ###

If your distribution (e.g., CentOS 7) does not offer a pre-built LAME library package, or you want to customize LAME library in any way, you need to build it from the source yourself. Here is how to compile and install LAME library and its development files on a Red Hat based system.

    $ sudo yum install gcc git
    $ wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
    $ tar -xzf lame-3.99.5.tar.gz
    $ cd lame-3.99.5
    $ ./configure --enable-static --enable-shared
    $ make
    $ sudo make install 

Before running make, feel free to customize compilation options by running configure with appropriate options. You can check available options with:

    $ ./configure --help 

Finally, you need to complete the last step because the shared LAME library installed in /usr/local/lib may not be visible to other applications.

Append the following line in /etc/ld.so.conf:

    /usr/local/lib

and then run the command below. This will add shared libraries (including LAME) in /usr/local/lib to the dynamic loader cache, making them visible to other applications.

    $ sudo ldconfig 

![](https://farm8.staticflickr.com/7340/16534478445_abc97cb65a_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fatal-error-lame-no-such-file-or-directory.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://lame.sourceforge.net/
[2]:http://ask.xmodulo.com/compile-ffmpeg-ubuntu-debian.html
[3]:http://xmodulo.com/how-to-cut-split-or-edit-mp3-file-on-linux.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
