如何在 Ubuntu 14.04 中安装 Winusb
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu_1404.jpeg)

[WinUSB][1]是一款即简单又有用的工具，可以让你从 Windows ISO 镜像或者 DVD 中创建 USB 安装盘（LCTT译注：支持将 Windows Vista/7/8/PE 制作成 USB 安装盘）。它支持 GUI 和命令行，你可以根据你的喜好决定使用哪种。

在本文中我们会展示**如何在 Ubuntu 14.04、14.10 和 Linux Mint 17 中安装 WinUSB**。

### 在 Ubuntu 14.04、14.10 和 Linux Mint 17 中安装 WinUSB ###

在 Ubuntu 13.10 之前, WinUSB 一直都在积极开发，且在官方 PPA 中可以找到。但这个 PPA 还没有为 Ubuntu 14.04 和 14.10 更新，不过其二进制文件仍旧可在更新版本的 Ubuntu 和 Linux Mint 中运行。基于[你使用的系统是32位还是64位][2]，使用下面的命令来下载二进制文件：

打开终端，32位的系统下使用下面的命令：

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_i386.deb

对于64位的系统，使用下面的命令：

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_amd64.deb

当你下载了正确的二进制包，你可以用下面的命令安装WinUSB：

    sudo dpkg -i winusb*

不要担心在你安装WinUSB时看到的错误。使用这条命令修复依赖错误：

    sudo apt-get -f install

之后，你就可以在 Unity Dash 中查找 WinUSB 并且用它在 Ubuntu 14.04 中创建 Windows 的 live USB 了。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu.png)

我希望这篇文章能够帮到你**在 Ubuntu 14.04、14.10 和 Linux Mint 17 中安装 WinUSB**。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-winusb-in-ubuntu-14-04/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.congelli.eu/prog_info_winusb.html
[2]:http://itsfoss.com/how-to-know-ubuntu-unity-version/
