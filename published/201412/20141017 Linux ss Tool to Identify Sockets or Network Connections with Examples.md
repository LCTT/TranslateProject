在Linux中的使用 ss 命令检查套接字/网络连接
================================================================================
ss是iproute2包的一部分（控制TCP/IP网络和流量的工具）。iproute2的目标是替代先前用于配置网络接口、路由表和管理ARP表的标准Unix网络工具套装（通常称之为“net-tools”）。ss工具用于导出套接字统计，它可以显示与netstat类似的信息，且可以显示更多的TCP和状态信息。因为它直接从内核空间获取信息，所以会更快。ss的操作和netstat很像，所以这让它可以很容易就可以取代。

### 使用和常见选项 ###

ss和netstat很像，默认它会显示已经建立连接的开放的非监听TCP套接字列表。并且你可以用下面的选项过滤输出：

- **-n** - 不要尝试解析服务名。
- **-r** - 尝试解析数字的地址/端口。
- **-a** - 显示所有套接字。
- **-l** - 显示监听套接字。
- **-p** - 显示使用该套接字的进程。
- **-s** - 打印统计数据
- **-t** - 只显示TCP套接字。
- **-u** - 只显示UDP套接字。
- **-d** - 只显示DCCP套接字
- **-w** - 只显示RAW套接字。
- **-x** - 只显示Unix域套接字
- **-f FAMILY** - 显示FAMILY套接字的类型。目前支持下面这些族：unix、inet、inet6、link、netlink。
- **-A QUERY** - 指定要列出的套接字列表，通过逗号分隔。可以识别下面的标识符：all、inet、tcp、udp、raw、unix、packet、netlink、unix_dgram、unix_stream、packet_raw、packet_dgram。
- **-o STATUS** - 列出指定状态的套接字

### ss 命令示例 ###

**1.** 显示所有的的TCP端口和使用它们的进程：

    # ss -tnap

![ss tnap](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-tnap.jpg)

**2.** 你可以使用-4 标志来显示IPv4链接，-6标志来显示IPv6链接，比如：

    # ss -tnap6

![ss tnap6](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-tnap6.jpg)

**3.** 跟上面的行为一样，你只需用u代替t就会显示所有开放的UDP端口。

    # ss -unap

![ss unap](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-unap.jpg)

**4.** 你可以使用-s标志来打印各种有用的统计数据：

    # ss -s

![ss stats](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-stats.jpg)

**5.** 你可以使用-o标志来检查所有不同状态下的链接，比如显示所有已经建立的连接。

    # ss -tn -o state established -p

![ss est](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-est.jpg)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/ss-sockets-network-connection/

作者：[Adrian Dinu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/