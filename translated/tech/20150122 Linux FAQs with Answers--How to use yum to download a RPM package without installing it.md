theo-l translating 
Linux FAQs with Answers--How to use yum to download a RPM package without installing it
Linux 常见问题解答--如何使用yum来下载RPM包而不进行安装.
================================================================================
> **Question**: I want to download a RPM package from Red Hat's standard repositories. Can I use yum command to download a RPM package without installing it?
> **问题**:我想从Red Hat's的标准仓库中下载一个RPM包,我能使用yum命令来下载一个RPM包但是不进行安装吗?

yum is the default package manager for Red Hat based systems, such as CentOS, Fedora or RHEL. Using yum, you can install or update a RPM package while resolving its package dependencies automatically. What if you want to download a RPM package without installing it on the system? For example, you may want to archive some RPM packages for later use or to install them on another machine.
yum是基于Red Hat的系统(如CentOS,Fedora,RHEl)上的默认包管理器.使用yum,你可以安装或者更新一个RPM包,并且他会自动解决包依赖关系.但是如果你只想将一个RPM包下载到你的系统上该怎么办呢? 例如,你可能想要获取一些RPM包在以后使用,或者将他们安装在另外的机器上.

Here is how to download a RPM package from yum repositories.
这里说明了如何从yum仓库上下载一个RPM包.

### Method One: Yum ###
### 方法一:yum###

The yum command itself can be used to download a RPM package. The standard yum command offers '--downloadonly' option for this purpose.
yum命令本身就可以用来下载一个RPM包,标准的yum命令提供了`--downloadonly(只下载)`的选项来达到这个目的.

    $ sudo yum install --downloadonly <package-name>

By default, a downloaded RPM package will be saved in:
默认情况下,一个下载的RPM包会保存在下面的目录中:

    /var/cache/yum/x86_64/[centos/fedora-version]/[repository]/packages

In the above, [repository] is the name of the repository (e.g., base, fedora, updates) from which the package is downloaded.
以上的[repository]表示下载包的来源仓库的名称(例如,base,fedora,updates)

If you want to download a package to a specific directory (e.g., /tmp):
如果你想要讲一个包下载到一个指定的目录(如/tmp):

    $ sudo yum install --downloadonly --downloaddir=/tmp <package-name>

Note that if a package to download has any unmet dependencies, yum will download all dependent packages as well. None of them will be installed.
注意,如果下载的包包含了任意没有满足的依赖关系,yum将会把所有的依赖关系包下载,但是都不会被安装.

One important thing is that on CentOS/RHEL 6 or earlier, you will need to install a separate yum plugin (called yum-plugin-downloadonly) to be able to use '--downloadonly' command option:
另外一个重要的事情时,在CentOS/RHEL 6或更早期的版本中,你需要安装一个单独yum插件(名称为 yum-plugin-downloadonly)才能使用`--downloadonly`命令选项:

    $ sudo yum install yum-plugin-downloadonly

Without this plugin, you will get the following error with yum:
如果没有该插件,你会在使用yum时得到以下错误:

    Command line error: no such option: --downloadonly

![](https://farm9.staticflickr.com/8627/15571201803_38390aae75_c.jpg)

### Method Two: Yumdownloader ###
### 方法二: Yumdownloader###
Another method to download a RPM package is via a dedicated package downloader tool called yumdownloader. This tool is part of yum-utils package which contains a suite of helper tools for yum package manager.
另外一个下载RPM包的方法就是通过一个专门的包下载工具--yumdownloader. 这个工具时yum工具包(包含了用来进行yum包管理的帮助工具套件)的子集.

    $ sudo yum install yum-utils

To download a RPM package:
下载一个RPM包:

    $ sudo yumdownloader <package-name>

The downloaded package will be saved in the current directory. You need to use root privilege because yumdownloader will update package index files during downloading. Unlike yum command above, none of the dependent package(s) will be downloaded.
下载的包会被保存在当前目录中.你需要使用root权限,因为yumdownloader会在下载过程中更新包索引文件.与yum命令不同的是,任何依赖包不会被下载.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/yum-download-rpm-package.html

译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
