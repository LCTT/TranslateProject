[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12168-1.html)
[#]: subject: (What Happened to IPv5? Why there is IPv4, IPv6 but no IPv5?)
[#]: via: (https://itsfoss.com/what-happened-to-ipv5/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

IPv5 发生了什么？为什么有 IPv4、IPv6 但没有 IPv5？
======

如果你花过很多时间在互联网上，那么你应该已经听说过计算机每天使用的 IPv4 和 IPv6 协议。

你可能会问的一个问题是：为什么没有 IPv5？为什么 IPv6 在 IPv4 之后而不是 IPv5 之后出现？是否有 IPv5，如果是，那么 IPv5 发生了什么？

答案是肯定的，曾经有一个 IPv5。让我解释一下这里发生的事。

### 互联网的早期历史

![ARPA Logical Map in 1977 | Image courtesy: Wikipedia][1]

在 1960 年代后期，美国国防部的[高级研究计划局][2]（DARPA）发起了一个[项目][3]来连接全国的计算机。最初的目标是创建一个由全国 ARPA 资助的所有计算机组成的网络系统。

由于这是第一次将如此规模的网络整合在一起，因此他们也在不断发展自己的技术和硬件。他们首先做的工作之一就是开发名为<ruby>[传输控制协议][4]<rt>Transmission Control Protocol</rt></ruby>（TCP）的<ruby>互联网协议<rt>Internet Protocol</rt></ruby>（IP）。该协议“可靠、有序，并会对运行于通过 IP 网络传输的主机上的应用的八进制（字节）流通讯进行错误检测”。简单来说，它可以确保数据安全到达。

最初，TCP 被设计为[“主机级别的端到端协议以及封装和路由协议”][5]。但是，他们意识到他们需要拆分协议以使其更易于管理。于是决定由 IP 协议处理封装和路由。

那时，TCP 已经经历了三个版本，因此新协议被称为 IPv4。

### IPv5 的诞生

IPv5 开始时有个不同的名字：<ruby>互联网流协议<rt>Internet Stream Protocol</rt></ruby>（ST）。它是[由 Apple、NeXT 和 Sun Microsystems][6] 为试验流式语音和视频而创建的。

该新协议能够“在保持通信的同时，以特定频率传输数据包”。

### 那么 IPv5 发生了什么？

![][7]

IPv5 从未被接受为正式的互联网协议。这主要是由于 32 位限制。

IPV5 使用与 IPv4 相同的寻址系统。每个地址由 0 到 255 之间的四组数字组成。这将可能的地址数量限制为 [43 亿][6]个。

在 1970 年代初，这似乎比全世界所需要的还要多。但是，互联网的爆炸性增长证明了这一想法是错误的。2011 年，世界上的IPv4地址正式用完了。

在 1990 年代，一个新项目开始致力于研究下一代互联网协议（IPng）。这形成了 128 位的 IPv6。IPv6 地址包含 [“8 组 4 字符的十六进制数字”][6]，它可以包含从 0 到 9 的数字和从 A 到 F 的字母。与 IPv4 不同，IPv6 拥有数万亿个可能的地址，因此我们应该能安全一阵子。

同时，IPv5 奠定了 VoIP 的基础，而该技术已被我们用于当今世界范围内的通信。**因此，我想在某种程度上，你可以说 IPv5 仍然可以保留到了今天**。

希望你喜欢有关互联网历史的轶事。你可以阅读其他[关于 Linux 和技术的琐事文章][8]。

如果你觉得这篇文章有趣，请花一点时间在社交媒体、Hacker News 或 [Reddit][9] 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-happened-to-ipv5/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/Arpa_internet.png?fit=800%2C573&ssl=1
[2]: https://en.wikipedia.org/wiki/DARPA
[3]: https://en.wikipedia.org/wiki/ARPANET
[4]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[5]: https://fcw.com/articles/2006/07/31/what-ever-happened-to-ipv5.aspx
[6]: https://www.lifewire.com/what-happened-to-ipv5-3971327
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/what-happened-to-ipv5.png?ssl=1
[8]: https://itsfoss.com/category/story/
[9]: https://reddit.com/r/linuxusersgroup
