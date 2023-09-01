[#]: subject: "Why is DNS still hard to learn?"
[#]: via: "https://jvns.ca/blog/2023/07/28/why-is-dns-still-hard-to-learn/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16089-1.html"

为什么 DNS 仍然难以学习？
======

![][0]

我经常写关于我发现难以学习的技术的文章。不久前，我的朋友 Sumana 向我提出了一个有趣的问题 - 为什么这些东西学起来那么难？为什么它们看起来如此神秘？

以 DNS 为例。我们从 [80 年代][1] 开始使用 DNS（已经超过 35 年了！）。它在互联网上的每个网站中都使用。而且它相当稳定 - 在很多方面，它的工作方式与 30 年前完全相同。

但是我花了好几年的时间才弄清楚如何自信地调试 DNS 问题，我也见过很多其他程序员在调试 DNS 问题上苦苦挣扎。那么到底发生了什么呢？

以下是关于为什么学习排除 DNS 问题很困难的几点思考。

（我不会在这篇文章中详细解释 DNS，更多关于 DNS 如何工作的信息，请参阅 《[用一个周末实现一个 DNS][2]》 或 [我的 DNS 方面的博文][3]）

### 并不是因为 DNS 非常难

当我最终学会如何排除 DNS 问题时，我的反应是“什么，就这样吗？？？这并不难！”我感觉有点被骗了！我可以在 [几个小时][3a] 内向你解释关于 DNS 令我感到困惑的一切事情。

那么 - 如果 DNS 并不是那么复杂，为什么我花了这么多年的时间才弄清楚如何排除相当基本的 DNS 问题（比如“即使我已经正确设置了，我的域名仍无法解析”或者“`dig` 命令和我的浏览器的 DNS 结果不一致，为什么？”）？

而且，在发现 DNS 学习困难方面，我并不孤单！我与许多经验丰富的程序员朋友讨论过多年来的 DNS 问题，其中很多人要么：

- 不敢轻易对其网站进行简单的 DNS 更改
- 或对 DNS 工作原理的基本事实感到困惑（比如记录是 [拉取的而非推送的][3b]）
- 或对 DNS 基础知识了解得很好，但却和我一样存在一些知识盲点（负缓存和 `dig` 命令及浏览器如何以不同方式进行 DNS 查询的细节）

因此，如果我们都面临着 DNS 的相同困扰，到底发生了什么？为什么对许多人来说学习 DNS 如此困难？

以下是我的一些看法。

### 很多系统是隐藏的

当你在计算机上发起 DNS 请求时，基本的过程如下：

1. 你的计算机向一个名为“解析器”的服务器发起请求。
2. 解析器检查其缓存，并向一些称为“权威名称服务器”的其它服务器发起请求。

以下是你看不到的一些内容：

- 解析器的**缓存**。里面有什么内容？
- 在你的计算机上进行 DNS 请求的**库代码**是哪个（是否是 libc 的 `getaddrinfo` 函数？如果是，它是来自 glibc、musl 还是苹果？是你的浏览器的 DNS 代码吗？还是其他自定义的 DNS 实现？）所有这些选项的行为略有不同，并且有不同的配置、缓存方法、可用功能等等。例如，musl DNS 直到 [2023 年初][4] 才支持 TCP。
- 解析器与权威名称服务器之间的**对话**。如果你能够神奇地获得一个准确记录你的请求期间向下游查询的每个权威名称服务器以及它们的响应的追踪，我认为很多 DNS 问题将变得非常简单。（比如，如果你能运行 `dig +debug google.com` 并获得一些额外的调试信息会怎么样？）

### 如何和隐藏系统打交道

以下是几个处理隐藏系统的方法：

- 向人们传授隐藏系统的知识会产生重大影响。很长一段时间里，我不知道我的计算机有多个不同的 DNS 库，它们在不同情况下使用，我对此感到困惑了好几年。这是我的重要排错方法。
- 通过 [Mess With DNS][5]，我们尝试了一种“鱼缸”的方法，展示了通常隐藏的系统（与解析器和权威名称服务器的对话）的一些部分。
- 我觉得将 DNS 扩展以包括一个“调试信息”部分会非常酷。（注：似乎这已经有了！它被称为“[扩展 DNS 错误][5a]”，即 EDE，各种工具正在逐渐添加对它的支持。）

### 扩展 DNS 错误看起来不错

扩展 DNS 错误是 DNS 服务器提供额外调试信息的一种新方式。以下是一个示例：

```
$ dig @8.8.8.8 xjwudh.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 39830
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
; EDE: 12 (NSEC Missing): (Invalid denial of existence of xjwudh.com/a)
;; QUESTION SECTION:
;xjwudh.com.			IN	A

;; AUTHORITY SECTION:
com.			900	IN	SOA	a.gtld-servers.net. nstld.verisign-grs.com. 1690634120 1800 900 604800 86400

;; Query time: 92 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Jul 29 08:35:45 EDT 2023
;; MSG SIZE  rcvd: 161
```

这里我请求了一个不存在的域名，并收到了扩展错误信息 `EDE: 12 (NSEC Missing): (Invalid denial of existence of xjwudh.com/a)`。我不太确定这是什么意思（它与 DNSSEC 有关），但能看到这样额外的调试信息真的很酷。

为了能看到上述内容，我确实需要安装更新版本的 `dig`。

### 令人困惑的工具

尽管很多 DNS 的细节被隐藏起来，但你可以通过使用 `dig` 工具来找出发生了什么事情。

例如，你可以使用 `dig +norecurse` 来确定给定的 DNS 解析器是否在其缓存中具有特定的记录。如果响应没有被缓存，`8.8.8.8` 看起来会返回 `SERVFAIL` 响应。

以下是对 `google.com` 进行该操作的示例：

```
$ dig +norecurse  @8.8.8.8 google.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 11653
;; flags: qr ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.            IN  A

;; ANSWER SECTION:
google.com.     21  IN  A   172.217.4.206

;; Query time: 57 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Jul 28 10:50:45 EDT 2023
;; MSG SIZE  rcvd: 55
```

这是对 `homestarrunner.com` 的示例：

```
$ dig +norecurse  @8.8.8.8 homestarrunner.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 55777
;; flags: qr ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;homestarrunner.com.		IN	A

;; Query time: 52 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Jul 28 10:51:01 EDT 2023
;; MSG SIZE  rcvd: 47
```

在这里，你可以看到我们对于 `google.com` 得到了一个正常的 `NOERROR` 响应（`8.8.8.8` 的缓存中有该记录），但对于 `homestarrunner.com` 得到了 `SERVFAIL` 响应（没有缓存）。这并不意味着 `homestarrunner.com` 没有 DNS 记录（实际上有！），它只是没有被缓存。

但如果你不熟悉这样的输出，它确实很难阅读！以下是我认为其中一些奇怪的地方：

1. 标题很奇怪（有 `->>HEADER<<-`、`flags:`、`OPT PSEUDOSECTION:`、`QUESTION SECTION:`、`ANSWER SECTION:`）。
2. 空格排版很奇怪（`OPT PSEUDOSECTION` 和 `QUESTION SECTION` 之间为什么没有换行符？）。
3. `MSG SIZE rcvd: 47` 很奇怪（`MSG SIZE` 中是否还有其他字段，而不仅仅是 `rcvd`？它们是什么？）。
4. 它说有 1 个记录在 `ADDITIONAL` 部分，但没有显示它，你必须以某种方式神奇地知道`OPT PSEUDOSECTION` 记录实际上在 `ADDITIONAL` 部分。

总的来说，`dig` 的输出给人的感觉是一个以临时方式编写并随着时间的推移逐渐发展起来的脚本，而不是经过有意设计的东西。

### 处理令人困惑的工具的一些想法：

- **解释输出结果**。例如，我写了一篇 [如何使用 dig][6] 的文章，解释了 `dig` 的输出结果以及如何配置它以默认给出更简短的输出。
- **创建新的、更友好的工具**。例如，在 DNS 方面，有 [dog][7]、[doggo][8] 和 [我的 DNS 查询工具][9]。我认为这些工具非常酷，但我个人不使用它们，因为有时我想做一些稍微高级一点的操作（比如使用 `+norecurse`），据我所知，无论是 `dog` 还是 `doggo` 都不支持 `+norecurse`。我更愿意使用一个工具来完成所有任务，所以我坚持使用 `dig`。要替换 `dig`，其功能广度是一项庞大的工作。
- **使 dig 的输出更加友好**。如果我在 C 编程方面更好一些，我可能会尝试编写一个 `dig` 的拉取请求，添加一个 `+human` 标志以以更结构化和易读的方式格式化长格式的输出，可能类似于以下形式：

```
$ dig +human +norecurse  @8.8.8.8 google.com 
HEADER:
  opcode: QUERY
  status: NOERROR
  id: 11653
  flags: qr ra
  records: QUESTION: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

QUESTION SECTION:
  google.com.			IN	A

ANSWER SECTION:
  google.com.		21	IN	A	172.217.4.206
  
ADDITIONAL SECTION:
  EDNS: version: 0, flags:; udp: 512

EXTRA INFO:
  Time: Fri Jul 28 10:51:01 EDT 2023
  Elapsed: 52 msec
  Server: 8.8.8.8:53
  Protocol: UDP
  Response size: 47 bytes
```

这样可以更清晰地呈现 DNS 响应的结构-包括标题、问题、答案和附加部分。

而且它并不是“简化”了什么！它是完全相同的信息，只是以更结构化的方式进行了格式化。我对替代的 DNS 工具最大的不满是它们经常为了清晰起见而删除信息。虽然这些工具肯定有其用武之地，但我想要看到所有的信息！我只是希望它能够以清晰明了的方式呈现。

在过去的 40 年中，我们已经学到了很多关于如何设计更用户友好的命令行工具的知识，我认为将其中一些知识应用到我们那些有些陈旧的工具中将会很棒。

### dig +yaml

关于 `dig` 的一个简单备注：较新版本的 `dig` 支持 `+yaml` 输出格式，对我来说更加清晰，但有些冗长（一个相当简单的 DNS 响应都无法在屏幕上完整显示）。

### 一些奇怪的陷阱

DNS 存在一些相对常见但很难通过自学了解到的奇怪问题。以下是一些例子（有更多可在 [导致 DNS 中断的一些方式][10] 中找到）：

- 负缓存：我在 [这篇演讲][11] 中提到过，我大约花了 5 年时间才意识到不应该访问没有 DNS 记录的域名，因为该记录的 **不存在** 信息将被缓存，并且该缓存在几个小时内不会被更新，这真的很烦人。
- `getaddrinfo` 实现的差异：直到 [2023 年初][4]，`musl` 不支持 TCP DNS。
- 忽略 TTL 的解析器：如果你在 DNS 记录上设置了 TTL（比如“5 分钟”），一些解析器完全会忽略这些 TTL 设置，并将记录缓存更长时间，比如可能是 24 小时。
- 如果你错误地配置了 Nginx（[像这样][12]），它将永久缓存 DNS 记录。
- [ndots][13] 如何导致 Kubernetes DNS 缓慢。

### 如何应对奇怪的陷阱

对此，我没有像我希望的那样完美的答案。对奇怪陷阱的了解非常难以获得（再次强调，我花了多年的时间才弄清楚负缓存！），对我而言，人们不得不一次又一次地自己重新发现它们感觉很愚蠢。

以下是一些想法：

- 当有人在解释一个主题时提到了一些棘手的问题，这是非常有帮助的。例如（离开 DNS 一下），Josh Comeau 的 Flexbox 入门解释了这个 [最小尺寸的陷阱][14]，在找到解释之前，我多年来遇到过很多次这个问题。
- 我希望看到更多的社区整理的常见陷阱。比如说，对于 Bash，[shellcheck][15] 是一个非常不错的常见陷阱集合。

关于记录 DNS 陷阱的一个棘手问题是，不同的人会遇到不同的陷阱。如果你只是每三年为个人域名配置一次 DNS，你可能会遇到不同的问题，而那些管理高流量域名的人则可能会遇到其他问题。

还有一些更简单的原因：

### 不经常接触

很多人非常少接触 DNS。如果你只在每三年才处理一次 DNS，学习起来就会更加困难！

我认为备忘单（比如“这是更改你的名称服务器的步骤”）可以在这方面起到很大的帮助。

### 难以进行实验

DNS 在进行实验时可能会让人感到害怕，因为你不想搞砸自己的域名。我们建立了 [Mess With DNS][5] 来使这个过程变得更容易一些。

### 目前就这些

我很想听听其他关于什么让 DNS（或你最喜欢的神秘技术）难以学习的想法。

*（题图：MJ/96c5d8fb-f4a5-4710-8f91-c71617120675）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/07/28/why-is-dns-still-hard-to-learn/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.ietf.org/rfc/rfc1034.txt
[2]: https://implement-dns.wizardzines.com/
[3]: https://jvns.ca/categories/dns/
[3a]: https://wizardzines.com/zines/dns
[3b]: https://jvns.ca/blog/2021/12/06/dns-doesn-t-propagate/
[4]: https://www.theregister.com/2023/05/16/alpine_linux_318/
[5]: https://messwithdns.net/
[5a]: https://blog.nlnetlabs.nl/extended-dns-error-support-for-unbound/
[6]: https://jvns.ca/blog/2021/12/04/how-to-use-dig/
[7]: https://github.com/ogham/dog
[8]: https://github.com/mr-karan/doggo
[9]: https://dns-lookup.jvns.ca/
[10]: https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/
[11]: https://jvns.ca/blog/2023/05/08/new-talk-learning-dns-in-10-years/
[12]: https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/#problem-nginx-caching-dns-records-forever
[13]: https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html
[14]: https://www.joshwcomeau.com/css/interactive-guide-to-flexbox/#the-minimum-size-gotcha-11
[15]: https://www.shellcheck.net/
[0]: https://img.linux.net.cn/data/attachment/album/202308/13/121642b6b2b4b4p2pgiydb.jpg