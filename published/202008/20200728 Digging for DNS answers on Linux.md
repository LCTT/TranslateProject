[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12509-1.html)
[#]: subject: (Digging for DNS answers on Linux)
[#]: via: (https://www.networkworld.com/article/3568488/digging-for-dns-answers-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上挖掘 DNS 应答中的秘密
======

> dig 是一个强大而灵活的工具，用于查询域名系统（DNS）服务器。在这篇文章中，我们将深入了解它的工作原理以及它能告诉你什么。

![](https://img.linux.net.cn/data/attachment/album/202008/11/235200wlyytlaymlylfdff.jpg)

`dig` 是一款强大而灵活的查询 DNS 名称服务器的工具。它执行 DNS 查询，并显示参与该过程的名称服务器返回的应答以及与搜索相关的细节。系统管理员和 [DNS][3] 管理员经常使用 `dig` 来帮助排除 DNS 问题。在这篇文章中，我们将深入了解它的工作原理，看看它能告诉我们什么。

开始之前，对 DNS（域名系统）的工作方式有一个基本的印象是很有帮助的。它是全球互联网的关键部分，因为它提供了一种查找世界各地的服务器的方式，从而可以与之连接。你可以把它看作是互联网的地址簿，任何正确连接到互联网的系统，都应该能够使用它来查询任何正确注册的服务器的 IP 地址。

### dig 入门

Linux 系统上一般都默认安装了 `dig` 工具。下面是一个带有一点注释的 `dig` 命令的例子：

```
$ dig www.networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> www.networkworld.com <== 你使用的 dig 版本
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 6034
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:                            <== 你的查询细节
;www.networkworld.com.          IN      A

;; ANSWER SECTION:                              <== 结果

www.networkworld.com.   3568    IN      CNAME   idg.map.fastly.net.
idg.map.fastly.net.     30      IN      A       151.101.250.165

;; Query time: 36 msec                          <== 查询用时
;; SERVER: 127.0.0.53#53(127.0.0.53)            <== 本地缓存解析器
;; WHEN: Fri Jul 24 19:11:42 EDT 2020           <== 查询的时间
;; MSG SIZE  rcvd: 97                           <== 返回的字节数
```

如果你得到了一个这样的应答，是好消息吗？简短的回答是“是”。你得到了及时的回复。状态字段（`status: NOERROR`）显示没有问题。你正在连接到一个能够提供所要求的信息的名称服务器，并得到一个回复，告诉你一些关于你所查询的系统的重要细节。简而言之，你已经验证了你的系统和域名系统相处得很好。

其他可能的状态指标包括：

- `SERVFAIL`：被查询的名称存在，但没有数据或现有数据无效。
- `NXDOMAIN`：所查询的名称不存在。
- `REFUSED`：该区域的数据不存在于所请求的权威服务器中，并且在这种情况下，基础设施没有设置为提供响应服务。

下面是一个例子，如果你要查找一个不存在的域名，你会看到什么？

```
$ dig cannotbe.org

; <<>> DiG 9.16.1-Ubuntu <<>> cannotbe.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 35348
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1
```

一般来说，`dig` 比 `ping` 会提供更多的细节，如果域名不存在，`ping` 会回复 “名称或服务未知”。当你查询一个合法的系统时，你可以看到域名系统对该系统知道些什么，这些记录是如何配置的，以及检索这些数据需要多长时间。

（LCTT 译注：`dig` 也比 `nslookup` 提供的数据更多。此外，`dig` 采用的是操作系统的解析库，而 `nslookup` 采用的是自己提供的解析库，这有时候会带来不同的行为。最后，有趣的一点是，`dig` 的返回的格式是符合 BIND 区域文件格式的。）

事实上，有时 `dig` 可以在 `ping` 完全不能响应的时候进行响应，当你试图确定一个连接问题时，这种信息是非常有用的。

### DNS 记录类型和标志

在上面的第一个查询中，我们可以看到一个问题，那就是同时存在 `CNAME` 和 `A` 记录。`CNAME`（<ruby>规范名称<rt>canonical name</rt></ruby>）就像一个别名，把一个域名指向另一个域名。你查询的大多数系统不会有 `CNAME` 记录，而只有 `A` 记录。如果你运行 `dig localhost` 命令，你会看到一个 `A` 记录，它就指向 `127.0.0.1` —— 这是每个系统都使用的“回环”地址。`A` 记录用于将一个名字映射到一个 IP 地址。

DNS 记录类型包括： 

* `A` 或 `AAAA`：IPv4 或 IPv6 地址
* `CNAME`：别名
* `MX`：邮件交换器
* `NS`：名称服务器
* `PTR`：一个反向条目，让你根据 IP 地址找到系统名称
* `SOA`：表示授权记录开始
* `TXT` 一些相关文本

我们还可以在上述输出的第五行看到一系列的“标志”。这些定义在 [RFC 1035][4] 中 —— 它定义了 DNS 报文头中包含的标志，甚至显示了报文头的格式。

```
                                1  1  1  1  1  1
  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                      ID                       |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|QR|   Opcode  |AA|TC|RD|RA|   Z    |   RCODE   |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    QDCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ANCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    NSCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ARCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
```

在上面的初始查询中，第五行显示的标志是：

* `qr` = 查询
* `rd` = 进行递归查询
* `ra` = 递归数据可用

RFC 中描述的其他标志包括：

* `aa` = 权威答复
* `cd` = 检查是否禁用
* `ad` = 真实数据
* `opcode` = 一个 4 位字段
* `tc` = 截断
* `z`（未使用）

### 添加 +trace 选项

如果你添加 `+trace` 选项，你将从 `dig` 得到更多的输出。它会添加更多信息，显示你的 DNS 查询如何通过名称服务器的层次结构找到你要找的答案。

下面显示的所有 `NS` 记录都反映了名称服务器 —— 这只是你将看到的数据的第一部分，因为查询通过名称服务器的层次结构来追踪你要找的东西：

```
$ dig +trace networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> +trace networkworld.com
;; global options: +cmd
.                       84895   IN      NS      k.root-servers.net.
.                       84895   IN      NS      e.root-servers.net.
.                       84895   IN      NS      m.root-servers.net.
.                       84895   IN      NS      h.root-servers.net.
.                       84895   IN      NS      c.root-servers.net.
.                       84895   IN      NS      f.root-servers.net.
.                       84895   IN      NS      a.root-servers.net.
.                       84895   IN      NS      g.root-servers.net.
.                       84895   IN      NS      l.root-servers.net.
.                       84895   IN      NS      d.root-servers.net.
.                       84895   IN      NS      b.root-servers.net.
.                       84895   IN      NS      i.root-servers.net.
.                       84895   IN      NS      j.root-servers.net.
;; Received 262 bytes from 127.0.0.53#53(127.0.0.53) in 28 ms
...
```

最终，你会得到与你的要求直接挂钩的信息：

```
networkworld.com.       300     IN      A       151.101.2.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       14400   IN      NS      ns-d.pnap.net.
networkworld.com.       14400   IN      NS      ns-a.pnap.net.
networkworld.com.       14400   IN      NS      ns0.pcworld.com.
networkworld.com.       14400   IN      NS      ns1.pcworld.com.
networkworld.com.       14400   IN      NS      ns-b.pnap.net.
networkworld.com.       14400   IN      NS      ns-c.pnap.net.
;; Received 269 bytes from 70.42.185.30#53(ns0.pcworld.com) in 116 ms
```

### 挑选响应者

你可以使用 `@` 符号来指定一个特定的名称服务器来处理你的查询。在这里，我们要求 Google 的主名称服务器响应我们的查询：

```
$ dig @8.8.8.8 networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> @8.8.8.8 networkworld.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43640
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       299     IN      A       151.101.66.165
networkworld.com.       299     IN      A       151.101.194.165
networkworld.com.       299     IN      A       151.101.130.165
networkworld.com.       299     IN      A       151.101.2.165

;; Query time: 48 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Sat Jul 25 11:21:19 EDT 2020
;; MSG SIZE  rcvd: 109
```

下面所示的命令对 `8.8.8.8` IP 地址进行反向查找，以显示它属于 Google 的 DNS 服务器。

```
$ nslookup 8.8.8.8
8.8.8.8.in-addr.arpa    name = dns.google.
```

### 总结

`dig` 命令是掌握 DNS 工作原理和在出现连接问题时排除故障的重要工具。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3568488/digging-for-dns-answers-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2017/01/05_tools-100704412-large.jpg
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[4]: https://tools.ietf.org/html/rfc1035
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
