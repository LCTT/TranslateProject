使用树莓派和 pi-hole 拦截你的网络上的广告
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pi-hole-banner.png?itok=1TXcp3hm)

有一个闲置的树莓派？在浏览网页时讨厌广告？[Pi-hole][1] 是一个拦截广告的开源软件项目，它可以将你的家庭网络上的所有广告路由到一个不存在的地方，从而实现在你的设备上拦截广告的目的。这么好的方法只需要花几钟的时间来设置，你就可以使用它了。

Pi-hole 拦截了超过 100,000 个提供广告的域名，它可以拦截任何设备（包括移动设备、平板电脑、以及个人电脑）上的广告，并且它是完整的拦截了广告，而不是仅将它们隐藏起来，它这样做可以提升总体的网络性能（因为广告不需要下载）。你可以在一个 web 界面上、或者也可以使用一个 API 来监视性能和统计数据。

### 你需要：

  * 树莓派 + SD 卡
  * USB 电源线
  * 以太网线


![](https://opensource.com/sites/default/files/u128651/raspberry-pi.png)
![](https://opensource.com/sites/default/files/u128651/noobs-card.png)
![](https://opensource.com/sites/default/files/u128651/power-supply.png)
![](https://opensource.com/sites/default/files/u128651/ethernet-cable.png)

你不需要使用一个最新型号的树莓派 — 一个老款足够完成这项工作，只要它的内存不小于 512MB 就可以 — 因此一个一代树莓派 Model B（rev 2）就足够，一个 Model B+、或者二代的或者三代的树莓派都可以。你可能需要一个 Pi Zero，也需要一个 USB micro 以太网适配器。你可以使用一个带 WiFi 的 Pi Zero W 而不是以太网。但是，作为你的网络基础设施的一部分，我建议你使用一个性能良好、稳定的有线连接来代替 WiFi 连接。

### 准备 SD 卡

开始的第一步，你可能需要将 Raspbian Stretch Lite 安装到一个 SD 卡上。SD 卡至少需要 4GB 大小（完整的桌面版 Raspbian 镜像至少要 8GB，但是 Lite 版镜像更小更轻量化，足够完成这项工作）。如果你喜欢，也可以使用完整的 Raspbian 桌面版镜像，但是作为一个去运行简单应用程序的树莓派，你没必要做更多的事情。

![](https://opensource.com/sites/default/files/u128651/raspbian-downloads.png)

使用你的个人电脑，从树莓派的网站上下载 Raspbian Stretch Lite 镜像。解压它并提取出里面的 `.img` 文件，然后将这个 `.img` 文件写入到你的 SD 卡。不论你的 SD 卡是否是空白的，这一步都不会有什么麻烦，因为在写入前它会清空上面的数据。

如果你使用的是 Linux，写入镜像文件更简单的办法是使用命令行工具 `dd`。或者，你也可以使用跨平台的软件 [Etcher][2] （可以去参考 Les Pounder 写的指南 “[如何为树莓派准备 SD 卡][3]“）。

![](https://opensource.com/sites/default/files/etcher-win-520px.png)

SD 卡准备完成之后，你可以将它插入到你的树莓派，连接上键盘、显示器、和以太网，然后为树莓派接上电源。在初始化设置之后，这个树莓派就不需要键盘或显示器了。如果你有使用”无头“树莓派工作的经验，你可以去 [启用 SSH][4] 然后去设置它 [启用远程连接][5]。

### 安装 Pi-hole

在你的树莓派引导完成之后，用缺省用户名（`pi`）和密码（`raspberry`）登入。现在你就可以运行命令行了，可以去安装 Pi-hole 了。简单地输入下列命令并回车：
```
curl -sSL https://install.pi-hole.net | bash

```

这个命令下载了 Pi-hole 安装脚本然后去运行它。你可以在你的电脑浏览器中输入 `https://install.pi-hole.net` 来查看它的内容，你将会看到这个脚本做了些什么。它为你生成了一个**管理员密码**，并和其它安装信息一起显示在你的屏幕上。

就是这么简单，几分钟之后，你的树莓派将准备好为你拦截广告。

在你断开树莓派连接之前，你需要知道它的 IP 地址和你的路由器的 IP 地址。（如果你不知道），在你的终端中输入 `hostname -I` 来查看你的树莓派的 IP 地址，输入 `ip route | grep default` 来找到你的路由器的 IP 地址。你看到的将是像 `192.168.1.1` 这样的地址。

### 配置你的路由器

你的树莓派现在运行着一个 DNS 服务器，接下来你需要告诉你的路由器去使用 Pi-hole 作为它的 DNS 服务器而不是你的 ISP 提供给你的缺省 DNS。进入路由器的管理控制台 web 界面。这个界面一般是输入你的路由器的 IP 地址来进入的。

找到 LAN 设置下面的 DHCP/DNS 设置，然后将你的主 DNS 服务器的 IP 地址设置为你的 Pi-hole 的 IP 地址。设置完成之后，它应该你下图的样子：

![](https://opensource.com/sites/default/files/u128651/pi-hole-dns.png)

关于这一步的更多信息，可以查看 [Pi-hole discourse][6]。

你还需要确保你的 Pi-hole 始终保持相同的 IP 地址，因此，你需要去查看 DHCP，将你的树莓派的 IP  地址条目添加到保留地址中。

### 外部测试

现在，在命令行下输入 `sudo halt` 关闭运行的树莓派，并断开它的电源。你可以拔掉显示器连接线和键盘，然后将你的树莓派放置到一个合适的固定的地方 — 或许应该将它放在你的路由器附近。确保连接着以太网线，然后重新连接电源以启动它。

在你的个人电脑上导航到一个网站（强烈建议访问 [Opensource.com][7] 网站），或者用你的 WiFi 中的一个设备去检查你的因特网访问是否正常（如果不能正常访问，可能是你的 DNS 配置错误）。如果在浏览器中看到了预期的结果，说明它的工作正常。现在，你浏览网站时，应该再也看不到广告了！甚至在你的 apps 中提供的广告也无法出现在你的移动设备中！祝你”冲浪“愉快！

如果你想去测试一下你的广告拦截的新功能，你可以去这个 [测试页面][8] 尝试浏览一些内置广告的网站。

现在你可以在你的电脑浏览器上输入 Pi-hole 的 IP 地址来访问它的 web 界面（比如，<http://192.168.1.4/admin> \- 或者 `http://pi.hole/admin` 也可能会工作）。你将看到 Pi-hole 管理面板和一些统计数据（在这时可能数字比较小）。在你输入密码（在安装时显示在屏幕上的）后，你将看到更漂亮的图形界面：

![](https://opensource.com/sites/default/files/u128651/pi-hole-web.png)

你也可以微调你的 Pi-hole 的设置，像域名的白名单和黑名单、永久和临时禁止、访问拦截统计信息等等。

个别情况下，你可能需要去升级你的 Pi-hole 安装。当软件需要更新时，这个 web 界面会出现一个更新提示。如果你启用了 SSH，你可以远程登入，否则，那你只能再次连接键盘和显示器。远程登入之后，输入 `pihole -up`命令来更新它。

![](https://opensource.com/sites/default/files/u128651/pi-hole-update.png)

如果你使用过 Pi-hole 或者其它的开源广告拦截器，请在下面的评论区把你的经验共享出来。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/block-ads-raspberry-pi

作者：[Ben Nuttall][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bennuttall
[1]:https://pi-hole.net/
[2]:https://etcher.io/
[3]:https://opensource.com/article/17/3/how-write-sd-cards-raspberry-pi
[4]:https://www.raspberrypi.org/blog/a-security-update-for-raspbian-pixel/
[5]:https://www.raspberrypi.org/documentation/remote-access/ssh/README.md
[6]:https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245
[7]:https://opensource.com/
[8]:https://pi-hole.net/pages-to-test-ad-blocking-performance/
