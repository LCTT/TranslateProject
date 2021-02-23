[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11804-1.html)
[#]: subject: (Keep your email in sync with OfflineIMAP)
[#]: via: (https://opensource.com/article/20/1/sync-email-offlineimap)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 OfflineIMAP 同步邮件
======

> 将邮件镜像保存到本地是整理消息的第一步。在我们的 20 个使用开源提升生产力的系列的第三篇文章中了解该如何做。

![](https://img.linux.net.cn/data/attachment/album/202001/20/235324nbgfyuwl98syowta.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 OfflineIMAP 在本地同步你的邮件

我与邮件之间存在爱恨交织的关系。我喜欢它让我与世界各地的人交流的方式。但是，像你们中的许多人一样，我收到过很多邮件，许多是来自邮件列表的，但也有很多垃圾邮件、广告等。这些积累了很多。

![The OfflineIMAP "blinkenlights" UI][2]

我尝试过的大多数工具（除了大型邮件服务商外）都可以很好地处理大量邮件，它们都有一个共同点：它们都依赖于以 [Maildir][3] 格式存储的本地邮件副本。这其中最有用的是 [OfflineIMAP][4]。OfflineIMAP 是将 IMAP 邮箱镜像到本地 Maildir 文件夹树的 Python 脚本。我用它来创建邮件的本地副本并使其保持同步。大多数 Linux 发行版都包含它，并且可以通过 Python 的 pip 包管理器获得。

示例的最小配置文件是一个很好的模板。首先将其复制到 `~/.offlineimaprc`。我的看起来像这样：

```
[general]
accounts = LocalSync
ui=Quiet
autorefresh=30

[Account LocalSync]
localrepository = LocalMail
remoterepository = MirrorIMAP

[Repository MirrorIMAP]
type = IMAP
remotehost = my.mail.server
remoteuser = myusername
remotepass = mypassword
auth_mechanisms = LOGIN
createfolder = true
ssl = yes
sslcacertfile = OS-DEFAULT

[Repository LocalMail]
type = Maildir
localfolders = ~/Maildir
sep = .
createfolder = true
```

我的配置要做的是定义两个仓库：远程 IMAP 服务器和本地 Maildir 文件夹。还有一个**帐户**，告诉 OfflineIMAP 运行时要同步什么。你可以定义链接到不同仓库的多个帐户。除了本地复制外，这还允许你从一台 IMAP 服务器复制到另一台作为备份。

如果你有很多邮件，那么首次运行 OfflineIMAP 将花费一些时间。但是完成后，下次会花*少得多*的时间。你也可以将 OfflineIMAP 作为 cron 任务（我的偏好）或作为守护程序在仓库之间不断进行同步。其文档涵盖了所有这些内容以及 Gmail 等高级配置选项。

现在，我的邮件已在本地复制，并有多种工具用来加快搜索、归档和管理邮件的速度。这些我明天再说。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-email-offlineimap

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://opensource.com/sites/default/files/uploads/productivity_3-1.png (The OfflineIMAP "blinkenlights" UI)
[3]: https://en.wikipedia.org/wiki/Maildir
[4]: http://www.offlineimap.org/
