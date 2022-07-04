[#]: subject: "Cloudflare Has Something New to Replace Annoying CAPTCHAs on the Internet"
[#]: via: "https://news.itsfoss.com/cloudflare-pat/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14711-1.html"

Cloudflare 有了一个新东西，它可以替代互联网上烦人的验证码
======

不想通过正确输入 <ruby>验证码<rt>CAPTCHA</rt></ruby> 来证明自己是个人类吗？Cloudflare 可能有了一个解决方案。

![Cloudflare][1]

互联网服务巨头 Cloudflare 前两天 [宣布了][2] <ruby>私有访问令牌<rt>Private Access Tokens</rt></ruby> 功能。这项功能旨在减少你在网络上看到的验证码数量，同时改善你的隐私。

你可能已经发现，验证码在移动设备上是一种可怕的体验。通常，它们会最终会占据整个屏幕，有时甚至无法完成。

作为替代方案，网站可以选择收集唯一识别数据，以证明你是人类。当然，从隐私的角度来看，这种做法是很糟糕的。如果这么做，许多重视隐私的公司都几乎无法避免他们受到 <ruby>僵尸攻击<rt>bot attacks</rt></ruby>。

幸运的是，私有访问令牌（PAT）的发布将改变这一点。

### 私有访问令牌会产生什么影响？

简而言之，私有访问令牌能够做到下面这些事：

* 在支持的设备上减少验证码数量
* 增强用户隐私
* 允许网站所有者确保访问者来自真实设备

然而，深入观察，我们可以看到私有访问令牌的影响力远不止于此。若使用传统的验证码，就有多个实体可以访问你的数据。

首先，你正在访问的网站知道你的 IP 地址和你正在访问的 URL。当然，这些数据是建立连接所需的最低要求。此外，对于更高级的功能，网站还会发送一些用户代理（UA）数据，还好这些数据并不是唯一可识别的。

然而，另一方，也就是验证码提供者，却可以收集更多的数据。与你要访问的网站一样，它也知道你的 IP 地址、用户代理数据和你访问的 URL。不幸的是，除此之外，他们还会收集其他数据，例如你的设备信息和交互数据。如果把这些信息，与你之前完成验证码的时间联系起来，你就会惊讶的发现，他们可以建立一个非常详细的属于你的个人资料。

幸运的是，有了 Cloudflare 的私有访问令牌，你就可以完全绕过验证码，从而阻止验证码提供者收集此类数据。

### 私有访问令牌是如何工作的？

![][3]

验证码的理念是集中尽可能多的数据，私人访问令牌则恰恰相反，它将数据去中心化，因此任何一方都无法唯一识别你。在你提到数据共享之前，Cloudflare 就已经特别指出了，数据不会在各方之间共享。

当你访问使用 Cloudflare 和私人访问令牌的网站的时候，共有三方将处理你的数据的不同部分。

1. 网站。它只会知道你的 IP、URL 和用户代理，这也是建立连接所必需的。
2. 你的设备制造商。他们只会知道那些用于验证设备是否真实所需的设备数据，而不会知道你正在访问哪个网站，或你的 IP 地址是什么。验证了你的设备后，他们将生成一个令牌，该令牌将发送到 Cloudflare。
3. Cloudflare。他们将收到这个令牌，令牌中不包含你的任何设备数据，只有制造商对它是正品的“保证”。他们知道的唯一其他数据，就是你正在访问的网站，同样，这是为你提供内容所必需的。

通过这种方式，Cloudflare 无需接触你的数据，就可以对“你是一个人”充满信心。

### 支持的操作系统：没有 Linux？

你可能已经意识到，私人访问令牌需要特定的操作系统功能才能工作。目前，它们仅存在于苹果最新的操作系统上，即 iOS 和 iPadOS 16，以及 macOS Ventura。这是因为苹果的操作系统只在有限的硬件上运行，设备验证会更加容易。

另一方面，Linux 是一种通用操作系统，旨在在各种硬件上运行。因此，我认为，在可预见的未来，它都不会支持私人访问令牌。

回到苹果，我想到私人访问令牌也可能导致消费者维修设备的权利出现一些问题。例如，如果我用第三方的非正品电池更换了老旧的 iPhone 原装电池，私人访问令牌系统会特殊对待这种情况吗？

如果是 Linux 手机呢？这些制造商，如 Pine64 和 Purism，可能没有支持这样一个系统的基础设施。是否可以在这些上使用私人访问令牌呢？

Cloudflare 在 [公告][4] 中提到：

> 我们正在积极努力让其他客户和设备制造商也使用私人访问令牌框架。每当新客户开始使用它时，从该客户进入你网站的流量将自动开始要求令牌，你的访问者将自动看到更少的验证码。

因此，我们希望看到它被更多的设备和操作系统采用。你如何看待 Cloudflare 的私人访问令牌呢？在下面的评论中发表你的看法吧！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cloudflare-pat/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/cloudflare-private-access-tokens.jpg
[2]: https://blog.cloudflare.com/eliminating-captchas-on-iphones-and-macs-using-new-standard/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/06/PAT-Data-transfer-chart-1024x650.png
[4]: https://blog.cloudflare.com/eliminating-captchas-on-iphones-and-macs-using-new-standard/
