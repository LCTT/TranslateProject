Linux有问必答：如何使用tcpdump来捕获TCP SYN，ACK和FIN包
================================================================================
> **问题**：我想要监控TCP连接活动（如，建立连接的三次握手，以及断开连接的四次握手）。要完成此事，我只需要捕获TCP控制包，如SYN，ACK或FIN标记相关的包。我怎样使用tcpdump来仅仅捕获TCP SYN，ACK和/或FYN包？

作为业界标准的捕获工具，tcpdump提供了强大而又灵活的包过滤功能。作为tcpdump基础的libpcap包捕获引擎支持标准的包过滤规则，如基于5重包头的过滤（如基于源/目的IP地址/端口和IP协议类型）。

tcpdump/libpcap的包过滤规则也支持更多通用分组表达式，在这些表达式中，包中的任意字节范围都可以使用关系或二进制操作符进行检查。对于字节范围表达，你可以使用以下格式：

    proto [ expr : size ]

“proto”可以是熟知的协议之一（如ip，arp，tcp，udp，icmp，ipv6），“expr”表示与指定的协议头开头相关的字节偏移量。有我们熟知的直接偏移量如tcpflags，也有取值常量如tcp-syn，tcp-ack或者tcp-fin。“size”是可选的，表示从字节偏移量开始检查的字节数量。

使用这种格式，你可以像下面这样过滤TCP SYN，ACK或FIN包。

只捕获TCP SYN包：

     # tcpdump -i <interface> "tcp[tcpflags] & (tcp-syn) != 0" 

只捕获TCP ACK包：

    # tcpdump -i <interface> "tcp[tcpflags] & (tcp-ack) != 0"

只捕获TCP FIN包：

    # tcpdump -i <interface> "tcp[tcpflags] & (tcp-fin) != 0"

之捕获TCP SYN或ACK包：

     # tcpdump -r <interface> "tcp[tcpflags] & (tcp-syn|tcp-ack) != 0" 

![](https://farm4.staticflickr.com/3923/15050566798_db14aea9a9_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/capture-tcp-syn-ack-fin-packets-tcpdump.html

 
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
