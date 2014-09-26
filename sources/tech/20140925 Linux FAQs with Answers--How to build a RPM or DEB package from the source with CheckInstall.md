Linux FAQs with Answers--How to build a RPM or DEB package from the source with CheckInstall
================================================================================
> **问题**:我想要从源码创建安装的软件程序。有没有一种方式来创建并且从源码安装包,而不是运行“make install”？那样，以后如果我想，我可以容易的卸载程序。

如果你已经从从它的源码运行“make install”安装了linux程序。想完整移除它将变得真的很麻烦，除非程序的创造者在Makefile里提供卸载的目标。你会有在你系统里文件的完整列表来和从源码安装之后比较，然后手工移除所有在制作安装过程中加入的文件


这时候Checkinstall就可以派上使用。Checkinstall保留命令行创建或修改的所有文件的路径(例如：“make install”“make install_modules”等)并建立一个标准的二进制包，让你能用你发行版的标准包管理系统安装或卸载它，（例子：Red Hat的yum或者Debian的apt-get命令） It has been also known to work with Slackware, SuSe, Mandrake and Gentoo as well, as per the official documentation. [official documentation][1].

在这篇文章中，我们只集中在红帽子和Debian为基础的发行版，并展示怎样从源码使用Checkinstall创建一个RPM和DEB软件包

###  ###

To install CheckInstall on Debian derivatives:

    # aptitude install checkinstall 

To install CheckInstall on Red Hat-based distributions, you will need to download a pre-built .rpm of CheckInstall (e.g., searchable from [http://rpm.pbone.net][2]), as it has been removed from the Repoforge repository. The .rpm package for CentOS 6 works in CentOS 7 as well.

    # wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/ikoinoba/CentOS_CentOS-6/x86_64/checkinstall-1.6.2-3.el6.1.x86_64.rpm
    # yum install checkinstall-1.6.2-3.el6.1.x86_64.rpm 

Once checkinstall is installed, you can use the following format to build a package for particular software.

    # checkinstall <install-command> 

Without <install-command> argument, the default install command "make install" will be used.

### Build a RPM or DEB Pacakge with CheckInstall ###

In this example, we will build a package for [htop][3], an interactive text-mode process viewer for Linux (like top on steroids). 

First, let's download the source code from the official website of the project. As a best practice, we will store the tarball in /usr/local/src, and untar it.

    # cd /usr/local/src
    # wget http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz
    # tar xzf htop-1.0.3.tar.gz
    # cd htop-1.0.3 

Let's find out the install command for htop, so that we can invoke checkinstall with the command. As shown below, htop is installed with 'make install' command.

    # ./configure
    # make install 

Therefore, to build a htop package, we can invoke checkinstall without any argument, which will then use 'make install' command to build a package. Along the process, the checkinstall command will ask you a series of questions.

In short, here are the commands to build a package for **htop**:

    # ./configure
    # checkinstall 

Answer 'y' to "Should I create a default set of package docs?":

![](https://farm6.staticflickr.com/5577/15118597217_1fdd0e0346_z.jpg)

You can enter a brief description of the package, then press Enter twice:

![](https://farm4.staticflickr.com/3898/15118442190_604b71d9af.jpg)

Enter a number to modify any of the following values or Enter to proceed:

![](https://farm4.staticflickr.com/3898/15118442180_428de59d68_z.jpg)

Then checkinstall will create a .rpm or a .deb package automatically, depending on what your Linux system is:

On CentOS 7:

![](https://farm4.staticflickr.com/3921/15282103066_5d688b2217_z.jpg)

On Debian 7:

![](https://farm4.staticflickr.com/3905/15118383009_4909a7c17b_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/build-rpm-deb-package-source-checkinstall.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://checkinstall.izto.org/docs/README
[2]:http://rpm.pbone.net/
[3]:http://ask.xmodulo.com/install-htop-centos-rhel.html
