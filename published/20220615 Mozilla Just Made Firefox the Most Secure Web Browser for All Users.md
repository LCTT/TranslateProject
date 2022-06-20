[#]: subject: "Mozilla Just Made Firefox the Most Secure Web Browser for All Users"
[#]: via: "https://news.itsfoss.com/mozilla-firefox-secure/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14723-1.html"

Mozilla 刚刚使 Firefox 成为所有人的最安全的网页浏览器
======

> Mozilla 终于启用了一项隐私保护功能，这可能使其成为当下最安全的网页浏览器。你怎么看？

![Mozilla Firefox][1]

Mozilla Firefox 是市面上最安全的开源网页浏览器之一。

毫无疑问，你可以自由定制它来进一步增强安全性，这就是 Tor 浏览器使用 Firefox 作为其核心的原因。

并且，这也是 [我继续使用 Firefox 的原因][2] 之一。

现在，Mozilla 终于为**所有桌面用户**启用了一项新功能，这使其成为最安全的浏览器（或是他们声称的“最安全”）。

本文中，我讨论的不是任何新功能，而是 Firefox 中的现有功能，即 <ruby>Cookie 全面保护<rt>Total Cookie Protection</rt></ruby>。它是在去年与 [Firefox 86][3] 一起引入的，但默认情况下并未对所有用户启用。

### 为所有用户提供的全面的 Cookie 保护

“Cookie 全面保护”正在向所有人推出，无论你使用的是 Windows、Mac 还是 Linux，它将成为默认启用的核心功能之一。

最初，要使用该功能，你必须启用严格模式（<ruby>增强跟踪保护<rt>Enhanced Tracking Protection</rt></ruby>）。但现在，你不再需要这样做了。

#### 它是什么？

如果你好奇的话，“Cookie 全面保护”会隔离每个网站和它们的 Cookie。Cookie 是网站向你的浏览器发送的少量数据。

因此，Cookie 不会在网站之间共享，从而防止了<ruby>跨站跟踪<rt>cross-site tracking</rt></ruby>。

浏览器将为你访问的每个网站都创建单独的“<ruby>饼干罐<rt>Cookie Jar</rt></ruby>”。（LCTT 译注：Cookie 原意是小饼干。）

![][4]

Mozilla 的博文对此进行了更多解释：

> 在任何时候，网站或嵌入网站的 [第三方内容][5] 在浏览器中存储的 Cookie，都将仅限于分配给该网站的 “饼干罐”。其他网站无法进入不属于它们的“饼干罐”，以得到你存储在那些 Cookie 中的信息。这可以让你免受侵入性广告的影响，并减少公司收集的关于你的信息量。

### 那么，这有什么大不了的吗？

即使你配备了所有的隐私跟踪保护和内容拦截器，你也不一定知道，其实还有个问题叫做“跨站跟踪”。

因此，通过跨站点的 Cookie 交互，你的许多个人活动和习惯，都可以帮助数字跟踪公司建立你的在线个人资料。

但是，对于 Mozilla Firefox 来说，它在所有其他隐私措施之上，默认额外启用了该功能，这可确保你获得最私密的体验。

并且，所有这些都不需要你调整任何东西，这应该为那些“重视隐私”的用户提供方便。

想了解进一步信息，你可以查看 Mozilla 的 [官方公告][6]。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mozilla-firefox-secure/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/mozilla-made-firefox-most-secure-web-browser.jpg
[2]: https://news.itsfoss.com/why-mozilla-firefox/
[3]: https://news.itsfoss.com/firefox-86-release/
[4]: https://news.itsfoss.com/wp-content/uploads/2021/02/tcp-firefox.png
[5]: https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection#:~:text=Third%2Dparty%20cookies%20are%20cookies,considered%20a%20third%2Dparty%20cookie.
[6]: https://blog.mozilla.org/en/products/firefox/firefox-rolls-out-total-cookie-protection-by-default-to-all-users-worldwide/
