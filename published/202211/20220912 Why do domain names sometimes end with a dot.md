[#]: subject: "Why do domain names sometimes end with a dot?"
[#]: via: "https://jvns.ca/blog/2022/09/12/why-do-domain-names-end-with-a-dot-/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15254-1.html"

为什么有时候域名的末尾有个点？
======

![](https://img.linux.net.cn/data/attachment/album/202211/15/001222ytut3qvtau32f2p2.jpg)

大家好！今年早些时候，我在写《[DNS 是如何工作的][1]》 时，有人问我——为什么人们有时在域名的末尾加一个点？例如，如果你通过运行 `dig example.com` 查询 `example.com` 的 IP，你会看到一下内容：

```
$ dig example.com
example.com.        5678    IN  A   93.184.216.34
```

执行完 `dig` 命令后，`example.com` 有一个 `.` ——变成了 `example.com.`！发生了什么？

有些 DNS 工具也要求传给它的域名后加一个 `.`：如果你在使用 [miekg/dns][2] 时传给它 `example.com`，它会报错：

```
// trying to send this message will return an error
m := new(dns.Msg)
m.SetQuestion("example.com", dns.TypeA)
```

最初我以为我知道这个问题的答案（“呃，末尾的点意味着域名是完全限定的？”）。这是对的 —— 一个<ruby>完全限定域名<rt>fully qualified domain name</rt></ruby>（FQDN）是一个末尾有 `.` 的域名！

但是*为什么*末尾的点是有用且重要的呢？

### 在 DNS 的请求/响应中，域名的末尾并没有 “.”

我曾经（错误地）认为 “为什么末尾有一个点？”的答案可能是 “在 DNS 请求/响应中，域名末尾有一个 `.`，所以我们把它放进去，以匹配你的计算机实际发送/接收的内容”。但事实并不是这样！

当计算机发送 DNS 请求/响应时，域名的末尾并没有点。实际上，域名中*没有*点。

域名会被编码成一系列的长度/字符串对。例如，域名 `example.com` 被编码为这 13 个字节。

```
7example3com0
```

编码后的内容一个点也没有。一个 ASCII 域名（如 `example.com`）被转成了各种 DNS 软件的 DNS 请求/响应中使用的格式。

今天我们来讨论域名被转成 DNS 响应的一个地方：区域文件。

### 区域文件中域名末尾的 “.”

一些人管理域名的 DNS 记录的方法是创建一个被称为 “区域文件” 的文本文件，然后配置一些 DNS 服务器软件（如 `nsd` 或 `bind`）来为该区域文件中指定的 DNS 记录提供服务。

下面是一个对应 `example.com` 的示例区域文件：

```
orange  300   IN    A     1.2.3.4
fruit   300   IN    CNAME orange
grape   3000  IN    CNAME example.com.
```

在这个文件中，任何不以 `.` 结尾的域名（比如 `orange`）后都会自动加上 `.example.com`。所以 `orange` 成了 `orange.example.com` 的简称。DNS 服务器从它的配置中得知这是一个 `example.com` 的区域文件，所以它知道在所有不以点结尾的名字后面自动添加 `example.com`。

我想这里的想法只是为了少打几个字符——如果要打出全称，区域文件会是这样：

```

    orange.example.com.  300   IN    A     1.2.3.4
    fruit.example.com.   300   IN    CNAME orange.example.com.
    grape.example.com.   3000  IN    CNAME example.com.

```

确实多了很多字符。

### 你也可以不通过区域文件来使用 DNS

尽管官方的 DNS RFC（[RFC 1035][3]）中定义了区域文件格式，但你也可以不通过区域文件来使用 DNS。例如，AWS Route 53 就不用区域文件来存储 DNS 记录！你可以通过 Web 界面或 API 来创建记录，我猜他们是用某种数据库而不是一堆文本文件来存储记录。

不过，Route 53（像许多其他 DNS 工具一样）确实支持导入和导出区域文件，这个功能或许在你更换 DNS 提供商时很有用。

### dig 命令输出中末尾的 “.”

现在我们来讨论下 `dig` 命令的输出：

```
$ dig example.com
; <<>> DiG 9.18.1-1ubuntu1.1-Ubuntu <<>> +all example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 10712
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;example.com.           IN  A

;; ANSWER SECTION:
example.com.        81239   IN  A   93.184.216.34
```

有一件奇怪的事是，几乎每一行都以 `;;` 开头，这是怎么回事？`;` 是区域文件中的注释字符！

我想 `dig` 以这种奇怪的方式输出的原因可能是为了方便你粘贴这些内容到区域文件时，不用修改就可以直接用。

这也是 `example.com` 末尾有个 `.` 的原因 —— 区域文件要求域名末尾必须有点（否则它们会被解释为是相对于该区域的）。因此 `dig` 也这么处理了。

我真的希望 dig 有一个 `+human` 选项，以更人性化的方式打印出这些信息，但现在我太懒了，懒得花工夫去实际贡献代码来做这件事（而且我并不擅长 C），所以我只能在我的博客上抱怨一下 :)

### curl 命令输出中末尾的 “.”

我们来看下另一个末尾有 `.` 的例子：`curl`！

我家里有台计算机名为 `grapefruit`，其上运行着 Web 服务器。当我执行 `curl grapefruit` 时，会输出：

```
$ curl grapefruit
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
......
```

这样运行没问题！但是如果我在域名后加一个 `.` 会怎样呢？它报错了：

```
$ curl grapefruit.
curl: (6) Could not resolve host: grapefruit.
```

发生了什么？为了搞清楚，我们需要先来学习下搜索域：

### 初识搜索域

当我执行 `curl grapefrult` 时，它是怎么被转成一个 DNS 请求的？你可能会认为我的计算机会向域名 `grapefruit` 发送一个请求，对吗？但事实并不是这样。

让我们用 `tcpdump` 来看看到底是什么域名在被查询。

```
$ sudo tcpdump -i any port 53
[...] A? grapefruit.lan. (32)
```

实际上是向 `grapefruit.lan.` 发送的请求。为什么呢？

解释一下：

  1. `curl` 调用函数 `getaddrinfo` 来查询 `grapefruit`
  2. `getaddrinfo` 查询了我计算机上的文件 `/etc/resolv.conf`
  3. `/etc/resolv.conf` 包含两行内容：
        ```
        nameserver 127.0.0.53
        search lan
        ```
  4. 因为有 `search lan` 这行内容，所以 `getaddrinfo` 在 `grapefruit` 的末尾添加了一个 `lan`，去查询 `grapefruit.lan`

### 什么时候搜索域被使用?

现在我们知道了一些奇怪的事情：当我们查询一个域名时，有时会有一个额外的东西（如 `lan`）被加到最后。但是什么时候会发生这种情况呢？

  1. 如果我们在域名**末尾**添加一个 `.`，那么这时不会用到搜索域
  2. 如果域名**中间包含**一个 `.`（如 `example.com`），那么默认也不会用到搜索域。但是可以通过修改配置来改变处理逻辑（在 [ndots][4] 里有更详细的说明）

我们现在知道了 `curl grapefruit.` 与 `curl grapefruit` 结果不一样的原因——因为一个查询的是 `grapefruit.`，而另一个查询的是 `grapefruit.lan.`。

### 我的计算机怎么知道使用哪个搜索域呢？

当我连接路由时，它会通过 DHCP 告诉我它的搜索域是 `lan` —— 它也是通过这个方式给我的计算机分配 IP。

### 所以为什么要在域名末尾加一个点呢？

现在我们已经了解了区域文件和搜索域，下面是我认为的人们要在域名末尾加点的原因：

有两种情况下，域名会被修改，并在末尾添加其他东西。

  * 在 `example.com` 的区域文件中，`grapefruit` 会被转为 `grapefruit.example.com`
  * 在我的本地网络（我的计算机已经配置了使用搜索域 `lan`），`grapefruit` 被转为 `grapefruit.lan`

因此，由于域名在某些情况下实际上可能被转成其他名字，人们就在结尾处加一个 `.`，以此来表示 “**这是域名，末尾不需要添加任何东西，这就是全部内容**”。否则会引起混乱。

“这就是全部内容”的技术术语是**“完全限定域名”**，简称为**“FQDN”**。所以 `google.com.` 是一个完全限定域名，而 `google.com` 不是。

我总是要提醒自己这样做的原因，因为我很少使用区域文件和搜索域，所以我经常觉得——“我当然是指 `google.com` 而不是 `google.com.something.else`! 我为什么要指其他东西？那太傻了！”

但是有些人确实在使用区域文件和搜索域（例如 Kubernetes 中使用了搜索域！），所以结尾的 `.` 很有用，可以让人确切的知道，不应该再添加其他东西。

### 什么时候在末尾添加 “.”？

以下是关于何时在域名末尾加 ". " 的几个简单说明：

**需要添加：配置 DNS 时**

在配置 DNS 时，使用完全限定域名从来都不是坏事。你不一定要这样做：非完全限定域名通常也能正常工作，但我从来没有遇到过不接受完全限定域名的 DNS 软件。

有些 DNS 软件需要这样做：现在我为 `jvns.ca` 使用的 DNS 服务器让我在域名的末尾加上 `.`（例如在 CNAME 记录中），并提示如果我不添加，它将在我输入的内容末尾加上 `.jvns.ca`。我不同意这个设计决定，但这不是什么大问题，我只是在最后加一个 `.`。

**不需要加：在浏览器中**

令人困惑的是，在浏览器中，在域名结尾处加一个 `.` *不能*正常运行。例如，如果我在浏览器中输入 `https://twitter.com.`，它就会报错。它会返回 404。

我认为这里发生的事情是，它将 HTTP `Host` 标头设置为 `Host：twitter.com.`，而对端的 Web 服务器则期望 `Host：twitter.com`。

同样地，`https://jvns.ca.` 由于某种原因，返回了一个 SSL 错误。

### 我认为相对域名在过去是比较常见的

最后一件事：我认为“相对”域名（比如我用 `grapefruit` 来指代我家的另一台计算机 `grapefruit.lan`）在过去更常用，因为 DNS 是在大学或其他有大型内部网络的大机构中开发的。

在今天的互联网上，使用“绝对”域名（如 `example.com`）似乎更为普遍。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/09/12/why-do-domain-names-end-with-a-dot-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/zines/dns/
[2]: https://github.com/miekg/dns
[3]: https://www.rfc-editor.org/rfc/rfc1035#section-4.1.1
[4]: https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html
