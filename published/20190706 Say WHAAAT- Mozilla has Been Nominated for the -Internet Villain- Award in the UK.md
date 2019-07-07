[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11068-1.html)
[#]: subject: (Say WHAAAT? Mozilla has Been Nominated for the “Internet Villain” Award in the UK)
[#]: via: (https://itsfoss.com/mozilla-internet-villain/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

什么？！Mozilla 被提名英国“互联网恶棍”奖
======

Mozilla Firefox 是目前最流行的浏览器之一。很多用户喜欢它胜过 Chrome 就是因为它鼓励隐私保护，并且可以通过一些选项设置让你的互联网活动尽可能地私密。

不过最近推出的功能之一 —— 仍然处于测试阶段的 [DoH (DNS-over-HTTPS)][1] 功能却受到了英国互联网服务提供商行业协会的负面评价。

英国<ruby>互联网服务提供商行业协会<rt>Internet Services Providers Association</rt></ruby>（ISPA）决定将 Mozilla 列入 2019 年“互联网恶棍”奖的最终入围者名单。该奖项将在 ISPA 于 7 月 11 日在伦敦举行的颁奖典礼上进行颁发。

![][3]

### 为什么说 “Mozilla” 是 “互联网恶棍”？

ISPA 在他们的声明中表示，Mozilla 因为支持了 DoH（DNS-over-HTTPS）而被视为“互联网恶棍”。

> [@mozilla][4] 被提名为 [#ISPA][5] 的 [#互联网恶棍][6] 是因为他们试图推行 DNS-over-HTTPS 以绕开英国的内容过滤系统和家长监护模式，破坏了英国 [#互联网][7] 安全准则。 <https://t.co/d9NaiaJYnk> [pic.twitter.com/WeZhLq2uvi][8]
>
> — 英国互联网提供商行业协会 (ISPAUK) (@ISPAUK) [2019 年 7 月 4 日][9]

![](https://pbs.twimg.com/media/D-n8WlvX4AAnWIW.jpg)

和 Mozilla 一同被列入最终入围者名单的还有欧盟《版权法第 13 条》和美国总统特朗普。ISPA 在他们的声明里是这样解释的：

**Mozilla**：因为试图推行 DNS-over-HTTPS 以绕开英国的内容过滤系统和家长监护模式，破坏了英国互联网安全准则。

**欧盟《版权法第 13 条》**：因为要求各平台使用“内容识别技术”，威胁到了线上言论自由。

**美国总统特朗普**：因为在试图保护其国家安全的过程中，为复杂的全球通信供应链带来了巨大的不确定性。

### 什么是 DNS-over-HTTPS?

你可以将 DoH 理解为，域名解析服务（DNS）的请求通过 HTTPS 连接加密传输。

传统意义上的 DNS 请求是不会被加密的，因此你的 DNS 提供商或者是互联网服务提供商（ISP）可以监视或者是控制你的浏览行为。如果没有 DoH，你很容易被 DNS 提供商强制拦截和进行内容过滤，并且你的互联网服务提供商也同样可以做到。

然而 DoH 颠覆了这一点，可以让你得到一个私密的浏览体验。

你可以研究一下 [Mozilla 是如何开展和 Cloudflare 的合作的][11]，并且可以自己配置一下 DoH（如果需要的话）。

### DoH 有用吗？

既有用又没有用。

当然了，从事情的一方面来看，DoH 可以帮助用户绕过 DNS 或者互联网服务提供商强制的内容过滤系统。如果说 DoH 有助于满足我们避开互联网审查的需求，那么它是一件好事情。

不过从事情的另一方面来看，如果你是一位家长，而你的孩子在 Mozilla Firefox 上使用了 DoH 的话，你就无法 [设置内容过滤器][12] 了。这取决于 [防火墙配置][13] 的好坏。

DoH 可能会成为一些人绕过家长监护的手段，这可能不是一件好事。

如果我这样的说法有问题，你可以在下面的评论区纠正我。

并且，使用 DoH 就意味着你没办法使用本地 host 文件了（如果你正用它作为广告拦截或者是其它用途的话）。

### 总结

你是如何看待 DoH 的呢？它足够好吗？

你又是如何看待 ISPA 的决定的呢？你觉得他们这样的声明是不是在鼓励互联网审查和政府对网民的监控呢？

我个人觉得这个提名决定非常可笑。即使 DoH 并不是所有人都需要的那个终极功能，能够有一种保护个人隐私的选择也总不是件坏事。

在下面的评论区里发表你的看法吧。最后我想引用这么一句话：

> 在谎言遍地的时代，说真话是一种革命行为。（LCTT 译注：引自乔治奥威尔）

--------------------------------------------------------------------------------

via: https://itsfoss.com/mozilla-internet-villain/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/DNS_over_HTTPS
[2]: https://www.ispa.org.uk/ispa-announces-finalists-for-2019-internet-heroes-and-villains-trump-and-mozilla-lead-the-way-as-villain-nominees/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/mozilla-internet-villain.jpg?resize=800%2C450&ssl=1
[4]: https://twitter.com/mozilla?ref_src=twsrc%5Etfw
[5]: https://twitter.com/hashtag/ISPAs?src=hash&ref_src=twsrc%5Etfw
[6]: https://twitter.com/hashtag/InternetVillain?src=hash&ref_src=twsrc%5Etfw
[7]: https://twitter.com/hashtag/internet?src=hash&ref_src=twsrc%5Etfw
[8]: https://t.co/WeZhLq2uvi
[9]: https://twitter.com/ISPAUK/status/1146725374455373824?ref_src=twsrc%5Etfw
[10]: https://itsfoss.com/why-firefox/
[11]: https://blog.nightly.mozilla.org/2018/06/01/improving-dns-privacy-in-firefox/
[12]: https://itsfoss.com/how-to-block-porn-by-content-filtering-on-ubuntu/
[13]: https://itsfoss.com/set-up-firewall-gufw/
