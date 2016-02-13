如何在 Ubuntu 中安装最新的 Arduino IDE 1.6.6
================================================================================
![Install latest Arduino in Ubuntu](http://ubuntuhandbook.org/wp-content/uploads/2015/11/arduino-icon.png)

> 本篇教程会教你如何在当前的 Ubuntu 发行版中安装最新的 Arduino IDE 1.6.6。

开源的 Arduino IDE 发布了1.6.6，并带来了很多的改变。新的发布已经切换到 Java 8，它与 IDE 绑定并且用于编译所需。具体见 [发布说明][1]。

![Arduino 1.6.6 in Ubuntu 15.10](http://ubuntuhandbook.org/wp-content/uploads/2015/11/arduino-ubuntu.jpg)

对于那些不想使用软件中心的 1.0.5 旧版本的人而言，你可以使用下面的步骤在所有的 Ubuntu 发行版中安装 Arduino。

> **请用正确版本号替换软件包的版本号**

**1、** 从下面的官方链接下载最新的包 **Linux 32-bit 或者 Linux 64-bit**。

- [https://www.arduino.cc/en/Main/Software][2]

如果不知道你系统的类型？进入系统设置->详细->概览。

**2、** 从Unity Dash、App Launcher 或者使用 Ctrl+Alt+T 打开终端。打开后，一个个运行下面的命令：

进入下载文件夹：

    cd ~/Downloads

![navigate-downloads](http://ubuntuhandbook.org/wp-content/uploads/2015/11/navigate-downloads.jpg)

使用 tar 命令解压：

    tar -xvf arduino-1.6.6-*.tar.xz

![extract-archive](http://ubuntuhandbook.org/wp-content/uploads/2015/11/extract-archive.jpg)

将解压后的文件移动到**/opt/**下：

    sudo mv arduino-1.6.6 /opt

![move-opt](http://ubuntuhandbook.org/wp-content/uploads/2015/11/move-opt.jpg)

**3、** 现在 IDE 已经与最新的 Java 绑定使用了。但是最好为程序设置一个桌面图标/启动方式：

进入安装目录：

    cd /opt/arduino-1.6.6/

在这个目录给 install.sh 可执行权限

    chmod +x install.sh

最后运行脚本同时安装桌面快捷方式和启动图标：

    ./install.sh

下图中我用“&&”同时运行这三个命令：

![install-desktop-icon](http://ubuntuhandbook.org/wp-content/uploads/2015/11/install-desktop-icon.jpg)

最后从 Unity Dash、程序启动器或者桌面快捷方式运行 Arduino IDE。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-arduino-ide-1-6-6-ubuntu/

作者：[Ji m][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://www.arduino.cc/en/Main/ReleaseNotes
[2]:https://www.arduino.cc/en/Main/Software
