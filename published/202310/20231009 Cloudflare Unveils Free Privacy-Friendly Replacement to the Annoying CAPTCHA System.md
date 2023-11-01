[#]: subject: "Cloudflare Unveils Free Privacy-Friendly Replacement to the Annoying CAPTCHA System"
[#]: via: "https://news.itsfoss.com/cloudflare-captcha-replacement/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16271-1.html"

Cloudflare 推出免费的、更注重隐私的替代验证码系统
======

![][0]

> Cloudflare 最终提出了一种可结束视觉难题的解决方案。

自 [去年][1] 以来，Cloudflare 一直在研发一种更加注重隐私的验证码（CAPTCHA）替代系统。

可恶的验证码（尤其是谷歌的 reCAPTCHA）的问题是其无必要地收集用户数据、延迟体验时间、在网络导航中造成不便。

当然，验证码在一定程度上具有其用处。如果我声称它一无是处，无疑会显得无知。然而，随着技术的发展，以及为了提供无缝体验，我们所有的 [隐私保护工具][2] 都在不断进步，我们也需要一个连贯的系统来保护网站免受机器人的侵扰。

令人感兴趣的是，Cloudfare 设法整合了一项**每个人都可以免费使用作为替代品的技术**，那就是**Cloudflare Turnstile**。和每个 Cloudflare 的产品一样，你可以得到一个 "_Enterprise_" 计划，能够移除其品牌标识，并做一些其他操作。

### Cloudflare Turnstile：彻底摆脱验证码！

有了 [Cloudflare Turnstile][4]，你将永远不再需要解答任何视觉难题。

一开始，即使是它的自家隐私优先的验证码系统也会向部分用户展示难题。

现在，所有这些都已被他们的新产品替换。你只需进行一次点击，就可以验证你是人类：

![来源：Cloudflare 博客][5]

为了确保隐私保护目标的实现，Cloudflare 作出了以下说明：

> 我们创立 Turnstile 就是为了保护隐私。Turnstile 达到了 <ruby>[电子隐私指令][6]<rt>ePrivacy Directive</rt></ruby>、[GDPR][7] 及 [CCPA][8] 的合规性要求，也符合我们自己严格的隐私承诺。此外，Cloudflare 的 [FedRAMP Moderate 授权套餐][9]、"Cloudflare for Government" 现在也包括 Turnstile。我们并不依赖于追踪用户数据，比如用户访问过其他哪些网站，来判断用户是人还是机器人。我们的业务是保护网站，而不是卖广告，因此，运营商可以放心部署 Turnstile，知道他们的用户数据安全无虞。

此外，Cloudflare 认为，即使不向用户提供任何交互元素，它也能比现有的验证码系统更有效。它可以保护网站免受机器人流量，以及欺诈行为的侵害。

所以，有些人可能甚至不会看到人类验证的挑战，因为 Cloudflare 已经通过后台进行了一系列的检查和分析以发现可疑行为。

**有什么更让人兴奋的吗？**

![][10]

所有这些都是免费提供的。任何不使用 Cloudflare 作为防火墙或 CDN 的网站或平台，只需添加**几行代码**，即可选择使用本服务。

> **[Cloudflare Turnstile][4]**

你还可以按照官方 [文档][14] 的指南，从 [reCAPTCHA][12] 或 [hCAPTCHA][13] 迁移到该系统。

欲了解更多技术信息，你可以查看 [Cloudflare 的公告][15]。

💬 你如何评价 Cloudflare 的新系统，能在无需验证码的情况下阻挡机器人并提升用户体验呢？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cloudflare-captcha-replacement/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/cloudflare-pat/
[2]: https://itsfoss.com/privacy-tools/
[3]: https://proton.go2cloud.org/favicons/apple-touch-icon.png
[4]: https://www.cloudflare.com/en-in/products/turnstile/
[5]: https://news.itsfoss.com/content/images/2023/10/cloudflare-turnstile.gif
[6]: https://www.cloudflare.com/learning/privacy/what-is-eprivacy-directive/
[7]: https://www.cloudflare.com/learning/privacy/what-is-the-gdpr/
[8]: https://www.cloudflare.com/learning/privacy/what-is-the-ccpa/
[9]: https://marketplace.fedramp.gov/products/FR2000863987
[10]: https://news.itsfoss.com/content/images/2023/10/turnsite-dashboard.jpg
[11]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[12]: https://www.google.com/recaptcha/about/
[13]: https://www.hcaptcha.com/
[14]: https://developers.cloudflare.com/turnstile/migration/
[15]: https://blog.cloudflare.com/turnstile-ga/
[0]: https://img.linux.net.cn/data/attachment/album/202310/10/104321aioinl13v7i9nz6b.jpg