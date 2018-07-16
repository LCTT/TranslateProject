 如何从Linux命令行截屏
================================================================================
Linux上有着许多不同口味儿的截屏工具，包括桌面环境专用的截屏程序（如： KDE里面的KSnapshot，GNOME里面的gnome-screenshot，Xfce的Screenshooter），或者是通用的截屏程序（如 Shutter）。而Scort（"SCReen shOT"的缩写）是最独一无二的截屏工具之一，它是一个**命令行截屏工具**。虽然它的界面十分简约，但Scrot在功能上和其它专用的基于GUI的屏幕捕获工具一样强大。举个例子，Scrot支持延时截屏，截屏调整品质/大小，命令行传递等功能。如果你是那些热衷命令行的爱好者之一，Scrot应该是你加入兵器库中的又一实用工具。在这个教程中，我将会描述**如何在命令行中用Scrot截屏**。

### 在Linux中安装Scrot ###

在 Debian，Ubuntu 或 Linux Mint 上安装Scrot：

    $ sudo apt-get install scrot

在 Fedora 上安装Scrot：

    $ sudo yum install scrot

要在CentOS上安装Scrot，你可以按照下列步骤从源码编译：

首先[在CentOS上启用Repoforge][1]，然后使用下列命令：

    $ sudo yum install giblib-devel
    $ wget http://linuxbrit.co.uk/downloads/scrot-0.8.tar.gz
    $ tar xvfvz scrot-0.8.tar.gz
    $ cd scrot-0.8
    $ ./configure
    $ make
    $ sudo make install

### 用Scrot截屏 ###

在这个教程的下面的部分，我会描述如何通过几种不同方法用Scrot截屏。

#### 1. 截下整个桌面 ####

截取整个桌面十分简单。只需运行Scrot命令，不需要任何参数，然后它会保存一张整个桌面的截屏，以(日期标记).png的文件形式保存在当前文件目录下。

    $ scrot

你也可以指定保存目标文件夹和截图文件名。

    $ scrot ~/Pictures/my_desktop.png

#### 2. 截取特定窗口或矩形区域 ####

Scrot允许你在桌面选择一个特定的窗口或定义一个矩形区域来截图。使用下列命令来实现：

    $ scrot -s

运行这个命令后，继续用你的鼠标单击任意窗口或画出一个矩形，它能够触发对选定窗口/区域的屏幕截取。（LCTT译注，还要使用鼠标，伐快乐）

有时候你选定的区域或窗口可能会被桌面的其它窗口部分遮挡。在这种情况下，你在截屏前需要一点时间来清理那个部分。那正是延迟截屏能够帮到你的，就像下面所描述的那样。

#### 3. 延迟截屏 ####

延迟截取在各种情况下都很实用。就在截图前，你可能想要移动一下窗口，激活一下菜单，或是触发特定时间（如通知）等等。 使用“-d N”参数，我们可以将截屏进程延迟N秒。

    $ scrot -s -d 5

#### 4. 调整截屏质量 ####

你可以在1到100的范围内调整截取的图像质量（数字越大质量越高）。默认质量设置为75。

    $ scrot -q 50

#### 5. 调整截屏尺寸 ####

你可以在1到100的范围内调整截取的图像尺寸（数字越大尺寸越大）。减小截屏的尺寸到原图的10％：

    $ scrot -t 10

#### 6. 将截取的截屏传递给其它命令 ####

Scrot允许你发送保存的截屏图像给任意一个命令作为它们的输入。这个选项在你想对截屏图像做任意后期处理的时候十分实用。截屏的文件名/路径跟随于“$f”字符串之后。

    $ scrot -e 'mv $f ~/screenshots'

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/take-screenshot-command-line-linux.html

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
