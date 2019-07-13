[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10722-1.html)
[#]: subject: (3 cool text-based email clients)
[#]: via: (https://fedoramagazine.org/3-cool-text-based-email-clients/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

3 个很酷的基于文本的邮件客户端
======

![][1]

编写和接收电子邮件是每个人日常工作的重要组成部分，选择电子邮件客户端通常是一个重要决定。Fedora 系统提供了大量的电子邮件客户端可供选择，其中包括基于文本的电子邮件应用。

### Mutt

Mutt 可能是最受欢迎的基于文本的电子邮件客户端之一。它有人们期望的所有常用功能。Mutt 支持颜色代码、邮件会话、POP3 和 IMAP。但它最好的功能之一是它具有高度可配置性。实际上，用户可以轻松地更改键绑定，并创建宏以使工具适应特定的工作流程。

要尝试 Mutt，请[使用 sudo][2] 和 `dnf` 安装它：

```
$ sudo dnf install mutt
```

为了帮助新手入门，Mutt 有一个非常全面的充满了宏示例和配置技巧的 [wiki][3]。

### Alpine

Alpine 也是最受欢迎的基于文本的电子邮件客户端。它比 Mutt 更适合初学者，你可以通过应用本身配置大部分功能而无需编辑配置文件。Alpine 的一个强大功能是能够对电子邮件进行评分。这对那些订阅含有大量邮件的邮件列表如 Fedora 的[开发列表][4]的用户来说尤其有趣。通过使用分数，Alpine 可以根据用户的兴趣对电子邮件进行排序，首先显示高分的电子邮件。

也可以使用 `dnf` 从 Fedora 的仓库安装 Alpine。

```
$ sudo dnf install alpine
```

使用 Alpine 时，你可以按 `Ctrl+G` 组合键轻松访问文档。

### nmh

nmh（new Mail Handling）遵循 UNIX 工具哲学。它提供了一组用于发送、接收、保存、检索和操作电子邮件的单一用途程序。这使你可以将 `nmh` 命令与其他程序交换，或利用 `nmh` 编写脚本来创建更多自定义工具。例如，你可以将 Mutt 与 `nmh` 一起使用。

使用 `dnf` 可以轻松安装 `nmh`。

```
$ sudo dnf install nmh
```

要了解有关 `nmh` 和邮件处理的更多信息，你可以阅读这本 GPL 许可的[书][5]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-cool-text-based-email-clients/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/07/email-clients-816x345.png
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://gitlab.com/muttmua/mutt/wikis/home
[4]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
[5]: https://rand-mh.sourceforge.io/book/
