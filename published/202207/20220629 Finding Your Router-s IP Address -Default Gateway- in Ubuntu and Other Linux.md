[#]: subject: "Finding Your Router’s IP Address (Default Gateway) in Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/router-ip-address-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14799-1.html"

在 Linux 中找到你的路由器的 IP 地址（默认网关）
======

![](https://img.linux.net.cn/data/attachment/album/202207/06/155222cgjpa9ppa19zr2g1.jpg)

你可能已经知道如何在 Linux 中获得你的系统的 IP 地址。

但是你怎么知道你的路由器的 IP 地址呢？

我说的不是你可以通过连接到 “[Show My IP][1]” 这样的网站或简单地在 [DuckDuckGo][3] 中 [搜索“what is my ip”][2] 获得的公网 IP。

我说的是默认网关 IP，你的 Linux 桌面所连接的地址。

你为什么需要它？嗯，如果你需要改变你的 Wi-Fi/网络的 SSID、密码或其他配置，你必须连接到它。简单的方法是在网页浏览器中输入路由器的 IP 地址，然后使用路由器的用户名和密码。

虽然我不能帮助你获得路由器的用户名和密码，但我肯定可以告诉你如何获得它的 IP。

一如既往，我将展示 GUI 和命令行两种方法。

### 方法 1：在 Linux 中使用 GUI 获取路由器的 IP 地址

这其实很简单。我在这里使用的是 Ubuntu 的 GNOME 桌面。如果你使用一些 [其他桌面环境][4]，截图可能会有所不同。

打开“<ruby>系统设置<rt>System Settings</rt></ruby>”：

![go to settings][5]

现在进入 Wi-Fi 或“<ruby>网络<rt>Network</rt></ruby>”（如果你使用的是有线的以太网连接）。在这里，点击你当前使用的网络旁边的小设置符号。

![access network settings ubuntu][6]

它将打开一个新窗口，里面有关于你的连接的一些细节，如 IP 地址、DNS 和 [Mac 地址][7]。你还可以在“<ruby>安全<rt>security</rt></ruby>”标签下看到 [保存的 Wi-Fi 密码][8]。

你还会看到一个名为“<ruby>默认路由<rt>Default Route</rt></ruby>”的条目。这就是你要找的东西。你的路由器的 IP 地址。

![default gateway ip ubuntu][9]

你的系统和网络上的所有其他设备都使用这个 IP 地址连接到路由器。这就是大多数家庭的设置。

现在我已经展示了 GUI 的方法，让我们去看看终端的路线。

### 方法 2：在 Linux 命令行中获取路由器的 IP 地址

打开一个终端，使用以下命令：

```
ip route
```

它将显示几个条目。

```
~$ ip route
default via 192.168.1.1 dev wlp0s20f3 proto dhcp metric 600 
169.254.0.0/16 dev wlp0s20f3 scope link metric 1000 
192.168.1.0/24 dev wlp0s20f3 proto kernel scope link src 192.168.1.34 metric 600
```

第一行，以 `default via` 开头，给出了你网关的 IP。这是你的路由器的 IP 地址。

![default route linux terminal][10]

你可以看到，`192.168.1.1` 是我的路由器的 IP 地址。通常情况下，路由器的 IP 地址是子网的第一个数字。然而，这并不是一个硬性规定。我也见过有 `x.y.z.30` 地址的路由器。

### 额外技巧

正如 Samir 在评论中所分享的，你也可以（在 Debian 上）使用 `ping` 命令来获得网关 IP：

```
ping _gateway
```

![ping gateway][11]

以防你不知道，你必须 [在 Linux 中使用 Ctrl+C 来停止一个正在运行的命令][12]。

我希望你在需要的时候能发现这个技巧是有用的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/router-ip-address-linux/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://www.showmyip.com/
[2]: https://duckduckgo.com/?q=what+is+my+ip&t=h_&ia=answer
[3]: https://itsfoss.com/duckduckgo-easter-eggs/
[4]: https://itsfoss.com/best-linux-desktop-environments/
[5]: https://itsfoss.com/wp-content/uploads/2022/02/go_to_settings.jpg
[6]: https://itsfoss.com/wp-content/uploads/2022/06/access-network-settings-ubuntu-800x448.png
[7]: https://itsfoss.com/change-mac-address-linux/
[8]: https://itsfoss.com/how-to-find-saved-wireless-wifi-passwords-ubuntu/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/defaul-gateway-ip-ubuntu.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/defaul-route-linux-terminal.png
[11]: https://itsfoss.com/wp-content/uploads/2022/06/ping-gateway.png
[12]: https://itsfoss.com/stop-program-linux-terminal/
