如何在Ubuntu 14.04 中安装Winusb
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu_1404.jpeg)

[WinUSB][1]是一款简单的且有用的工具，可以让你从Windows ISO镜像或者DVD中创建USB安装盘。它结合了GUI和命令行，你可以根据你的喜好决定使用哪种。

在本篇中我们会展示**如何在Ubuntu 14.04、14.10 和 Linux Mint 17 中安装WinUSB**。

### 在Ubuntu 14.04、14.10 和 Linux Mint 17 中安装WinUSB ###

直到Ubuntu 13.10, WinUSBu一直都在积极开发，且在官方PPA中可以找到。这个PPA还没有为Ubuntu 14.04 和14.10更新，但是二进制文件仍旧可在更新版本的Ubuntu和Linux Mint中运行。基于[基于你使用的系统是32位还是64位的][2]，使用下面的命令来下载二进制文件：

打开终端，并在32位的系统下使用下面的命令：

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_i386.deb

对于64位的系统，使用下面的命令：

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_amd64.deb

一旦你下载了正确的二进制包，你可以用下面的命令安装WinUSB：

    sudo dpkg -i winusb*

不要担心在你安装WinUSB时看见错误。使用这条命令修复依赖：

    sudo apt-get -f install

之后，你就可以在Unity Dash中查找WinUSB并且用它在Ubuntu 14.04 中创建Windows的live USB了。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu.png)

我希望这篇文章能够帮到你**在Ubuntu 14.04、14.10 和 Linux Mint 17 中安装WinUSB**。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-winusb-in-ubuntu-14-04/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.congelli.eu/prog_info_winusb.html
[2]:http://itsfoss.com/how-to-know-ubuntu-unity-version/