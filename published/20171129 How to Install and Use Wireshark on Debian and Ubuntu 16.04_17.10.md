如何安装并使用 Wireshark
======

[![wireshark-Debian-9-Ubuntu 16.04 -17.10](https://www.linuxtechi.com/wp-content/uploads/2017/11/wireshark-Debian-9-Ubuntu-16.04-17.10.jpg)][2]

Wireshark 是自由开源的、跨平台的基于 GUI 的网络数据包分析器，可用于 Linux、Windows、MacOS、Solaris 等。它可以实时捕获网络数据包，并以人性化的格式呈现。Wireshark 允许我们监控网络数据包直到其微观层面。Wireshark 还有一个名为 `tshark` 的命令行实用程序，它与 Wireshark 执行相同的功能，但它是通过终端而不是 GUI。

Wireshark 可用于网络故障排除、分析、软件和通信协议开发以及用于教育目的。Wireshark 使用 `pcap` 库来捕获网络数据包。

Wireshark 具有许多功能：

* 支持数百项协议检查
* 能够实时捕获数据包并保存，以便以后进行离线分析
* 许多用于分析数据的过滤器
* 捕获的数据可以即时压缩和解压缩
* 支持各种文件格式的数据分析，输出也可以保存为 XML、CSV 和纯文本格式
* 数据可以从以太网、wifi、蓝牙、USB、帧中继、令牌环等多个接口中捕获

在本文中，我们将讨论如何在 Ubuntu/Debian 上安装 Wireshark，并将学习如何使用 Wireshark 捕获网络数据包。

#### 在 Ubuntu 16.04 / 17.10 上安装 Wireshark

Wireshark 在 Ubuntu 默认仓库中可用，只需使用以下命令即可安装。但有可能得不到最新版本的 wireshark。

```
linuxtechi@nixworld:~$ sudo apt-get update
linuxtechi@nixworld:~$ sudo apt-get install wireshark -y
```

因此，要安装最新版本的 wireshark，我们必须启用或配置官方 wireshark 仓库。

使用下面的命令来配置仓库并安装最新版本的 wireshark 实用程序。

```
linuxtechi@nixworld:~$ sudo add-apt-repository ppa:wireshark-dev/stable
linuxtechi@nixworld:~$ sudo apt-get update
linuxtechi@nixworld:~$ sudo apt-get install wireshark -y
```

一旦安装了 wireshark，执行以下命令，以便非 root 用户也可以捕获接口的实时数据包。

```
linuxtechi@nixworld:~$ sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
```

#### 在 Debian 9 上安装 Wireshark

Wireshark 包及其依赖项已存在于 debian 9 的默认仓库中，因此要在 Debian 9 上安装最新且稳定版本的 Wireshark，请使用以下命令：

```
linuxtechi@nixhome:~$ sudo apt-get update
linuxtechi@nixhome:~$ sudo apt-get install wireshark -y
```

在安装过程中，它会提示我们为非超级用户配置 dumpcap，

选择 `yes` 并回车。

[![Configure-Wireshark-Debian9](https://www.linuxtechi.com/wp-content/uploads/2017/11/Configure-Wireshark-Debian9-1024x542.jpg)][3] 

安装完成后，执行以下命令，以便非 root 用户也可以捕获接口的实时数据包。

```
linuxtechi@nixhome:~$ sudo chmod +x /usr/bin/dumpcap
```

我们还可以使用最新的源代码包在 Ubuntu/Debian 和其它 Linux 发行版上安装 wireshark。

#### 在 Debian / Ubuntu 系统上使用源代码安装 Wireshark

首先下载最新的源代码包（写这篇文章时它的最新版本是 2.4.2），使用以下命令：

```
linuxtechi@nixhome:~$ wget https://1.as.dl.wireshark.org/src/wireshark-2.4.2.tar.xz
```

然后解压缩包，进入解压缩的目录：

```
linuxtechi@nixhome:~$ tar -xf wireshark-2.4.2.tar.xz -C /tmp
linuxtechi@nixhome:~$ cd /tmp/wireshark-2.4.2
```

现在我们使用以下命令编译代码：

```
linuxtechi@nixhome:/tmp/wireshark-2.4.2$ ./configure --enable-setcap-install
linuxtechi@nixhome:/tmp/wireshark-2.4.2$ make
```

最后安装已编译的软件包以便在系统上安装 Wireshark：

```
linuxtechi@nixhome:/tmp/wireshark-2.4.2$ sudo make install
linuxtechi@nixhome:/tmp/wireshark-2.4.2$ sudo ldconfig
```

在安装后，它将创建一个单独的 Wireshark 组，我们现在将我们的用户添加到组中，以便它可以与 Wireshark 一起使用，否则在启动 wireshark 时可能会出现 “permission denied（权限被拒绝）”错误。

要将用户添加到 wireshark 组，执行以下命令：

```
linuxtechi@nixhome:~$ sudo usermod -a -G wireshark linuxtechi
```

现在我们可以使用以下命令从 GUI 菜单或终端启动 wireshark：

```
linuxtechi@nixhome:~$ wireshark
```

#### 在 Debian 9 系统上使用 Wireshark

[![Access-wireshark-debian9](https://www.linuxtechi.com/wp-content/uploads/2017/11/Access-wireshark-debian9-1024x664.jpg)][4] 

点击 Wireshark 图标。

[![Wireshark-window-debian9](https://www.linuxtechi.com/wp-content/uploads/2017/11/Wireshark-window-debian9-1024x664.jpg)][5] 

#### 在 Ubuntu 16.04 / 17.10 上使用 Wireshark

[![Access-wireshark-Ubuntu](https://www.linuxtechi.com/wp-content/uploads/2017/11/Access-wireshark-Ubuntu-1024x664.jpg)][6] 

点击 Wireshark 图标。

[![Wireshark-window-Ubuntu](https://www.linuxtechi.com/wp-content/uploads/2017/11/Wireshark-window-Ubuntu-1024x664.jpg)][7] 

#### 捕获并分析数据包

一旦 wireshark 启动，我们就会看到 wireshark 窗口，上面有 Ubuntu 和 Debian 系统的示例。

[![wireshark-Linux-system](https://www.linuxtechi.com/wp-content/uploads/2017/11/wireshark-Linux-system.jpg)][8] 

所有这些都是我们可以捕获网络数据包的接口。根据你系统上的接口，此屏幕可能与你的不同。

我们选择 `enp0s3` 来捕获该接口的网络流量。选择接口后，在我们网络上所有设备的网络数据包开始填充（参考下面的屏幕截图）：

[![Capturing-Packet-from-enp0s3-Ubuntu-Wireshark](https://www.linuxtechi.com/wp-content/uploads/2017/11/Capturing-Packet-from-enp0s3-Ubuntu-Wireshark-1024x727.jpg)][9] 

第一次看到这个屏幕，我们可能会被这个屏幕上显示的数据所淹没，并且可能已经想过如何整理这些数据，但不用担心，Wireshark 的最佳功能之一就是它的过滤器。

我们可以根据 IP 地址、端口号，也可以使用来源和目标过滤器、数据包大小等对数据进行排序和过滤，也可以将两个或多个过滤器组合在一起以创建更全面的搜索。我们也可以在 “Apply a Display Filter（应用显示过滤器）”选项卡中编写过滤规则，也可以选择已创建的规则。要选择之前构建的过滤器，请单击 “Apply a Display Filter（应用显示过滤器）”选项卡旁边的旗帜图标。

[![Filter-in-wireshark-Ubuntu](https://www.linuxtechi.com/wp-content/uploads/2017/11/Filter-in-wireshark-Ubuntu-1024x727.jpg)][10] 

我们还可以根据颜色编码过滤数据，默认情况下，浅紫色是 TCP 流量，浅蓝色是 UDP 流量，黑色标识有错误的数据包，看看这些编码是什么意思，点击 “View -> Coloring Rules”，我们也可以改变这些编码。

[![Packet-Colouring-Wireshark](https://www.linuxtechi.com/wp-content/uploads/2017/11/Packet-Colouring-Wireshark-1024x682.jpg)][11] 

在我们得到我们需要的结果之后，我们可以点击任何捕获的数据包以获得有关该数据包的更多详细信息，这将显示该网络数据包的所有数据。

Wireshark 是一个非常强大的工具，需要一些时间来习惯并对其进行命令操作，本教程将帮助你入门。请随时在下面的评论框中提出你的疑问或建议。


--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-use-wireshark-debian-9-ubuntu/

作者：[Pradeep Kumar][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/author/pradeep/
[2]:https://www.linuxtechi.com/wp-content/uploads/2017/11/wireshark-Debian-9-Ubuntu-16.04-17.10.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Configure-Wireshark-Debian9.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Access-wireshark-debian9.jpg
[5]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Wireshark-window-debian9.jpg
[6]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Access-wireshark-Ubuntu.jpg
[7]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Wireshark-window-Ubuntu.jpg
[8]:https://www.linuxtechi.com/wp-content/uploads/2017/11/wireshark-Linux-system.jpg
[9]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Capturing-Packet-from-enp0s3-Ubuntu-Wireshark.jpg
[10]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Filter-in-wireshark-Ubuntu.jpg
[11]:https://www.linuxtechi.com/wp-content/uploads/2017/11/Packet-Colouring-Wireshark.jpg
