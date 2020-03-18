[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12008-1.html)
[#]: subject: (How to Change MAC Address in Linux)
[#]: via: (https://itsfoss.com/change-mac-address-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/itsfoss/)

如何在 Linux 中更改 MAC 地址
======

在向你展示如何在 Linux 中更改 MAC 地址之前，让我们首先讨论为什么要更改它。

可能有几个原因。也许你不希望在公共网络上公开你的实际 [MAC 地址][1]（也称为物理地址）？还有可能是网络管理员可能已在路由器或防火墙中阻止了特定的 MAC 地址。

一个实用的“好处”是某些公共网络（例如机场 WiFi）允许在有限的时间内免费上网。如果你还想继续使用，那么伪造 Mac 地址可能会欺骗网络，让它认为是一台新设备。这也是一个有名的原因。

![](https://img.linux.net.cn/data/attachment/album/202003/18/120702qdjyb7hvyj7bsrj7.jpg)

我将展示更改 MAC 地址（也称为欺骗/伪造 MAC 地址）的步骤。

### 在 Linux 中更改 MAC 地址

让我们一步步来：

#### 查找你的 MAC 地址和网络接口

让我们找出一些[关于 Linux 中网卡的细节][3]。使用此命令获取网络接口详细信息：

```
ip link show
```

在输出中，你将看到一些详细信息以及 MAC 地址：

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 94:c6:f8:a7:d7:30 brd ff:ff:ff:ff:ff:ff
3: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether 38:42:f8:8b:a7:68 brd ff:ff:ff:ff:ff:ff
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 42:02:07:8f:a7:38 brd ff:ff:ff:ff:ff:ff
```

如你所见，在这里，我的网络接口称为 `enp0s31f6`，MAC 地址为 `38:42:f8:8b:a7:68`。

你可能需要在安全的地方记录下来，以便稍后还原到该原始 MAC 地址。

现在你可以继续更改 MAC 地址。

注意！

如果在当前使用的网络接口上执行此操作，那么可能会中断你的网络连接。因此，请在其他网卡上尝试使用此方法，或者准备重启网络。

#### 方法 1：使用 Macchanger 更改 MAC 地址

![][4]

[Macchanger][5] 是查看、修改和操作网卡 MAC 地址的简单程序。它几乎在所有 GNU/Linux 操作系统中都可用，你可以使用发行版的包安装程序进行安装。

在 Arch Linux 或 Manjaro 上：

```
sudo pacman -S macchanger
```

在 Fedora、CentOS 和 RHEL 上：

```
sudo dnf install macchanger
```

在 Debian、Ubuntu、Linux Mint、Kali Linux 上：

```
sudo apt install macchanger
```

**重要！**系统会要求你选择是否应将 `macchanger` 设置为在每次启动或关闭网络设备时自动运行。每当你接到网线或重启 WiFi 时，它都会提供一个新的 MAC 地址。

![Not a good idea to run it automatically][6]

我建议不要自动运行它，除非你确实需要每次更改 MAC 地址。因此，选择“No”（按 `Tab` 键），然后按回车键继续。

**如何使用 Macchanger 更改 MAC 地址**

你还记得网络接口名称吗？你在前面的步骤中获得了它。

现在，要将随机 MAC 地址分配给该网卡，请使用：

```
sudo macchanger -r enp0s31f6
```

更改 MAC 后，使用以下命令进行验证：

```
ip addr
```

现在你将看到已经伪造 MAC。

要将 MAC 地址更改为特定值，请使用以下命令指定自定义 MAC 地址：

```
macchanger --mac=XX:XX:XX:XX:XX:XX
```

其中 XX:XX:XX:XX:XX:XX 是你要更改的新 MAC。

最后，要将 MAC 地址恢复为其原始硬件值，请运行以下命令：

```
macchanger -p enp0s31f6
```

但是，你不必如此。重启系统后，更改将自动丢失，并且实际的 MAC 地址将再次恢复。

你可以随时查看手册页以获取更多详细信息。

#### 方法 2：使用 iproute2 更改 Mac 地址（中级知识）

我建议你使用 macchanger，但如果你不想使用它，那么可以使用另一种方法在 Linux 中更改 MAC 地址。

首先，使用以下命令关闭网卡：

```
sudo ip link set dev enp0s31f6 down
```

接下来，使用以下命令设置新的 MAC：

```
sudo ip link set dev enp0s31f6 address XX:XX:XX:XX:XX:XX
```

最后，使用以下命令重新打开网络：

```
sudo ip link set dev enp0s31f6 up
```

现在，验证新的 MAC 地址：

```
ip link show enp0s31f6
```

就是这些了。你已经成功地在 Linux 中修改了 MAC 地址。敬请期待 FOSS 更多有关 Linux 教程和技巧的文章。

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-mac-address-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/MAC_address
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/airport_wifi_meme.jpg?ssl=1
[3]: https://itsfoss.com/find-network-adapter-ubuntu-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/Change_MAC_Address_Linux.jpg?ssl=1
[5]: https://github.com/alobbs/macchanger
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/configuring_mcchanger.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Dimitrios.jpg?ssl=1
