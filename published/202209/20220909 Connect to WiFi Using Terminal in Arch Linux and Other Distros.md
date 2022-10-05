[#]: subject: "Connect to WiFi Using Terminal in Arch Linux and Other Distros"
[#]: via: "https://www.debugpoint.com/connect-wifi-terminal-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15067-1.html"

在 Arch Linux 和其他发行版中使用终端连接到 WiFi
======

![](https://img.linux.net.cn/data/attachment/album/202209/24/185145fcas1rje3f8pr8sa.jpg)

> 本快速指南介绍了在 Arch Linux 和其他发行版中使用终端设置和连接 WiFi 所需的步骤。

本指南非常适合没有 GUI 只有终端且没有其他有线互联网连接可用的情况。这些步骤可帮助你手动检测无线网卡和设备，并通过终端密码验证连接到 WiFi 热点。

本指南使用 [iwd][1]（Net Wireless Daemon）通过终端连接到 WiFi。

### 在 Arch Linux 和其他发行版中使用终端连接到 WiFi

#### 1、设置 iwd

`iwd` 包有三个主要模块：

- `iwctl`：无线客户端
- `iwd`：守护进程
- `iwmon`：监控工具

在终端中输入：

```
iwctl
```

![iwctl 提示符][2]

如果找不到该命令，那么需要从 [此处][3] 下载安装包。

从任何其他具有互联网连接的系统/笔记本电脑获取帮助，以通过安装 USB 下载和安装软件包。

或者，如果你有一个可连接互联网的 USB 网卡，那么将其插入你的系统。并通过以下命令安装。

USB 网卡应该可以在 Arch 和当今大多数 Linux 系统中开箱即用，连接到互联网。

**Arch：**

```
pacman -S iwd
```

**Debian、Ubuntu 和其他类似发行版：**

```
sudo apt-get install iwd
```

**Fedora：**

```
sudo dnf install iwd
```

如果你看到了 `iwctl` 提示符（如下所示），那么继续下一步。

#### 2、配置

运行以下命令以获取系统的**无线设备名称**。

```
device list
```

![iwctl – 设备列表][4]

要**获取 WiFi 网络列表**，请运行以下命令。在以下命令和所有其他命令中将 `wlan0` 替换为你的设备名称。

```
station wlan0 get-networks
```

![iwctl – 可用网络][5]

该命令为你提供具有安全类型和信号强度的可用 WiFi 网络列表。

#### 3、连接

要**连接到 WiFi 网络**，请使用上述 `get-networks` 命令中的 WiFi 接入点名称运行以下命令。

```
station wlan0 connect
```

出现提示时输入你的 WiFi 密码。

![使用 iwctl 连接到 WiFi][6]

如果一切顺利，你现在可以连接到互联网。

### 使用指南

如下所示，你可以使用简单的 `ping` 命令检查连接。`ping` 回复成功的数据包传输表示连接稳定。

```
ping -c 3 google.com
```

你还可以使用以下命令检查连接状态。

```
station wlan0 show
```

`iwd` 在 `/var/lib/iwd` 中保存 `.psk` 后缀的配置文件，其中带有你的接入点名称。此文件包含使用你的 WiFi 网络的密码和 SSID 生成的哈希文件。

按 `CTRL+D` 退出 `iwctl` 提示符。

### 总结

我希望本指南可以帮助你通过终端连接到互联网。当你没有其他方式连接到 WiFi 时，这会有所帮助。例如，如果你在独立系统（不是 VM）中安装 Arch Linux，那么需要连接到互联网以通过终端使用 `pacman` 下载软件包。

如果你遇到任何问题，请在下面的评论栏中指出错误消息。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/connect-wifi-terminal-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.archlinux.org/index.php/Iwd
[2]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-Prompt.jpg
[3]: https://www.archlinux.org/packages/?name=iwd
[4]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-device-list-2.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-available-networks.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2020/11/connect-to-WiFi-using-iwctl.jpg
