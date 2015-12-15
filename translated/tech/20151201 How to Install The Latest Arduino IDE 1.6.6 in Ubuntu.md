如何再Ubuntu中安装最新的Arduino IDE 1.6.6
================================================================================
![Install latest Arduino in Ubuntu](http://ubuntuhandbook.org/wp-content/uploads/2015/11/arduino-icon.png)

> 本篇教程会教你如何在现在的Ubuntu发布版中安装最新的 Arduino IDE，目前的版本为1.6.6。

开源的Arduino IDE发布了1.6.6，并带来了很多的改变。新的发布已经切换到Java 8，它与IDE绑定并且再编译时需要它。具体见[RELEASE NOTE][1]。

![Arduino 1.6.6 in Ubuntu 15.10](http://ubuntuhandbook.org/wp-content/uploads/2015/11/arduino-ubuntu.jpg)

对于那些不想使用软件中心的1.0.5旧版本的人而言，你可以使用下面的步骤再所有的Ubuntu发行版中安装Ardunino。

注：下面这个说明下面的代码颜色，这个发布的时候要对照一下原文，写点说明，因为颜色在md里标识不出来
> **用红字替换将来的版本**

**1.** Download the latest packages, **Linux 32-bit or Linux 64-bit**, from the official link below:
**1.** 从下面的官方链接下载最新的包 **Linux 32-bit 或者 Linux 64-bit**。

- [www.arduino.cc/en/Main/Software][2]

不知道你系统的类型？进入系统设置->详细->概览。

**2.** 从Unity Dash、App Launcher或者Ctrl+Alt+T打开终端。打开后，一个个运行下面的命令：

进入下载文件夹：

    cd ~/Downloads

![navigate-downloads](http://ubuntuhandbook.org/wp-content/uploads/2015/11/navigate-downloads.jpg)

使用tar命令解压

注：arduino-1.6.6-*.tar.xz 为红色部分
    tar -xvf arduino-1.6.6-*.tar.xz

![extract-archive](http://ubuntuhandbook.org/wp-content/uploads/2015/11/extract-archive.jpg)

将解压后的文件移动到**/opt/**下：

注：arduino-1.6.6 为红色部分
    sudo mv arduino-1.6.6 /opt

![move-opt](http://ubuntuhandbook.org/wp-content/uploads/2015/11/move-opt.jpg)

**3.** 现在IDE已经与最新的Java绑定使用了。但是最好位程序设置一个桌面图标/启动方式：

进入安装目录

注：arduino-1.6.6 为红色部分
    cd /opt/arduino-1.6.6/

在这个目录给install.sh可执行权限

    chmod +x install.sh

最后运行脚本同事安装桌面快捷方式和启动图标：

    ./install.sh

下图中我用“&&”同事运行这三个命令：

![install-desktop-icon](http://ubuntuhandbook.org/wp-content/uploads/2015/11/install-desktop-icon.jpg)

最后从Unity Dash、程序启动器或者桌面快捷方式运行Arduino IDE。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-arduino-ide-1-6-6-ubuntu/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://www.arduino.cc/en/Main/ReleaseNotes
[2]:https://www.arduino.cc/en/Main/Software
