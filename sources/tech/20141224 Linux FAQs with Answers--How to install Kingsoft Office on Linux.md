Linux FAQs with Answers--How to install Kingsoft Office on Linux
================================================================================
> **Question**: I heard good things about Kingsoft Office, so I would like to try it out on my Linux. How can I install Kingsoft Office on [insert your Linux distro]? 

Kingsoft Office is an office suite available for muliple platforms including Windows, Linux, iOS and Android. It comes with three programs: Writer for word processing, Presentation for presentations, and Spreadsheets for spreadsheets. It is freemium model, where the basic version is free to use. Compared to other Linux office suites such as LibreOffice or OpenOffice, the best advantage of Kingsoft Office is its **excellent compatibility with Microsoft Office**. Thus for those of you who need to use an office suite on Linux and Windows platforms interchangeably, Kingsoft Office is a good choice for Linux platform.

### Install Kingsoft Office on CentOS, Fedora or RHEL ###

Download a RPM file for the [official site][1]. The official RPM package is available as a 32-bit version only, but you can install it on both 32-bit and 64-bit systems.

Use yum command with "localinstall" option to install the RPM file.

    $ sudo yum localinstall kingsoft-office-9.1.0.4244-0.1.a12p3.i686.rpm 

Note that do NOT use rpm command to install it. Otherwise, you will get unmet dependency errors, which are not easy to solve manually:

    error: Failed dependencies:
            libICE.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libSM.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libX11.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libXext.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libXrender.so.1 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libc.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686

Red Hat based distributions have multilib support. If the RPM package you are trying to install is 32-bit and has 32-bit library dependencies, a better way is to use yum to install it as shown above. As long as the RPM is properily built with all dependency information, yum should be able to install it using yum repositories.

![](https://farm9.staticflickr.com/8626/16040291445_ca62275064_c.jpg)

### Install Kingsoft Office on Debian, Ubuntu or Linux Mint ###

Download a DEB package from the [official site][2]. The official DEB package is available as a 32-bit version only, but you can install it on both 32-bit and 64-bit systems.

The DEB package has a set of dependencies to meet. Therefore use [gdebi][3] instead of dpkg command to automatically resolve dependencies.

    $ sudo apt-get install gdebi-core
    $ sudo gdebi kingsoft-office_9.1.0.4244~a12p3_i386.deb 

### Launch Kingsoft Office ###

Once Kingsoft Office is installed, you can launch Witer, Presentation, and Spreadsheets from the desktop manager easily.

On Ubuntu Unity:

![](https://farm9.staticflickr.com/8591/16039583702_632a49779f_z.jpg)

On GNOME:

![](https://farm9.staticflickr.com/8617/16039583622_4e7c1d8545_b.jpg)

Alternatively, you can also launch Kingsoft Office from the command line.

To launch Kingsoft Writer from the command line, use this command:

![](https://farm8.staticflickr.com/7525/16039583642_7202457899_c.jpg)

To launch Kingsoft Presentation from the command line, use this command:

    $ wpp 

![](https://farm8.staticflickr.com/7570/15420632223_4243cc99d9_c.jpg)

To launch Kingsoft Spreadsheets from the command line, use this command:

    $ et 

![](https://farm9.staticflickr.com/8682/15852842558_97edda4afd_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-kingsoft-office-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ksosoft.com/product/office-2013-linux.html
[2]:http://ksosoft.com/product/office-2013-linux.html
[3]:http://xmodulo.com/how-to-install-deb-file-with-dependencies.html