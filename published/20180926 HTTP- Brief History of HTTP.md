[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10621-1.html)
[#]: subject: (HTTP: Brief History of HTTP)
[#]: via: (https://hpbn.co/brief-history-of-http/#http-09-the-one-line-protocol)
[#]: author: (Ilya Grigorik https://www.igvita.com/)

HTTP 简史
======

译注：本文来源于 2013 年出版的《High Performance Browser Networking》的第九章，因此有些信息略有过时。事实上，现在 HTTP/2 已经有相当的不是，而新的 HTTP/3 也在设计和标准制定当中。

### 介绍

<ruby>超文本传输协议<rt>Hypertext Transfer Protocol</rt></ruby>（HTTP）是互联网上最普遍和广泛采用的应用程序协议之一。它是客户端和服务器之间的通用语言，支持现代 Web。从最初作为单个的关键字和文档路径开始，它已成为不仅仅是浏览器的首选协议，而且几乎是所有连接互联网硬件和软件应用程序的首选协议。

在本文中，我们将简要回顾 HTTP 协议的发展历史。对 HTTP 不同语义的完整讨论超出了本文的范围，但理解 HTTP 的关键设计变更以及每个变更背后的动机将为我们讨论 HTTP 性能提供必要的背景，特别是在 HTTP/2 中即将进行的许多改进。

### HTTP 0.9: 单行协议

<ruby>蒂姆·伯纳斯·李<rt>Tim Berners-Lee</rt></ruby> 最初的 HTTP 提案在设计时考虑到了简单性，以帮助他采用他的另一个新想法：<ruby>万维网<rt>World Wide Web</rt></ruby>。这个策略看起来奏效了：注意，他是一个有抱负的协议设计者。

1991 年，伯纳斯·李概述了这个新协议的动机，并列出了几个高级设计目标：文件传输功能、请求超文档存档索引搜索的能力，格式协商以及将客户端引用到另一个服务器的能力。为了证明该理论的实际应用，构建了一个简单原型，它实现了所提议功能的一小部分。

  * 客户端请求是一个 ASCII 字符串。
  * 客户端请求以回车符（CRLF）终止。
  * 服务器响应是 ASCII 字符流。
  * 服务器响应是一种超文本标记语言（HTML）。
  * 文档传输完成后连接终止。

然而，即使这听起来也比实际复杂得多。这些规则支持的是一种非常简单的，对 Telnet 友好的协议，一些 Web 服务器至今仍然支持这种协议：

```
$> telnet google.com 80

Connected to 74.125.xxx.xxx

GET /about/

(hypertext response)
(connection closed)
```

请求包含这样一行：`GET` 方法和请求文档的路径。响应是一个超文本文档，没有标题或任何其他元数据，只有 HTML。真的是再简单不过了。此外，由于之前的交互是预期协议的子集，因此它获得了一个非官方的 HTTP 0.9 标签。其余的，就像他们所说的，都是历史。

从 1991 年这些不起眼的开始，HTTP 就有了自己的生命，并在接下来几年里迅速发展。让我们快速回顾一下 HTTP 0.9 的特性：

  * 采用客户端-服务器架构，是一种请求-响应协议。
  * 采用 ASCII 协议，运行在 TCP/IP 链路上。
  * 旨在传输超文本文档（HTML）。
  * 每次请求后，服务器和客户端之间的连接都将关闭。

> 流行的 Web 服务器，如 Apache 和 Nginx，仍然支持 HTTP 0.9 协议，部分原因是因为它没有太多功能！如果你感兴趣，打开 Telnet 会话并尝试通过 HTTP 0.9 访问 google.com 或你最喜欢的网站，并检查早期协议的行为和限制。

### HTTP/1.0: 快速增长和 Informational RFC

1991 年至 1995 年期间，HTML 规范和一种称为 “web 浏览器”的新型软件快速发展，面向消费者的公共互联网基础设施也开始出现并快速增长。

> **完美风暴：1990 年代初的互联网热潮**

> 基于蒂姆·伯纳斯·李最初的浏览器原型，美国国家超级计算机应用中心（NCSA）的一个团队决定实现他们自己的版本。就这样，第一个流行的浏览器诞生了：NCSA Mosaic。1994 年 10 月，NCSA 团队的一名程序员 Marc Andreessen 与 Jim Clark 合作创建了 Mosaic Communications，该公司后来改名为 Netscape（网景），并于 1994 年 12 月发布了 Netscape Navigator 1.0。从这一点来说，已经很清楚了，万维网已经不仅仅是学术上的好奇心了。

> 实际上，同年在瑞士日内瓦组织了第一次万维网会议，这导致<ruby>万维网联盟<rt>World Wide Web Consortium</rt></ruby>（W3C）的成立，以帮助指导 HTML 的发展。同样，在 IETF 内部建立了一个并行的<ruby>HTTP 工作组<rt>HTTP Working Group</rt></ruby>（HTTP-WG），专注于改进 HTTP 协议。后来这两个团体一直对 Web 的发展起着重要作用。

> 最后，完美风暴来临，CompuServe，AOL 和 Prodigy 在 1994-1995 年的同一时间开始向公众提供拨号上网服务。凭借这股迅速的浪潮，Netscape 在 1995 年 8 月 9 日凭借其成功的 IPO 创造了历史。这预示着互联网热潮已经到来，人人都想分一杯羹！

不断增长的新 Web 所需功能及其在公共网站上的应用场景很快暴露了 HTTP 0.9 的许多基础限制：我们需要一种能够提供超文本文档、提供关于请求和响应的更丰富的元数据，支持内容协商等等的协议。相应地，新兴的 Web 开发人员社区通过一个特殊的过程生成了大量实验性的 HTTP 服务器和客户端实现来回应：实现，部署，并查看其他人是否采用它。

从这些急速增长的实验开始，一系列最佳实践和常见模式开始出现。1996 年 5 月，<ruby>HTTP 工作组<rt>HTTP Working Group</rt></ruby>（HTTP-WG）发布了 RFC 1945，它记录了许多被广泛使用的 HTTP/1.0 实现的“常见用法”。请注意，这只是一个信息性 RFC：HTTP/1.0，如你所知的，它不是一个正式规范或 Internet 标准！

话虽如此，HTTP/1.0 请求看起来应该是：

```
$> telnet website.org 80

Connected to xxx.xxx.xxx.xxx

GET /rfc/rfc1945.txt HTTP/1.0 ❶
User-Agent: CERN-LineMode/2.15 libwww/2.17b3
Accept: */*

HTTP/1.0 200 OK ❷
Content-Type: text/plain
Content-Length: 137582
Expires: Thu, 01 Dec 1997 16:00:00 GMT
Last-Modified: Wed, 1 May 1996 12:45:26 GMT
Server: Apache 0.84

(plain-text response)
(connection closed)
```

- ❶ 请求行有 HTTP 版本号，后面跟请求头
- ❷ 响应状态，后跟响应头

前面的交互并不是 HTTP/1.0 功能的详尽列表，但它确实说明了一些关键的协议更改：

* 请求可能多个由换行符分隔的请求头字段组成。
* 响应对象的前缀是响应状态行。
* 响应对象有自己的一组由换行符分隔的响应头字段。
* 响应对象不限于超文本。
* 每次请求后，服务器和客户端之间的连接都将关闭。

请求头和响应头都保留为 ASCII 编码，但响应对象本身可以是任何类型：HTML 文件、纯文本文件、图像或任何其他内容类型。因此，HTTP 的“超文本传输”部分在引入后不久就变成了用词不当。实际上，HTTP 已经迅速发展成为一种超媒体传输，但最初的名称没有改变。

除了媒体类型协商之外，RFC 还记录了许多其他常用功能：内容编码、字符集支持、多部分类型、授权、缓存、代理行为、日期格式等。

> 今天，几乎所有 Web 上的服务器都可以并且仍将使用 HTTP/1.0。不过，现在你应该更加清楚了！每个请求都需要一个新的 TCP 连接，这会对 HTTP/1.0 造成严重的性能损失。参见[三次握手][1]，接着会[慢启动][2]。

### HTTP/1.1: Internet 标准

将 HTTP 转变为官方 IETF 互联网标准的工作与围绕 HTTP/1.0 的文档工作并行进行，并计划从 1995 年至 1999 年完成。事实上，第一个正式的 HTTP/1.1 标准定义于 RFC 2068，它在 HTTP/1.0 发布大约六个月后，即 1997 年 1 月正式发布。两年半后，即 1999 年 6 月，一些新的改进和更新被纳入标准，并作为 RFC 2616 发布。

HTTP/1.1 标准解决了早期版本中发现的许多协议歧义，并引入了一些关键的性能优化：保持连接，分块编码传输，字节范围请求，附加缓存机制，传输编码和请求管道。

有了这些功能，我们现在可以审视一下由任何现代 HTTP 浏览器和客户端执行的典型 HTTP/1.1 会话：

```
$> telnet website.org 80
Connected to xxx.xxx.xxx.xxx

GET /index.html HTTP/1.1 ❶
Host: website.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4)... (snip)
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Encoding: gzip,deflate,sdch
Accept-Language: en-US,en;q=0.8
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3
Cookie: __qca=P0-800083390... (snip)

HTTP/1.1 200 OK ❷
Server: nginx/1.0.11
Connection: keep-alive
Content-Type: text/html; charset=utf-8
Via: HTTP/1.1 GWA
Date: Wed, 25 Jul 2012 20:23:35 GMT
Expires: Wed, 25 Jul 2012 20:23:35 GMT
Cache-Control: max-age=0, no-cache
Transfer-Encoding: chunked

100 ❸
<!doctype html>
(snip)

100
(snip)

0 ❹

GET /favicon.ico HTTP/1.1 ❺
Host: www.website.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4)... (snip)
Accept: */*
Referer: http://website.org/
Connection: close ❻
Accept-Encoding: gzip,deflate,sdch
Accept-Language: en-US,en;q=0.8
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3
Cookie: __qca=P0-800083390... (snip)

HTTP/1.1 200 OK ❼
Server: nginx/1.0.11
Content-Type: image/x-icon
Content-Length: 3638
Connection: close
Last-Modified: Thu, 19 Jul 2012 17:51:44 GMT
Cache-Control: max-age=315360000
Accept-Ranges: bytes
Via: HTTP/1.1 GWA
Date: Sat, 21 Jul 2012 21:35:22 GMT
Expires: Thu, 31 Dec 2037 23:55:55 GMT
Etag: W/PSA-GAu26oXbDi

(icon data)
(connection closed)
```

- ❶ 请求的 HTML 文件，包括编、字符集和 cookie 元数据
- ❷ 原始 HTML 请求的分块响应
- ❸ 以 ASCII 十六进制数字（256 字节）表示块中的八位元的数量
- ❹ 分块流响应结束
- ❺ 在相同的 TCP 连接上请求一个图标文件
- ❻ 通知服务器不再重用连接
- ❼ 图标响应后，然后关闭连接

哇，这里发生了很多事情！第一个也是最明显的区别是我们有两个对象请求，一个用于 HTML 页面，另一个用于图像，它们都通过一个连接完成。这就是保持连接的实际应用，它允许我们重用现有的 TCP 连接到同一个主机的多个请求，提供一个更快的最终用户体验。参见[TCP 优化][3]。

要终止持久连接，注意第二个客户端请求通过 `Connection` 请求头向服务器发送显示的 `close`。类似地，一旦传输响应，服务器就可以通知客户端关闭当前 TCP 连接。从技术上讲，任何一方都可以在没有此类信号的情况下终止 TCP 连接，但客户端和服务器应尽可能提供此类信号，以便双方都启用更好的连接重用策略。

> HTTP/1.1 改变了 HTTP 协议的语义，默认情况下使用保持连接。这意味着，除非另有说明（通过 `Connection:close` 头），否则服务器应默认保持连接打开。

> 但是，同样的功能也被反向移植到 HTTP/1.0 上，通过 `Connection:keep-Alive` 头启用。因此，如果你使用 HTTP/1.1，从技术上讲，你不需要 `Connection:keep-Alive` 头，但许多客户端仍然选择提供它。

此外，HTTP/1.1 协议还添加了内容、编码、字符集，甚至语言协商、传输编码、缓存指令、客户端 cookie，以及可以针对每个请求协商的十几个其他功能。

我们不打算详细讨论每个 HTTP/1.1 特性的语义。这个主题可以写一本专门的书了，已经有了很多很棒的书。相反，前面的示例很好地说明了 HTTP 的快速进展和演变，以及每个客户端-服务器交换的错综复杂的过程，里面发生了很多事情！

> 要了解 HTTP 协议所有内部工作原理，参考 David Gourley 和 Brian Totty 共同撰写的权威指南： The Definitive Guide。

### HTTP/2: 提高传输性能

RFC 2616 自发布以来，已经成为互联网空前增长的基础：数十亿各种形状和大小的设备，从台式电脑到我们口袋里的小型网络设备，每天都在使用 HTTP 来传送新闻，视频，在我们生活中的数百万的其他网络应用程序都在依靠它。

一开始是一个简单的，用于检索超文本的简单协议，很快演变成了一种通用的超媒体传输，现在十年过去了，它几乎可以为你所能想象到的任何用例提供支持。可以使用协议的服务器无处不在，客户端也可以使用协议，这意味着现在许多应用程序都是专门在 HTTP 之上设计和部署的。

需要一个协议来控制你的咖啡壶？RFC 2324 已经涵盖了超文本咖啡壶控制协议（HTCPCP/1.0）- 它原本是 IETF 在愚人节开的一个玩笑，但在我们这个超链接的新世界中，它不仅仅意味着一个玩笑。

> 超文本传输协议（HTTP）是一个应用程序级的协议，用于分布式、协作、超媒体信息系统。它是一种通用的、无状态的协议，可以通过扩展请求方法、错误码和头，用于超出超文本之外的许多任务，比如名称服务器和分布式对象管理系统。HTTP 的一个特性是数据表示的类型和协商，允许独立于传输的数据构建系统。
>
> RFC 2616: HTTP/1.1, June 1999

HTTP 协议的简单性是它最初被采用和快速增长的原因。事实上，现在使用 HTTP 作为主要控制和数据协议的嵌入式设备（传感器，执行器和咖啡壶）并不罕见。但在其自身成功的重压下，随着我们越来越多地继续将日常互动转移到网络 —— 社交、电子邮件、新闻和视频，以及越来越多的个人和工作空间，它也开始显示出压力的迹象。用户和 Web 开发人员现在都要求 HTTP/1.1 提供近乎实时的响应能力和协议
性能，如果不进行一些修改，就无法满足这些要求。

为了应对这些新挑战，HTTP 必须继续发展，因此 HTTPbis 工作组在 2012 年初宣布了一项针对 HTTP/2 的新计划：

> 已经有一个协议中出现了新的实现经验和兴趣，该协议保留了 HTTP 的语义，但是没有保留 HTTP/1.x 的消息框架和语法，这些问题已经被确定为妨碍性能和鼓励滥用底层传输。
>
> 工作组将使用有序的双向流中生成 HTTP 当前语义的新表达式的规范。与 HTTP/1.x 一样，主要传输目标是 TCP，但是应该可以使用其他方式传输。
>
> HTTP/2 charter, January 2012

HTTP/2 的主要重点是提高传输性能并支持更低的延迟和更高的吞吐量。主要的版本增量听起来像是一个很大的步骤，但就性能而言，它将是一个重大的步骤，但重要的是要注意，没有任何高级协议语义收到影响：所有的 HTTP 头，值和用例是相同的。

任何现有的网站或应用程序都可以并且将通过 HTTP/2 传送而无需修改。你无需修改应用程序标记来利用 HTTP/2。HTTP 服务器将来一定会使用 HTTP/2，但这对大多数用户来说应该是透明的升级。如果工作组实现目标，唯一的区别应该是我们的应用程序以更低的延迟和更好的网络连接利用率来传送数据。
 
话虽如此，但我们不要走的太远了。在讨论新的 HTTP/2 协议功能之前，有必要回顾一下我们现有的 HTTP/1.1 部署和性能最佳实践。HTTP/2 工作组正在新规范上取得快速的进展，但即使最终标准已经完成并准备就绪，在可预见的未来，我们仍然必须支持旧的 HTTP/1.1 客户端，实际上，这得十年或更长时间。

--------------------------------------------------------------------------------

via: https://hpbn.co/brief-history-of-http/#http-09-the-one-line-protocol

作者：[Ilya Grigorik][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.igvita.com/
[b]: https://github.com/lujun9972
[1]: https://hpbn.co/building-blocks-of-tcp/#three-way-handshake
[2]: https://hpbn.co/building-blocks-of-tcp/#slow-start
[3]: https://hpbn.co/building-blocks-of-tcp/#optimizing-for-tcp
