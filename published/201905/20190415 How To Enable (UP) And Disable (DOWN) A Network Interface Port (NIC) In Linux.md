[#]: collector: (lujun9972)
[#]: translator: (bodhix)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10844-1.html)
[#]: subject: (How To Enable (UP) And Disable (DOWN) A Network Interface Port (NIC) In Linux?)
[#]: via: (https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 中如何启用和禁用网卡？
======

你可能会根据你的需要执行以下命令。我会在这里列举一些你会用到这些命令的例子。

当你添加一个网卡或者从一个物理网卡创建出一个虚拟网卡的时候，你可能需要使用这些命令将新网卡启用起来。另外，如果你对网卡做了某些修改或者网卡本身没有启用，那么你也需要使用以下的某个命令将网卡启用起来。

启用、禁用网卡有很多种方法。在这篇文章里，我们会介绍我们使用过的最好的 5 种方法。

启用禁用网卡可以使用以下 5 个方法来完成：

* `ifconfig` 命令：用于配置网卡。它可以提供网卡的很多信息。
* `ifdown/up` 命令：`ifdown` 命令用于禁用网卡，`ifup` 命令用于启用网卡。
* `ip` 命令：用于管理网卡，用于替代老旧的、不推荐使用的 `ifconfig` 命令。它和 `ifconfig` 命令很相似，但是提供了很多 `ifconfig` 命令所不具有的强大的特性。
* `nmcli` 命令：是一个控制 NetworkManager 并报告网络状态的命令行工具。
* `nmtui` 命令：是一个与 NetworkManager 交互的、基于 curses 图形库的终端 UI 应用。

以下显示的是我的 Linux 系统中可用网卡的信息。

```
# ip a
1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86049sec preferred_lft 86049sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: enp0s8:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:30:5d:52 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.3/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s8
       valid_lft 86049sec preferred_lft 86049sec
    inet6 fe80::32b7:8727:bdf2:2f3/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 1、如何使用 ifconfig 命令启用禁用网卡？

`ifconfig` 命令用于配置网卡。

在系统启动过程中如果需要启用网卡，调用的命令就是 `ifconfig`。`ifconfig` 可以提供很多网卡的信息。不管我们想修改网卡的什么配置，都可以使用该命令。

`ifconfig` 的常用语法：

```
# ifconfig [NIC_NAME] Down/Up
```

执行以下命令禁用 `enp0s3` 网卡。注意，这里你需要输入你自己的网卡名字。

```
# ifconfig enp0s3 down
```

从以下输出结果可以看到网卡已经被禁用了。

```
# ip a | grep -A 1 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
```

执行以下命令启用 `enp0s3` 网卡。

```
# ifconfig enp0s3 up
```

从以下输出结果可以看到网卡已经启用了。

```
# ip a | grep -A 5 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86294sec preferred_lft 86294sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 2、如何使用 ifdown/up 命令启用禁用网卡？

`ifdown` 命令用于禁用网卡，`ifup` 命令用于启用网卡。

注意：这两个命令不支持以 `enpXXX` 命名的新的网络设备。

`ifdown`/`ifup` 的常用语法：

```
# ifdown [NIC_NAME]
# ifup [NIC_NAME]
```

执行以下命令禁用 `eth1` 网卡。

```
# ifdown eth1
```

从以下输出结果可以看到网卡已经被禁用了。

```
# ip a | grep -A 3 "eth1:"
3: eth1:  mtu 1500 qdisc pfifo_fast state DOWN qlen 1000
    link/ether 08:00:27:d5:a0:18 brd ff:ff:ff:ff:ff:ff
```

执行以下命令启用 `eth1` 网卡。

```
# ifup eth1
```

从以下输出结果可以看到网卡已经启用了。

```
# ip a | grep -A 5 "eth1:"
3: eth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:d5:a0:18 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.7/24 brd 192.168.1.255 scope global eth1
    inet6 fe80::a00:27ff:fed5:a018/64 scope link tentative dadfailed
       valid_lft forever preferred_lft forever
```

`ifup` 和 `ifdown` 不支持以 `enpXXX` 命名的网卡。当执行该命令时得到的结果如下：

```
# ifdown enp0s8
Unknown interface enp0s8
```

### 3、如何使用 ip 命令启用禁用网卡？

`ip` 命令用于管理网卡，用于替代老旧的、不推荐使用的 `ifconfig` 命令。

它和 `ifconfig` 命令很相似，但是提供了很多 `ifconfig` 命令不具有的强大的特性。

`ip` 的常用语法：

```
# ip link set  Down/Up
```

执行以下命令禁用 `enp0s3` 网卡。

```
# ip link set enp0s3 down
```

从以下输出结果可以看到网卡已经被禁用了。

```
# ip a | grep -A 1 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
```

执行以下命令启用 `enp0s3` 网卡。

```
# ip link set enp0s3 up
```

从以下输出结果可以看到网卡已经启用了。

```
# ip a | grep -A 5 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86294sec preferred_lft 86294sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 4、如何使用 nmcli 命令启用禁用网卡？

`nmcli` 是一个控制 NetworkManager 并报告网络状态的命令行工具。

`nmcli` 可以用做 nm-applet 或者其他图形化客户端的替代品。它可以用于展示、创建、修改、删除、启用和停用网络连接。除此之后，它还可以用来管理和展示网络设备状态。

`nmcli` 命令大部分情况下都是使用“配置名称”工作而不是“设备名称”。所以，执行以下命令，获取网卡对应的配置名称。（LCTT 译注：在使用 `nmtui` 或者 `nmcli` 管理网络连接的时候，可以为网络连接配置一个名称，就是这里提到的<ruby>配置名称<rt>Profile name</rt></ruby>`）

```
# nmcli con show
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  3d5afa0a-419a-3d1a-93e6-889ce9c6a18c  ethernet  enp0s3
Wired connection 2  a22154b7-4cc4-3756-9d8d-da5a4318e146  ethernet  enp0s8
```

`nmcli` 的常用语法：

```
# nmcli con  Down/Up
```

执行以下命令禁用 `enp0s3` 网卡。在禁用网卡的时候，你需要使用配置名称而不是设备名称。

```
# nmcli con down 'Wired connection 1'
Connection 'Wired connection 1' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/6)
```

从以下输出结果可以看到网卡已经禁用了。

```
# nmcli dev status
DEVICE  TYPE      STATE         CONNECTION
enp0s8  ethernet  connected     Wired connection 2
enp0s3  ethernet  disconnected  --
lo      loopback  unmanaged     --
```

执行以下命令启用 `enp0s3` 网卡。同样的，这里你需要使用配置名称而不是设备名称。

```
# nmcli con up 'Wired connection 1'
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/7)
```

从以下输出结果可以看到网卡已经启用了。

```
# nmcli dev status
DEVICE  TYPE      STATE      CONNECTION
enp0s8  ethernet  connected  Wired connection 2
enp0s3  ethernet  connected  Wired connection 1
lo      loopback  unmanaged  --
```

### 5、如何使用 nmtui 命令启用禁用网卡？

`nmtui` 是一个与 NetworkManager 交互的、基于 curses 图形库的终端 UI 应用。

在启用 `nmtui` 的时候，如果第一个参数没有特别指定，它会引导用户选择对应的操作去执行。

执行以下命令打开 `mntui` 界面。选择 “Active a connection” 然后点击 “OK”。

```
# nmtui
```

![][2]

选择你要禁用的网卡，然后点击 “Deactivate” 按钮，就可以将网卡禁用。

![][3]

如果要启用网卡，使用上述同样的步骤即可。

![][4]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[bodhix](https://github.com/bodhix)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-1.png
[3]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-2.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-3.png
