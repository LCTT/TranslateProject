使用 NetworkManager 随机化你的 MAC 地址
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/randomizemacaddress-816x345.png)

今时今日，无论在家里的沙发上，还是在外面的咖啡厅，只要打开笔记本电脑，连上 Wi-Fi，就能通过网络与外界保持联系。但现在的 Wi-Fi 热点们大都能够通过[每张网卡对应的唯一 MAC 地址][1]来追踪你的设备。下面就来看一下如何避免被追踪。

现在很多人已经开始注重个人隐私这个问题。个人隐私问题并不仅仅指防止他人能够访问到你电脑上的私有内容（这又是另一个问题了），而更多的是指<ruby>可追踪性<rt>legibility</rt></ruby>，也就是是否能够被轻易地统计和追踪到。大家都应该[对此更加重视][2]。同时，这方面的底线是，服务提供者在得到了用户的授权后才能对用户进行追踪，例如机场的计时 Wi-Fi 只有在用户授权后才能够使用。

因为固定的 MAC 地址能被轻易地追踪到，所以应该定时进行更换，随机的 MAC 地址是一个好的选择。由于 MAC 地址一般只在局域网内使用，因此随机的 MAC 地址也不大会产生[冲突][3]。

### 配置 NetworkManager

要将随机的 MAC 地址默认地用于所有的 Wi-Fi 连接，需要创建 `/etc/NetworkManager/conf.d/00-macrandomize.conf` 这个文件：

```
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=stable
ethernet.cloned-mac-address=stable
connection.stable-id=${CONNECTION}/${BOOT}
```

然后重启 NetworkManager ：

```
systemctl restart NetworkManager
```

以上配置文件中，将 `cloned-mac-address` 的值设置为 `stable` 就可以在每次 NetworkManager 激活连接的时候都生成相同的 MAC 地址，但连接时使用不同的 MAC 地址。如果要在每次激活连接时也获得随机的 MAC 地址，需要将 `cloned-mac-address` 的值设置为 `random`。

设置为 `stable` 可以从 DHCP 获取相同的 IP 地址，也可以让 Wi-Fi 的<ruby>[强制主页](https://en.wikipedia.org/wiki/Captive_portal)<rt>captive portal</rt></ruby>根据 MAC 地址记住你的登录状态。如果设置为 `random` ，在每次连接的时候都需要重新认证（或者点击“我同意”），在使用机场 Wi-Fi 的时候会需要到这种 `random` 模式。可以在这篇 NetworkManager 的[博客文章][4]中参阅到有关使用 `nmcli` 从终端配置特定连接的详细说明。

使用 `ip link` 命令可以查看当前的 MAC 地址，MAC 地址将会显示在 `ether` 一词的后面。

```
$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 52:54:00:5f:d5:4e brd ff:ff:ff:ff:ff:ff
3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
    link/ether 52:54:00:03:23:59 brd ff:ff:ff:ff:ff:ff
```

### 什么时候不能随机化 MAC 地址

当然，在某些情况下确实需要能被追踪到。例如在家用网络中，可能需要将路由器配置为对电脑分配一致的 IP 地址以进行端口转发；再例如公司的雇主可能需要根据 MAC 地址来提供 Wi-Fi 服务，这时候就需要进行追踪。要更改特定的 Wi-Fi 连接，请使用 `nmcli` 查看 NetworkManager 连接并显示当前设置：

```
$ nmcli c | grep wifi
Amtrak_WiFi    5f4b9f75-9e41-47f8-8bac-25dae779cd87 wifi -- 
StaplesHotspot de57940c-32c2-468b-8f96-0a3b9a9b0a5e wifi -- 
MyHome         e8c79829-1848-4563-8e44-466e14a3223d wifi wlp1s0 
...
$ nmcli c show 5f4b9f75-9e41-47f8-8bac-25dae779cd87 | grep cloned
802-11-wireless.cloned-mac-address:     --
$ nmcli c show e8c79829-1848-4563-8e44-466e14a3223d | grep cloned
802-11-wireless.cloned-mac-address:     stable
```

这个例子在 Amtrak 使用完全随机 MAC 地址（使用默认配置）和 MyHome 的永久 MAC 地址（使用 `stable` 配置）。永久 MAC 地址是在硬件生产的时候分配到网络接口上的，网络管理员能够根据永久 MAC 地址来查看[设备的制造商 ID][5]。

更改配置并重新连接活动的接口：

```
$ nmcli c modify 5f4b9f75-9e41-47f8-8bac-25dae779cd87 802-11-wireless.cloned-mac-address random
$ nmcli c modify e8c79829-1848-4563-8e44-466e14a3223d 802-11-wireless.cloned-mac-address permanent
$ nmcli c down e8c79829-1848-4563-8e44-466e14a3223d
$ nmcli c up e8c79829-1848-4563-8e44-466e14a3223d
$ ip link
...
```

你还可以安装 NetworkManager-tui ，就可以通过可视化界面菜单来编辑连接。

### 总结

当你走在路上时，你要[留意周围的环境][6]，并[警惕可能的危险][7]。同样，在使用公共互联网资源时也要注意你自己的可追踪性。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/randomize-mac-address-nm/

作者：[sheogorath][a],[Stuart D Gathman][b]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sheogorath/
[b]: https://fedoramagazine.org/author/sdgathman/
[1]: https://en.wikipedia.org/wiki/MAC_address
[2]: https://www.ribbonfarm.com/2010/07/26/a-big-little-idea-called-legibility/
[3]: https://serverfault.com/questions/462178/duplicate-mac-address-on-the-same-lan-possible
[4]: https://blogs.gnome.org/thaller/2016/08/26/mac-address-spoofing-in-networkmanager-1-4-0/
[5]: https://www.wireshark.org/tools/oui-lookup.html
[6]: https://www.isba.org/committees/governmentlawyers/newsletter/2013/06/becomingmoreawareafewtipsonkeepingy
[7]: http://www.selectinternational.com/safety-blog/aware-of-surroundings-can-reduce-safety-incidents

