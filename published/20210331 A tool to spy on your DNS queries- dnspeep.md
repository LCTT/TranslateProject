[#]: subject: (A tool to spy on your DNS queries: dnspeep)
[#]: via: (https://jvns.ca/blog/2021/03/31/dnspeep-tool/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13353-1.html)

dnspeep：监控 DNS 查询的工具
======

![](https://img.linux.net.cn/data/attachment/album/202105/02/191521i4ycjm7veln426vy.jpg)

在过去的几天中，我编写了一个叫作 [dnspeep][1] 的小工具，它能让你看到你电脑中正进行的 DNS 查询，并且还能看得到其响应。它现在只有 [250 行 Rust 代码][2]。

我会讨论如何去尝试它、能做什么、为什么我要编写它，以及当我在开发时所遇到的问题。

### 如何尝试

我构建了一些二进制文件，因此你可以快速尝试一下。

对于 Linux（x86）：

```
wget https://github.com/jvns/dnspeep/releases/download/v0.1.0/dnspeep-linux.tar.gz
tar -xf dnspeep-linux.tar.gz
sudo ./dnspeep
```

对于 Mac：

```
wget https://github.com/jvns/dnspeep/releases/download/v0.1.0/dnspeep-macos.tar.gz
tar -xf dnspeep-macos.tar.gz
sudo ./dnspeep
```

它需要以<ruby>超级用户<rt>root</rt></ruby>身份运行，因为它需要访问计算机正在发送的所有 DNS 数据包。 这与 `tcpdump` 需要以超级身份运行的原因相同：它使用 `libpcap`，这与 tcpdump 使用的库相同。 

如果你不想在超级用户下运行下载的二进制文件，你也能在 <https://github.com/jvns/dnspeep> 查看源码并且自行编译。

### 输出结果是什么样的

以下是输出结果。每行都是一次 DNS 查询和响应：

```
$ sudo dnspeep
query   name                 server IP      response
A       firefox.com          192.168.1.1    A: 44.235.246.155, A: 44.236.72.93, A: 44.236.48.31
AAAA    firefox.com          192.168.1.1    NOERROR
A       bolt.dropbox.com     192.168.1.1    CNAME: bolt.v.dropbox.com, A: 162.125.19.131
```

这些查询是来自于我在浏览器中访问的 `neopets.com`，而 `bolt.dropbox.com` 查询是因为我正在运行 Dropbox 代理，并且我猜它不时会在后台运行，因为其需要同步。

### 为什么我要开发又一个 DNS 工具？

之所以这样做，是因为我认为当你不太了解 DNS 时，DNS 似乎真的很神秘！

你的浏览器（和你电脑上的其他软件）一直在进行 DNS 查询，我认为当你能真正看到请求和响应时，似乎会有更多的“真实感”。

我写这个也把它当做一个调试工具。我想“这是 DNS 的问题？”的时候，往往很难回答。我得到的印象是，当尝试检查问题是否由 DNS 引起时，人们经常使用试错法或猜测，而不是仅仅查看计算机所获得的 DNS 响应。

### 你可以看到哪些软件在“秘密”使用互联网

我喜欢该工具的一方面是，它让我可以感知到我电脑上有哪些程序正使用互联网！例如，我发现在我电脑上，某些软件出于某些理由不断地向 `ping.manjaro.org` 发送请求，可能是为了检查我是否已经连上互联网了。

实际上，我的一个朋友用这个工具发现，他的电脑上安装了一些以前工作时的企业监控软件，但他忘记了卸载，因此你甚至可能发现一些你想要删除的东西。

### 如果你不习惯的话， tcpdump 会令人感到困惑

当我试图向人们展示他们的计算机正在进行的 DNS 查询时，我的第一感是想“好吧，使用 tcpdump”！而 `tcpdump` 确实可以解析 DNS 数据包！

例如，下方是一次对 `incoming.telemetry.mozilla.org.` 的 DNS 查询结果：

```
11:36:38.973512 wlp3s0 Out IP 192.168.1.181.42281 > 192.168.1.1.53: 56271+ A? incoming.telemetry.mozilla.org. (48)
11:36:38.996060 wlp3s0 In  IP 192.168.1.1.53 > 192.168.1.181.42281: 56271 3/0/0 CNAME telemetry-incoming.r53-2.services.mozilla.com., CNAME prod.data-ingestion.prod.dataops.mozgcp.net., A 35.244.247.133 (180)
```

绝对可以学着去阅读理解一下，例如，让我们分解一下查询：

`192.168.1.181.42281 > 192.168.1.1.53: 56271+ A? incoming.telemetry.mozilla.org. (48)`

 * `A?` 意味着这是一次 A 类型的 DNS **查询**
 * `incoming.telemetry.mozilla.org.` 是被查询的名称
 * `56271` 是 DNS 查询的 ID
 * `192.168.1.181.42281` 是源 IP/端口
 * `192.168.1.1.53` 是目的 IP/端口
 * `(48)` 是 DNS 报文长度

在响应报文中，我们可以这样分解：

`56271 3/0/0 CNAME telemetry-incoming.r53-2.services.mozilla.com., CNAME prod.data-ingestion.prod.dataops.mozgcp.net., A 35.244.247.133 (180)`

  * `3/0/0` 是在响应报文中的记录数：3 个回答，0 个权威记录，0 个附加记录。我认为 tcpdump 甚至只打印出回答响应报文。
  * `CNAME telemetry-incoming.r53-2.services.mozilla.com`、`CNAME prod.data-ingestion.prod.dataops.mozgcp.net.` 和 `A 35.244.247.133` 是三个响应记录。
  *  `56271` 是响应报文 ID，和查询报文的 ID 相对应。这就是你如何知道它是对前一行请求的响应。

我认为，这种格式最难处理的是（作为一个只想查看一些 DNS 流量的人），你必须手动匹配请求和响应，而且它们并不总是相邻的行。这就是计算机擅长的事情！

因此，我决定编写一个小程序（`dnspeep`）来进行匹配，并排除一些我认为多余的信息。

### 我在编写时所遇到的问题

在撰写本文时，我遇到了一些问题：

  * 我必须给 `pcap` 包打上补丁，使其能在 Mac 操作系统上和 Tokio 配合工作（[这个更改][3]）。这是其中的一个 bug，花了很多时间才搞清楚，用了 1 行代码才解决 :)
  * 不同的 Linux 发行版似乎有不同的 `libpcap.so` 版本。所以我不能轻易地分发一个动态链接 libpcap 的二进制文件（你可以 [在这里][4] 看到其他人也有同样的问题）。因此，我决定在 Linux 上将 libpcap 静态编译到这个工具中。但我仍然不太了解如何在 Rust 中正确做到这一点作，但我通过将 `libpcap.a` 文件复制到 `target/release/deps` 目录下，然后直接运行 `cargo build`，使其得以工作。
  * 我使用的 `dns_parser` carte 并不支持所有 DNS 查询类型，只支持最常见的。我可能需要更换一个不同的工具包来解析 DNS 数据包，但目前为止还没有找到合适的。
  * 因为 `pcap` 接口只提供原始字节（包括以太网帧），所以我需要 [编写代码来计算从开头剥离多少字节才能获得数据包的 IP 报头][5]。我很肯定我还遗漏了一些情形。

我对于给它取名也有过一段艰难的时光，因为已经有许多 DNS 工具了（dnsspy！dnssnoop！dnssniff！dnswatch！）我基本上只是查了下有关“监听”的每个同义词，然后选择了一个看起来很有趣并且还没有被其他 DNS 工具所占用的名称。

该程序没有做的一件事就是告诉你哪个进程进行了 DNS 查询，我发现有一个名为 [dnssnoop][6] 的工具可以做到这一点。它使用 eBPF，看上去很酷，但我还没有尝试过。

### 可能会有许多 bug

我只在 Linux 和 Mac 上简单测试了一下，并且我已知至少有一个 bug（不支持足够多的 DNS 查询类型），所以请在遇到问题时告知我！

尽管这个 bug 没什么危害，因为这 libpcap 接口是只读的。所以可能发生的最糟糕的事情是它得到一些它无法解析的输入，最后打印出错误或是崩溃。

### 编写小型教育工具很有趣

最近，我对编写小型教育的 DNS 工具十分感兴趣。

到目前为止我所编写的工具：

  * <https://dns-lookup.jvns.ca>（一种进行 DNS 查询的简单方法）
  * <https://dns-lookup.jvns.ca/trace.html>（向你显示在进行 DNS 查询时内部发生的情况）
  * 本工具（`dnspeep`）

以前我尽力阐述已有的工具（如 `dig` 或 `tcpdump`）而不是编写自己的工具，但是经常我发现这些工具的输出结果让人费解，所以我非常关注以更加友好的方式来看这些相同的信息，以便每个人都能明白他们电脑正在进行的 DNS 查询，而不仅仅是依赖 tcmdump。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/03/31/dnspeep-tool/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/jvns/dnspeep
[2]: https://github.com/jvns/dnspeep/blob/f5780dc822df5151f83703f05c767dad830bd3b2/src/main.rs
[3]: https://github.com/ebfull/pcap/pull/168
[4]: https://github.com/google/gopacket/issues/734
[5]: https://github.com/jvns/dnspeep/blob/f5780dc822df5151f83703f05c767dad830bd3b2/src/main.rs#L136
[6]: https://github.com/lilydjwg/dnssnoop
