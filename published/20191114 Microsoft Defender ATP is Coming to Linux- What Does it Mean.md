[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11576-1.html)
[#]: subject: (Microsoft Defender ATP is Coming to Linux! What Does it Mean?)
[#]: via: (https://itsfoss.com/microsoft-defender-atp-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

微软 Defender ATP 要出 Linux 版了!
======

> 微软宣布将于 2020 年将其企业安全产品 Defender 高级威胁防护（ATP）引入 Linux。

![](https://img.linux.net.cn/data/attachment/album/201911/14/183733rllau7hvkgzkuwgg.jpg)

微软的年度开发者大会 Microsoft Ignite 刚刚结束，会上发布了一些与 Linux 有关的重要公告。你可能已经知道[微软将 Edge Web 浏览器引入 Linux][1]，而下一个大新闻是微软将 Defender ATP 引入 Linux！

让我们详细介绍一下它是什么，以及微软为何不厌其烦为 Linux 开发某些东西。

### 微软 Defender ATP 是什么？

如果你过去几年使用过 Windows，那么你一定遇到过 Windows Defender。它基本上可以说是微软的防病毒产品，通过检测病毒和恶意软件来提供一定程度的安全性。

微软通过引入 Windows Defender ATP（高级威胁防护）来为其企业用户改进了此功能。Defender ATP 致力于行为分析。它收集使用使用数据并将其存储在同一系统上。但是，当发现行为不一致时，它将数据发送到 Azure 服务（微软的云服务）。在这里，它将收集行为数据和异常信息。

例如，如果你收到一封包含 PDF 附件的电子邮件，你将其打开并打开了命令提示符，Defender ATP 就会注意到此异常行为。我建议[阅读本文以了解有关 Defender 和 Defender ATP 之间的区别的更多信息] [2]。

现在，这完全是一种企业级产品。在具有成百上千个端点（计算机）的大型企业中，Defender ATP 提供了很好的保护层。IT 管理员可以在其 Azure 实例上集中查看端点的视图，可以分析威胁并采取相应措施。

### 适用于 Linux（和 Mac）的微软 Defender ATP

通常，企业的计算机上装有 Windows，但 Mac 和 Linux 在开发人员中也特别受欢迎。在混合了 Mac 和 Linux 的 Windows 机器环境中，Defender ATP 必须将其服务扩展到这些操作系统，以便它可以为网络上的所有设备提供整体防御。

请注意，微软先是[在 2019 年 3 月将 Windows Defender ATP 更改为微软 Defender ATP][3]，这表明该产品不仅限于 Windows 操作系统。

此后不久微软[宣布推出 Mac 版 Defender ATP][4]。

现在，为了涵盖企业环境中的所有主要操作系统，[微软将于 2020 年将 Defender ATP 引入到 Linux][5]。

### Linux 上的微软 Defender ATP 对 Linux 用户有何影响？

由于 Defender ATP 是企业产品，因此我认为你无需为此而烦恼。组织需要保护其端点免受威胁，因此，微软也在改进其产品以使其涵盖 Linux。

对于像你我这样的普通 Linux 用户，这没有任何区别。我不会用它“保护”我的三个 Linux 系统，并为此而向微软付费。

请随时在评论部分中分享你对微软将 Defender ATP 引入 Linux 的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/microsoft-defender-atp-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/microsoft-edge-linux/
[2]: https://www.concurrency.com/blog/november-2017/windows-defender-vs-windows-defender-atp
[3]: https://www.theregister.co.uk/2019/03/21/microsoft_defender_atp/
[4]: https://techcommunity.microsoft.com/t5/Microsoft-Defender-ATP/Announcing-Microsoft-Defender-ATP-for-Mac/ba-p/378010
[5]: https://www.zdnet.com/article/microsoft-defender-atp-is-coming-to-linux-in-2020/
