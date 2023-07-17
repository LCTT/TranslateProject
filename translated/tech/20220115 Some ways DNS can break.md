[#]: subject: "Some ways DNS can break"
[#]: via: "https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

一些 DNS 故障
======

当我第一次知道 DNS 时，我想它应该不会很复杂。不就是一些存储在服务器上的 DNS 记录罢了。有什么大不了的？

但是教科书上只是介绍了 DNS 的原理，并没有告诉你实际使用中 DNS 可能会以多少种方式破坏你的系统。

所以我 [在 Twitter 上发起了一个提问][1]，征集人们遇到的 DNS 问题，尤其是那些一开始看起来与 DNS 没什么关系的问题。（“总是 DNS问题”这个梗）

我不打算在这篇文章中讨论如何解决或避免这些问题，但我会放一些讨论这些问题的链接，在那里可以找到解决问题的方法。

### 问题：网络请求缓慢

如果你的网络比预期的要慢，这是因为某些原因导致 DNS 解析器变慢了。这可能是解析器负载过大或者存在内存泄漏等原因导致的。

我的路由器的 DNS 转发器曾遇到过这个问题，导致我的所有 DNS 请求很慢。我通过重启路由器解决了这个问题。

### 问题：DNS 超时

一些网友提到由于 DNS 查询超时，他们的网络请求需要耗时 2 秒多甚至 30 秒。这跟“网络请求缓慢”问题类似，但情况要更糟糕，因为 DNS 请求就会消耗掉几秒钟时间。

Sophie Haskins 有一篇关于 Kubernete DNS 超时的博客文章 [一次 Kube DNS 踩坑经历][2]。 

### 问题：ndots 设置

一些网友提到在 `/etc/resolv.conf` 中设置 `ndots:5` 时会出现问题。

下面是从 [Kubernetes pod 中 /etc/resolv.conf 里设置 ndots:5 为什么会拖慢你的程序性能][3] 中引用的 `/etc/resolv.conf `文件。 

```

    nameserver 100.64.0.10
    search namespace.svc.cluster.local svc.cluster.local cluster.local eu-west-1.compute.internal
    options ndots:5

```

如果你用上面的配置文件，想要查询得域名是 `google.com`，那么你的程序会调用 `getaddrinfo` 函数，而它会依次查询以下域名：

  1. `google.com.namespace.svc.cluster.local.`
  2. `google.com.svc.cluster.local.`
  3. `google.com.cluster.local.`
  4. `google.com.eu-west-1.compute.internal.`
  5. `google.com.`



简单来说，它会检查 `google.com` 是不是 `search` 这一行中的某个子域名。

所以每发起一次 DNS 查询，你都得先等待前 4 次查询失败后才能获取到最终查询结果。

### 问题：难以判断系统使用的 DNS 解析器

这本身并不是一个 bug，但当你遇到 DNS 问题时，一般都会跟 DNS 解析器有关。我没有一种判断 DNS 解析器的万能方法。

下面是我知道的方法：

  * 在 Linux 系统上，最常见的是通过 `/etc/resolv.conf` 来选择 DNS 解析器。但是也有例外，比如浏览器可能会忽略 `/etc/resolv.conf`，而是使用 <ruby>基于 HTTPS 的 DNS <rt>DNS-over-HTTPS</rt></ruby> 服务。
  * 如果你使用的是 UDP DNS，你可以通过 `sudo tcpdump port 53` 来查看 DNS 请求被发送到了哪里。但如果你使用的是基于 HTTPS 的 DNS 或 <ruby>基于 TLS 的 DNS <rt>DNS over TLS</rt></ruby>，这个方法就不行了。
  


我依稀记得这在 MacOS 系统上会更加令人迷惑，我也不清楚原因。

### 问题：DNS 服务器返回 NXDOMAIN 而不是 NOERROR

这是我曾经遇到过的一个 nginx 不能解析域名的问题。

  * 我设置 nginx 使用一个特定的 DNS 服务器来解析 DNS 查询
  * 当访问这个域名时，nginx 做了两次查询，第一次是对 `A` 的，第二次是对 `AAAA` 的
  * 对于 `A` 的查询，DNS 服务器返回 `NXDOMAIN`
  * nginx 认为这个域名不存在，然后放弃查询
  * 对于 `AAAA` 的查询 DNS 服务器返回了成功
  * 但 nginx 忽略了对 `AAAA` 返回的查询结果，因为它前面已经放弃查询了



问题出在 DNS 服务器本应该返回 `NOERROR` 的——那个域名确实存在，只是没有关于 `A` 的记录罢了。我报告了这个 bug，然后他们修复了这个问题。

我自己也写出过这个 bug，所以我理解为什么会发生这种情况——很容易想当然地认为“没有要查询的记录，就应该返回 `NXDOMAIN` 错误码”。

### 问题：自动生效的 DNS 缓存

如果你在生成一个域名的 DNS 记录之前就访问这个域名，那么这个记录的缺失会被缓存起来。当你第一次遇到这个问题时一定会非常吃惊——我也是去年才知道有这个问题。

缓存的 TTL 就是域名的 <ruby>起始权限记录<rt>Start of Authority</rt></ruby> 记录的 TTL ——比如对于 `jvns.ca` ，这个值是一个小时。

### 问题：nginx 永久缓存 DNS 记录

如果你在 nginx 中使用下面的配置：

```

    location / {
        proxy_pass https://some.domain.com;
    }

```

nginx 只会在启动的时候解析一次 `some.domain.com`，以后不会再对其进行解析。这是非常危险的操作，尤其是对于那些 IP 地址经常变动的域名。它可能平安无事地运行几个月，然后突然在某个凌晨两点把你从床上纠起来。

针对这个问题已经有很多众所周知的方法了，但由于本文不是关于 nginx 的，所以我不打算深入探讨它。但你第一次遇到它时一定会很惊讶。

这是一篇关于这个问题发生在 AWS 负载均衡器上的 [博客文章]][4]。 

### 问题：Java 永久缓存 DNS 记录

跟上面类似的问题，只是出现在 Java 上：[据说][5] 这与你 Java 的配置有关。“JVM 的默认 TTL 设置可能会导致只有 JVM 重启时才会刷新 DNS 记录。”

我还没有遇到过这个问题，不过我那些经常写 Java 的朋友遇到过这个问题。

当然，任何软件都可能存在永久缓存 DNS 的问题，但据我所知它经常出现在 nginx 和 Java 上。

### 问题：被遗忘的 /etc/hosts 记录

这是另一种缓存问题：`/etc/hosts` 中的记录会覆盖你的常规 DNS 设置！

让人迷惑的是 `dig` 命令会忽略 `/etc/hosts` 文件。所以当你使用 `dig whatever.com` 来查询 DNS 信息时，它会告诉你一切正常。 

### 问题：电子邮件未发送 / 将成为垃圾邮件

电子邮件是通过 DNS（MX 记录, SPF 记录, DKIM 记录）来发送和验证的，所以有些电子邮件问题其实是 DNS 问题。

### 问题：对国际化域名无效

你可以使用非 ASCII 字符甚至是 emoji 来注册域名，比如 [拉屎网 https://💩.la][6]。

DNS 能够处理国际化域名是因为 `💩.la` 会被用 punycode 编码将转换为 `xn--ls8h.la`。 

尽管已经有了 DNS 处理国际化域名的标准，很多软件并不能很好地处理国际化域名。Julian Squires 的  [干掉 Chrome 浏览器的 emoji！！][7] 就是一个非常有趣的例子。

### 问题：TCP DNS 被防火墙拦截

有人提到一些防火墙会允许在 53 端口上使用 UDP 协议，但是禁止 TCP 协议。然而很多 DNS 查询需要在 53 端口上使用 TCP，这可能会导致很难排查的间歇性的问题。

### 问题：musl 不支持 TCP DNS

很多应用程序使用 `libc` 的 `getaddrinfo` 来做 DNS 查询。`musl` 是用在 Alpine Docker 容器上的 `glibc` 替代品。而它不支持 TCP DNS。如果你的 DNS 查询的响应数据超过 DNS UDP 数据包的大小(512 字节)就会出现问题。

我对此仍然不太清楚，我下面我的理解也可能是错的:

  1. `musl` 的 `getaddrinfo` 发起一个 DNS 请求
  2. DNS 服务器发现请求的响应数据太大了，没法放入一个 DNS 数据包中
  3. DNS 服务器返回一个<ruby>空截断响应<rt>empty truncated response</rt></ruby>，并期望客户端通过 TCP DNS 重新用发起查询
  4. 但 `musl` 不支持 TCP DNS，所以根本不会重试



关于这个问题的文章：[在 Alpine Linux 上的 DNS 解析问题][8]。

###  问题：getaddrinfo　不支持轮询 DNS

<ruby>轮询<rt>round robin</rt></ruby> DNS 是一种 <ruby>负载均衡<rt>load balancing</rt></ruby> 技术，每次 DNS 查询都会获得一个不同的 IP 地址。显然如果你使用 `gethostbyname` 做 DNS 查询不会有任何问题，但是用 `getaddrinfo` 就不行了。因为 `getaddrinfo` 会对获得的 IP 地址进行排序。

在你从 `gethostbyname` 切换到 `getaddrinfo` 时可能完全不会意识到这可能会引起负载均衡问题。

这个问题可能会非常隐蔽，如果你不是用 C 语言编程的话，这些函数调用被隐藏在各种调用库背后，你可能完全意识不到发生了这种改变。所以某次看似人畜无害的升级就可能导致你的 DNS 负载均衡失效。

下面是讨论这个的一些文章：

  * [getaddrinfo 导致轮询 DNS 失效][9]
  * [getaddrinfo，轮询 DNS 和 happy eyeballs 算法][10]



### 问题：启动服务时的竞争条件

有人 [提到][11] 使用 Kubernete DNS 时遇到的问题：他们有两个同时启动的容器，一旦启动就会立即尝试解析对方的地址。由于 Kubernete DNS 还没有改变，所以 DNS 查询会失败。这个失败会被缓存起来，所以后续的查询会一直失败。

### 写在最后

我所列举的不过是 DNS 问题的冰山一角，期待大家告诉我那些我没有提到的问题和相关链接。我希望了解这些问题在实际中是如何发生的以及如何被解决的。


--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1481265429897261058
[2]: https://blog.sophaskins.net/blog/misadventures-with-kube-dns/
[3]: https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html
[4]: https://medium.com/driven-by-code/dynamic-dns-resolution-in-nginx-22133c22e3ab
[5]: https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/java-dg-jvm-ttl.html
[6]: https://💩.la/
[7]: https://www.youtube.com/watch?v=UE-fJjMasec
[8]: https://christoph.luppri.ch/fixing-dns-resolution-for-ruby-on-alpine-linux
[9]: https://groups.google.com/g/consul-tool/c/AGgPjrrkw3g
[10]: https://daniel.haxx.se/blog/2012/01/03/getaddrinfo-with-round-robin-dns-and-happy-eyeballs/
[11]: https://mobile.twitter.com/omatskiv/status/1481305175440646148
