[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11637-1.html)
[#]: subject: (5 Commands to Find the IP Address of a Domain in the Linux Terminal)
[#]: via: (https://www.2daygeek.com/linux-command-find-check-domain-ip-address/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5 个用于在 Linux 终端中查找域名 IP 地址的命令
======

![](https://img.linux.net.cn/data/attachment/album/201912/03/000402c0ekkgku1f011kzt.jpg)

本教程介绍了如何在 Linux 终端验证域名或计算机名的 IP 地址。本教程将允许你一次检查多个域。你可能已经使用过这些命令来验证信息。但是，我们将教你如何有效使用这些命令在 Linux 终端中识别多个域的 IP 地址信息。

可以使用以下 5 个命令来完成此操作。

* `dig` 命令：它是一个用于查询 DNS 名称服务器的灵活命令行工具。
* `host` 命令：它是用于执行 DNS 查询的简单程序。
* `nslookup` 命令：它用于查询互联网域名服务器。
* `fping` 命令：它用于向网络主机发送 ICMP ECHO_REQUEST 数据包。
* `ping` 命令：它用于向网络主机发送 ICMP ECHO_REQUEST 数据包。

为了测试，我们创建了一个名为 `domains-list.txt` 的文件，并添加了以下域。

```
# vi /opt/scripts/domains-list.txt

2daygeek.com
magesh.co.in
linuxtechnews.com
```

### 方法 1：如何使用 dig 命令查找域的 IP 地址

[dig 命令][1]代表 “<ruby>域名信息抓手<rt>Domain Information Groper</rt></ruby>”，它是一个功能强大且灵活的命令行工具，用于查询 DNS 名称服务器。

它执行 DNS 查询，并显示来自查询的名称服务器的返回信息。大多数 DNS 管理员使用 `dig` 命令来解决 DNS 问题，因为它灵活、易用且输出清晰。

它还有批处理模式，可以从文件读取搜索请求。

```
# dig 2daygeek.com | awk '{print $1,$5}'

2daygeek.com. 104.27.157.177
2daygeek.com. 104.27.156.177
```

使用以下 bash 脚本查找多个域的 IP 地址。

```
# vi /opt/scripts/dig-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
dig $server +short
done | paste -d " " - - -
```

添加以上内容到脚本后，给 `dig-command.sh` 文件设置可执行权限。

```
# chmod +x /opt/scripts/dig-command.sh
```

最后运行 bash 脚本获得输出。

```
# sh /opt/scripts/dig-command.sh

2daygeek.com - 104.27.156.177 104.27.157.177
magesh.co.in - 104.18.35.52 104.18.34.52
linuxtechnews.com - 104.27.144.3 104.27.145.3
```

如果要在一行中运行上面的脚本，请使用以下脚本。

```
# for server in 2daygeek.com magesh.co.in linuxtechnews.com; do echo $server "-"; dig $server +short; done | paste -d " " - - -
```

或者，你可以使用以下 Shell 脚本查找多个域的 IP 地址。

```
# for server in 2daygeek.com magesh.co.in linuxtechnews.com; do dig $server | awk '{print $1,$5}'; done

2daygeek.com. 104.27.157.177
2daygeek.com. 104.27.156.177
magesh.co.in. 104.18.34.52
magesh.co.in. 104.18.35.52
linuxtechnews.com. 104.27.144.3
linuxtechnews.com. 104.27.145.3
```

### 方法 2：如何使用 host 命令查找域的 IP 地址

[host 命令][2]是一个简单的命令行程序，用于执行 [DNS 查询][3]。它通常用于将名称转换为 IP 地址，反之亦然。如果未提供任何参数或选项，`host` 将打印它的命令行参数和选项摘要。

你可以在 `host` 命令中添加特定选项或记录类型来查看域中的所有记录类型。

```
# host 2daygeek.com | grep "has address" | sed 's/has address/-/g'

2daygeek.com - 104.27.157.177
2daygeek.com - 104.27.156.177
```

使用以下 bash 脚本查找多个域的 IP 地址。

```
# vi /opt/scripts/host-command.sh

for server in `cat /opt/scripts/domains-list.txt`
do host $server | grep "has address" | sed 's/has address/-/g'
done
```

添加以上内容到脚本后，给 `host-command.sh` 文件设置可执行权限。

```
# chmod +x /opt/scripts/host-command.sh
```

最后运行 bash 脚本获得输出。

```
# sh /opt/scripts/host-command.sh

2daygeek.com - 104.27.156.177
2daygeek.com - 104.27.157.177
magesh.co.in - 104.18.35.52
magesh.co.in - 104.18.34.52
linuxtechnews.com - 104.27.144.3
linuxtechnews.com - 104.27.145.3
```

### 方法 3：如何使用 nslookup 命令查找域的 IP 地址

[nslookup 命令][4]是用于查询互联网[域名服务器（DNS）] [5]的程序。

`nslookup` 有两种模式，分别是交互式和非交互式。交互模式允许用户查询名称服务器以获取有关各种主机和域的信息，或打印域中的主机列表。非交互模式用于仅打印主机或域的名称和请求的信息。

它是一个网络管理工具，可以帮助诊断和解决 DNS 相关问题。

```
# nslookup -q=A 2daygeek.com | tail -n+4 | sed -e '/^$/d' -e 's/Address://g' | grep -v 'Name|answer' | xargs -n1

104.27.157.177
104.27.156.177
```

使用以下 bash 脚本查找多个域的 IP 地址。

```
# vi /opt/scripts/nslookup-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
nslookup -q=A $server | tail -n+4 | sed -e '/^$/d' -e 's/Address://g' | grep -v 'Name|answer' | xargs -n1 done | paste -d " " - - -
```

添加以上内容到脚本后，给 `nslookup-command.sh` 文件设置可执行权限。

```
# chmod +x /opt/scripts/nslookup-command.sh
```

最后运行 bash 脚本获得输出。

```
# sh /opt/scripts/nslookup-command.sh

2daygeek.com - 104.27.156.177 104.27.157.177
magesh.co.in - 104.18.35.52 104.18.34.52
linuxtechnews.com - 104.27.144.3 104.27.145.3
```

### 方法 4：如何使用 fping 命令查找域的 IP 地址

[fping 命令][6]是类似 `ping` 之类的程序，它使用互联网控制消息协议（ICMP）echo 请求来确定目标主机是否响应。

`fping` 与 `ping` 不同，因为它允许用户并行 ping 任意数量的主机。另外，它可以从文本文件输入主机。

`fping` 发送 ICMP echo 请求，并以循环方式移到下一个目标，并且不等到目标主机做出响应。

如果目标主机答复，那么将其标记为活动主机并从要检查的目标列表中删除；如果目标在特定时间限制和/或重试限制内未响应，那么将其指定为不可访问。

```
# fping -A -d 2daygeek.com magesh.co.in linuxtechnews.com

104.27.157.177 (104.27.157.177) is alive
104.18.35.52 (104.18.35.52) is alive
104.27.144.3 (104.27.144.3) is alive
```

### 方法 5：如何使用 ping 命令查找域的 IP 地址

[ping 命令][6]（<ruby>数据包互联网抓手<rt>Packet Internet Groper</rt></ruby>）是一个网络程序，用于测试 Internet 协议（IP）网络上主机的可用性/连接性。

通过向目标主机发送互联网控制消息协议（ICMP）Echo 请求数据包并等待 ICMP Echo 应答来验证主机的可用性。

它基于发送的数据包、接收的数据包、丢失的数据包，通常包含最小/平均/最大时间来汇总统计结果。

```
# ping -c 2 2daygeek.com | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'

104.27.157.177
```

使用以下 bash 脚本查找多个域的 IP 地址。

```
# vi /opt/scripts/ping-command.sh

#!/bin/bash
for server in `cat /opt/scripts/domains-list.txt`
do echo $server "-"
ping -c 2 $server | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g'
done | paste -d " " - -
```

添加以上内容到脚本后，给 `ping-command.sh` 文件设置可执行权限。

```
# chmod +x /opt/scripts/ping-command.sh
```

最后运行 bash 脚本获得输出。

```
# sh /opt/scripts/ping-command.sh

2daygeek.com - 104.27.156.177
magesh.co.in - 104.18.35.52
linuxtechnews.com - 104.27.144.3
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-find-check-domain-ip-address/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dig-command-check-find-dns-records-lookup-linux/
[2]: https://www.2daygeek.com/linux-host-command-check-find-dns-records-lookup/
[3]: https://www.2daygeek.com/category/dns-lookup/
[4]: https://www.2daygeek.com/nslookup-command-check-find-dns-records-lookup-linux/
[5]: https://www.2daygeek.com/check-find-dns-records-of-domain-in-linux-terminal/
[6]: https://www.2daygeek.com/how-to-use-ping-fping-gping-in-linux/
