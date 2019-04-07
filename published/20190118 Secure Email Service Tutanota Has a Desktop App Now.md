[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10688-1.html)
[#]: subject: (Secure Email Service Tutanota Has a Desktop App Now)
[#]: via: (https://itsfoss.com/tutanota-desktop)
[#]: author: (John Paul https://itsfoss.com/author/john/)

加密邮件服务 Tutanota 现在有桌面应用了
======

![][18]

[Tutanota][1] 最近[宣布][2]发布针对其电子邮件服务的桌面应用。该 Beta 版适用于 Linux、Windows 和 macOS。

### 什么是 Tutanota？

网上有大量免费的、带有广告的电子邮件服务。但是，大多数电子邮件服务并不完全安全或在意隐私。在这个后[斯诺登][3]世界中，[Tutanota][4] 提供了免费、安全的电子邮件服务，它专注于隐私。

Tutanota 有许多引人注目的功能，例如：

* 端到端加密邮箱
* 端到端加密地址簿
* 用户之间自动端到端加密邮件
* 通过分享密码将端到端加密电子邮件发送到任何电子邮件地址
* 安全密码重置，使 Tutanota 完全无法访问
* 从发送和接收的电子邮件中去除 IP 地址
* 运行 Tutanota 的代码是[开源][5]的
* 双因子身份验证
* 专注于隐私
* 加盐的密码，并本地使用 Bcrypt 哈希
* 位于德国的安全服务器
* 支持 PFS、DMARC、DKIM、DNSSEC 和 DANE 的 TLS
* 本地执行加密数据的全文搜索

![][6]

*web 中的 Tutanota*

你可以[免费注册一个帐户][7]。你还可以升级帐户获取其他功能，例如自定义域、自定义域登录、域规则、额外的存储和别名。他们还提供企业帐户。

Tutanota 也可以在移动设备上使用。事实上，它的 [Android 应用也是开源的][8]。

这家德国公司计划扩展邮件之外的其他业务。他们希望提供加密的日历和云存储。你可以通过 PayPal 和加密货币[捐赠][9]帮助他们实现目标。

### Tutanota 的新桌面应用

Tutanota 在去年圣诞节前宣布了桌面应用的 [Beta 版][2]。该应用基于 [Electron][10]。

![][11]

*Tutanota 桌面应用*

他们选择 Electron 的原因：

* 以最小的成本支持三个主流操作系统。
* 快速调整新桌面客户端，使其与添加到网页客户端的新功能一致。
* 将开发时间留给桌面功能，例如离线可用、电子邮件导入，将同时在所有三个桌面客户端中提供。

由于这是 Beta 版，因此应用中缺少一些功能。Tutanota 的开发团队正在努力添加以下功能：

* 电子邮件导入和与外部邮箱同步。这将“使 Tutanota 能够从外部邮箱导入电子邮件，并在将数据存储在 Tutanota 服务器上之前在设备本地加密数据。”
* 电子邮件的离线可用
* 双因子身份验证

### 如何安装 Tutanota 桌面客户端？

![][12]

*在 Tutanota 中写邮件*

你可以直接从 Tutanota 的网站[下载][2] Beta 版应用。它们有[适用于 Linux 的 AppImage 文件][13]、适用于 Windows 的 .exe 文件和适用于 macOS 的 .app 文件。你可以将你遇到的任何 bug 发布到 Tutanota 的 [GitHub 帐号中][14]。

为了证明应用的安全性，Tutanota 签名了每个版本。“签名确保桌面客户端以及任何更新直接来自我们且未被篡改。”你可以使用 Tutanota 的 [GitHub 页面][15]来验证签名。

请记住，你需要先创建一个 Tutanota 帐户才能使用它。该邮件客户端设计上只能用在 Tutanota。

### 总结

我在 Linux Mint MATE 上测试了 Tutanota 的邮件应用。正如所料，它是网络应用的镜像。同时，我发现桌面应用和 Web 应用程序之间没有任何区别。我目前觉得使用该应用的唯一场景是在自己的窗口中使用。

你曾经使用过 [Tutanota][16] 么？如果没有，你最喜欢的关心隐私的邮件服务是什么？请在下面的评论中告诉我们。

如果你觉得这篇文章很有趣，请花些时间在社交媒体上分享。


--------------------------------------------------------------------------------

via: https://itsfoss.com/tutanota-desktop

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutanota-review/
[2]: https://tutanota.com/blog/posts/desktop-clients/
[3]: https://en.wikipedia.org/wiki/Edward_Snowden
[4]: https://tutanota.com/
[5]: https://tutanota.com/blog/posts/open-source-email
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/tutanota2.jpg?resize=800%2C490&ssl=1
[7]: https://tutanota.com/pricing
[8]: https://itsfoss.com/tutanota-fdroid-release/
[9]: https://tutanota.com/community
[10]: https://electronjs.org/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/tutanota-app1.png?fit=800%2C486&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/tutanota1.jpg?resize=800%2C405&ssl=1
[13]: https://itsfoss.com/use-appimage-linux/
[14]: https://github.com/tutao/tutanota
[15]: https://github.com/tutao/tutanota/blob/master/buildSrc/installerSigner.js
[16]: https://tutanota.com/polo/
[17]: http://reddit.com/r/linuxusersgroup
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/02/tutanota-featured.png?fit=800%2C450&ssl=1
