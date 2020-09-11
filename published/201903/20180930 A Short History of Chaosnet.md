Chaosnet 简史
===

如果你输入 `dig` 命令对 `google.com` 进行 DNS 查询，你会得到如下答复：

```
$ dig google.com

; <<>> DiG 9.10.6 <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 27120
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.            IN  A

;; ANSWER SECTION:
google.com.     194 IN  A   216.58.192.206

;; Query time: 23 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Sep 21 16:14:48 CDT 2018
;; MSG SIZE rcvd: 55
```

这个输出一部分描述了你的问题（`google.com` 的 IP 地址是什么？），另一部分则详细描述了你收到的回答。在<ruby>答案区段<rt>ANSWER SECTION</rt></ruby>里，`dig` 为我们找到了一个包含五个字段的记录。从左数第四个字段 `A` 定义了这个记录的类型 —— 这是一个地址记录。在 `A` 的右边，第五个字段告知我们 `google.com` 的 IP 地址是 `216.58.192.206`。第二个字段，`194` 则代表这个记录的缓存时间是 194 秒。

那么，`IN` 字段告诉了我们什么呢？令人尴尬的是，在很长的一段时间里，我都认为这是一个介词。那时候我认为 DNS 记录大概是表达了“在 `A` 记录里，`google.com` 的 IP 地址是 `216.58.192.206`。”后来我才知道 `IN` 是 “internet” 的简写。`IN` 这一个部分告诉了我们这个记录分属的<ruby>类别<rt>class</rt></ruby>。

那么，除了 “internet” 之外，DNS 记录还会有什么别的类别吗？这究竟意味着什么？你怎么去搜寻一个*不位于* internet 上的地址？看起来 `IN` 是唯一一个可能有意义的值。而且的确，如果你尝试去获得除了 `IN` 之外的，关于 `google.com` 的记录的话，DNS 服务器通常不能给出恰当的回应。以下就是我们尝试向 `8.8.8.8`（谷歌公共 DNS 服务器）询问在 `HS` 类别里 `google.com` 的 IP 地址。我们得到了状态为 `SERVFAIL` 的回复。

```
$ dig -c HS google.com

; <<>> DiG 9.10.6 <<>> -c HS google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 31517
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.            HS  A

;; Query time: 34 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Tue Sep 25 14:48:10 CDT 2018
;; MSG SIZE rcvd: 39
```

所以说，除了 `IN` 以外的类别没有得到广泛支持，但它们的确是存在的。除了 `IN` 之外，DNS 记录还有 `HS`（我们刚刚看到的）和 `CH` 这两个类别。`HS` 类是为一个叫做 [Hesiod][1] 的系统预留的，它可以利用 DNS 来存储并让用户访问一些文本资料。它通常在本地环境中作为 [LDAP][2] 的替代品使用。而 `CH` 这个类别，则是为 Chaosnet 预留的。

如今，大家都在使用 TCP/IP 协议族。这两种协议（TCP 及 UDP）是绝大部分电脑远程连接采用的协议。不过我觉得，从互联网的垃圾堆里翻出了一个布满灰尘，绝迹已久，被人们遗忘的系统，也是一件令人愉悦的事情。那么，Chaosnet 是什么？为什么它像恐龙一样，走上了毁灭的道路呢？

### 在 MIT 的机房里

Chaosnet 是在 1970 年代，由 MIT 人工智能实验室的研究员们研发的。它是一个宏伟目标的一部分 —— 设计并制造一个能比其他通用电脑更高效率运行 Lisp 代码的机器。

Lisp 是 MIT 教授 John McCarthy 的造物，他亦是人工智能领域的先驱者。在 1960 年发布的[一篇论文][3]中，他首次描述了 Lisp 这个语言。在 1962 年，Lisp 的编译器和解释器诞生了。Lisp 引入了非常多的新特性，这些特性在现在看来是每一门编程语言不可或缺的一部分。它是第一门拥有垃圾回收器的语言，是第一个有 REPL（Read-eval-print-loop：交互式解析器）的语言，也是第一个支持动态类型的语言。在人工智能领域工作的程序员们都十分喜爱这门语言，比如说，大名鼎鼎的 [SHRDLU][4] 就是用它写的。这个程序允许人们使用自然语言，向机器下达挪动玩具方块这样的命令。

