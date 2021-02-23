[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11354-1.html)
[#]: subject: (Firefox 69 available in Fedora)
[#]: via: (https://fedoramagazine.org/firefox-69-available-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Firefox 69 已可在 Fedora 中获取
======

![][1]

当你安装 Fedora Workstation 时，你会发现它包括了世界知名的 Firefox 浏览器。 Mozilla 基金会以开发 Firefox 以及其他促进开放、安全和隐私的互联网项目为己任。Firefox 有快速的浏览引擎和大量的隐私功能。

开发者社区不断改进和增强 Firefox。最新版本 Firefox 69 于最近发布，你可在稳定版 Fedora 系统（30 及更高版本）中获取它。继续阅读以获得更多详情。

### Firefox 69 中的新功能

最新版本的 Firefox 包括<ruby>[增强跟踪保护][2]<rt>Enhanced Tracking Protection</rt></ruby>（ETP）。当你使用带有新（或重置）配置文件的 Firefox 69 时，浏览器会使网站更难以跟踪你的信息或滥用你的计算机资源。

例如，不太正直的网站使用脚本让你的系统进行大量计算来产生加密货币，这称为<ruby>[加密挖矿][3]<rt>cryptomining</rt></ruby>。加密挖矿在你不知情或未经许可的情况下发生，因此是对你的系统的滥用。Firefox 69 中的新标准设置可防止网站遭受此类滥用。

Firefox 69 还有其他设置，可防止识别或记录你的浏览器指纹，以供日后使用。这些改进为你提供了额外的保护，免于你的活动被在线追踪。

另一个常见的烦恼是在没有提示的情况下播放视频。视频播放也会占用更多的 CPU，你可能不希望未经许可就在你的笔记本上发生这种情况。Firefox 使用<ruby>[阻止自动播放][4]<rt>Block Autoplay</rt></ruby>这个功能阻止了这种情况的发生。而 Firefox 69 还允许你停止静默开始播放的视频。此功能可防止不必要的突然的噪音。它还解决了更多真正的问题 —— 未经许可使用计算机资源。

新版本中还有许多其他新功能。在 [Firefox 发行说明][5]中阅读有关它们的更多信息。

### 如何获得更新

Firefox 69 存在于稳定版 Fedora 30、预发布版 Fedora 31 和 Rawhide 仓库中。该更新由 Fedora 的 Firefox 包维护者提供。维护人员还确保更新了 Mozilla 的网络安全服务（nss 包）。我们感谢 Mozilla 项目和 Firefox 社区在提供此新版本方面的辛勤工作。

如果你使用的是 Fedora 30 或更高版本，请在 Fedora Workstation 上使用*软件中心*，或在任何 Fedora 系统上运行以下命令：

```
$ sudo dnf --refresh upgrade firefox
```

如果你使用的是 Fedora 29，请[帮助测试更新][6]，这样它可以变得稳定，让所有用户可以轻松使用。

Firefox 可能会提示你升级个人设置以使用新设置。要使用新功能，你应该这样做。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/firefox-69-available-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/firefox-v69-816x345.jpg
[2]: https://blog.mozilla.org/blog/2019/09/03/todays-firefox-blocks-third-party-tracking-cookies-and-cryptomining-by-default/
[3]: https://www.webopedia.com/TERM/C/cryptocurrency-mining.html
[4]: https://support.mozilla.org/kb/block-autoplay
[5]: https://www.mozilla.org/en-US/firefox/69.0/releasenotes/
[6]: https://bodhi.fedoraproject.org/updates/FEDORA-2019-89ae5bb576
