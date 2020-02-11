[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11807-1.html)
[#]: subject: (Organize your email with Notmuch)
[#]: via: (https://opensource.com/article/20/1/organize-email-notmuch)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Notmuch 组织你的邮件
======

> Notmuch 可以索引、标记和排序电子邮件。在我们的 20 个使用开源提升生产力的系列的第四篇文章中了解该如何使用它。

![](https://img.linux.net.cn/data/attachment/album/202001/22/112231xg5dgv6f6g5a1iv1.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 用 Notmuch 为你的邮件建立索引

昨天，我谈到了如何使用 OfflineIMAP [将我的邮件同步][2]到本地计算机。今天，我将讨论如何在阅读之前预处理所有邮件。

![Notmuch][3]

[Maildir][4] 可能是最有用的邮件存储格式之一。有很多工具可以帮助你管理邮件。我经常使用一个名为 [Notmuch][5] 的小程序，它能索引、标记和搜索邮件。Notmuch 配合其他几个程序一起使用可以使处理大量邮件更加容易。

大多数 Linux 发行版都包含 Notmuch，你也可以在 MacOS 上获得它。Windows 用户可以通过 Linux 的 Windows 子系统（[WSL][6]）访问它，但可能需要进行一些其他调整。

![Notmuch's first run][7]

Notmuch 首次运行时，它将询问你一些问题，并在家目录中创建 `.notmuch-config` 文件。接下来，运行 `notmuch new` 来索引并标记所有邮件。你可以使用 `notmuch search tag:new` 进行验证，它会找到所有带有 `new` 标签的消息。这可能会有很多邮件，因为 Notmuch 使用 `new` 标签来指示新邮件，因此你需要对其进行清理。

运行 `notmuch search tag:unread` 来查找未读消息，这会减少很多邮件。要从你已阅读的消息中删除 `new` 标签，请运行 `notmuch tag -new not tag:unread`，它将搜索所有没有 `unread` 标签的消息，并从其中删除 `new` 标签。现在，当你运行 `notmuch search tag:new` 时，它将仅显示未读邮件。

但是，批量标记消息可能更有用，因为在每次运行时手动更新标记可能非常繁琐。`--batch` 命令行选项告诉 Notmuch 读取多行命令并执行它们。还有一个 `--input=filename` 选项，该选项从文件中读取命令并应用它们。我有一个名为 `tagmail.notmuch` 的文件，用于给“新”邮件添加标签；它看起来像这样：

```
# Manage sent, spam, and trash folders
-unread -new folder:Trash
-unread -new folder:Spam
-unread -new folder:Sent

# Note mail sent specifically to me (excluding bug mail)
+to-me to:kevin at sonney.com and tag:new and not tag:to-me

# And note all mail sent from me
+sent from:kevin at sonney.com and tag:new and not tag:sent

# Remove the new tag from messages
-new tag:new
```

我可以在运行 `notmuch new` 后运行 `notmuch tag --input=tagmail.notmuch` 批量处理我的邮件，之后我也可以搜索这些标签。

Notmuch 还支持 `pre-new` 和 `post-new` 钩子。这些脚本存放在 `Maildir/.notmuch/hooks` 中，它们定义了在使用 `notmuch new` 索引新邮件之前（`pre-new`）和之后（`post-new`）要做的操作。在昨天的文章中，我谈到了使用 [OfflineIMAP][8] 同步来自 IMAP 服务器的邮件。从 `pre-new` 钩子运行它非常容易：


```
#!/bin/bash
# Remove the new tag from messages that are still tagged as new
notmuch tag -new tag:new

# Sync mail messages
offlineimap -a LocalSync -u quiet
```

你还可以使用可以操作 Notmuch 数据库的 Python 应用 [afew][9]，来为你标记*邮件列表*和*垃圾邮件*。你可以用类似的方法在 `post-new` 钩子中使用 `afew`：

```
#!/bin/bash
# tag with my custom tags
notmuch tag --input=~/tagmail.notmuch

# Run afew to tag new mail
afew -t -n
```

我建议你在使用 `afew` 标记邮件时，不要使用 `[ListMailsFilter]`，因为某些邮件处理程序会在邮件中添加模糊或者彻头彻尾是垃圾的列表标头（我说的就是你 Google）。

![alot email client][10]

此时，任何支持 Notmuch 或 Maildir 的邮件阅读器都可以读取我的邮件。有时，我会使用 [alot][11]（一个 Notmuch 特定的客户端）在控制台中阅读邮件，但是它不像其他邮件阅读器那么美观。

在接下来的几天，我将向你展示其他一些邮件客户端，它们可能会与你在使用的工具集成在一起。同时，请查看可与 Maildir 邮箱一起使用的其他工具。你可能会发现我没发现的好东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/organize-email-notmuch

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://linux.cn/article-11804-1.html
[3]: https://opensource.com/sites/default/files/uploads/productivity_4-1.png (Notmuch)
[4]: https://en.wikipedia.org/wiki/Maildir
[5]: https://notmuchmail.org/
[6]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[7]: https://opensource.com/sites/default/files/uploads/productivity_4-2.png (Notmuch's first run)
[8]: http://www.offlineimap.org/
[9]: https://afew.readthedocs.io/en/latest/index.html
[10]: https://opensource.com/sites/default/files/uploads/productivity_4-3.png (alot email client)
[11]: https://github.com/pazz/alot
