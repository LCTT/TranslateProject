如何在 Linux 中找到你的 IP 地址
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/satellite_radio_location.jpg?itok=KJUKSB6x)
互联网协议（IP）不需要介绍 - 我们每天都在使用它。即使你不直接使用它，当你在浏览器上输入 website-name.com 时，它会查找该 URL 的 IP 地址，然后加载该网站。

我们将 IP 地址分为两类：私有和公共。私有 IP 地址是你的无线路由（和公司内网）提供的私有 IP 地址。它们的范围是 10.xxx、172.16.xx-172.31.xx 和 192.168.xx，其中 x=0 到 255。公有 IP 地址，顾名思义，是“公共”的，你可以在世界上任何地方访问它。每个网站都有一个唯一的 IP 地址，任何人可在任何地点访问，这可被视为公共 IP 地址。

此外，还有两种类型的 IP 地址：IPv4 和 IPv6。

IPv4 地址格式为 x.x.x.x，其中 x=0 到 255。有 2^32（大约 40 亿个）可能的 IPv4 地址。

IPv6 地址使用更复杂的十六进制。总的比特数是 128，这意味着有  2^128-340 后面有 36 个零！ - 可能的 IPv6 地址。IPv6 已经被引入解决了可预见的 IPv4 地址耗尽问题。

作为网络工程师，我建议不要与任何人共享你机器的公有 IP 地址。你的 WiFi 路由器有公共 IP，即 WAN（广域网）IP 地址，并且连接到该 WiFi 的任何设备都是相同的。连接到相同 WiFi 的所有设备都有上面所说的私有 IP 地址。例如，我的笔记本电脑的 IP 地址 192.168.0.5，而我的电话是 192.168.0.8。这些是私有 IP 地址，但两者都有相同的公有 IP 地址。

以下命令将列出IP地址列表，以查找你计算机的公有 IP 地址：

  1. `ifconfig.me`
  2. `curl -4/-6 icanhazip.com`
  3. `curl ipinfo.io/ip`
  4. `curl api.ipify.org`
  5. `curl checkip.dyndns.org`
  6. `dig +short myip.opendns.com @resolver1.opendns.com`
  7. `host myip.opendns.com resolver1.opendns.com`
  8. `curl ident.me`
  9. `curl bot.whatismyipaddress.com`
  10. `curl ipecho.net/plain`



以下命令将为你提供接口的私有 IP 地址：

  1. `ifconfig -a`
  2. `ip addr (ip a)`
  3. `hostname -I | awk ‘{print $1}’`
  4. `ip route get 1.2.3.4 | awk '{print $7}'`
  5. `(Fedora) Wifi-Settings→ click the setting icon next to the Wifi name that you are connected to → Ipv4 and Ipv6 both can be seen`
  6. `nmcli -p device show`



_注意：一些工具需要根据你正在使用的 Linux 发行版安装在你的系统上。另外，一些提到的命令使用第三方网站来获取 IP_

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-find-ip-address-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
