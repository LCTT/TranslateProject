[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (5 Firefox extensions to protect your privacy)
[#]: via: (https://opensource.com/article/18/7/firefox-extensions-protect-privacy)
[#]: author: ( Chris Short https://opensource.com/users/chrisshort)
[#]: url: (https://linux.cn/article-10316-1.html)

5 个保护你隐私的 Firefox 扩展
======
> 用这些关注隐私的工具使你的浏览器免于泄露数据。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/biz_cinderblock_cloud_yellowhat.jpg?itok=sJdlsYTF)

在<ruby>剑桥分析公司<rt>Cambridge Analytica</rt></ruby>这件事后，我仔细研究了我让 Facebook 渗透到我的网络生活的程度。由于我一般担心单点故障，我不是一个使用社交登录的人。我使用密码管理器为每个站点创建唯一的登录（你也应该这样做）。

我最担心的 Facebook 对我的数字生活的普遍侵扰。在深入了解剑桥分析公司这件事后，我几乎立即卸载了 Facebook 的移动程序。我还从 Facebook [断开了对所有应用、游戏和网站的连接][1]。是的，这将改变你在 Facebook 上的体验，但它也将保护您的隐私。作为一名有遍布全球朋友的人，保持 Facebook 的社交连接对我来说非常重要。

我还仔细审查了其他服务。我检查了 Google、Twitter、GitHub 以及任何未使用的连接应用。但我知道这还不够。我需要我的浏览器主动防止侵犯我隐私的行为。我开始研究如何做到最好。当然，我可以锁定浏览器，但是我需要使我用的网站和工具正常使用，同时试图防止它们泄露数据。

以下是五种可在使用浏览器时保护你隐私的工具。前三个扩展可用于 Firefox 和 Chrome，而后两个仅适用于 Firefox。

### Privacy Badger

我已经使用 [Privacy Badger][2] 有一段时间了。其他内容或广告拦截器做得更好吗？也许。很多内容拦截器的问题在于它们的“付费显示”。这意味着他们有收费的“合作伙伴”白名单。这就站在了为什么存在内容拦截器这件事的对立面。Privacy Badger 是由电子前沿基金会 （EFF） 制作的，这是一家以捐赠为基础的商业模式的非营利实体。Privacy Badger 承诺从你的浏览习惯中学习，并且很少需要调整。例如，我只需将一些网站列入白名单。Privacy Badger 允许精确控制在哪些站点上启用哪些跟踪器。这是我无论在哪个浏览器必须安装的头号扩展。

### DuckDuckGo Privacy Essentials

搜索引擎 DuckDuckGo 通常有隐私意识。[DuckDuckGo Privacy Essentials][3] 适用于主流的移动设备和浏览器。它的独特之处在于它根据你提供的设置对网站进行评分。例如，即使启用了隐私保护，Facebook 也会获得 D。同时，[chrisshort.net][4] 在启用隐私保护时获得 B 和禁用时获得 C。如果你因任何原因不喜欢 EFF 或 Privacy Badger，我会推荐 DuckDuckGo Privacy Essentials（选择一个，而不是两个，因为它们基本上做同样的事情）。

### HTTPS Everywhere

[HTTPS Everywhere][5] 是 EFF 的另一个扩展。根据 HTTPS Everywhere 的说法，“网络上的许多网站都通过 HTTPS 提供一些有限的加密支持，但使它难以使用。例如，它们可能默认为未加密的 HTTP 或在加密的页面里面使用返回到未加密站点的链接。HTTPS Everywhere 扩展通过使用聪明的技术将对这些站点的请求重写为 HTTPS 来解决这些问题。“虽然许多网站和浏览器在实施 HTTPS 方面越来越好，但仍有很多网站仍需要帮助。HTTPS Everywhere 将尽力确保你的流量已加密。

### NoScript Security Suite

[NoScript Security Suite][6] 不适合胆小的人。虽然这个 Firefox 独有扩展“允许 JavaScript、Java、Flash 和其他插件只能由你选择的受信任网站执行”，但它并不能很好地确定你的选择。但是，毫无疑问，防止泄漏数据的可靠方法是不执行可能会泄露数据的代码。NoScript 通过其“基于白名单的抢占式脚本阻止”实现了这一点。这意味着你需要为尚未加入白名单的网站构建白名单。请注意，NoScript 仅适用于 Firefox。

### Facebook Container

[Facebook Container][7] 使 Firefox 成为我在使用 Facebook 时的唯一浏览器。 “Facebook Container 的工作原理是将你的 Facebook 身份隔离到一个单独的容器中，这使得 Facebook 更难以使用第三方 Cookie 跟踪你访问其他网站。” 这意味着 Facebook 无法窥探浏览器中其他地方发生的活动。 突然间，这些令人毛骨悚然的广告将停止频繁出现（假设你在移动设备上卸载了 Facebook 应用）。 在隔离的空间中使用 Facebook 将阻止任何额外的数据收集。 请记住，你已经提供了 Facebook 数据，而 Facebook Container 无法阻止这些数据被共享。

这些是我浏览器隐私的首选扩展。 你的是什么？ 请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/firefox-extensions-protect-privacy

作者：[Chris Short][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/chrisshort
[1]:https://www.facebook.com/help/211829542181913
[2]:https://www.eff.org/privacybadger
[3]:https://duckduckgo.com/app
[4]:https://chrisshort.net
[5]:https://www.eff.org/https-everywhere
[6]:https://noscript.net/
[7]:https://addons.mozilla.org/en-US/firefox/addon/facebook-container/
