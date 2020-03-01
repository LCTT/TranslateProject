[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11931-1.html)
[#]: subject: (Digging up IP addresses with the Linux dig command)
[#]: via: (https://www.networkworld.com/article/3527430/digging-up-ip-addresses-with-the-dig-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 dig 命令挖掘域名解析信息
======

> 命令行工具 `dig` 是用于解析域名和故障排查的一个利器。

![](https://img.linux.net.cn/data/attachment/album/202002/26/094028jgvzguau1pdgicpz.jpg)

从主要功能上来说，`dig` 和 `nslookup` 之间差异不大，但 `dig` 更像一个加强版的 `nslookup`，可以查询到一些由域名服务器管理的信息，这在排查某些问题的时候非常有用。总的来说，`dig` 是一个既简单易用又功能强大的命令行工具。（LCTT 译注：`dig` 和 `nslookup` 行为的主要区别来自于 `dig`  使用是是操作系统本身的解析库，而 `nslookup` 使用的是该程序自带的解析库，这有时候会带来一些行为差异。此外，从表现形式上看，`dig` 返回是结果是以 BIND 配置信息的格式返回的，也带有更多的技术细节。）

`dig` 最基本的功能就是查询域名信息，因此它的名称实际上是“<ruby>域名信息查询工具<rt>Domain Information Groper</rt></ruby>”的缩写。`dig` 向用户返回的内容可以非常详尽，也可以非常简洁，展现内容的多少完全由用户在查询时使用的选项来决定。

### 我只需要查询 IP 地址

如果只需要查询某个域名指向的 IP 地址，可以使用 `+short` 选项：

```
$ dig facebook.com +short
31.13.66.35
```

在查询的时候发现有的域名会指向多个 IP 地址？这其实是网站提高其可用性的一种措施。

```
$ dig networkworld.com +short
151.101.2.165
151.101.66.165
151.101.130.165
151.101.194.165
```

也正是由于这些网站通过负载均衡实现高可用，在下一次查询的时候，或许会发现这几个 IP 地址的排序有所不同。（LCTT 译注：浏览器等应用默认会使用返回的第一个 IP 地址，因此这样实现了一种简单的负载均衡。）

```
$ dig networkworld.com +short
151.101.130.165
151.101.194.165
151.101.2.165
151.101.66.165
```

### 标准返回

`dig` 的标准返回内容则包括这个工具本身的一些信息，以及请求域名服务器时返回的响应内容：

```
$ dig networkworld.com

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>*gt; networkworld.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 39932
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165

;; Query time: 108 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Thu Feb 13 13:49:53 EST 2020
;; MSG SIZE  rcvd: 109
```

由于域名服务器有缓存机制，返回的内容可能是之前缓存好的信息。在这种情况下，`dig` 最后显示的<ruby>查询时间<rt>Query time</rt></ruby>会是 0 毫秒（0 msec）：

```
;; Query time: 0 msec        <==
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Thu Feb 13 15:30:09 EST 2020
;; MSG SIZE  rcvd: 109
```

### 向谁查询？

在默认情况下，`dig` 会根据 `/etc/resolv.conf` 这个文件的内容决定向哪个域名服务器获取查询结果。你也可以使用 `@` 来指定 `dig` 请求的域名服务器。

在下面的例子中，就指定了 `dig` 向 Google 的域名服务器 8.8.8.8 查询域名信息。

```
$ dig @8.8.8.8 networkworld.com

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>> @8.8.8.8 networkworld.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21163
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       299     IN      A       151.101.130.165
networkworld.com.       299     IN      A       151.101.66.165
networkworld.com.       299     IN      A       151.101.194.165
networkworld.com.       299     IN      A       151.101.2.165

;; Query time: 48 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Thu Feb 13 14:26:14 EST 2020
;; MSG SIZE  rcvd: 109
```

想要知道正在使用的 `dig` 工具的版本，可以使用 `-v` 选项。你会看到类似这样：

```
$ dig -v
DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu
```

或者这样的返回信息：

```
$ dig -v
DiG 9.11.4-P2-RedHat-9.11.4-22.P2.el8
```

如果你觉得 `dig` 返回的内容过于详细，可以使用 `+noall`（不显示所有内容）和 `+answer`（仅显示域名服务器的响应内容）选项，域名服务器的详细信息就会被忽略，只保留域名解析结果。

```
$ dig networkworld.com +noall +answer

; <<>> DiG 9.11.5-P4-5.1ubuntu2.1-Ubuntu <<>> networkworld.com +noall +answer
;; global options: +cmd
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165
```

### 批量查询域名

如果你要查询多个域名，可以把这些域名写入到一个文件内（`domains`），然后使用下面的 `dig` 命令遍历整个文件并给出所有查询结果。

```
$ dig +noall +answer -f domains
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.2.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.194.165
world.std.com.          77972   IN      A       192.74.137.5
uushenandoah.org.       1982    IN      A       162.241.24.209
amazon.com.             18      IN      A       176.32.103.205
amazon.com.             18      IN      A       176.32.98.166
amazon.com.             18      IN      A       205.251.242.103
```

你也可以在上面的命令中使用 `+short` 选项，但如果其中有些域名指向多个 IP 地址，就无法看出哪些 IP 地址对应哪个域名了。在这种情况下，更好地做法应该是让 `awk` 对返回内容进行处理，只留下第一列和最后一列：

```
$ dig +noall +answer -f domains | awk '{print $1,$NF}'
networkworld.com. 151.101.66.165
networkworld.com. 151.101.130.165
networkworld.com. 151.101.194.165
networkworld.com. 151.101.2.165
world.std.com. 192.74.137.5
amazon.com. 176.32.98.166
amazon.com. 205.251.242.103
amazon.com. 176.32.103.205
```

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3527430/digging-up-ip-addresses-with-the-dig-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
