[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11846-1.html)
[#]: subject: (Keep a journal of your activities with this Python program)
[#]: via: (https://opensource.com/article/20/1/python-journal)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用这个 Python 程序记录你的活动
======

> jrnl 可以创建可搜索、带时间戳、可导出、加密的（如果需要）的日常活动日志。在我们的 20 个使用开源提升生产力的系列的第八篇文章中了解更多。

![](https://img.linux.net.cn/data/attachment/album/202002/03/105455tx03zo2pu7woyusp.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 jrnl 记录日志

在我的公司，许多人会在下班之前在 Slack 上发送一个“一天结束”的状态。在有着许多项目和全球化的团队里，这是一个分享你已完成、未完成以及你需要哪些帮助的一个很好的方式。但有时候我太忙了，以至于我忘了做了什么。这时候就需要记录日志了。

![jrnl][2]

打开一个文本编辑器并在你做一些事的时候添加一行很容易。但是在需要找出你在什么时候做的笔记，或者要快速提取相关的行时会有挑战。幸运的是，[jrnl][3] 可以提供帮助。

jrnl 能让你在命令行中快速输入条目、搜索过去的条目并导出为 HTML 和 Markdown 等富文本格式。你可以有多个日志，这意味着你可以将工作条目与私有条目分开。它将条目存储为纯文本，因此即使 jrnl 停止工作，数据也不会丢失。

由于 jrnl 是一个 Python 程序，最简单的安装方法是使用 `pip3 install jrnl`。这将确保你获得最新和最好的版本。第一次运行它会询问一些问题，接下来就能正常使用。

![jrnl's first run][4]

现在，每当你需要做笔记或记录日志时，只需输入 `jrnl <some text>`，它将带有时间戳的记录保存到默认文件中。你可以使用 `jrnl -on YYYY-MM-DD` 搜索特定日期条目，`jrnl -from YYYY-MM-DD` 搜索在那日期之后的条目，以及用 `jrnl -to YYYY-MM-DD` 搜索到那日期的条目。搜索词可以与 `-and` 参数结合使用，允许像 `jrnl -from 2019-01-01 -and -to 2019-12-31` 这类搜索。

你还可以使用 `--edit` 标志编辑日志中的条目。开始之前，通过编辑文件 `~/.config/jrnl/jrnl.yaml` 来设置默认编辑器。你还可以指定日志使用什么文件、用于标签的特殊字符以及一些其他选项。现在，重要的是设置编辑器。我使用 Vim，jrnl 的文档中有一些使用其他编辑器如 VSCode 和 Sublime Text 的[有用提示][5]。

![Example jrnl config file][6]

jrnl 还可以加密日志文件。通过设置全局 `encrypt` 变量，你将告诉 jrnl 加密你定义的所有日志。还可在配置文件中的针对文件设置 `encrypt: true` 来加密文件。

```
journals:
  default: ~/journals/journal.txt
  work: ~/journals/work.txt
  private:
    journal: ~/journals/private.txt
    encrypt: true
```

如果日志尚未加密，系统将提示你输入在对它进行任何操作的密码。日志文件将加密保存在磁盘上，以免受窥探。[jrnl 文档][7] 中包含其工作原理、使用哪些加密方式等的更多信息。

![Encrypted jrnl file][8]

日志记录帮助我记住什么时候做了什么事，并在我需要的时候能够找到它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/python-journal

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_ (Writing in a notebook)
[2]: https://opensource.com/sites/default/files/uploads/productivity_8-1.png (jrnl)
[3]: https://jrnl.sh/
[4]: https://opensource.com/sites/default/files/uploads/productivity_8-2.png (jrnl's first run)
[5]: https://jrnl.sh/recipes/#external-editors
[6]: https://opensource.com/sites/default/files/uploads/productivity_8-3.png (Example jrnl config file)
[7]: https://jrnl.sh/encryption/
[8]: https://opensource.com/sites/default/files/uploads/productivity_8-4.png (Encrypted jrnl file)
