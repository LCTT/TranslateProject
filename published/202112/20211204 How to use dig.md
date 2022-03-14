[#]: subject: "How to use dig"
[#]: via: "https://jvns.ca/blog/2021/12/04/how-to-use-dig/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14051-1.html"

如何使用 dig
======

![](https://img.linux.net.cn/data/attachment/album/202112/05/192530gj36ttdwz16azu6w.jpg)

你好！最近我和几个朋友聊天，他们提到希望知道如何使用 `dig` 来进行 DNS 查询，所以这是一篇关于它的速读博文。

当我第一次使用 `dig` 时，我发现它有点吓人 —— 有这么多的选项！我打算把大部分的选项省略。在这篇文章中，我打算不谈 `dig` 的大部分选项，只谈我实际使用的选项。

我最近还了解到，你可以设置一个 `.digrc` 配置文件，让它的输出更容易阅读，这让它的使用变得更加轻松。

几年前我还画了一个关于 `dig` 的 [zine 页][1]，但我想写这篇文章来包括更多的信息。

### 两种类型的 dig 参数：查询和格式化

有两种主要的参数可以传递给 `dig`：

  1. 告诉 `dig` **要进行什么 DNS 查询的参数**。
  2. 告诉 `dig` 如何 **格式化响应的参数**。

首先，让我们看一下查询选项。

### 主要的查询选项

你通常想控制 DNS 查询的 3 件事是：

  1. **名称**（如 `jvns.ca`）。默认情况下，查询的是空名称（`.`）。
  2. **DNS 查询类型**（如 `A` 或 `CNAME`）。默认是 `A`。
  3. 发送查询的 **服务器**（如 `8.8.8.8`）。默认是 `/etc/resolv.conf` 中的内容。

其格式是：

```
dig @server name type
```

这里有几个例子：

  * `dig @8.8.8.8 jvns.ca` 向谷歌的公共 DNS 服务器（`8.8.8.8`）查询 `jvns.ca`。
  * `dig ns jvns.ca` 对 `jvns.ca` 进行类型为 `NS` 的查询。

### `-x`：进行反向 DNS 查询

我偶尔使用的另一个查询选项是 `-x`，用于进行反向 DNS 查询。下面是输出结果的样子。

```
$ dig -x 172.217.13.174
174.13.217.172.in-addr.arpa. 72888 IN PTR yul03s04-in-f14.1e100.net。
```

`-x` 不是魔术。`dig -x 172.217.13.174` 只是对 `174.13.217.172.in-addr.arpa.` 做了一个 `PTR` 查询。下面是如何在不使用 `-x’ 的情况下进行完全相同的反向 DNS 查询。

```
$ dig ptr 174.13.217.172.in-addr.arpa.
174.13.217.172.in-addr.arpa. 72888 IN PTR yul03s04-in-f14.1e100.net。
```

我总是使用 `-x`，因为它可以减少输入。

### 格式化响应的选项

现在，让我们讨论一下你可以用来格式化响应的参数。

我发现 `dig` 默认格式化 DNS 响应的方式对初学者来说是很难接受的。下面是输出结果的样子：

```
; <<>> DiG 9.16.20 <<>> -r jvns.ca
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28629
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
; COOKIE: d87fc3022c0604d60100000061ab74857110b908b274494d (good)
;; QUESTION SECTION:
;jvns.ca.           IN  A

;; ANSWER SECTION:
jvns.ca.        276 IN  A   172.64.80.1

;; Query time: 9 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Sat Dec 04 09:00:37 EST 2021
;; MSG SIZE  rcvd: 80
```

如果你不习惯看这个，你可能需要花点时间来筛选，找到你要找的 IP 地址。而且大多数时候，你只对这个响应中的一行感兴趣（`jvns.ca. 180 IN A 172.64.80.1`）。

下面是我最喜欢的两种方法，可以使 `dig` 的输出更容易管理：

#### 方式 1 : +noall +answer

这告诉 `dig` 只打印 DNS 响应中的“答案”部分的内容。下面是一个查询 `google.com` 的 `NS` 记录的例子：

```
$ dig +noall +answer ns google.com
google.com.     158564  IN  NS  ns4.google.com.
google.com.     158564  IN  NS  ns1.google.com.
google.com.     158564  IN  NS  ns2.google.com.
google.com.     158564  IN  NS  ns3.google.com.
```

这里的格式是：

```
NAME         TTL            TYPE   CONTENT
google.com   158564   IN    NS     ns3.google.com.
```

顺便说一下：如果你曾经想知道 `IN` 是什么意思，它是指“查询类”，代表“<ruby>互联网<rt> internet</rt></ruby>”。它基本上只是上世纪 80、90 年代的遗物，当时还有其他网络与互联网竞争，如“<ruby>混沌网络<rt>chaosnet</rt></ruby>”。

#### 方式 2：+short

这就像 `dig +noall +answer`，但更短：它只显示每条记录的内容。比如说：

```
$ dig +short ns google.com
ns2.google.com.
ns1.google.com.
ns4.google.com.
ns3.google.com.
```

### 你可以在 `digrc` 中设置格式化选项

如果你不喜欢 `dig` 的默认格式（我就不喜欢！），你可以在你的主目录下创建一个 `.digrc` 文件，告诉它默认使用不同的格式。

我非常喜欢 `+noall +answer` 格式，所以我把 `+noall +answer` 放在我的 `~/.digrc` 中。下面是我使用该配置文件运行 `dig jvns.ca` 时的情况。

```
$ dig jvns.ca
jvns.ca.        255在172.64.80.1中
```

这样读起来就容易多了！

如果我想回到所有输出的长格式（我有时会这样做，通常是因为我想看响应的权威部分的记录），我可以通过运行再次得到一个长答案。

```
$ dig +all jvns.ca
```

### dig +trace

我使用的最后一个 `dig` 选项是 `+trace`。`dig +trace` 模仿 DNS 解析器在查找域名时的做法 —— 它从根域名服务器开始，然后查询下一级域名服务器（如 `.com`），以此类推，直到到达该域名的权威域名服务器。因此，它将进行大约 30 次 DNS 查询。（我用 `tcpdump` 检查了一下，对于每个根域名服务器的 `A` / `AAAA` 记录它似乎要进行 2 次查询，所以这已经是 26 次查询了。我不太清楚它为什么这样做，因为它应该已经有了这些 IP 的硬编码，但它确实如此。）

我发现这对了解 DNS 的工作原理很有用，但我不认为我用它解决过问题。

### 为什么要用 dig

尽管有一些更简单的工具来进行 DNS 查询（如 `dog` 和 `host`），我发现自己还是坚持使用 `dig`。

我喜欢 `dig` 的地方实际上也是我 **不喜欢** `dig` 的地方 —— 它显示了大量的细节！

我知道，如果我运行 `dig +all`，它将显示 DNS 响应的所有部分。例如，让我们查询 `jvns.ca` 的一个根名称服务器。响应有 3 个部分，我可能会关心：回答部分、权威部分和附加部分。

```
$ dig @h.root-servers.net. jvns.ca +all
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18229
;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 4, ADDITIONAL: 9
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;jvns.ca.           IN  A

;; AUTHORITY SECTION:
ca.         172800  IN  NS  c.ca-servers.ca.
ca.         172800  IN  NS  j.ca-servers.ca.
ca.         172800  IN  NS  x.ca-servers.ca.
ca.         172800  IN  NS  any.ca-servers.ca.

;; ADDITIONAL SECTION:
c.ca-servers.ca.    172800  IN  A   185.159.196.2
j.ca-servers.ca.    172800  IN  A   198.182.167.1
x.ca-servers.ca.    172800  IN  A   199.253.250.68
any.ca-servers.ca.  172800  IN  A   199.4.144.2
c.ca-servers.ca.    172800  IN  AAAA    2620:10a:8053::2
j.ca-servers.ca.    172800  IN  AAAA    2001:500:83::1
x.ca-servers.ca.    172800  IN  AAAA    2620:10a:80ba::68
any.ca-servers.ca.  172800  IN  AAAA    2001:500:a7::2

;; Query time: 103 msec
;; SERVER: 198.97.190.53#53(198.97.190.53)
;; WHEN: Sat Dec 04 11:23:32 EST 2021
;; MSG SIZE  rcvd: 289

```

`dog` 也显示了 “附加” 部分的记录，但它没有明确指出哪个是哪个（我猜 `+` 意味着它在附加部分？） ，但它似乎没有显示“权威”部分的记录。

```
$ dog @h.root-servers.net. jvns.ca 
  NS ca.                2d0h00m00s A "c.ca-servers.ca."
  NS ca.                2d0h00m00s A "j.ca-servers.ca."
  NS ca.                2d0h00m00s A "x.ca-servers.ca."
  NS ca.                2d0h00m00s A "any.ca-servers.ca."
   A c.ca-servers.ca.   2d0h00m00s + 185.159.196.2
   A j.ca-servers.ca.   2d0h00m00s + 198.182.167.1
   A x.ca-servers.ca.   2d0h00m00s + 199.253.250.68
   A any.ca-servers.ca. 2d0h00m00s + 199.4.144.2
AAAA c.ca-servers.ca.   2d0h00m00s + 2620:10a:8053::2
AAAA j.ca-servers.ca.   2d0h00m00s + 2001:500:83::1
AAAA x.ca-servers.ca.   2d0h00m00s + 2620:10a:80ba::68
AAAA any.ca-servers.ca. 2d0h00m00s + 2001:500:a7::2
```

而 `host` 似乎只显示“答案”部分的记录（在这种情况下没有得到记录）：

```
$ host jvns.ca h.root-servers.net
Using domain server:
Name: h.root-servers.net
Address: 198.97.190.53#53
Aliases:
```

总之，我认为这些更简单的 DNS 工具很好（我甚至自己做了一个 [简单的网络 DNS 工具][2]），如果你觉得它们更容易，你绝对应该使用它们，但这就是为什么我坚持使用 `dig` 的原因。`drill` 的输出格式似乎与 `dig` 的非常相似，也许 `drill` 更好！但我还没有真正试过它。

### 就这些了

我最近才知道 `.digrc`，我非常喜欢使用它，所以我希望它能帮助你们中的一些人花更少的时间来整理 `dig` 的输出！

有人在 Twitter 上指出，如果有办法让 `dig` 显示响应的简短版本，其中也包括响应的状态（如 `NOERROR`、`NXDOMAIN`、`SERVFAIL` 等），那就更好了！我同意这个观点！不过我在手册中没有找到这样的选项。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/12/04/how-to-use-dig/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/comics/dig/
[2]: https://dns-lookup.jvns.ca/
