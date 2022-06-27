[#]: subject: "This Open-Source Project Proves Chrome Extensions Can Track You"
[#]: via: "https://news.itsfoss.com/chrome-extension-tracking/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

这个开源项目证明了 Chrome 扩展可以跟踪你
======
这会成为放弃基于 Chromium 的浏览器并开始使用 Firefox 的一个理由吗？也许吧，决定权在你。

![Chrome 扩展追踪器][1]

即使你有了所有的隐私扩展和高级的保护功能，别人仍然有方法可以识别你或跟踪你。

请注意，并非所有浏览器都是如此，本文中，我们只关注基于 Chromium 的浏览器，并将 Google Chrome 作为“主要嫌疑人”。

以前，尽管别人已经能够在你的检测 Chromium 浏览器上，检测到你的已安装的扩展程序，但许多扩展程序都实施了某些保护措施来防止这种检测。

然而，一位名为 “**z0ccc**” 的安全研究人员发现了一种检测已安装 Chrome 浏览器扩展程序的新方法，该方法可进一步用于**通过“浏览器指纹识别”来跟踪你**。

**如果你还不知道的话**：<ruby>浏览器指纹识别<rt>Browser Fingerprinting</rt></ruby>是指收集有关你的设备/浏览器的各种信息，以创建唯一的指纹 ID（哈希），从而在互联网上识别你的一种跟踪方法。“各种信息”包括：浏览器名称、版本、操作系统、已安装的扩展程序、屏幕分辨率和类似的技术数据。

这听起来像是一种无害的数据收集技术，但可以使用这种跟踪方法在线跟踪你。

### 检测 Google Chrome 扩展

研究人员分享了一个开源项目 “**Extension Fingerprints**”，你可以使用它来测试，你安装的 Chrome 扩展，是否正在被人检测。

新技术涉及一种“时差”方法，该工具比较了扩展获取资源的时间。与浏览器上未安装的其他扩展相比，受保护的扩展需要更多时间来获取资源。因此，这有助于从 1000 多个扩展列表中识别出一些扩展。

关键是：即使有了这些新的进步和技术来防止跟踪，Chrome 网上应用店的扩展也可以被检测到。

![][2]

并且，在检测到已安装的扩展程序后，别人可以就使用浏览器指纹识别，对你进行在线跟踪。

令人惊讶的是，即使你安装有 uBlocker、AdBlocker、或 Privacy Badger（一些流行的以隐私为重点的扩展程序）之类的扩展程序，使用了这种方法，它们也都可以被检测到。

你可以在它的 [GitHub 页面][3] 上查看所有技术细节。如果你想自己测试它，请前往它的 [扩展指纹识别网站][4] 自行检查。

### 大救星 Firefox？

嗯，似乎是的，毕竟我出于各种原因，[不断切回到 Firefox][5]。

这个新发现的（跟踪）方法应该适用于所有基于 Chromium 的浏览器。我在 Brave 和 Google Chrome 上都测试了这个方法。研究人员还提到，该工具不适用于在 Microsoft Edge 中使用的，微软应用商店中的扩展。但是，相同的跟踪方法仍然有效。

正如研究人员指出，Mozilla Firefox 可以避免这种情况，因为每个浏览器实例的扩展 ID 都是唯一的。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/chrome-extension-tracking/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/opensource-project-tracker-chrome-extensions.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/06/extension-fingerprints.jpg
[3]: https://github.com/z0ccc/extension-fingerprints
[4]: https://z0ccc.github.io/extension-fingerprints/
[5]: https://news.itsfoss.com/why-mozilla-firefox/
