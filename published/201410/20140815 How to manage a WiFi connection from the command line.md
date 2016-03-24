在命令行中管理 Wifi 连接
================================================================================
无论何时要安装一款新的 Linux 发行系统，一般的建议都是让您通过有线连接来接到互联网的。这主要的原因有两条：第一，您的无线网卡也许安装的驱动不正确而不能用；第二，如果您是从命令行中来安装系统的，管理 WiFi 就非常可怕。我总是试图避免在命令行中处理 WiFi 。但 Linux 的世界，应具有无所畏惧的精神。如果您不知道怎样操作，您需要继续往下来学习之，这就是写这篇文章的唯一原因。所以我迫使自己学习如何在命令行中管理 WiFi 连接。

通过命令行来设置连接到 WiFi 当然有很多种方法，但在这篇文章里，同时也是一个建议，我使用最基本的方法：那就是使用在任何发布版本中都有的包含在“默认包”里的程序和工具。或者说我偏向于使用这一种方法。使用此方法显而易见的好处是这个操作过程能在任意有 Linux 系统的机器上复用。不好的一点是它相对来说比较复杂。

首先，我假设您们都已经正确安装了无线网卡的驱动程序。没有这前提，后续的一切都如镜花水月。如果您你机器确实没有正确安装上，您应该看看关于您的发布版本的维基和文档。

然后您就可以用如下命令来检查是哪一个接口来支持无线连接的：

    $ iwconfig

![](https://farm6.staticflickr.com/5578/14725621337_b174a3029c_z.jpg)

一般来说，无线接口都叫做 wlan0。当然也有例外的，但在这篇教程中我们将会一直用通用叫法。

以防万一，你得确认下以使此接口服务是启动着的：

    $ sudo ip link set wlan0 up

一但确认了无线接口是工作着的，你就可以用如下命令来扫描附近的无线网络了：

    $ sudo iw dev wlan0 scan | less 

![](https://farm4.staticflickr.com/3847/14909117931_e2f3d0feb0_z.jpg)

根据扫描出的结果，可以得到网络的名字（它的 SSID），它的信息强度，以及它使用的是哪个安全加密的（如：WEP、WPA/WPA2）。从此时起，将会分成两条路线：情况很好、很容易的以及情况稍微复杂的。

如果您想连接的网络是没有加密的，您可以用下面的命令直接连接：

    $ sudo iw dev wlan0 connect [网络 SSID]

如果网络是用 WEP 加密的，也非常容易：

    $ sudo iw dev wlan0 connect [网络 SSID] key 0:[WEP 密钥]

但网络使用的是 WPA 或 WPA2 协议的话，事情就不好办了。这种情况，您就得使用叫做 wpa_supplicant 的工具，它默认是没有的。然后需要修改 /etc/wpa_supplicant/wpa_supplicant.conf 文件，增加如下行：

    network={
        ssid="[网络 ssid]"
        psk="[密码]"
        priority=1
    }

我建议你​​在文件的末尾添加它，并确保其他配置都注释掉。要注意 SSID 和密码字串都是大小写敏感的。在技术上您也可以把接入点的名称当做是 SSID，使用 wpa_supplicant 工具的话会有合适的 SSID 来替代这个名字。 

一旦配置文件修改完成后，在后台启动此命令：

    $ sudo wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf

最后，无论是连到开放的网络还是加密的安全网络，您都得获取 IP 地址。简单地使用如下命令：

    $ sudo dhcpcd wlan0

如果一切顺利的话，您应该已经通过 DHCP 获取到了一个全新的本地 IP，这个过程是在后台自动完成的。如果想确认下是否真正连接上的话，您可以再一次输入如下命令检查：

    $ iwconfig

![](https://farm4.staticflickr.com/3904/14725573368_7110407db8_z.jpg)

最后，我认为多次重复第一步的检查操作是很有必要的。您永远不会知道什么时候您的图形用户界面挂了，或者是什么时候不能访问无线连接了，所以现在就准备着用命令来检测吧。还有，前面提到过的，有很多种方式（如 NetworkManager、[wicd][1]、[netcfg][2]、[wifi][3] 等等）来管理无线连接。我坚持使用最基本的方式，但在某些情况下，我使用的工具可能您还没有，所以您在之前就得先下载它们。另一方面，有很多高级的应用程序，他们确实是不包含在“默认包”里面的，使用它们会大大简化操作过程。但一般建议是开始的话最好从基本的来。

关于从命令行来管理连接 WiFi 您还有其他方式方法吗？请在评论中让我们知道。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/manage-wifi-connection-command-line.html

作者：[Adrien Brochard][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://wicd.sourceforge.net/
[2]:https://www.archlinux.org/netcfg/
[3]:https://github.com/rockymeza/wifi