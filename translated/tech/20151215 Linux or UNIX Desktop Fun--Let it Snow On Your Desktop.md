Linux/Unix桌面趣事：让桌面下雪
================================================================================
在这个节日里感到孤独么？试一下Xsnow吧。它是一个可以在Unix/Linux桌面下下雪的app。圣诞老人和他的驯鹿会在屏幕中奔跑，伴随着雪片让你感受到节日的感觉。

我第一次是再13、4年前安装的它。它最初是在1984年Macintosh系统中创造的。你可以用下面的方法来安装：

### 安装 xsnow ###

Debian/Ubuntu/Mint用户用下面的命令：

    $ sudo apt-get install xsnow

Freebsd用户输入下面的命令：

    # cd /usr/ports/x11/xsnow/
    # make install clean

或者尝试添加包：

    # pkg_add -r xsnow

#### 其他发行版的方法 ####

1. Fedora/RHEL/CentOS在[rpmfusion][1]仓库中找找。
2. Gentoo用户试下Gentoo portage也就是[emerge -p xsnow][2]
3. Opensuse用户使用yast搜索xsnow

### 我该如何使用xsnow？ ###

打开终端（程序 > 附件 > 终端），输入下面的额命令启动xsnow：

    $ xsnow

示例输出:

![Fig.01: Snow for your Linux and Unix desktop systems](http://files.cyberciti.biz/uploads/tips/2011/12/application-to-bring-snow-to-desktop_small.png)

图01: 在Linux和Unix桌面中显示雪花

你可以设置背景位蓝色，并让它下白雪，输入：

    $ xsnow -bg blue -sc snow

设置最大的雪片数量，并让它尽可能快地运行，输入：

    $ xsnow -snowflakes 10000 -delay 0

不要显示圣诞树和圣诞老人满屏幕地跑，输入：

    $ xsnow -notrees -nosanta

关于xsnow更多的信息和选项，在命令行下输入man xsnow查看手册：

    $ man xsnow

建议阅读

- 官网[下载 Xsnow][1]
- 注意[MS-Windows][2]和[Mac OS X version][3]有一次性的共享软件费用。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/linux-unix-xsnow.html

作者：Vivek Gite 
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://rpmfusion.org/Configuration
[2]:http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=2&chap=1
[3]:http://dropmix.xs4all.nl/rick/Xsnow/
[4]:http://dropmix.xs4all.nl/rick/WinSnow/
[5]:http://dropmix.xs4all.nl/rick/MacOSXSnow/
