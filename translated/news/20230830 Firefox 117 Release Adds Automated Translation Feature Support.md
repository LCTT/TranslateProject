[#]: subject: "Firefox 117 Release Adds Automated Translation Feature Support"
[#]: via: "https://news.itsfoss.com/firefox-117-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 117 版本增加自动翻译功能支持
======
Firefox 117 版本为即将到来的升级带来了必要的改进和新功能支持。

Firefox 是一款被许多人喜爱、却被少数人讨厌的浏览器。但是，作为**基于 Chromium 的浏览器**（例如 Chrome 和 Opera）的开源替代品，它不断发展以为其武器库添加新功能。

这一次，随着 **Firefox 117** 的发布，我们添加了一个有趣的附加功能，它已经准备了相当长一段时间了。

请允许我在本文中向你介绍这一点以及更多内容。让我们开始。

## 🆕 Firefox 117：有什么新变化？

![][2]

与大多数 Firefox 版本一样，它也提供了很多功能。一些值得注意的亮点包括：

  * **新的注重隐私的本地翻译功能**（_正在进行_）
  * **将信用卡自动填充功能扩展到更多地区。**
  * **YouTube 视频列表现在可以使用屏幕阅读器正确滚动。**


虽然功能听起来不错，但让我们关注翻译功能。

### 注重隐私的翻译

如上面的演示，Firefox 现在具有内置翻译工具。

它的主要卖点是**所有语言翻译都在本地进行**，无需将你的数据发送到任何服务器进行处理。

由于名为 “[Firefox Translations][3]” 的附加组件，该功能已经存在于 Firefox 中。

但是，[当时][4]在 Mozilla 对引擎代码库进行内部安全审查后，由于其第三方依赖性，直接将其集成到 Firefox 中被放弃了。

幸运的是，现在我们有了合适的原生功能。**但是，有一个问题。**

🚧

感谢 [Ghack][5]，我发现**翻译功能在 Firefox 117 上默认处于禁用状态。他们计划逐步向用户推出该功能，并在下一个版本更新时默认禁用**。

因此，为了测试它，我必须进入 “**about:config**” 手动启用它，然后在高级首选项中启用 “**browser.translations.enable**” 标志。

![][6]

### 🛠️ 其他更改和改进

除此之外，还有一些值得注意的变化：

  * 各种安全更新。
  * macOS 用户现在可以控制控件和链接的选项卡功能。
  * 新的 CSS 兼容性工具提示增强了 Web 兼容性检查。（对网络开发人员有用）
  * 一个新的首选项，允许禁用按 Shift+右键单击时出现的上下文菜单。



你可以浏览[发行说明][7]以更深入地了解此版本。

## 📥 获取 Mozilla Firefox 117

你可以从 [FTP 门户][8]获取最新版本的 Firefox。如果尚未提供，它应该很快就会在[官方网站][9]上提供。

[Mozilla Firefox 117][9]

**对于现有安装：** 你可以通过在设置菜单中搜索“**更新**”，然后单击“**检查更新**”来更新它。

_💬 你对 Firefox 117 新的自动翻译功能支持有何看法？ 在下面的评论中分享你的想法。_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-117-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[2]: https://news.itsfoss.com/content/images/2023/08/Mozilla_Firefox_Translate_1.png
[3]: https://addons.mozilla.org/en-US/firefox/addon/firefox-translations/
[4]: https://hacks.mozilla.org/2022/06/neural-machine-translation-engine-for-firefox-translations-add-on/
[5]: https://www.ghacks.net/2023/08/29/firefox-117-native-language-translations-last-firefox-102-update-and-security-fixes/
[6]: https://news.itsfoss.com/content/images/2023/08/Mozilla_Firefox_Translate_3.png
[7]: https://www.mozilla.org/en-US/firefox/117.0/releasenotes/
[8]: https://ftp.mozilla.org/pub/firefox/releases/117.0/
[9]: https://www.mozilla.org/firefox/download/thanks/
