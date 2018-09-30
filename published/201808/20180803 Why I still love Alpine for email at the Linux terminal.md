为什么我仍然喜欢用 Alpine 在 Linux 终端中发送电子邮件
======

> 这个免费的邮件客户端使用直观、易于定制，并且可以在许多操作系统上使用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

也许你有这个经历：你试了一个程序，并且很喜欢它。多年后，有新的程序开发出来，它可以做同样的事情或者更多，甚至更好。你试了下它们，它们也很棒 —— 但你会继续使用第一个程序。

这是我与 [Alpine Mail][1] 关系的故事。所以我决定写一篇赞美我最喜欢的邮件程序的文章。

![alpine_main_menu.png][3]

*Alpine 邮件客户端的主菜单屏幕*

在 90 年代中期，我发现了 [GNU/Linux][4] 操作系统。因为我之前从未见过类 Unix 的系统，所以我阅读了大量的文档和书籍，并尝试了很多程序来熟悉这个迷人的系统。

没多久，[Pine][5] 成了我最喜欢的邮件客户端，其后是其继任者 Alpine。我发现它直观且易于使用 —— 你始终可以在底部看到可能的命令或选项，因此引导很容易快速学习，并且 Alpine 提供了很好的帮助。

入门很容易。

大多数发行版包含 Alpine。它可以通过包管理器安装。

只需按下 `S`（或移动高亮栏到“设置”那一行）你就会看到可以配置的项目。在底部，你可以使用快捷键来执行你可以立即执行的命令。对于其他命令，按下 `O`（“其他命令”）。

按下 `S` 进入配置对话框。当你向下滚动列表时，很明显你可以设置 Apline 如你所希望的那样运行。如果你只有一个邮件帐户，只需移动到你想要更改的行，按下 `C`（“更改值”），然后输入值：

![alpine_setup_configuration.png][7]

*Alpine 设置配置屏幕*

请注意如何输入 SNMP 和 IMAP 服务器，因为这与那些有辅助助手和预填字段的邮件客户端不同。如果你像这样输入“服务器/SSL/用户”：

```
imap.myprovider.com:993/ssl/user=max@example.com
```

Alpine 会询问你是否使用“收件箱”（选择“是”）并在“服务器”两边加上大括号。完成后，按下 `E`（“退出设置”）并按下 `Y`（“是”）提交更改。回到主菜单，然后你可以移动到文件夹列表和收件箱以查看是否有邮件（系统将提示你输入密码）。你现在可以使用 `>` 和 `<` 进行移动。

![navigating_the_message_index.png][9]

*在 Apline 中浏览消息索引*

要撰写邮件，只需移动到相应的菜单并编写即可。请注意，底部的选项会根据你所在的行而变化。`^T`（`Ctrl + T`）可代表 To Addressbook（“地址簿”）或 To Files（“文件”）。要附加文件，只需移动到 Attchmt:（“附件”）然后按 `Ctrl + T` 转到文件浏览器，或按 `Ctrl + J` 输入路径。

用 `^X` 发送邮件。

![composing_an_email_in_alpine.png][11]

在 Alpine 中撰写电子邮件

### 为何选择 Alpine？

当然，每个用户的个人偏好和需求都是不同的。如果你需要一个更像 “office” 的解决方案，像 Evolution 或 Thunderbird 这样的应用可能是更好的选择。

但对我来说，Alpine（和 Pine）是软件界的活化石。你可以以舒适的方式管理邮件 —— 不多也不少。它适用于许多操作系统（甚至 [Termux for Android][12]）。并且因为配置存储在纯文本文件（`.pinerc`）中，所以你只需将其复制到设备即可。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/love-alpine

作者：[Heiko Ossowski][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/hossow
[1]:https://en.wikipedia.org/wiki/Alpine_(email_client)
[2]:/file/405641
[3]:https://opensource.com/sites/default/files/uploads/alpine_main_menu.png (alpine_main_menu.png)
[4]:https://www.gnu.org/gnu/linux-and-gnu.en.html
[5]:https://en.wikipedia.org/wiki/Pine_(email_client)
[6]:/file/405646
[7]:https://opensource.com/sites/default/files/uploads/alpine_setup_configuration.png (alpine_setup_configuration.png)
[8]:/file/405651
[9]:https://opensource.com/sites/default/files/uploads/navigating_the_message_index.png (navigating_the_message_index.png)
[10]:/file/405656
[11]:https://opensource.com/sites/default/files/uploads/composing_an_email_in_alpine.png (composing_an_email_in_alpine.png)
[12]:https://termux.com/
