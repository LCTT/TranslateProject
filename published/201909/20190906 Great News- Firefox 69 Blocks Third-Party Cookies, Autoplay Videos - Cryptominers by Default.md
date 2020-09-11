[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11346-1.html)
[#]: subject: (Great News! Firefox 69 Blocks Third-Party Cookies, Autoplay Videos & Cryptominers by Default)
[#]: via: (https://itsfoss.com/firefox-69/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Firefox 69 默认阻拦第三方 Cookie、自动播放的视频和加密矿工
======

如果你使用的是 [Mozilla Firefox][1] 并且尚未更新到最新版本，那么你将错过许多新的重要功能。

### Firefox 69 版本中的一些新功能

首先，Mozilla Firefox 69 会默认强制执行更强大的安全和隐私选项。以下是新版本的一些主要亮点。

#### Firefox 69 阻拦视频自动播放

![][2]

现在很多网站都提供了自动播放视频。无论是弹出视频还是嵌入在文章中设置为自动播放的视频，默认情况下，Firefox 69 都会阻止它（或者可能会提示你）。

这个[阻拦自动播放][3]功能可让用户自动阻止任何视频播放。

#### 禁止第三方跟踪 cookie

默认情况下，作为<ruby>增强型跟踪保护<rt>Enhanced Tracking Protection</rt></ruby>功能的一部分，它现在将阻止第三方跟踪 Cookie 和加密矿工。这是 Mozilla Firefox 的增强隐私保护功能的非常有用的改变。

Cookie 有两种：第一方的和第三方的。第一方 cookie 由网站本身拥有。这些是“好的 cookie”，可以让你保持登录、记住你的密码或输入字段等来改善浏览体验。第三方 cookie 由你访问的网站以外的域所有。广告服务器使用这些 Cookie 来跟踪你，并在你访问的所有网站上跟踪广告。Firefox 69 旨在阻止这些。

当它发挥作用时，你将在地址栏中看到盾牌图标。你可以选择为特定网站禁用它。

![Firefox Blocking Tracking][4]

#### 禁止加密矿工消耗你的 CPU

![][5]

对加密货币的欲望一直困扰着这个世界。GPU 的价格已经高企，因为专业的加密矿工们使用它们来挖掘加密货币。

人们使用工作场所的计算机秘密挖掘加密货币。当我说工作场所时，我不一定是指 IT 公司。就在今年，[人们在乌克兰的一家核电站抓住了偷挖加密货币的活动][6]。

不仅如此。如果你访问某些网站，他们会运行脚本并使用你的计算机的 CPU 来挖掘加密货币。这在 IT 术语中被称为 <ruby>[挖矿攻击][7]<rt>cryptojacking</rt></ruby>。

好消息是 Firefox 69 会自动阻止这些加密矿工脚本。因此，网站不再能利用你的系统资源进行挖矿攻击了。

####  Firefox 69 带来的更强隐私保护

![][8]

如果你把隐私保护设置得更严格，那么它也会阻止指纹。因此，当你在 Firefox 69 中选择严格的隐私设置时，你不必担心通过[指纹][9]共享计算机的配置信息。

在[关于这次发布的官方博客文章][10]中，Mozilla 提到，在此版本中，他们希望默认情况下为 100％ 的用户提供保护。

#### 性能改进

尽管在更新日志中没有提及 Linux，但它提到了在 Windows 10/mac OS 上运行性能、UI 和电池寿命有所改进。如果你发现任何性能改进，请在评论中提及。

### 总结

除了所有这些之外，还有很多底层的改进。你可以查看[发行说明][11]中的详细信息。

Firefox 69 对于关注其隐私的用户来说是一个令人印象深刻的更新。与我们最近对某些[安全电子邮件服务][12]的建议类似，我们建议你更新浏览器以充分受益。新版本已在大多数 Linux 发行版中提供，你只需要更新你的系统即可。

如果你对阻止广告和跟踪 Cookie 的浏览器感兴趣，请尝试[开源的 Brave 浏览器][13]，他们甚至给你提供了加密货币以让你使用他们的浏览器，你可以使用这些加密货币来奖励你最喜爱的发布商。

你觉得这个版本怎么样？请在下面的评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/firefox-69/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-firefox/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/auto-block-firefox.png?ssl=1
[3]: https://support.mozilla.org/en-US/kb/block-autoplay
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/firefox-blocking-tracking.png?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/firefox-shield.png?ssl=1
[6]: https://thenextweb.com/hardfork/2019/08/22/ukrainian-nuclear-powerplant-mine-cryptocurrency-state-secrets/
[7]: https://hackernoon.com/cryptojacking-in-2019-is-not-dead-its-evolving-984b97346d16
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/firefox-secure.jpg?ssl=1
[9]: https://clearcode.cc/blog/device-fingerprinting/
[10]: https://blog.mozilla.org/blog/2019/09/03/todays-firefox-blocks-third-party-tracking-cookies-and-cryptomining-by-default/
[11]: https://www.mozilla.org/en-US/firefox/69.0/releasenotes/
[12]: https://itsfoss.com/secure-private-email-services/
[13]: https://itsfoss.com/brave-web-browser/
