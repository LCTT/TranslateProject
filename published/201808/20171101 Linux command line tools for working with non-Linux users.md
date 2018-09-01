用于与非 Linux 用户一同工作的 Linux 命令行工具
======
> 如果你在 Linux 终端工作，那么与非 Linux 用户一同工作时可能遇到困难。这些工具有助于文档兼容性和企业即时消息。

![](https://images.techhive.com/images/article/2016/06/linux-shell-100666628-large.jpg)

我大部分时间都在使用 Shell（命令行、终端或其它随便什么你使用的平台）上。但是，当我需要与大量其他人合作时，这可能会有点挑战，特别是在大型企业公司中 —— 除了 shell 外其他都使用。

当公司内的其他人使用与你不同的平台时，问题就会变得更加严重。我倾向于使用 Linux。如果我在 Linux 终端上做了很多日常工作，而我的大多数同事都使用 Windows 10（完全使用 GUI 端），那么事情就会变得……有问题。

- **Network World 上另外一篇文章：**[**11 个没用但很酷的 Linux 终端技巧**][1]

幸运的是，在过去的几年里，我已经想出如何处理这些问题。我已经找到了在非 Unix 的企业环境中使用 Linux（或其他类 Unix 系统）Shell 的方法。这些工具/技巧同样适用于在公司服务器上工作的系统管理员们，就像对开发人员或营销人员一样。

让我们首先关注对于大公司中的许多人来说似乎最难解决的两个方面：文档兼容性和企业即时消息。

### Linux 和非 Linux 系统之间的文档兼容性

出现的最大问题之一是简单的文字处理文档的兼容性。

假设你的公司已在 Microsoft Office 上进行了标准化。这让你难过。但不要失去希望！有很多方法可以使它（基本）可用 —— 甚至在 shell 中。

两个工具在我的武器库中至关重要：[Pandoc][2] 和 [Wordgrinder][3]。

Wordgrinder 是一个简单、直观的文字处理器。它可能不像 LibreOffice 那样功能齐全（或者，实际上，任何主要的 GUI 文字处理应用程序），但速度很快。它很稳定。它有足够的功能（和文件格式）来完成工作。事实上，我完全在 Wordgrinder 中写了我的大部分文章和书籍。

但是有一个问题（你知道肯定会有）。

Wordgrinder 不支持 .doc（或 .docx）文件。这意味着它无法读取使用 Windows 和 MS Office 的同事发送给你的大多数文件。

这就是 Pandoc 的用武之地。它是一个简单的文档转换器，可以将各种文件作为输入（MS Word、LibreOffice、HTML、markdown 等）并将它们转换为其他内容。它支持的格式数量绝对是惊人的 —— PDF、ePub、各种幻灯片格式。它确实使格式之间的文档转换变得轻而易举。

这并不是说我不会偶尔遇到格式或功能问题。要转换有大量自定义格式、某些脚本和嵌入式图表的 Word 文档？是的，在这个过程中会丢失很多。

但实际上，Pandoc（用于转换文件）和 Wordgrinder（用于文档编辑）的组合已经证明非常有用和强大。

###  Linux 和非 Linux 系统之间的企业即时消息传递

每家公司都喜欢在即时通讯系统上实现标准化 —— 所有员工都可以使用它来保持实时联系。

在命令行中，这可能会变得棘手。如果贵公司使用 Google 环聊怎么办？或者 Novell GroupWise Messenger 怎么样？既没有官方支持，也没有基于终端的客户端。

谢天谢地，还有 [Finch 和 Hangups][4]。

Finch 是 Pidgin（开源，多协议消息客户端）的终端版本。它支持各种协议，包括 Novell GroupWise、（很快会死的）AOL Instant Messenger 以及其他一些协议。

而 Hangups 是 Google Hangouts 客户端的开源实现 —— 包含消息历史记录和精美的标签界面。

这些方案都不会为你提供语音或视频聊天功能，但对于基于文本的消息，它们的工作得非常好。它们并不完美（Finch 的用户界面需要时间习惯），但它们肯定足以与你的同事保持联系。

这些方案能否让你在纯文本 shell 中舒适地过完一个工作日？可能不会。就个人而言，我发现（使用这些工具和其他工具）我可以轻松地将 80％ 的时间花在纯文本界面上。

这感觉很棒。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3235688/linux/linux-command-line-tools-for-working-with-non-linux-users.html

作者：[Bryan Lunduke][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Bryan-Lunduke/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
[2]:https://www.youtube.com/watch?v=BkTYHChkDoE
[3]:https://www.youtube.com/watch?v=WnMyamBgKFE
[4]:https://www.youtube.com/watch?v=19lbWnYOsTc
