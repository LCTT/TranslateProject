[#]: subject: "Get change alerts from any website with this open source tool"
[#]: via: "https://opensource.com/article/22/9/changedetection-io-open-source-website-changes"
[#]: author: "Leigh Morresi https://opensource.com/users/dgtlmoon"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15129-1.html"

用这个开源工具从任何网站获取变化提醒
======

> 使用 changeetection.io 在网站发生变化或更新时获得提醒。

![](https://img.linux.net.cn/data/attachment/album/202210/11/153605ikpi81s1mz8wak2z.jpg)

那一年是 2020 年，关于大流行病的消息迅速涌来，每个人都感到完全被类似的新闻文章所淹没，提供了不同程度的更新。

但我需要知道的是，我们的官方准则何时改变。最后，这就是对我来说最重要的事情。

无论关注的是大流行病还是最新的科技新闻，提前了解网站内容的变化都至关重要。

[changedetection.io][2] 项目为网站变更检测和通知提供了一个简单但强大的开源解决方案。它很容易设置，而且可以通知 70 多个（还在不断增加）不同的通知系统，如 Matrix、Mattermost、[Nextcloud][3]、[Signal][4]、[Zulip][5]、[Home Assistant][6]、电子邮件等等。它还能通知专有应用，如 Discord、Office365、Reddit、Telegram 和许多其他应用。

但 [changeetection.io][7] 并不只是局限于观察网页内容。你也可以监视 XML 和 JSON 源，它将建立一个 RSS 馈送，记录变化的网站。

由于其内置的 JSON 简单存储系统，不需要设置复杂的数据库来接收和存储信息。你可以 [使用 Docker 镜像运行][8] 或用 `pip` 安装它。该项目有一个 [全面的维基帮助页][9]，大多数常见的问题都有涵盖。

对于使用复杂 JavaScript 的网站，你可以用内置的 [Playwright 内容获取器][10] 将你的 changeetection.io 连接到 Chromium 或 Chrome 浏览器。

运行后，在你的浏览器（默认情况下是 `http://localhost:5000`）中访问该应用。如果你的电脑可以从外部网络访问，你可以在 <ruby>设置<rt>Settings</rt></ruby>中设置一个密码。

![change detection watch list][11]

提交你想监控的页面的 URL。有几个与如何过滤该网页有关的设置。例如，你很可能不想知道一家公司在其网站页脚列出的股票价格何时发生变化，但你可能想知道他们在其博客上发布的新闻文章。

### 监控一个网站

想象一下，你想添加你最喜欢的网站 Opensource.com 进行监控。你只想知道主要标注文章何时包含 “python” 一词，并且通过 Matrix 收到通知。

要做到这点，首先要使用“<ruby>视觉选择器<rt>Visual Filter Selector</rt></ruby>”工具。（这需要连接 **playwright** 浏览器界面）。

![Find an element to monitor][12]

该工具会自动计算出针对内容的最佳 Xpath 或 CSS 过滤器。否则，你会从每天的页面更新中得到大量的噪音。

接下来，访问“<ruby>过滤器和触发器<rt>Filters & Triggers</rt></ruby>”标签。

![Filters and triggers][13]

在 “<ruby>CSS/JSON/XPATH 过滤器<rt>CSS/JSON/XPATH Filter</rt></ruby>”区域（蓝色圆圈），你可以看到上一步自动生成的 CSS 过滤器。

有几个有用的过滤器，比如“<ruby>移除元素<rt>Remove elements</rt></ruby>”（适合移除嘈杂的元素）、“<ruby>忽略文本<rt>Ignore text</rt></ruby>”、“<ruby>触发/等待文本<rt>Trigger/wait for text</rt></ruby>”，和“<ruby>如果文本匹配则阻止变化检测<rt>Block change-detection if text matches</rt></ruby>”（用于等待一些文本消失，如“售罄”）。

在“<ruby>触发/等待文本<rt>Trigger/wait for text</rt></ruby>”（红色圆圈）中，输入你想监测的关键词。（在这个例子中是 “python”）。

最后一步是在“<ruby>通知<rt>Notifications</rt></ruby>”选项卡中，你要在那里配置你想收到的通知。下面我使用 Matrix API 添加了一个 Matrix 房间作为通知目标。

![Notifications tab][14]

通知的 URL 的格式是 `matrixs://username:password@matrix.org/#/room/#room-name:matrix.org`。

然而，[t2Bot][15] 格式也支持。这里有更多的 [Matrix 通知选项][16]。

就是这些了! 现在只要内容有变化，你就会通过 Matrix 收到信息。

### 还有更多

changedetection.io 还有很多东西。如果你喜欢调用一个自定义的 JSON API，你不需要使用通知的 API（使用 `jsons://` ）。你还可以创建一个自定义的 HTTP 请求（POST 和 GET），在检查前执行 JavaScript（也许是为了预先填充一个用户名和密码的登录字段），以及更多有趣的功能，更多的功能将陆续推出。

不要再浏览网站，而是开始监测网络吧！

*图片提供：(Leigh Morresi, CC BY-SA 4.0)*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/changedetection-io-open-source-website-changes

作者：[Leigh Morresi][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dgtlmoon
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_desktop_website_checklist_metrics.png
[2]: https://github.com/dgtlmoon/changedetection.io
[3]: https://opensource.com/tags/nextcloud
[4]: https://opensource.com/article/19/10/secure-private-messaging
[5]: https://opensource.com/article/22/3/open-source-chat-zulip
[6]: https://opensource.com/article/20/11/home-assistant
[7]: https://github.com/dgtlmoon/changedetection.io
[8]: https://github.com/dgtlmoon/changedetection.io#docker
[9]: https://github.com/dgtlmoon/changedetection.io/wiki
[10]: https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher
[11]: https://opensource.com/sites/default/files/2022-09/screenshot.png
[12]: https://opensource.com/sites/default/files/2022-09/changedetect-osdc.png
[13]: https://opensource.com/sites/default/files/2022-09/changedetect-filters-triggers.webp
[14]: https://opensource.com/sites/default/files/2022-09/step3-notification-matrix.png
[15]: https://t2bot.io/
[16]: https://github.com/caronc/apprise/wiki/Notify_matrix
