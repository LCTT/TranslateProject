[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10494-1.html)
[#]: subject: (Getting started with Isotope, an open source webmail client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-isotope)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Isotope 吧，一款开源的 Web 邮件客户端
======

> 使用轻量级的电子邮件客户端 Isotope 阅读富文本电子邮件，这个开源工具系列的第十一个工具将使你在 2019 年更高效。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH)

在每年的年初，似乎都有一股疯狂的寻找提高工作效率方法的冲动。新年决心，渴望以正确的方式开始新的一年。当然，“旧不去的，新的不来”的态度都会导致这种情况。一般的建议都偏向于闭源和专有软件，然而并不是必须这样。

以下是我挑选的 19 个新的（或者对你来说是新的）开源工具中的第 11 个，它将帮助你在 2019 年提高工作效率。

### Isotope

正如我们在[本系列的第四篇文章][1]（Cypht）中所讨论的那样，我们花了很多时间来处理电子邮件。有很多方法可以解决它，我已经花了很多时间来寻找最适合我的电子邮件客户端。我认为这是一个重要的区别：对我有效的方法并不总是对其它人有效。有时对我有用的是像 [Thunderbird][2] 这样的完整客户端，有时是像 [Mutt][3] 这样的控制台客户端，有时是像 [Gmail][4] 和 [RoundCube][5] 这样基于 Web 的界面。

![](https://opensource.com/sites/default/files/uploads/isotope_1.png)

[Isotope][6] 是一个本地托管的、基于 Web 的电子邮件客户端。它非常轻巧，只使用 IMAP 协议，占用的磁盘空间非常小。与 Cypht 不同，Isotope 具有完整的 HTML 邮件支持，这意味着显示富文本电子邮件没有问题。

![](https://opensource.com/sites/default/files/uploads/isotope_2_0.png)

如果你安装了 [Docker][7]，那么安装 Isotope 非常容易。你只需将文档中的命令复制到控制台中，然后按下回车键。在浏览器中输入 `localhost` 来访问 Isotope 登录界面，输入你的 IMAP 服务器，登录名和密码将打开收件箱视图。

![](https://opensource.com/sites/default/files/uploads/isotope_3.png)

在这一点上，Isotope 的功能和你想象的差不多。单击消息进行查看，单击铅笔图标以创建新邮件等。你会注意到用户界面（UI）非常简单，没有“移动到文件夹”、“复制到文件夹”和“存档”等常规按钮。你可以通过拖动来移动消息，因此其实你并不太需要这些按钮。

![](https://opensource.com/sites/default/files/uploads/isotope_4.png)

总的来说，Isotope 干净、速度快、工作得非常好。更棒的是，它正在积极开发中（最近一次的提交是在我撰写本文的两小时之前），所以它正在不断得到改进。你可以查看代码并在 [GitHub][8] 上为它做出贡献。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-isotope

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/1/productivity-tool-cypht-email
[2]: https://www.thunderbird.net/
[3]: http://www.mutt.org/
[4]: https://mail.google.com/
[5]: https://roundcube.net/
[6]: https://blog.marcnuri.com/isotope-mail-client-introduction/
[7]: https://www.docker.com/
[8]: https://github.com/manusa/isotope-mail
