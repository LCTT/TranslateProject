[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11149-1.html)
[#]: subject: (Bond WiFi and Ethernet for easier networking mobility)
[#]: via: (https://fedoramagazine.org/bond-wifi-and-ethernet-for-easier-networking-mobility/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

绑定 WiFi 和以太网，以使网络间移动更轻松
======

![][1]

有时一个网络接口是不够的。网络绑定允许将多条网络连接与单个逻辑接口一起工作。你可能因为需要给单条连接更多的带宽而这么做，或者你可能希望在有线和无线网络之间来回切换而不会丢失网络连接。

我是后面一种情况。在家工作的好处之一是，当天气晴朗时，在阳光明媚的阳台而不是在室内工作是很愉快的。但每当我这样做时，我都会失去网络连接。IRC、SSH、VPN，一切都断开了，客户端重连至少需要一会。本文介绍了如何在 Fedora 30 笔记本上设置网络绑定，以便从笔记本扩展坞的有线连接无缝切换到 WiFi。

在 Linux 中，接口绑定由内核模块 `bonding` 处理。默认情况下，Fedora 没有启用此功能，但它包含在 `kernel-core` 软件包中。这意味着启用接口绑定只需一个命令：

```
sudo modprobe bonding
```

请注意，这只会在你重启之前生效。要永久启用接口绑定，请在 `/etc/modules-load.d` 目录中创建一个名为 `bonding.conf` 的文件，该文件仅包含单词 `bonding`。

现在你已启用绑定，现在可以创建绑定接口了。首先，你必须获取要绑定的接口的名称。要列出可用的接口，请运行：

```
sudo nmcli device status
```

你将看到如下输出：

```
DEVICE          TYPE      STATE         CONNECTION
enp12s0u1       ethernet  connected     Wired connection 1
tun0            tun       connected     tun0
virbr0          bridge    connected     virbr0
wlp2s0          wifi      disconnected  --
p2p-dev-wlp2s0  wifi-p2p  disconnected  --
enp0s31f6       ethernet  unavailable   --
lo              loopback  unmanaged     --
virbr0-nic      tun       unmanaged     --
```

在本例中，有两个（有线）以太网接口可用。 `enp12s0u1` 在笔记本电脑扩展坞上，你可以通过 `STATE` 列知道它已连接。另一个是 `enp0s31f6`，是笔记本电脑中的内置端口。还有一个名为 `wlp2s0` 的 WiFi 连接。 `enp12s0u1` 和 `wlp2s0` 是我们在这里感兴趣的两个接口。（请注意，阅读本文无需了解网络设备的命名方式，但如果你感兴趣，可以查看 [systemd.net-naming-scheme 手册页][2]。）

第一步是创建绑定接口：

```
sudo nmcli connection add type bond ifname bond0 con-name bond0
```

在此示例中，绑定接口名为 `bond0`。`con-name bond0` 将连接名称设置为 `bond0`。直接这样做会有一个名为 `bond-bond0` 的连接。你还可以将连接名设置得更加人性化，例如 “Docking station bond” 或 “Ben”。

下一步是将接口添加到绑定接口：

```
sudo nmcli connection add type ethernet ifname enp12s0u1 master bond0 con-name bond-ethernet
sudo nmcli connection add type wifi ifname wlp2s0 master bond0 ssid Cotton con-name bond-wifi
```

如上所示，连接名称被设置为[更具描述性][3]。请务必使用系统上相应的接口名称替换 `enp12s0u1` 和 `wlp2s0`。对于 WiFi 接口，请使用你自己的网络名称 （SSID）替换我的 “Cotton”。如果你的 WiFi 连接有密码（这当然会有！），你也需要将其添加到配置中。以下假设你使用 [WPA2-PSK][4] 身份验证

```
sudo nmcli connection modify bond-wifi wifi-sec.key-mgmt wpa-psk
sudo nmcli connection edit bond-wif
```

第二条命令将进入交互式编辑器，你可以在其中输入密码，而无需将其记录在 shell 历史记录中。输入以下内容，将 `password` 替换为你的实际密码。

```
set wifi-sec.psk password
save
quit
```

现在，你可以启动你的绑定接口以及你创建的辅助接口。

```
sudo nmcli connection up bond0
sudo nmcli connection up bond-ethernet
sudo nmcli connection up bond-wifi
```

你现在应该能够在不丢失网络连接的情况下断开有线或无线连接。

### 警告：使用其他 WiFi 网络时

在指定的 WiFi 网络间移动时，此配置很有效，但是当远离此网络时，那么绑定中使用的 SSID 就不可用了。从理论上讲，可以为每个使用的 WiFi 连接添加一个接口，但这似乎并不合理。相反，你可以禁用绑定接口：

```
sudo nmcli connection down bond0
```

回到定义的 WiFi 网络时，只需按上述方式启动绑定接口即可。

### 微调你的绑定

默认情况下，绑定接口使用“<ruby>轮询<rt>round-robin</rt></ruby>”模式。这会在接口上平均分配负载。但是，如果你有有线和无线连接，你可能希望更喜欢有线连接。 `active-backup` 模式能实现此功能。你可以在创建接口时指定模式和主接口，或者之后使用此命令（绑定接口应该关闭）：

```
sudo nmcli connection modify bond0 +bond.options "mode=active-backup,primary=enp12s0u1"
```

[内核文档][5]提供了有关绑定选项的更多信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bond-wifi-and-ethernet-for-easier-networking-mobility/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/networkingmobility-816x345.jpg
[2]: https://www.freedesktop.org/software/systemd/man/systemd.net-naming-scheme.html
[3]: https://en.wikipedia.org/wiki/Master/slave_(technology)#Terminology_concerns
[4]: https://en.wikipedia.org/wiki/Wi-Fi_Protected_Access#Target_users_(authentication_key_distribution)
[5]: https://www.kernel.org/doc/Documentation/networking/bonding.txt