Lisp 的缺点是它太慢了。跟其它语言相比，Lisp 需要使用两倍的时间来执行相同的操作。因为 Lisp 在运行中仍会检查变量类型，而不仅是编译过程中。在 MIT 的 IBM 7090 上，它的垃圾回收器也需要长达一秒钟的时间来执行。[^1] 这个性能问题急需解决，因为 AI 研究者们试图搭建类似 SHRDLU 的应用。他们需要程序与使用者进行实时互动。因此，在 1970 年代的晚期，MIT 人工智能实验室的研究员们决定去建造一个能更高效运行 Lisp 的机器来解决这个问题。这些“Lisp 机器”们拥有更大的存储和更精简的指令集，更加适合 Lisp。类型检查由专门的电路完成，因此在 Lisp 运行速度的提升上达成了质的飞跃。跟那时流行的计算机系统不同，这些机器并不支持分时，整台电脑的资源都用来运行一个单独的 Lisp 程序。每一个用户都会得到他自己单独的 CPU。MIT 的 <ruby>Lisp 机器小组<rt>Lisp Machine Group</rt></ruby>在一个备忘录里提到，这些功能是如何让 Lisp 运行变得更简单的：

> Lisp 机器是个人电脑。这意味着处理器和主内存并不是分时复用的，每个人都能得到单独属于自己的处理器和内存。这个个人运算系统由许多处理器组成，每个处理器都有它们自己的内存和虚拟内存。当一个用户登录时，他就会被分配一个处理器，在他的登录期间这个处理器是独属于他的。当他登出，这个处理器就会重新可用，等待被分配给下一个用户。通过采取这种方法，当前用户就不用和其他用户竞争内存的使用，他经常使用的内存页也能保存在处理器核心里，因此页面换出的情况被显著降低了。这个 Lisp 机器解决了分时 Lisp 机器的一个基本问题。[^2]

这个 Lisp 机器跟我们认知的现代个人电脑有很大的不同。该小组原本希望今后用户不用直接面对 Lisp 机器，而是面对终端。那些终端会与位于别处的 Lisp 机器进行连接。虽然每个用户都有自己专属的处理器，但那些处理器在工作时会发出很大的噪音，因此它们最好是位于机房，而不是放在本应安静的办公室里。[^3] 这些处理器会通过一个“完全分布式控制”的高速本地网络共享访问一个文件系统和设备，例如打印机。[^4] 这个网络的名字就是 Chaosnet。

Chaosnet 既是硬件标准也是软件协议。它的硬件标准与以太网类似，事实上 Chaosnet 软件协议是运行在以太网之上的。这个软件协议在网络层和传输层之间交互，它并不像 TCP/IP，而总是控制着本地网络。Lisp 机器小组的一个成员 David Moon 写的另一个备忘录中提到，Chaosnet “目前并不打算为低速链接、高信噪链接、多路径、长距离链接做特别的优化。” [^5] 他们专注于打造一个在小型网络里表现极佳的协议。

因为 Chaosnet 连接在 Lisp 处理器和文件系统之间，所以速度十分重要。网络延迟会严重拖慢一些像打开文本文档这种简单操作的速度，为了提高速度，Chaosnet 结合了在<ruby><rb>Network Control Program</rb>网络控制程序</ruby>中使用的一些改进方法，随后的 Arpanet 项目中也使用了这些方法。据 Moon 所说，“为了突破诸如在 Arpanet 中发现的速率瓶颈，很有必要采纳新的设计。目前来看，瓶颈在于由多个链接分享控制链接，而且在下一个信息发送之前，我们需要知道本次信息已经送达。” [^6] Chaosnet 协议族的批量 ACK 包跟当今 TCP 的差不多，它减少了 1/3 到一半的需要传输的包的数量。

因为绝大多数 Lisp 机器使用较短的单线进行连接，所以 Chaosnet 可以使用较为简单的路由算法。Moon 在 Chaosnet 路由方案中写道“预计要适配的网络架构十分简单，很少有多个路径，而且每个节点之间的距离很短。所以我认为没有必要进行复杂的方案设计。” [^7] 因为 Chaosnet 采用的算法十分简单，所以实现它也很容易。与之对比明显，其实现程序据说只有 Arpanet 网络控制程序的一半。[^8]

Chaosnet 的另一个特性是，它的地址只有 16 位，是 IPv4 地址的一半。所以这也意味着 Chaosnet 只能在局域网里工作。Chaosnet 也不会去使用端口号；当一个进程试图连接另一个机器上的另外一个进程时，需要首先初始化连接，获取一个特定的目标“<ruby>联系名称<rt>contact name</rt></ruby>”。这个联系名称一般是某个特定服务的名字。比方说，一个主机试图使用 `TELNET` 作为联系名称，连接另一个主机。我认为它的工作方式在实践中有点类似于 TCP，因为有些非常著名的服务也会拥有联系名称，比如运行在 80 端口上的 `HTTP` 服务。

