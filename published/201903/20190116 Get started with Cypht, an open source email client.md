[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10642-1.html)
[#]: subject: (Get started with Cypht, an open source email client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-cypht-email)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Cypht 吧，一个开源的电子邮件客户端
======

> 使用 Cypht 将你的电子邮件和新闻源集成到一个界面中，这是我们 19 个开源工具系列中的第 4 个，它将使你在 2019 年更高效。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_mail_box_envelope_send_blue.jpg?itok=6Epj47H6)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 4 个工具来帮助你在 2019 年更有效率。

### Cypht

我们花了很多时间来处理电子邮件，有效地[管理你的电子邮件][1]可以对你的工作效率产生巨大影响。像 Thunderbird、Kontact/KMail 和 Evolution 这样的程序似乎都有一个共同点：它们试图复制 Microsoft Outlook 的功能，这在过去 10 年左右并没有真正改变。在过去十年中，甚至像 Mutt 和 Cone 这样的[著名控制台程序][2]也没有太大变化。

![](https://opensource.com/sites/default/files/uploads/cypht-1.png)

[Cypht][3] 是一个简单、轻量级和现代的 Webmail 客户端，它将多个帐户聚合到一个界面中。除了电子邮件帐户，它还包括 Atom/RSS 源。在 “Everything” 中，不仅可以显示收件箱中的邮件，还可以显示新闻源中的最新文章，从而使得阅读不同来源的内容变得简单。

![](https://opensource.com/sites/default/files/uploads/cypht-2.png)

它使用简化的 HTML 消息来显示邮件，或者你也可以将其设置为查看纯文本版本。由于 Cypht 不会加载远程图像（以帮助维护安全性），HTML 渲染可能有点粗糙，但它足以完成工作。你将看到包含大量富文本邮件的纯文本视图 —— 这意味着很多链接并且难以阅读。我不会说是 Cypht 的问题，因为这确实是发件人所做的，但它确实降低了阅读体验。阅读新闻源大致相同，但它们与你的电子邮件帐户集成，这意味着可以轻松获取最新的（我有时会遇到问题）。

![](https://opensource.com/sites/default/files/uploads/cypht-3.png)

用户可以使用预配置的邮件服务器并添加他们使用的任何其他服务器。Cypht 的自定义选项包括纯文本与 HTML 邮件显示，它支持多个配置文件以及更改主题（并自行创建）。你要记得单击左侧导航栏上的“保存”按钮，否则你的自定义设置将在该会话后消失。如果你在不保存的情况下注销并重新登录，那么所有更改都将丢失，你将获得开始时的设置。因此可以轻松地实验，如果你需要重置，只需在不保存的情况下注销，那么在再次登录时就会看到之前的配置。

![](https://opensource.com/sites/default/files/pictures/cypht-4.png)

本地[安装 Cypht][4] 非常容易。虽然它不使用容器或类似技术，但安装说明非常清晰且易于遵循，并且不需要我做任何更改。在我的笔记本上，从安装开始到首次登录大约需要 10 分钟。服务器上的共享安装使用相同的步骤，因此它应该大致相同。

最后，Cypht 是桌面和基于 Web 的电子邮件客户端的绝佳替代方案，它有简单的界面，可帮助你快速有效地处理电子邮件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-cypht-email

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/7/email-alternatives-thunderbird
[2]: https://opensource.com/life/15/8/top-4-open-source-command-line-email-clients
[3]: https://cypht.org/
[4]: https://cypht.org/install.html
