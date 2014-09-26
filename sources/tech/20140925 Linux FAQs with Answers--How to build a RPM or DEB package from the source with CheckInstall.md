Linux FAQs with Answers--How to build a RPM or DEB package from the source with CheckInstall
================================================================================
> **问题**:我想要从源码创建安装的软件程序。有没有一种方式来创建并且从源码安装包,而不是运行“make install”？那样，以后如果我想，我可以容易的卸载程序。

如果你已经从从它的源码运行“make install”安装了linux程序。想完整移除它将变得真的很麻烦，除非程序的创造者在Makefile里提供卸载的目标。你会有在你系统里文件的完整列表来和从源码安装之后比较，然后手工移除所有在制作安装过程中加入的文件


这时候Checkinstall就可以派上使用。Checkinstall保留命令行创建或修改的所有文件的路径(例如：“make install”“make install_modules”等)并建立一个标准的二进制包，让你能用你发行版的标准包管理系统安装或卸载它，（例子：Red Hat的yum或者Debian的apt-get命令） It has been also known to work with Slackware, SuSe, Mandrake and Gentoo as well, as per the official documentation. [official documentation][1].

在这篇文章中，我们只集中在红帽子和Debian为基础的发行版，并展示怎样从源码使用Checkinstall创建一个RPM和DEB软件包

### 在linux上安装Checkinstall ###

在Debian衍生上安装Checkinstall：

    # aptitude install checkinstall 

在红帽子的发行版上安装Checkinstall，你需要下载一个预先建立的Checkinstall rpm(例如：从 [http://rpm.pbone.net][2]),他已经从Repoforge库里删除。对于Cent OS6这个rpm包也可在Cent OS7里工作。

    # wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/ikoinoba/CentOS_CentOS-6/x86_64/checkinstall-1.6.2-3.el6.1.x86_64.rpm
    # yum install checkinstall-1.6.2-3.el6.1.x86_64.rpm 

一旦checkinstall安装，你可以用下列格式创建一个特定的软件包

    # checkinstall <install-command> 

如果没有参数，默认安装命令“make install”将被使用

### 用Checkinstall创建一个RPM或DEB包 ###

在这个例子里，我们将创建一个htop包，对于linux交互式文本模式进程查看器（就像上面的 steroids）


首先，让我们从项目的官方网站下载源代码，一个最佳的练习，我们存储源码到/usr/local/src,并解压它

    # cd /usr/local/src
    # wget http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz
    # tar xzf htop-1.0.3.tar.gz
    # cd htop-1.0.3 

让我们找出htop安装命令，那样我们就能调用Checkinstall命令，下面展示了，htop用“make install”命令安装

    # ./configure
    # make install 

因此，创建一个htop包，我们可以调用checkinstall不带任何参数安装，这将使用“make install”命令创建一个包。随着这个过程 checkinstall命令会问你一个连串的问题。

总之，这个命令会创建一个htop包： **htop**:

    # ./configure
    # checkinstall 

回答“Y”“我会创建一个默认设置的包文件？”

![](https://farm6.staticflickr.com/5577/15118597217_1fdd0e0346_z.jpg)

你可以输入一个包的简短描述，然后按两次ENTER

![](https://farm4.staticflickr.com/3898/15118442190_604b71d9af.jpg)

输入一个数值修改下面的任何值或ENTER前进

![](https://farm4.staticflickr.com/3898/15118442180_428de59d68_z.jpg)

然后checkinstall将自动地创建一个.rpm或者.deb包，根据你的linux系统是什么：

在CentOS7：

![](https://farm4.staticflickr.com/3921/15282103066_5d688b2217_z.jpg)

在Debian 7:

![](https://farm4.staticflickr.com/3905/15118383009_4909a7c17b_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/build-rpm-deb-package-source-checkinstall.html

译者：[译者ID](https://github.com/译者luoyutiantang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://checkinstall.izto.org/docs/README
[2]:http://rpm.pbone.net/
[3]:http://ask.xmodulo.com/install-htop-centos-rhel.html
