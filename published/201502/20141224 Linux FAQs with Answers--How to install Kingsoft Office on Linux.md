Linux有问必答 -  如何在linux上安装WPS
================================================================================
> **问题**: 我听说一个好东西Kingsoft Office（译注：就是WPS），所以我想在我的Linux上试试。我怎样才能安装Kingsoft Office呢？

Kingsoft Office 是一套办公套件，支持多个平台，包括Windows, Linux, iOS 和 Android。它包含三个组件：Writer（WPS文字）用来文字处理，Presentation（WPS演示）支持幻灯片，Spereadsheets（WPS表格）是电子表格。其使用免费增值模式，其中基础版本是免费使用。比较其他的linux办公套件，如LibreOffice、 OpenOffice，其最大优势在于，Kingsoft Office能最好的兼容微软的Office（译注：版权问题？了解下wps和Office的历史问题，可以得到一些结论）。因此如果你需要在windows和linux平台间交互，Kingsoft office是一个很好的选择。

### CentOS, Fedora 或 RHEL中安装Kingsoft Office ###

在[官方页面][1]下载RPM文件.官方RPM包只支持32位版本linux，但是你可以在64位中安装。

需要使用yum命令并用"localinstall"选项来本地安装这个RPM包

    $ sudo yum localinstall kingsoft-office-9.1.0.4244-0.1.a12p3.i686.rpm 

注意不要使用rpm命令安装。否者，你会得到依赖错误，而且很难解决：

    错误: 依赖失败:
            libICE.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libSM.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libX11.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libXext.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libXrender.so.1 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686
            libc.so.6 is needed by kingsoft-office-9.1.0.4244-0.1.a12p3.i686

基于Red Hat的发行版有多重库支持。如果你要想安装的RPM包是32位的并有32位库依赖（你的系统是64位的），一个很好的解决方法就是使用yum来安装。只要RPM在构建时候已经添加所有依赖关系，yum就可以自动使用yum库解决依赖关系。

![](https://farm9.staticflickr.com/8626/16040291445_ca62275064_c.jpg)

### Debian, Ubuntu 和 Linux Mint 中安装Kingsoft Office###

在[官方页面][1]下载DEB包。官方RPM包同样只支持32位版本linux，但是你可以在64位中安装。

DEB包同样遇到一堆依赖。因此使用[gdebi][3]命令来代替dpkg来自动解决依赖。

    $ sudo apt-get install gdebi-core
    $ sudo gdebi kingsoft-office_9.1.0.4244~a12p3_i386.deb 

### 启动 Kingsoft Office ###

安装完成后，你就可以在桌面管理器轻松启动Witer（WPS文字）, Presentation（WPS演示）, and Spreadsheets（WPS表格），如下图。

Ubuntu Unity中:

![](https://farm9.staticflickr.com/8591/16039583702_632a49779f_z.jpg)

GNOME桌面中:

![](https://farm9.staticflickr.com/8617/16039583622_4e7c1d8545_b.jpg)

不但如此，你也可以在命令行中启动Kingsoft Office。

启动Wirter（WPS文字），使用这个命令：

    $ wps (译注：原文丢失此命令)

![](https://farm8.staticflickr.com/7525/16039583642_7202457899_c.jpg)

启动Presentation（WPS演示），使用这个命令：

    $ wpp 

![](https://farm8.staticflickr.com/7570/15420632223_4243cc99d9_c.jpg)

启动Spreadsheets（WPS表格），使用这个命令：

    $ et 

![](https://farm9.staticflickr.com/8682/15852842558_97edda4afd_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-kingsoft-office-linux.html

译者：[Vic020/VicYu](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ksosoft.com/product/office-2013-linux.html
[2]:http://ksosoft.com/product/office-2013-linux.html
[3]:http://xmodulo.com/how-to-install-deb-file-with-dependencies.html
