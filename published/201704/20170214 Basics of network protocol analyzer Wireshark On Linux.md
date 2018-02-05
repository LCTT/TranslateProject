Linux 下网络协议分析器 Wireshark 使用基础
=================

Wireshark 是 Kali 中预置的众多有价值工具中的一种。与其它工具一样，它可以被用于正面用途，同样也可以被用于不良目的。当然，本文将会介绍如何追踪你自己的网络流量来发现潜在的非正常活动。

Wireshark 相当的强大，当你第一次见到它的时候可能会被它吓到，但是它的目的始终就只有一个，那就是追踪网络流量，并且它所实现的所有选项都只为了加强它追踪流量的能力。

### 安装

Kali 中预置了 Wireshark 。不过，`wireshark-gtk` 包提供了一个更好的界面使你在使用 Wireshark 的时候会有更友好的体验。因此，在使用 Wireshark 前的第一步是安装 `wireshark-gtk` 这个包。

```
# apt install wireshark-gtk
```

如果你的 Kali 是从 live 介质上运行的也不需要担心，依然有效。


### 基础配置

在你使用 Wireshark 之前，将它设置成你使用起来最舒适的状态可能是最好的。Wireshark 提供了许多不同的布局方案和选项来配置程序的行为。尽管数量很多，但是使用起来是相当直接明确的。

从启动 Wireshark-gtk 开始。需要确定启动的是 GTK 版本的。在 Kali 中它们是被分别列出的。

