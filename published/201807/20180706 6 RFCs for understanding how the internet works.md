6 个可以帮你理解互联网工作原理的 RFC 
======

> 以及 3 个有趣的 RFC。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe)

阅读源码是开源软件的重要组成部分。这意味着用户可以查看代码并了解做了什么。

但“阅读源码”并不仅适用于代码。理解代码实现的标准同样重要。这些标准编写在由<ruby>[互联网工程任务组][1]<rt>Internet Engineering Task Force</rt></ruby>（IETF）发布的称为“<ruby>意见征集<rt>Requests for Comment</rt></ruby>”（RFC）的文档中。多年来已经发布了数以千计的 RFC，因此我们收集了一些我们的贡献者认为必读的内容。

### 6 个必读的 RFC

#### RFC 2119 - 在 RFC 中用于指示需求级别的关键字

这是一个快速阅读，但它对了解其它 RFC 非常重要。 [RFC 2119][2] 定义了后续 RFC 中使用的需求级别。 “MAY” 究竟意味着什么？如果标准说 “SHOULD”，你*真的*必须这样做吗？通过为需求提供明确定义的分类，RFC 2119 有助于避免歧义。

#### RFC 3339 - 互联网上的日期和时间：时间戳

时间是全世界程序员的祸根。 [RFC 3339][3] 定义了如何格式化时间戳。基于 [ISO 8601][4] 标准，3339 为我们提供了一种表达时间的常用方法。例如，像星期几这样的冗余信息不应该包含在存储的时间戳中，因为它很容易计算。

#### RFC 1918 - 私有互联网的地址分配

有属于每个人的互联网，也有只属于你的互联网。私有网络一直在使用，[RFC 1918][5] 定义了这些网络。当然，你可以在路由器上设置在内部使用公网地址，但这是一个坏主意。或者，你可以将未使用的公共 IP 地址视为内部网络。在任何一种情况下都表明你从未阅读过 RFC 1918。

#### RFC 1912 - 常见的 DNS 操作和配置错误

一切都是 #@%@ 的 DNS 问题，对吧？ [RFC 1912][6] 列出了管理员在试图保持互联网运行时所犯的错误。虽然它是在 1996 年发布的，但 DNS（以及人们犯的错误）并没有真正改变这么多。为了理解我们为什么首先需要 DNS，如今我们再来看看 [RFC 289 - 我们希望正式的主机列表是什么样子的][7] 就知道了。

#### RFC 2822 — 互联网邮件格式

想想你知道什么是有效的电子邮件地址么？如果你知道有多少个站点不接受我邮件地址中 “+” 的话，你就知道你知道不知道了。 [RFC 2822][8] 定义了有效的电子邮件地址。它还详细介绍了电子邮件的其余部分。

#### RFC 7231 - 超文本传输​​协议（HTTP/1.1）：语义和内容

想想看，几乎我们在网上做的一切都依赖于 HTTP。 [RFC 7231][9] 是该协议的最新更新。它有超过 100 页，定义了方法、请求头和状态代码。

### 3 个应该阅读的 RFC

好吧，并非每个 RFC 都是严肃的。

#### RFC 1149 - 在禽类载体上传输 IP 数据报的标准

网络以多种不同方式传递数据包。 [RFC 1149][10] 描述了鸽子载体的使用。当我距离州际高速公路一英里以外时，它们的可靠性不会低于我的移动提供商。

#### RFC 2324 — 超文本咖啡壶控制协议（HTCPCP/1.0）

咖啡对于完成工作非常重要，当然，我们需要一个用于管理咖啡壶的程序化界面。 [RFC 2324][11] 定义了一个用于与咖啡壶交互的协议，并添加了 HTTP 418（“我是一个茶壶”）。

#### RFC 69 — M.I.T.的分发列表更改

[RFC 69][12] 是否是第一个误导取消订阅请求的发布示例？

你必须阅读的 RFC 是什么（无论它们是否严肃）？在评论中分享你的列表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/requests-for-comments-to-know

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://www.ietf.org
[2]:https://www.rfc-editor.org/rfc/rfc2119.txt
[3]:https://www.rfc-editor.org/rfc/rfc3339.txt
[4]:https://www.iso.org/iso-8601-date-and-time-format.html
[5]:https://www.rfc-editor.org/rfc/rfc1918.txt
[6]:https://www.rfc-editor.org/rfc/rfc1912.txt
[7]:https://www.rfc-editor.org/rfc/rfc289.txt
[8]:https://www.rfc-editor.org/rfc/rfc2822.txt
[9]:https://www.rfc-editor.org/rfc/rfc7231.txt
[10]:https://www.rfc-editor.org/rfc/rfc1149.txt
[11]:https://www.rfc-editor.org/rfc/rfc2324.txt
[12]:https://www.rfc-editor.org/rfc/rfc69.txt
