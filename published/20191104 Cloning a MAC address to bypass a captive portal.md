[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11564-1.html)
[#]: subject: (Cloning a MAC address to bypass a captive portal)
[#]: via: (https://fedoramagazine.org/cloning-a-mac-address-to-bypass-a-captive-portal/)
[#]: author: (Esteban Wilson https://fedoramagazine.org/author/swilson/)

克隆 MAC 地址来绕过强制门户
======

![][1]

如果你曾经在家和办公室之外连接到 WiFi，那么通常会看到一个门户页面。它可能会要求你接受服务条款或其他协议才能访问。但是，当你无法通过这类门户进行连接时会发生什么？本文向你展示了如何在 Fedora 上使用 NetworkManager 在某些故障情况下让你仍然可以访问互联网。

### 强制门户如何工作

强制门户是新设备连接到网络时显示的网页。当用户首次访问互联网时，门户网站会捕获所有网页请求并将其重定向到单个门户页面。

然后，页面要求用户采取一些措施，通常是同意使用政策。用户同意后，他们可以向 RADIUS 或其他类型的身份验证系统进行身份验证。简而言之，强制门户根据设备的 MAC 地址和终端用户接受条款来注册和授权设备。（MAC 地址是附加到任何网络接口的[基于硬件的值][2]，例如 WiFi 芯片或卡。）

有时设备无法加载强制门户来进行身份验证和授权以使用 WiFI 接入。这种情况的例子包括移动设备和游戏机（Switch、Playstation 等）。当连接到互联网时，它们通常不会打开强制门户页面。连接到酒店或公共 WiFi 接入点时，你可能会看到这种情况。

不过，你可以在 Fedora 上使用 NetworkManager 来解决这些问题。Fedora 可以使你临时克隆要连接的设备的 MAC 地址，并代表该设备通过强制门户进行身份验证。你需要得到连接设备的 MAC 地址。通常，它被打印在设备上的某个地方并贴上标签。它是一个六字节的十六进制值，因此看起来类似 `4A:1A:4C:B0:38:1F`。通常，你也可以通过设备的内置菜单找到它。

### 使用 NetworkManager 克隆

首先，打开 `nm-connection-editor`，或通过“设置”打开 WiFi 设置。然后，你可以使用 NetworkManager 进行克隆：

* 对于以太网：选择已连接的以太网连接。然后选择 “Ethernet” 选项卡。记录或复制当前的 MAC 地址。在 “<ruby>克隆 MAC 地址<rt>Cloned MAC address</rt></ruby>” 字段中输入游戏机或其他设备的 MAC 地址。
* 对于 WiFi：选择 WiFi 配置名。然后选择 “WiFi” 选项卡。记录或复制当前的 MAC 地址。在 “<ruby>克隆 MAC 地址<rt>Cloned MAC address</rt></ruby>” 字段中输入游戏机或其他设备的 MAC 地址。

### 启动所需的设备

当 Fedora 系统与以太网或 WiFi 配置连接，克隆的 MAC 地址将用于请求 IP 地址，并加载强制门户。输入所需的凭据和/或选择用户协议。该 MAC 地址将获得授权。

现在，断开 WiF i或以太网配置连接，然后将 Fedora 系统的 MAC 地址更改回其原始值。然后启动游戏机或其他设备。该设备现在应该可以访问互联网了，因为它的网络接口已通过你的 Fedora 系统进行了授权。

不过，这不是 NetworkManager 全部能做的。例如，请参阅[随机化系统硬件地址][3]，来获得更好的隐私保护。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/cloning-a-mac-address-to-bypass-a-captive-portal/

作者：[Esteban Wilson][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/swilson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/clone-mac-nm-816x345.jpg
[2]: https://en.wikipedia.org/wiki/MAC_address
[3]: https://linux.cn/article-10028-1.html
