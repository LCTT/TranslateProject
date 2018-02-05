树莓派 3 的新手指南
======
> 这个教程将帮助你入门<ruby>树莓派 3<rt>Raspberry Pi 3</rt></ruby>。

![](https://images.techhive.com/images/article/2017/03/raspberry2-100711632-large.jpeg)

这篇文章是我的使用树莓派 3 创建新项目的每周系列文章的一部分。该系列的这个第一篇文章专注于入门，它主要讲安装  Raspbian 和 PIXEL 桌面，以及设置网络和其它的基本组件。

###  你需要：

* 一台树莓派 3
* 一个 5v 2mAh 带 USB 接口的电源适配器
* 至少 8GB 容量的 Micro SD 卡
* Wi-Fi 或者以太网线
* 散热片
* 键盘和鼠标
* 一台 PC 显示器
* 一台用于准备 microSD 卡的 Mac 或者 PC

现在有很多基于 Linux 操作系统可用于树莓派，你可以直接安装它，但是，如果你是第一次接触树莓派，我推荐使用 NOOBS，它是树莓派官方的操作系统安装器，它安装操作系统到该设备的过程非常简单。

在你的电脑上从 [这个链接][1] 下载 NOOBS。它是一个 zip 压缩文件。如果你使用的是 MacOS，可以直接双击它，MacOS 会自动解压这个文件。如果你使用的是 Windows，右键单击它，选择“解压到这里”。

如果你运行的是 Linux 桌面，如何去解压 zip 文件取决于你的桌面环境，因为，不同的桌面环境下解压文件的方法不一样，但是，使用命令行可以很容易地完成解压工作。

```
$ unzip NOOBS.zip
```

不管它是什么操作系统，打开解压后的文件，你看到的应该是如下图所示的样子：

![content][3]

现在，在你的 PC 上插入 Micro SD 卡，将它格式化成 FAT32 格式的文件系统。在 MacOS 上，使用磁盘实用工具去格式化 Micro SD 卡：

![format][4]

在 Windows 上，只需要右键单击这个卡，然后选择“格式化”选项。如果是在 Linux 上，不同的桌面环境使用不同的工具，就不一一去讲解了。在这里我写了一个教程，[在 Linux 上使用命令行界面][5] 去格式化 SD 卡为 Fat32 文件系统。

在你的卡格式成了 FAT32 格式的文件系统后，就可以去拷贝下载的 NOOBS 目录的内容到这个卡的根目录下。如果你使用的是 MacOS 或者 Linux，可以使用 `rsync` 将 NOOBS 的内容传到 SD 卡的根目录中。在 MacOS 或者 Linux 中打开终端应用，然后运行如下的 rsync 命令：

```
rsync -avzP /path_of_NOOBS /path_of_sdcard
```

一定要确保选择了 SD 卡的根目录，在我的案例中（在 MacOS 上），它是：

```
rsync -avzP /Users/swapnil/Downloads/NOOBS_v2_2_0/ /Volumes/U/
```

或者你也可以拷贝粘贴 NOOBS 目录中的内容。一定要确保将 NOOBS 目录中的内容全部拷贝到 Micro SD 卡的根目录下，千万不能放到任何的子目录中。

现在可以插入这张 MicroSD 卡到树莓派 3 中，连接好显示器、键盘鼠标和电源适配器。如果你拥有有线网络，我建议你使用它，因为有线网络下载和安装操作系统更快。树莓派将引导到 NOOBS，它将提供一个供你去选择安装的分发版列表。从第一个选项中选择 Raspbian，紧接着会出现如下图的画面。

![raspi config][6]

在你安装完成后，树莓派将重新启动，你将会看到一个欢迎使用树莓派的画面。现在可以去配置它，并且去运行系统更新。大多数情况下，我们都是在没有外设的情况下使用树莓派的，都是使用 SSH 基于网络远程去管理它。这意味着你不需要为了管理树莓派而去为它接上鼠标、键盘和显示器。

开始使用它的第一步是，配置网络（假如你使用的是 Wi-Fi）。点击顶部面板上的网络图标，然后在出现的网络列表中，选择你要配置的网络并为它输入正确的密码。

![wireless][7]

恭喜您，无线网络的连接配置完成了。在进入下一步的配置之前，你需要找到你的网络为树莓派分配的 IP 地址，因为远程管理会用到它。

打开一个终端，运行如下的命令：

```
ifconfig
```

现在，记下这个设备的 `wlan0` 部分的 IP 地址。它一般显示为 “inet addr”。

现在，可以去启用 SSH 了，在树莓派上打开一个终端，然后打开 `raspi-config` 工具。

```
sudo raspi-config
```

树莓派的默认用户名和密码分别是 “pi” 和 “raspberry”。在上面的命令中你会被要求输入密码。树莓派配置工具的第一个选项是去修改默认密码，我强烈推荐你修改默认密码，尤其是你基于网络去使用它的时候。

第二个选项是去修改主机名，如果在你的网络中有多个树莓派时，主机名用于区分它们。一个有意义的主机名可以很容易在网络上识别每个设备。

然后进入到接口选项，去启用摄像头、SSH、以及 VNC。如果你在树莓派上使用了一个涉及到多媒体的应用程序，比如，家庭影院系统或者 PC，你也可以去改变音频输出选项。缺省情况下，它的默认输出到 HDMI 接口，但是，如果你使用外部音响，你需要去改变音频输出设置。转到树莓派配置工具的高级配置选项，选择音频，然后选择 “3.5mm” 作为默认输出。

[小提示：使用箭头键去导航，使用回车键去选择]

一旦应用了所有的改变， 树莓派将要求重新启动。你可以从树莓派上拔出显示器、鼠标键盘，以后可以通过网络来管理它。现在可以在你的本地电脑上打开终端。如果你使用的是 Windows，你可以使用 Putty 或者去读我的文章 - 怎么在 Windows 10 上安装 Ubuntu Bash。

在你的本地电脑上输入如下的 SSH 命令：

```
ssh pi@IP_ADDRESS_OF_Pi
```

在我的电脑上，这个命令是这样的：

```
ssh pi@10.0.0.161
```

输入它的密码，你登入到树莓派了！现在你可以从一台远程电脑上去管理你的树莓派。如果你希望通过因特网去管理树莓派，可以去阅读我的文章 -   [如何在你的计算机上启用 RealVNC][8]。

在该系列的下一篇文章中，我将讲解使用你的树莓派去远程管理你的 3D 打印机。

--------------------------------------------------------------------------------

via: https://www.infoworld.com/article/3176488/linux/a-beginner-s-guide-to-raspberry-pi-3.html

作者：[Swapnil Bhartiya][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.infoworld.com/author/Swapnil-Bhartiya/
[1]:https://www.raspberrypi.org/downloads/noobs/
[2]:http://idgenterprise.selz.com
[3]:https://images.techhive.com/images/article/2017/03/content-100711633-large.jpg
[4]:https://images.techhive.com/images/article/2017/03/format-100711635-large.jpg
[5]:http://www.cio.com/article/3176034/linux/how-to-format-an-sd-card-in-linux.html
[6]:https://images.techhive.com/images/article/2017/03/raspi-config-100711634-large.jpg
[7]:https://images.techhive.com/images/article/2017/03/wireless-100711636-large.jpeg
[8]:http://www.infoworld.com/article/3171682/internet-of-things/how-to-access-your-raspberry-pi-remotely-over-the-internet.html
[9]:https://www.infoworld.com/contributor-network/signup.html