在 1986 年，[RFC 973][5] 通过了将 Chaosnet DNS 类别加入域名解析系统的决议。它替代了一个早先出现的类别 `CSNET`。`CSNET` 是为了支持一个名叫<ruby>计算机科学网络<rt>Computer Science Network</rt></ruby>而被制造出来的协议。我并不知道为什么 Chaosnet 能被域名解析系统另眼相待。很多别的协议族也有资格加入 DNS，但是却被忽略了。比如 DNS 的主要架构师之一 Paul Mockapetris 提到说在他原本的构想里，<ruby>施乐<rt>Xerox</rt></ruby>的网络协议应该被包括在 DNS 里。[^9] 但是它并没有被加入。Chaosnet 被加入的原因大概是因为 Arpanet 项目和互联网的早期工作，有很多都在麻省剑桥的博尔特·贝拉尼克—纽曼公司，他们的雇员和 MIT 大多有紧密的联系。在这一小撮致力于发展计算机网络人中，Chaosnet 这个协议应该较为有名。

Chaosnet 随着 Lisp 机器的衰落渐渐变得不那么流行。尽管在一小段时间内 Lisp 机器有实际的商业产品 —— Symbolics 和 Lisp Machines Inc 在 80 年代售卖了这些机器。但它们很快被更便宜的微型计算机替代。这些计算机没有特殊制造的回路，但也可以快速运行 Lisp。Chaosnet 被制造出来的目的之一是解决一些 Apernet 协议的原始设计缺陷，但现在 TCP/IP 协议族同样能够解决这些问题了。

### 壳中幽灵

非常不幸的是，在互联网中留存的关于 Chaosnet 的资料不多。RFC 675 —— TCP/IP 的初稿于 1974 年发布，而 Chasnet 于 1975 年开始开发。[^10] 但 TCP/IP 最终征服了整个互联网世界，Chaosnet 则被宣布技术性死亡。尽管 Chaosnet 有可能影响了接下来 TCP/IP 的发展，可我并没有找到能够支持这个猜测的证据。

唯一一个可见的 Chaosnet 残留就是 DNS 的 `CH` 类。这个事实让我着迷。`CH` 类别是那被遗忘的幽魂 —— 在 TCP/IP 广泛部署中存在的一个替代协议 Chaosnet 的最后栖身之地。至少对于我来说，这件事情是十分让人激动。它告诉我关于 Chaosnet 的最后一丝痕迹，仍然藏在我们日常使用的网络基础架构之中。DNS 的 `CH` 类别是有趣的数码考古学遗迹。但它同时也是活生生的标识，提醒着我们互联网并非天生完整成型的，TCP/IP 不是唯一一个能够让计算机们交流的协议。“万维网”也远远不是我们这全球交流系统所能有的，最酷的名字。


[^1]: LISP 1.5 Programmer’s Manual, The Computation Center and Research Laboratory of Electronics, 90, accessed September 30, 2018, http://www.softwarepreservation.org/projects/LISP/book/LISP%201.5%20Programmers%20Manual.pdf 
[^2]: Lisp Machine Progress Report (Artificial Intelligence Memo 444), MIT Artificial Intelligence Laboratory, August, 1977, 3, accessed September 30, 2018, https://dspace.mit.edu/bitstream/handle/1721.1/5751/AIM-444.pdf. 
[^3]: Lisp Machine Progress Report (Artificial Intelligence Memo 444), 4. 
[^4]: 同上 
[^5]: Chaosnet (Artificial Intelligence Memo 628), MIT Artificial Intelligence Laboratory, June, 1981, 1, accessed September 30, 2018, https://dspace.mit.edu/bitstream/handle/1721.1/6353/AIM-628.pdf. 
[^6]: 同上 
[^7]: Chaosnet (Artificial Intelligence Memo 628), 16. 
[^8]: Chaosnet (Artificial Intelligence Memo 628), 9. 
[^9]: Paul Mockapetris and Kevin Dunlap, “The Design of the Domain Name System,” Computer Communication Review 18, no. 4 (August 1988): 3, accessed September 30, 2018, http://www.cs.cornell.edu/people/egs/615/mockapetris.pdf. 
[^10]: Chaosnet (Artificial Intelligence Memo 628), 1.

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/09/30/chaosnet.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[acyanbird](https://github.com/acyanbird)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Hesiod_(name_service)
[2]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[3]: http://www-formal.stanford.edu/jmc/recursive.pdf
[4]: https://en.wikipedia.org/wiki/SHRDLU
[5]: https://tools.ietf.org/html/rfc973
[6]: https://twitter.com/TwoBitHistory
[7]: https://twobithistory.org/feed.xml
[8]: https://twitter.com/TwoBitHistory/status/1041485204802756608?ref_src=twsrc%5Etfw
