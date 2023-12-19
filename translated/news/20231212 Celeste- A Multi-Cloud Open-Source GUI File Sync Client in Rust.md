[#]: subject: "Celeste: A Multi-Cloud Open-Source GUI File Sync Client in Rust"
[#]: via: "https://news.itsfoss.com/celeste/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Celeste：Rust 开发的多云端开源 GUI 文件同步客户端
======
一个简单而优雅的 GUI 同步客户端，提供双向同步。

当谈到与云文件同步时，我们有 [Insync][1]、[FreeFileSync][2] 等选项，以及 [rclone][3] 等几个命令行工具。

无论哪种情况，你也可以使用云存储提供商的同步客户端（如果他们有适用于 Linux 或任何其他平台的同步客户端）。但是，这并不是与多个云存储服务同步内容的最佳方式。

Insync 是一款付费工具，而 FreeFileSync 或 rclone 对于 Linux 新用户来说可能是一种难以接受的选择。。

Celeste，一个简单的 GUI 同步客户端，支持多个云提供商。

📋

该应用正在积极开发中。目前它可能没有足够的功能和贡献者。欢迎你探索并帮助该项目。

### 适用于 Linux 的基于 Rust 的同步客户端

![][4]

Celeste 是一款用 Rust 编写的应用，可确保你获得快速的体验。它在底层利用 rclone 来可靠地将数据与云同步。

与某些现有选项不同，它没有为你提供很多选择。虽然一些用户可能会发现它有所欠缺，但其他用户可能会发现它是他们一直想要的简单工具。

Celeste 仅支持双向同步，目前没有其他同步方式。

如果你想要单向同步（云到本地，或本地到云），那么这不适合你。

该工具的工作机制很简单。你只需从列表中添加云提供商，或添加任何 WebDAV 服务器。

默认选项包括：**Google Drive、Dropbox、Proton Drive、pCloud、ownCloud、** 和 **Nextcloud**。

![][5]

你可以自定义该工具的服务器名称，然后点击“**登录**”开始授权过程。pCloud 的情况如下：

![][6]

当你授权应用访问云文件，它会提示你设置本地文件夹和云之间的同步。

![][7]

如果还没有正斜杠 (/)** 符号，那么只需输入它即可，它应该开始以下拉样式列出你拥有的远程文件夹。

💡

这将是双向同步。因此，你的云文件将被下载到远程文件夹（如果有）。同步后，从云中删除的任何内容都不会从本地文件夹中消失。而且，你从系统中删除的任何内容都将从云中删除。

**此同步过程定期发生。**我没有找到强制启动或停止同步的方法。如果此应用的未来版本中提供类似的选项，它应该会有所帮助。

![][8]

在大多数情况下，每当本地/远程中发生文件更改时，同步都会确保你能够尽快访问最新的更改。

有一次，很长一段时间没有同步，所以我不得不重新启动应用来修复它。

不幸的是，如果云提供商的令牌过期，该应用不能很好地处理错误，并且你必须重新授权和重新同步。

![][9]

它显示错误，并且没有使用 GUI 刷新令牌的选项。我宁愿不尝试命令行方式，因为这违背了 GUI 工具的目的。

因此，你可以选择再次重新添加相同的同步服务器，重新进行所有授权和同步。这就是目前的解决方案。

### 总结

Celeste 似乎是一个非常有用且简单的 GUI 同步客户端。

尽管它缺乏某些功能，但用户体验对于它已经提供的功能来说还是很好的。

考虑到它是一个相当新的应用，有更多的贡献者和用户尝试它，Celeste 可以凭借其坚实的基础发展成更多的东西。

_你觉得 Celeste 怎么样？ 在下面的评论中分享你的想法。_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/celeste/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/insync-linux-review/
[2]: https://itsfoss.com/freefilesync/
[3]: https://itsfoss.com/use-onedrive-linux-rclone/
[4]: https://news.itsfoss.com/content/images/2023/12/celeste.png
[5]: https://news.itsfoss.com/content/images/2023/12/celeste-options.png
[6]: https://news.itsfoss.com/content/images/2023/12/celeste-pcloud.png
[7]: https://news.itsfoss.com/content/images/2023/12/celeste-sync-location.png
[8]: https://news.itsfoss.com/content/images/2023/12/celeste-gui-sync-check.png
[9]: https://news.itsfoss.com/content/images/2023/12/celeste-dropbox-error.png
[10]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
