Linux有问必答：怎么用CheckInstall从源码创建一个RPM或DEB包
================================================================================
> **问题**:我想要从源码创建安装的软件包。有没有一种方式从源码来创建和安装软件包，而不是运行“make install”？这样的话，以后如果我想，我可以容易的卸载程序。

如果你已经从它的源码运行“make install”安装了linux程序。想完整移除它将变得真的很麻烦，除非程序的开发者在Makefile里提供了uninstall的目标设置。否则你必须在安装前后比较你系统里文件的完整列表，然后手工移除所有在安装过程中加入的文件。

这时候Checkinstall就可以派上使用。Checkinstall会跟踪install命令行所创建或修改的所有文件的路径(例如：“make install”、“make install_modules”等)并建立一个标准的二进制包，让你能用你发行版的标准包管理系统安装或卸载它，（例如Red Hat的yum或者Debian的apt-get命令）。已知它在 Slackware、SuSe、Mandrake 和 Gentoo 上也工作很好，请参考其[官方文档][1]。

在这篇文章中，我们只集中在红帽子和Debian为基础的发行版，并展示怎样从源码使用Checkinstall创建一个RPM和DEB软件包

### 在linux上安装Checkinstall ###

在Debian及其衍生发行版上安装Checkinstall：

    # aptitude install checkinstall 

在红帽子的发行版上安装Checkinstall，你需要下载一个已经打包好的Checkinstall rpm包(例如：从 [http://rpm.pbone.net][2]找到)，不过它已经从Repoforge库里删除了。这个包是针对Cent OS6的，不过也可在Cent OS7里工作。

    # wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/ikoinoba/CentOS_CentOS-6/x86_64/checkinstall-1.6.2-3.el6.1.x86_64.rpm
    # yum install checkinstall-1.6.2-3.el6.1.x86_64.rpm 

一旦checkinstall安装好，你就可以用下列格式创建一个特定的软件包

    # checkinstall <install-command> 

如果没有参数，默认安装命令“make install”将被使用

### 用Checkinstall创建一个RPM或DEB包 ###

在这个例子里，我们将创建一个htop包，这是一个linux交互式文本模式进程查看器（类似 top）。

首先，让我们从项目的官方网站下载源代码，作为一个好的习惯，我们存储源码包到/usr/local/src下，并解压它。

    # cd /usr/local/src
    # wget http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz
    # tar xzf htop-1.0.3.tar.gz
    # cd htop-1.0.3 

让我们看看htop的安装命令是什么，以便我们能用Checkinstall命令调用它，如下面所示，htop用“make install”命令安装。

    # ./configure
    # make install 

因此，要创建一个htop安装包，我们可以不带任何参数的调用checkinstall，这将使用“make install”命令创建一个包。在这个过程中， checkinstall命令会问你几个问题。

简而言之，如下命令会创建一个htop包：

    # ./configure
    # checkinstall 

“Should I create a default set of package docs?（我会创建一个默认设置的包文件？）”，回答“Y”：

![](https://farm6.staticflickr.com/5577/15118597217_1fdd0e0346_z.jpg)

你可以输入一个包的简短描述，然后按两次回车：

![](https://farm4.staticflickr.com/3898/15118442190_604b71d9af.jpg)

输入一个数字以修改下面的任何值或ENTER继续：

![](https://farm4.staticflickr.com/3898/15118442180_428de59d68_z.jpg)

然后checkinstall将自动地创建一个.rpm或者.deb包，根据你的linux系统是什么：

在CentOS7：

![](https://farm4.staticflickr.com/3921/15282103066_5d688b2217_z.jpg)

在Debian 7:

![](https://farm4.staticflickr.com/3905/15118383009_4909a7c17b_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/build-rpm-deb-package-source-checkinstall.html

译者：[luoyutiantang](https://github.com/luoyutiantang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://checkinstall.izto.org/docs/README
[2]:http://rpm.pbone.net/
[3]:http://ask.xmodulo.com/install-htop-centos-rhel.html
