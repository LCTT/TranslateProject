[#]: collector: "lujun9972"
[#]: translator: "FSSlc"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12599-1.html"
[#]: subject: "Manage network connections from the Linux command line with nmcli"
[#]: via: "https://opensource.com/article/20/7/nmcli"
[#]: author: "Dave McKay https://opensource.com/users/davemckay"

在命令行中使用 nmcli 来管理网络连接
======

> nmcli 命令赋予你直接在 Linux 命令行操作 NetworkManager 工具的能力。

![](https://img.linux.net.cn/data/attachment/album/202009/10/100302z2xq9cieqyekxbdc.jpg)

[nmcli][2] 命令赋予你直接在 Linux 命令行操作 NetworkManager 工具的能力。它是 NetworkManager 软件包集成的一部分，通过使用一些 [应用程序接口][3]（API）来获取 NetworkManager 的功能。

`nmcli` 发布于 2010 年，用以替代其他配置网络接口和连接的方法，例如 [ifconfig][4]。因为它是一个 [命令行界面][5]（CLI）工具，被设计用在终端窗口和脚本中，所以对于那些工作在没有 [图形用户界面][6]（GUI）的系统的管理员来说，它是一个非常理想的工具。

### ncmli 的语法

`nmcli` 命令可以使用*选项*来更改它的行为，使用*子命令*来告诉 `nmcli` 想使用它的那部分功能，使用*操作*来告诉 `nmcli` 你想执行什么操作。

```
$ nmcli <选项> <子命令> <操作>
```

`nmcli` 一共有 8 个子命令，每个子命令有一些相关的网络操作：

  * `help` 提供有关 `nmcli` 命令和使用方法的帮助信息
  * `general` 返回 NetworkManager 的状态和总体配置信息
  * `networking` 提供命令来查询某个网络连接的状态和启动、禁用连接的功能
  * `radio` 提供命令来查询某个 WiFi 网络连接的状态和启动、禁用连接的功能
  * `monitor` 提供命令来监控 NetworkManager 的活动并观察网络连接的状态改变
  * `connection` 提供命令来启用或禁用网络接口、添加新的连接、删除已有连接等功能
  * `device` 主要被用于更改与某个设备（例如接口名称）相关联的连接参数或者使用一个已有的连接来连接设备
  * `secret` 注册 `nmcli` 来作为一个 NetworkManager 的秘密代理，用以监听秘密信息。这个子命令很少会被用到，因为当连接到网络时，`nmcli` 会自动做这些事

### 简单的示例

首先，我们验证一下 NetworkManager 正在运行并且 `nmcli` 可以与之通信：

```
$ nmcli general
STATE      CONNECTIVITY  WIFI-HW  WIFI     WWAN-HW  WWAN    
connected  full          enabled  enabled  enabled  enabled
```

探测总是管理一个系统的首要部分。为了列出内存或磁盘上的网络连接配置，可以使用下面的命令：

```
$ nmcli connection show
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  ac3241e4-b424-35d6-aaa7-07498561688d  ethernet  enp0s3
Wired connection 2  2279d917-fa02-390c-8603-3083ec5a1d3e  ethernet  enp0s8
Wired connection 3  52d89737-de92-35ec-b082-8cf2e5ac36e6  ethernet  enp0s9
```

上面的命令使用了 `connection` 子命令中的 `show` 操作。

用来运行上面这个例子的测试机器上运行着 Ubuntu 20.04，它安装了 3 个网络适配器：`enp0s3`、`enp0s8`和 `enp0s9`。

### 连接管理

理解 `nmcli` 的术语是非常重要的。一个网络<ruby>连接<rt>connection</rt></ruby>包含了一个连接的所有信息。你可以将它看作一个网络<ruby>配置<rt>configuration</rt></ruby>。“连接”包含了与其相关的所有信息，包括 [数据链路层][7] 和 [IP 地址信息][8] 。它们是 [OSI 网络模型][9] 中的第 2 和第 3 层。

当你在 Linux 上配置网络时，通常来说你是在为某个网络设备（它们是安装在一个电脑中的网络接口）配置连接。当一个连接被某个设备所使用，那么就可以说这个连接被<ruby>激活<rt>active</rt></ruby>或者<ruby>上线<rt>up</rt></ruby>了，反之是<ruby>停用<rt>inactive</rt></ruby>或<ruby>下线<rt>down</rt></ruby>。

#### 添加网络连接

`nmcli` 允许你快速地创建网络连接并同时为该连接指定参数。为了通过使用“有线连接 2” `enp0s8` 来创建一个新的连接，你可以利用 `sudo` 来运行下面的命令：

```
$ sudo nmcli connection add type ethernet ifname enp0s8
Connection 'ethernet-enp0s8' (09d26960-25a0-440f-8b20-c684d7adc2f5) successfully added.
```

其中 `type` 选项指定需要一个 [Ethernet][10] 类型的连接，而 `ifname`（接口名）选项指定你想要为这个连接使用的网络接口设备。

让我们看看发生了什么变化：

```
$ nmcli connection show
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  ac3241e4-b424-35d6-aaa7-07498561688d  ethernet  enp0s3
Wired connection 2  2279d917-fa02-390c-8603-3083ec5a1d3e  ethernet  enp0s8
Wired connection 3  52d89737-de92-35ec-b082-8cf2e5ac36e6  ethernet  enp0s9
ethernet-enp0s8     09d26960-25a0-440f-8b20-c684d7adc2f5  ethernet  --  
```

通过上图可以看到新的连接 `ethernet-enp0s8` 已经创建好了。它的 <ruby>[通用唯一标识符][11]<rt>Universally Unique IDentifier</rt></ruby>（UUID）也一同被赋予，并且其连接类型为 “Ethernet”。我们可以使用 `up` 子命令再加上连接名称（或 UUID）来使得这个连接被激活：

```
$ nmcli connection up ethernet-enp0s8
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/4)
```

再次查看激活的连接：

```
$ nmcli connection show --active
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  ac3241e4-b424-35d6-aaa7-07498561688d  ethernet  enp0s3
ethernet-enp0s8     09d26960-25a0-440f-8b20-c684d7adc2f5  ethernet  enp0s8
Wired connection 3  52d89737-de92-35ec-b082-8cf2e5ac36e6  ethernet  enp0s9
```

可以看到新的连接 `ethernet-enp0s8` 现在已经被激活了，并且与 `enp0s8` 网络接口设备绑定。

#### 调整连接

`nmcli` 命令使得调整现有连接的参数变得更加容易。也许你想将某个网络接口从 <ruby>[动态主机配置协议][12]<rt>Dynamic Host Configuration Protocol</rt></ruby>（DHCP）改为静态 IP 地址。

假设你需要为你的新连接分配一个固定的 IP 地址 `192.168.4.26`，那么你需要使用两个命令，一个用于设定 IP 地址，另一个用来将获取 IP 地址的方法改为 `manual`（手动）：

```
$ nmcli connection modify ethernet-enp0s8 ipv4.address 192.168.4.26/24
$ nmcli connection modify ethernet-enp0s8 ipv4.method manual
```

记得指定 [子网掩码][13]，在我们这个测试的连接中，它是 <ruby>[无类域间路由][14]<rt> Classless Inter-Domain Routing</rt></ruby>（CIDR）中的 `255.255.255.0` 或 `/24`

为了使得你的更改生效，你需要通过停止再重新启用该连接。下面的第一个命令是停用该连接，第二个命令则是启用它：

```
$ nmcli connection down ethernet-enp0s8
Connection 'ethernet-enp0s8' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/4)
$ nmcli connection up ethernet-enp0s8
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/6)
```

假如你想将连接设置为使用 DHCP，则需要将上面的 `manual` 改为 `auto`（自动）：

```
$ nmcli connection modify ethernet-enp0s8 ipv4.method auto
```

### 设备管理

`nmcli` 命令中的 `device` 子命令允许你管理安装在你电脑中的网络接口。

#### 检查设备状态

可以使用下面的命令来快速检查所有网络接口的状态：

```
$ nmcli device status
DEVICE  TYPE      STATE      CONNECTION        
enp0s3  ethernet  connected  Wired connection 1
enp0s8  ethernet  connected  ethernet-enp0s8    
enp0s9  ethernet  connected  Wired connection 3
lo      loopback  unmanaged  --  
```

#### 显示设备详情

为了检查某个网络接口的详情，可以使用 `device` 子命令中的 `show` 操作。假如你不提供某个设备的名称，那么会获取并展示所有设备的详情。你可以上下翻动来查看这些信息。

要查看你最近添加的连接所对应的设备 `enp0s8`，你可以使用下面的命令，请注意验证它使用的 IP 地址是否为先前你要求设置的那个：

```
$ nmcli device show enp0s8
GENERAL.DEVICE:                         enp0s8
GENERAL.TYPE:                           ethernet
GENERAL.HWADDR:                         08:00:27:81:16:20
GENERAL.MTU:                            1500
GENERAL.STATE:                          100 (connected)
GENERAL.CONNECTION:                     ethernet-enp0s8
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/6
WIRED-PROPERTIES.CARRIER:               on
IP4.ADDRESS[1]:                         192.168.4.26/24
IP4.GATEWAY:                            --
IP4.ROUTE[1]:                           dst = 192.168.4.0/24, nh = 0.0.0.0, mt = 103
IP6.ADDRESS[1]:                         fe80::6d70:90de:cb83:4491/64
IP6.GATEWAY:                            --
IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 103
IP6.ROUTE[2]:                           dst = ff00::/8, nh = ::, mt = 256, table=255
```

上面的输出非常细致，它主要显示了下面这些内容：

  * **网络接口名称**，在这个示例中是 `enp0s8`，它是 [udev][15] 分配的
  * **网络连接类型**，在这个示例中是物理的 Ethernet 连接
  * 设备的<ruby>媒介访问控制<rt>media access control</rt></ruby>（MAC）地址，它被用来在网络中识别该设备
  * [最大传输单元][17]，在单个传输中最大协议数据单位的大小，任何大于这个大小的数据将被分为多个包来进行传输
  * 该设备**当前已经处于连接状态**
  * 这个设备使用的连接名称是 `ethernet-enp0s8`
  * 这个设备使用的 IP 地址如上面所要求的那样，被设置为 `192.168.4.26/24`

其他的信息则是与这个设备连接的网络相关的默认路由和网关设置信息。

#### nmcli 的交互式编辑器

尽管 `nmcli` 是一个命令行工具，但它还包含一个基本的交互式编辑器，`edit` 子命令将为你指定的连接打开一个交互式编辑器，例如：

```
$ nmcli connection edit ethernet-enp0s8
```

它将显示少量的帮助文字，接着是 `nmcli` 的命令提示符：

```
===| nmcli interactive connection editor |===

Editing existing '802-3-ethernet' connection: 'ethernet-enp0s8'

Type 'help' or '?' for available commands.
Type 'print' to show all the connection properties.
Type 'describe [<setting>.<prop>]' for detailed property description.

You may edit the following settings: connection, 802-3-ethernet (ethernet), 802-1x, dcb, sriov, ethtool, match, ipv4, ipv6, tc, proxy
nmcli>
```

假如你输入 `print` 然后敲击 `Enter` 键， `nmcli` 将列举出与这个接口相关的所有属性。这些属性有很多，你可以上下翻动来查看这个列表：

```
===============================================================================
                 Connection profile details (ethernet-enp0s8)
===============================================================================
connection.id:                          ethernet-enp0s8
connection.uuid:                        09d26960-25a0-440f-8b20-c684d7adc2f5
connection.stable-id:                   --
connection.type:                        802-3-ethernet
connection.interface-name:              enp0s8
connection.autoconnect:                 yes
connection.autoconnect-priority:        0
connection.autoconnect-retries:         -1 (default)
connection.multi-connect:               0 (default)
connection.auth-retries:                -1
connection.timestamp:                   1593967212
connection.read-only:                   no
connection.permissions:                 --
connection.zone:                        --
connection.master:                      --
connection.slave-type:                  --
connection.autoconnect-slaves:          -1 (default)
connection.secondaries:                 --
```

如果你想将你的连接改为 DHCP，则请输入 `goto ipv4` 然后敲 `Enter` 键：

```
nmcli> goto ipv4
You may edit the following properties: method, dns, dns-search, dns-options, dns-priority, addresses, gateway, routes, route-metric, route-table, routing-rules, ignore-auto-routes, ignore-auto-dns, dhcp-client-id, dhcp-iaid, dhcp-timeout, dhcp-send-hostname, dhcp-hostname, dhcp-fqdn, dhcp-hostname-flags, never-default, may-fail, dad-timeout
nmcli ipv4>
```

你想改变的属性是 `method`，再继续敲 `set method auto` 然后敲 `Enter` 键：

```
nmcli ipv4> set method auto
Do you also want to clear 'ipv4.addresses'? [yes]:
```

假如你想让这个连接清除掉这个静态 IP 地址，则请敲 `Enter` 键，如果要保留，则输入 `no` 然后敲 `Enter` 键。假如你想在将来再次使用它，你可以保留这个 IP 地址。即便存储了一个静态的 IP 地址，如果 `method` 被设置为 `auto` ，它仍然会使用 DHCP。

最后输入 `save` 来保存你的更改：

```
nmcli ipv4> save
Connection 'ethernet-enp0s8' (09d26960-25a0-440f-8b20-c684d7adc2f5) successfully updated.
nmcli ipv4>
```

输入 `quit` 来离开 `nmcli` 的交互式编辑器窗口。假如你不想离开，可以输入 `back` 来回到最开始的命令行提示符界面，然后继续使用这个编辑器。

### nmcli 的更多内容

浏览交互式编辑器，你就可以看到 `nmcli` 有多少设定和每个设定有多少属性。交互式编辑器是一个简洁的工具，但如果需要在命令行或者在脚本中使用 `nmcli`，你还是需要使用常规的命令行版本。

现在你有了这些基础知识，你还可以查看 `nmcli` 的 [man 页面][2] 来查看它还可以提供什么更多功能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/nmcli

作者：[Dave McKay][a]
选题：[lujun9972][b]
译者：[FSSLC](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/davemckay
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF "Woman using laptop concentrating"
[2]: https://developer.gnome.org/NetworkManager/stable/nmcli.html
[3]: https://en.wikipedia.org/wiki/Application_programming_interface
[4]: https://man7.org/linux/man-pages/man8/ifconfig.8.html
[5]: https://en.wikipedia.org/wiki/Command-line_interface
[6]: https://en.wikipedia.org/wiki/Graphical_user_interface
[7]: https://en.wikipedia.org/wiki/Data_link_layer
[8]: https://en.wikipedia.org/wiki/IP_address
[9]: https://en.wikipedia.org/wiki/OSI_model
[10]: https://en.wikipedia.org/wiki/Ethernet
[11]: https://en.wikipedia.org/wiki/Universally_unique_identifier
[12]: https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol
[13]: https://en.wikipedia.org/wiki/Subnetwork
[14]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[15]: https://en.wikipedia.org/wiki/Udev
[16]: https://en.wikipedia.org/wiki/MAC_address
[17]: https://en.wikipedia.org/wiki/Maximum_transmission_unit