![Wireshark running on Kali](https://linuxconfig.org/images/wireshark-start.jpg?58a2b879) 

### 布局

默认情况下，Wireshark 的信息展示分为三块内容，每一块都叠在另一块上方。（LCTT 译注：这里的三部分指的是展示抓包信息的时候的那三块内容，本段配图没有展示，配图 4、5、6 的设置不是默认设置，与这里的描述不符）最上方的一块是所抓包的列表。中间的一块是包的详细信息。最下面那块中包含的是包的原始字节信息。通常来说，上面的两块中的信息比最下面的那块有用的多，但是对于资深用户来说这块内容仍然是重要信息。

每一块都是可以缩放的，可并不是每一个人都必须使用这样叠起来的布局方式。你可以在 Wireshark 的“选项（Preferences）”菜单中进行更改。点击“编辑（Edit）”菜单，最下方就是的“选项”菜单。这个选项会打开一个有更多选项的新窗口。单击侧边菜单中“用户界面（User Interface）”下的“布局（Layout）”选项。

![Wireshark's layout configuration](https://linuxconfig.org/images/wireshark-layouts.jpg?58a2b879) 

你将会看到一些不同的布局方案。上方的图示可以让你选择不同的面板位置布局方案，下面的单选框可以让你选择不同面板中的数据内容。

下面那个标记为“列（Columns）”的标签可以让你选择展示所抓取包的哪些信息。选择那些你需要的数据信息，或者全部展示。

### 工具条

对于 Wireshark 的工具条能做的设置不是太多，但是如果你想设置的话，你依然在前文中提到的“布局”菜单中的窗口管理工具下方找到一些有用的设置选项。那些能让你配置工具条和工具条中条目的选项就在窗口选项下方。

你还可以在“视图（View）”菜单下勾选来配置工具条的显示内容。

### 功能

主要的用来控制 Wireshark 抓包的控制选项基本都集中在“捕捉（Capture）”菜单下的“选项（Options）”选项中。

在开启的窗口中最上方的“捕捉（Capture）”部分可以让你选择 Wireshark 要监控的某个具体的网络接口。这部分可能会由于你系统的配置不同而会有相当大的不同。要记得勾选正确的选择框才能获得正确的数据。虚拟机和伴随它们一起的网络接口也同样会在这个列表里显示。同样也会有多种不同的选项对应这多种不同的网络接口。

![Wireshark's capture configuration](https://linuxconfig.org/images/wireshark-capture-config.jpg?58a2b879) 

在网络接口列表的下方是两个选项。其中一个选项是全选所有的接口。另一个选项用来选择是否开启混杂模式。这个选项可以使你的计算机监控到所选网络上的所有的计算机。（LCTT 译注：混杂模式可以在 HUB 中或监听模式的交换机接口上捕获那些由于 MAC 地址非本机而会被自动丢弃的数据包）如果你想监控你所在的整个网络，这个选项是你所需要的。

**注意:** 在一个不属于你或者不拥有权限的网络上使用混杂模式来监控是非法的！

在窗口下方的右侧是“显示选项（Display Options）”和“名称解析（Name Resolution）”选项块。对于“显示选项（Display Options）”来说，三个选项全选可能就是一个很好的选择了。当然你也可以取消选择，但是最好还是保留选择“实时更新抓包列表”。

在“名称解析（Name Resolution）”中你也可以设置你的偏好。这里的选项会产生附加的请求因此选得越多就会有越多的请求产生使你的抓取的包列表显得杂乱。把 MAC 解析选项选上是个好主意，那样就可以知道所使用的网络硬件的品牌了。这可以帮助你来确定你是在与哪台设备上的哪个接口进行交互。

### 抓包

抓包是 Wireshark 的核心功能。监控和记录特定网络上的流量就是它最初产生的目的。使用它最基本的方式来作这个抓包的工作是相当简单方便的。当然，越多的配置和选项就越可以充分利用 Wireshark 的力量。这里的介绍的关注点依然还是它最基本的记录方式。

按下那个看起来像蓝色鲨鱼鳍的新建实时抓包按钮就可以开始抓包了。（LCTT 译注：在我的 Debian 上它是绿色的）


![Wireshark listing packet information](https://linuxconfig.org/images/wireshark-packet-list.jpg?58a2b879) 

在抓包的过程中，Wireshark 会收集所有它能收集到的包的数据并且记录下来。如果没有更改过相关设置的话，在抓包的过程中你会看见不断的有新的包进入到“包列表”面板中。你可以实时的查看你认为有趣的包，或者就让 Wireshark 运行着，同时你可以做一些其它的事情。

当你完成了，按下红色的正方形“停止”按钮就可以了。现在，你可以选择是否要保存这些所抓取的数据了。要保存的话，你可以使用“文件”菜单下的“保存”或者是“另存为”选项。

### 读取数据

Wireshark 的目标是向你提供你所需要的所有数据。这样做时，它会在它监控的网络上收集大量的与网络包相关的数据。它使用可折叠的标签来展示这些数据使得这些数据看起来没有那么吓人。每一个标签都对应于网络包中一部分的请求数据。

这些标签是按照从最底层到最高层一层层堆起来的。顶部标签总是包含数据包中包含的字节数据。最下方的标签可能会是多种多样的。在下图的例子中是一个 HTTP 请求，它会包含 HTTP 的信息。您遇到的大多数数据包将是 TCP 数据，它将展示在底层的标签中。

![Wireshark listing HTTP packet info](https://linuxconfig.org/images/wireshark-packet-info-http.jpg?58a2b879) 

每一个标签页都包含了抓取包中对应部分的相关数据。一个 HTTP 包可能会包含与请求类型相关的信息，如所使用的网络浏览器，服务器的 IP 地址，语言，编码方式等的数据。一个 TCP 包会包含服务器与客户端使用的端口信息和 TCP 三次握手过程中的标志位信息。

![Wireshark listing TCP packet info](https://linuxconfig.org/images/wireshark-packet-info-tcp.jpg?58a2b879) 

在上方的其它标签中包含了一些大多数用户都感兴趣的少量信息。其中一个标签中包含了数据包是否是通过 IPv4 或者 IPv6 传输的，以及客户端和服务器端的 IP 地址。另一个标签中包含了客户端和接入因特网的路由器或网关的设备的 MAC 地址信息。

### 结语

即使只使用这些基础选项与配置，你依然可以发现 Wireshark 会是一个多么强大的工具。监控你的网络流量可以帮助你识别、终止网络攻击或者提升连接速度。它也可以帮你找到问题应用。下一篇 Wireshark 指南我们将会一起探索 Wireshark 的包过滤选项。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux

作者：[Nick Congleton][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux
[1]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-1-layout
[2]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-2-toolbars
[3]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-3-functionality
[4]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h1-installation
[5]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-basic-configuration
[6]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h3-capture
[7]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h4-reading-data
[8]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h5-closing-thoughts
