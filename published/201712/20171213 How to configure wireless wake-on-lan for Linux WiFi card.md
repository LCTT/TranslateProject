如何为 Linux 无线网卡配置无线唤醒功能
======

我有一台用于备份我的所有设备的网络存储（NAS）服务器。然而当我备份我的 Linux 笔记本时遇到了困难。当它休眠或挂起时我不能备份它。当我使用基于 Intel 的无线网卡时，我可以配置笔记本上的 WiFi 接受无线唤醒吗？

<ruby>[网络唤醒][2]<rt>Wake-on-LAN</rt></ruby>（WOL）是一个以太网标准，它允许服务器通过一个网络消息而被打开。你需要发送一个“魔法数据包”到支持网络唤醒的以太网卡和主板，以便打开被唤醒的系统。

[![linux-configire-wake-on-wireless-lan-wowlan][1]][1]

<ruby>无线唤醒<rt>wireless wake-on-lan</rt></ruby>（WoWLAN 或 WoW）允许 Linux 系统进入低耗电模式的情况下保持无线网卡处于激活状态，依然与热点连接。这篇教程演示了如何在一台安装无线网卡的 Linux 笔记本或桌面电脑上启用 WoWLAN / WoW 模式。

> 请注意，不是所有的无线网卡和 Linux 驱动程序都支持 WoWLAN。

### 语法

在 Linux 系统上，你需要使用 `iw` 命令来查看和操作无线设备及其配置。 其格式为：

```
iw command
iw [options] command
```

### 列出所有的无线设备及其功能

输入下面命令：

```
$ iw list
$ iw list | more
$ iw dev
```

输出为：

```
phy#0
	Interface wlp3s0
		ifindex 3
		wdev 0x1
		addr 6c:88:14:ff:36:d0
		type managed
		channel 149 (5745 MHz)，width： 40 MHz， center1： 5755 MHz
		txpower 15.00 dBm
```

请记下这个 `phy0`。

### 查看无线唤醒的当前状态

打开终端并输入下面命令来查看无线网络的状态：

```
$ iw phy0 wowlan show
```

输出为：

```
WoWLAN is disabled
```

### 如何启用无线唤醒

启用的语法为：

`sudo iw phy {phyname} wowlan enable {option}`

其中，

1. `{phyname}` - 使用 `iw dev` 来获取其物理名。
2. `{option}` - 可以是 `any`、`disconnect`、`magic-packet` 等。

比如，我想为 `phy0` 开启无线唤醒：

```
$ sudo iw phy0 wowlan enable any
```
或者：

```
$ sudo iw phy0 wowlan enable magic-packet disconnect
```

检查一下：

```
$ iw phy0 wowlan show
```

结果为：

```
WoWLAN is enabled：
 * wake up on disconnect
 * wake up on magic packet
```

### 测试一下

将你的笔记本挂起或者进入休眠模式：

```
$ sudo sh -c 'echo mem > /sys/power/state'
```

从 NAS 服务器上使用 [ping 命令][3] 发送 ping 请求

```
$ ping your-laptop-ip
```

也可以 [使用 `wakeonlan` 命令发送魔法数据包][4]：

```
$ wakeonlan laptop-mac-address-here
$ etherwake MAC-Address-Here
```

### 如何禁用无线唤醒？

语法为：

```
$ sudo phy {phyname} wowlan disable
$ sudo phy0 wowlan disable
```

更多信息请阅读 `iw` 命令的 man 页：

```
$ man iw
$ iw --help
```

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/configure-wireless-wake-on-lan-for-linux-wifi-wowlan-card/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/nixcraft
[1]: https://www.cyberciti.biz/media/new/faq/2017/12/linux-configire-wake-on-wireless-lan-wowlan.jpg
[2]: https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html
[3]: https://www.cyberciti.biz/faq/unix-ping-command-examples/ (See Linux/Unix ping command examples for more info)
[4]: https://www.cyberciti.biz/faq/apple-os-x-wake-on-lancommand-line-utility/
