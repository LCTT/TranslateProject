[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12860-1.html)
[#]: subject: (Secure NTP with NTS)
[#]: via: (https://fedoramagazine.org/secure-ntp-with-nts/)
[#]: author: (Miroslav Lichvar https://fedoramagazine.org/author/mlichvar/)

用 NTS 保证 NTP 的安全
======

![](https://img.linux.net.cn/data/attachment/album/202011/26/111649pt32v9j22x3ooa33.jpg)

许多计算机使用<ruby>网络时间协议<rt>Network Time Protocol</rt></ruby>（NTP）通过互联网来同步系统时钟。NTP 是少数几个仍在普遍使用的不安全的互联网协议之一。攻击者如果能够观察到客户端和服务器之间的网络流量，就可以向客户端提供虚假的数据，并根据客户端的实现和配置，强迫其将系统时钟设置为任何时间和日期。如果客户端的系统时钟不准确，一些程序和服务就可能无法工作。例如，如果根据客户端的系统时钟，Web 服务器的证书似乎已经过期，Web 浏览器将无法正常工作。可以使用<ruby>网络时间安全<rt>Network Time Security</rt></ruby>（NTS）来保证 NTP 的安全。

Fedora 33 [^1] 是第一个支持 NTS 的 Fedora 版本。NTS 是一种新的 NTP 验证机制。它使客户端能够验证它们从服务器接收的数据包在传输过程中有没有被修改。当 NTS 启用时，攻击者唯一能做的就是丢弃或延迟数据包。关于 NTS 的更多细节，请参见 [RFC8915][3]。

使用对称密钥可以很好地保证 NTP 的安全。遗憾的是，服务器必须为每个客户端配备不同的密钥，而且密钥必须安全地分发才行。这对于本地网络上的私有服务器来说可能是实用的，但它不能扩展到有着数百万客户端的公共服务器上。

NTS 包括一个<ruby>密钥建立<rt>Key Establishment</rt></ruby>（NTS-KE）协议，它可以自动创建服务器与其客户端之间使用的加密密钥。它在 TCP 端口 4460 上使用<ruby>传输层安全<rt>Transport Layer Security</rt></ruby>（TLS）。它被设计成可以扩展到非常多的客户端，而对准确性的影响最小。服务器不需要保存任何客户端特定的状态。它为客户提供 cookie，cookie 是加密的，包含验证 NTP 数据包所需的密钥。隐私是 NTS 的目标之一。客户端在每次服务器响应时都会得到一个新的 cookie，所以它不必重复使用 cookie。这可以防止被动观察者跟踪在网络之间迁移的客户端。

Fedora 中默认的 NTP 客户端是 Chrony。Chrony 在 4.0 版本中增加了 NTS 支持，但并没有改变默认配置。Chrony 仍然使用 [pool.ntp.org][4] 项目中的公共服务器，而且默认情况下 NTS 没有启用。

目前，支持 NTS 的公共 NTP 服务器非常少。两个主要的提供商是 Cloudflare 和 Netnod。[Cloudflare 服务器][5]分布在世界各地的不同地方。他们使用的是<ruby>任播<rt>anycast</rt></ruby>地址，应该可以让大多数客户到达一个接近的服务器。[Netnod 服务器][6]位于瑞典。在未来，我们可能会看到更多支持 NTS 的公共 NTP 服务器。

为了获得最佳的可靠性，配置 NTP 客户端的一般建议是至少有三个工作的服务器。为了达到最好的精度，建议选择距离较近的服务器，以减少网络延迟和非对称网络路由造成的不对称性。如果你不关心细粒度的精度，你可以忽略这个建议，使用任何你信任的 NTS 服务器，无论它们位于哪里。

如果你确实想要高准确度，但又没有近距离的 NTS 服务器，你可以将远处的 NTS 服务器和近处的非 NTS 服务器混合使用。但是，这样的配置不如只使用 NTS 服务器的配置安全。攻击者仍然不能强迫客户机接受任意时间，但他们确实对客户机的时钟及其估计精度有更大的控制权，这在某些环境下可能是不可接受的。

### 在安装程序中启用客户端 NTS

安装 Fedora 33 时，你可以在“Time & Date”对话框的“Network Time”配置中启用 NTS。在点击“+”（添加）按钮之前，请输入服务器的名称并检查 NTS 支持情况。你可以添加一个或多个具有 NTS 的服务器或池。要删除默认的服务器池（`2.fedora.pool.ntp.org`），请取消选中“Use”列中的相应标记。

![Fedora 安装程序中的网络时间配置][7]

### 在配置文件中启用客户端 NTS

如果你从之前的 Fedora 版本升级，或者你没有在安装程序中启用 NTS，你可以直接在 `/etc/chrony.conf` 中启用 NTS。除了推荐的 `iburst` 选项外，还可以对指定服务器使用 `nts` 选项。例如：

```
server time.cloudflare.com iburst nts
server nts.sth1.ntp.se iburst nts
server nts.sth2.ntp.se iburst nts
```

你还应该允许客户端将 NTS 密钥和 cookie 保存到磁盘上，这样它就不必在每次启动时重复 NTS-KE 会话。在 `chrony.conf` 中添加以下一行，如果还没有的话：

```
ntsdumpdir /var/lib/chrony
```

如果不想让 DHCP 提供的 NTP 服务器与你指定的服务器混在一起，请在 `chrony.conf` 中删除或注释以下一行：

```
sourcedir /run/chrony-dhcp
```

当你完成编辑 `chrony.conf` 后，保存你的更改并重新启动 `chronyd` 服务：

```
systemctl restart chronyd
```

### 检查客户端状态

在 root 用户下运行以下命令，检查 NTS 密钥建立是否成功：

```
# chronyc -N authdata
Name/IP address             Mode KeyID Type KLen Last Atmp  NAK Cook CLen
=========================================================================
time.cloudflare.com          NTS     1   15  256  33m    0    0    8  100
nts.sth1.ntp.se              NTS     1   15  256  33m    0    0    8  100
nts.sth2.ntp.se              NTS     1   15  256  33m    0    0    8  100
```

`KeyID`、`Type` 和 `KLen` 列应该有非零值。如果它们为零，请检查系统日志中是否有来自 `chronyd` 的错误信息。一个可能的故障原因是防火墙阻止了客户端与服务器的 TCP 端口（端口 4460）的连接。

另一个可能的故障原因是由于客户机的时钟错误而导致证书无法验证。这是 NTS 的先有鸡还是先有蛋的问题。你可能需要手动修正日期或暂时禁用 NTS，以使 NTS 正常工作。如果你的电脑有实时时钟，几乎所有的电脑都有，而且有好的电池做备份，这种操作应该只需要一次。

如果计算机没有实时时钟或电池，就像一些常见的小型 ARM 计算机（如树莓派）那样，你可以在 `/etc/sysconfig/chronyd` 中添加 `-s` 选项来恢复上次关机或重启时保存的时间。时钟会落后于真实时间，但如果电脑没有关机太久，服务器的证书也没有在离到期时间太近的时候更新，应该足以让时间检查成功。作为最后的手段，你可以用 `nocerttimecheck` 指令禁用时间检查。详情请参见`chrony.conf(5)` 手册页。

运行下面的命令来确认客户端是否在进行 NTP 测量：

```
# chronyc -N sources
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* time.cloudflare.com           3   6   377    45   +355us[ +375us] +/-   11ms
^+ nts.sth1.ntp.se               1   6   377    44   +237us[ +237us] +/-   23ms
^+ nts.sth2.ntp.se               1   6   377    44   -170us[ -170us] +/-   22ms
```

`Reach` 列应该有一个非零值，最好是 377。上图所示的值 377 是一个八进制数，它表示最后八个请求都有有效的响应。如果启用了 NTS 的话，验证检查将包括 NTS 认证。如果该值一直很少或从未达到 377，则表明 NTP 请求或响应在网络中丢失了。众所周知，一些主要的网络运营商有中间设备，它可以阻止或限制大的 NTP 数据包的速率，以缓解利用 `ntpd` 的监控协议进行的放大攻击。不幸的是，这影响了受 NTS 保护的 NTP 数据包，尽管它们不会引起任何放大。NTP 工作组正在考虑为 NTP 提供一个替代端口，作为解决这个问题的办法。

### 在服务器上启用 NTS

如果你有自己的 NTP 服务器，运行着 `chronyd`，你可以启用服务器的 NTS 支持，让它的客户端安全同步。如果该服务器是其他服务器的客户端，它应该使用 NTS 或对称密钥与之同步。客户端假设同步链在所有服务器到主时间服务器之间是安全的。

启用服务器 NTS 类似于在 Web 服务器上启用 HTTPS。你只需要一个私钥和证书。例如，证书可以由 Let's Encrypt 权威机构使用 `certbot` 工具签署。当你有了密钥和证书文件（包括中间证书），在 `chrony.conf` 中用以下指令指定它们：

```
ntsserverkey /etc/pki/tls/private/foo.example.net.key
ntsservercert /etc/pki/tls/certs/foo.example.net.crt
```

确保之前在客户端配置中提到的 `ntsdumpdir` 指令存在于 `chrony.conf` 中。它允许服务器将其密钥保存到磁盘上，这样服务器的客户端在重启服务器时就不必获取新的密钥和 cookie 了。

重新启动 `chronyd` 服务：

```
systemctl restart chronyd
```

如果系统日志中没有来自 `chronyd` 的错误信息，那么它应该是可以接受客户端连接的，如果服务器有防火墙，则需要同时允许 UDP 123 和 TCP 4460 端口的 NTP 和 NTS-KE 服务。

你可以用下面的命令在客户端机器上进行快速测试：

```
$ chronyd -Q -t 3 'server foo.example.net iburst nts maxsamples 1'
2020-10-13T12:00:52Z chronyd version 4.0 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SIGND +ASYNCDNS +NTS +SECHASH +IPV6 +DEBUG)
2020-10-13T12:00:52Z Disabled control of system clock
2020-10-13T12:00:55Z System clock wrong by -0.001032 seconds (ignored)
2020-10-13T12:00:55Z chronyd exiting
```

如果你看到一个“System clock wrong”消息，说明它是正确工作的。

在服务器上，你可以使用下面的命令来检查它已经处理了多少个 NTS-KE 连接和认证的 NTP 数据包：

```
# chronyc serverstats
NTP packets received       : 2143106240
NTP packets dropped        : 117180834
Command packets received   : 16819527
Command packets dropped    : 0
Client log records dropped : 574257223
NTS-KE connections accepted: 104
NTS-KE connections dropped : 0
Authenticated NTP packets  : 52139
```

如果你看到非零的 “NTS-KE connections accepted” 和 “Authenticated NTP packets”，这意味着至少有一些客户端能够连接到 NTS-KE 端口，并发送一个认证的 NTP 请求。

[^1]: Fedora 33 Beta 安装程序包含一个较旧的 Chrony 预发布版本，它不能与当前的 NTS 服务器一起工作，因为 NTS-KE 端口已经改变。因此，在安装程序中的网络时间配置中，服务器总是显示为不工作。安装后，需要更新 chrony 包，才能与当前的服务器配合使用。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/secure-ntp-with-nts/

作者：[Miroslav Lichvar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mlichvar/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/secure-ntp-with-nts-816x345.jpg
[2]: tmp.rl0XC1HIGm#footnote1
[3]: https://tools.ietf.org/html/rfc8915
[4]: https://www.pool.ntp.org
[5]: https://developers.cloudflare.com/time-services/nts/usage
[6]: https://www.netnod.se/time-and-frequency/how-to-use-nts
[7]: https://fedoramagazine.org/wp-content/uploads/2020/10/anaconda-nts.png
