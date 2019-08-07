[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11089-1.html)
[#]: subject: (Copy and paste at the Linux command line with xclip)
[#]: via: (https://opensource.com/article/19/7/xclip)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

使用 xclip 在 Linux 命令行中复制粘贴
======
> 了解如何在 Linux 中使用 xclip。

![Green paperclips][1]

在使用 Linux 桌面工作时，你通常如何复制全部或部分文本？你可能会在文本编辑器中打开文件，选择全部或仅选择要复制的文本，然后将其粘贴到其他位置。

这样没问题。但是你可以使用 [xclip][2] 在命令行中更有效地完成工作。`xclip` 提供了在终端窗口中运行的命令与 Linux 图形桌面环境中的剪贴板之间的管道。

### 安装 xclip

`xclip` 并不是许多 Linux 发行版的标准套件。要查看它是否已安装在你的计算机上，请打开终端窗口并输入 `which xclip`。如果该命令返回像 `/usr/bin/xclip` 这样的输出，那么你可以开始使用了。否则，你需要安装 `xclip`。

为此，请使用你的发行版的包管理器。如果你喜欢冒险，你可以[从 GitHub 获取源代码][2]并自己编译。

### 基础使用

假设你要将文件的内容复制到剪贴板。在 `xclip` 中可以使用两种方法。输入：

```
xclip file_name
```

或者

```
xclip -sel clip file_name
```

两个命令之间有什么区别（除了第二个命令更长）？第一个命令在你使用鼠标中键粘贴的情况下有效。但是，不是每个人都这样做。许多人习惯使用右键单击菜单或按 `Ctrl+V` 粘贴文本。如果你时其中之一（我就是！），使用 `-sel clip` 选项可确保你可以粘贴要粘贴的内容。

### 将 xclip 与其他应用一起使用

将文件内容直接复制到剪贴板是个巧妙的技巧。很可能你不会经常这样做。还有其他方法可以使用 `xclip`，其中包括将其与另一个命令行程序结合。

结合是用管道（`|`）完成的。管道将一个命令行程序的输出重定向到另一个命令行程序。这样我们就会有更多的可能性，我们来看看其中的三个。

假设你是系统管理员，你需要将日志文件的最后 30 行复制到 bug 报告中。在文本编辑器中打开文件，向下滚动到最后，复制和粘贴有一点工作量。为什么不使用 `xclip` 和 [tail][3] 来快速轻松地完成？运行此命令以复制最后 30 行：


```
tail -n 30 logfile.log | xclip -sel clip
```

我的写作有相当一部分用于内容管理系统 （CMS） 或者在其他网络中发布。但是，我从不使用 CMS 的 WYSIWYG 编辑器来编写 - 我采用 [Markdown][5] 格式离线编写[纯文本][4]。也就是说，许多编辑器都有 HTML 模式。通过使用此命令，我可以使用 [Pandoc][6] 将 Markdown 格式的文件转换为 HTML 并将其一次性复制到剪贴板：

```
pandoc -t html file.md | xclip -sel clip
```

在其他地方，粘贴完成。

我的两个网站使用 [GitLab Pages][7] 托管。我使用名为 [Certbot][8] 的工具为这些站点生成 HTTPS 证书，每当我更新它时，我需要将每个站点的证书复制到 GitLab。结合 [cat][9] 命令和 xclip 比使用编辑器更快，更有效。例如：

```
cat /etc/letsencrypt/live/website/fullchain.pem | xclip -sel clip
```

这就是全部可以用 xclip 做的事么？当然不是。我相信你可以找到更多用途来满足你的需求。

### 最后总结

不是每个人都会使用 `xclip`。没关系。然而，它是一个在你需要它时非常方便的一个小工具。而且，正如我几次发现的那样，你不知道什么时候需要它。等到时候，你会很高兴能用上 `xclip`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/xclip

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T (Green paperclips)
[2]: https://github.com/astrand/xclip
[3]: https://en.wikipedia.org/wiki/Tail_(Unix)
[4]: https://plaintextproject.online
[5]: https://gumroad.com/l/learnmarkdown
[6]: https://pandoc.org
[7]: https://docs.gitlab.com/ee/user/project/pages/
[8]: https://certbot.eff.org/
[9]: https://en.wikipedia.org/wiki/Cat_(Unix)
