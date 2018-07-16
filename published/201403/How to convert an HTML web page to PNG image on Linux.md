如何在Linux上将HTML页面转化成png图片
================================================================================
将一个特定页面抓取为一张png图片的最简单的方法是使用[CutyCapt][1]，这是一种在Linux下的方便地将HTML网页转化成矢量图形和位图图像格式的命令行工具（比如，SVG, PDF, PS, PNG, JPEG, TIFF, GIF）。CutyCapt内部使用WebKit渲染引擎来导出网页渲染输出到图片文件中。它使用Qt构建，CutyCapt实际上是一个也可以在Windows上使用的跨平台应用。

在本篇教程中，我会描述如何**将一个HTML网页使用CutyCapt转化成png图片**。

### 在Linux上安装 CutyCapt###

这是在特定Linux发行版上的安装命令。

####在Debian, Ubuntu 或者 Linux Mint 安装 CutyCapt 

    $ sudo apt-get install cutycapt 

####在Fedora上安装 CutyCapt

    $ sudo yum install subversion qt-devel qtwebkit-devel gcc-c++ make
    $ svn co svn://svn.code.sf.net/p/cutycapt/code/ cutycapt
    $ cd cutycapt/CutyCapt 

在Fedora上编译前，你需要在源码上[打上补丁][2]。

使用文本编辑器打开CutyCapt.hpp,并且加入在文件的开头加上下面的两行。

    #include <QNetworkReply>
    #include <QSslError>

最后，如下编译并安装CutyCapt。

    $ qmake-qt4
    $ make
    $ sudo cp CutyCapt /usr/local/bin/cutycapt 

#### 在CentOS 或者 RHEL安装 CutyCapt

首先在你的Linux上[启用EPEL仓库][3]。接着和在Fedora上一样使用相同的步骤编译安装。

### 使用CutyCapt将 HTML 转化成 PNG ###

将一个HTML页面截图成一个png图片，只要使用下面的格式运行CutyCapt。

    $ cutycapt --url=http://www.cnn.com --out=cnn.png

要将HTML页面保存成不同的格式（比如，PDF），只要适当地指定输出文件。

    $ cutycapt --url=http://www.cnn.com --out=cnn.pdf

下图显示了CutyCapt命令选项。

![](http://farm3.staticflickr.com/2811/12542271814_3c2563d405_z.jpg)

### 在一台不含X的服务器上使用CutyCapt将HTML转换成PNG ###

虽然CutyCapt是一个命令行工具，但是它需要X服务运行。如果你尝试在不含X服务的机器上运行，你会得到下面这个错误：

    cutycapt: cannot connect to X server :0

如果你要不含X的服务器上运行CutyCapt，你可以在服务器上安装Xvfb（轻量级“假的”X11 服务）。这样CutyCapt就不会报错了。

要在Debian, Ubuntu 或者 Linux Mint 上安装Xvfb：

    $ sudo apt-get install xvfb 

要在Fedora, CentOS 或者 RHEL 上安装Xvfb:

    $ sudo yum install xvfb 

在安装Xvfb之后，接下来像这样运行CutyCapt。

    $ xvfb-run --server-args="-screen 0, 1280x1200x24" cutycapt --url=http://www.cnn.com --out=cnn.png 

它首先会运行Xbfb服务，接着使用CutyCapt来抓取网页。因此它可能会花费更长的时间。如果你想要截图多张截图，你可能事先需要将Xvfb作为后台守护进程启动。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/02/convert-html-web-page-png-image-linux.html

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://cutycapt.sourceforge.net/
[2]:https://github.com/hoehrmann/CutyCapt/issues/3
[3]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
