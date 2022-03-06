[#]: subject: "Logseq: A Free & Open-Source App to Create Notes, Manage Tasks, Build Knowledge Graph, and More"
[#]: via: "https://itsfoss.com/logseq/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14258-1.html"

Logseq：创建笔记、管理任务、构建知识图谱
======

> Logseq 是一个多功能的知识平台，支持 Markdown 和 Org 模式。你可以创建任务、管理笔记，并利用它们做更多的事情。

在信息时代，适当地组织你的思想、任务清单和任何其他与你的工作/个人生活有关的笔记是至关重要的。

虽然我们中的一些人选择使用单独的应用程序和服务，但使用一个一体化的、开源的、对隐私友好的应用程序来做这一切不是更好？

这就是 Logseq 出现的地方。

![][1]

### Logseq：支持 Markdown & Org 模式的隐私友好知识平台

Logseq 旨在帮助你组织、创建待办事项清单，并建立一个知识图谱。

你可以使用现有的 Markdown 或 Org 模式文件来简单地编辑、编写和保存任何新的笔记。

官方称，Logseq 仍处于测试阶段，但自从进入 alpha 阶段以来，它就得到了广泛赞誉。

它也可以成为 [黑曜石][2] 的一个不错的开源替代品。默认情况下，它依赖于你的本地目录，但你可以选择任何云目录来通过你的文件系统进行同步。所以，你的数据在你控制之中。

如果你没有设置任何云存储，你可以尝试使用 [Rclone][3]、[Insync][4]，甚至是 [rsync 命令][5]。

![][6]

Logseq 具备强大的能力，也支持插件来进一步扩展功能。让我强调一些关键的功能来帮助你决定。

### Logseq 的功能

![][7]

Logseq 提供了一个知识应用平台的所有基本要素。以下是你可以从它那里得到的东西：

  * Markdown 编辑器
  * 支持 Org 模式文件
  * 反向链接
  * 页面和块引用（链接它们）
  * 页面和块嵌入，以添加引文/参考文献
  * 支持添加任务和待办事项清单
  * 能够按优先级或按字母顺序添加任务
  * 发布页面并使用本地主机或 GitHub 页面访问它
  * 支持高级命令
  * 能够从你现有的资源中创建一个模板来重新使用它
  * 页面别名
  * PDF 高亮
  * 创建卡片并快速回顾以记住东西
  * Excalidraw 集成
  * Zotero 集成
  * 通过简单地创建一个 `custom.css` 文件添加一个自定义主题，也有可用的社区制作的文件供快速使用
  * 自定义键盘快捷方式
  * 自我托管 Logseq 的能力
  * 跨平台支持

尽管这是一个测试版软件，但在我简短的测试中，它可以如预期的工作。我不是一个资深用户，没有检查它令人印象深刻的知识图谱功能，但如果你有许多 Markdown 笔记，你可以添加它们、链接它们，并看看生成的图谱。

我能够添加任务、链接页面、添加引用、嵌入页面，查看现有数据的知识图谱。

你可以随时从插件市场上改变主题，并使用插件增加功能，这应该有助于你为你的工作流程提供个性化的体验。

![][8]

我发现它非常容易使用，而且如果你在某个地方卡住了，[文档][9] 很好地解释了一切。

### 在 Linux 中安装 Logseq

你可以在它的 [GitHub 发布区][10] 中找到预发布和测试版本的 AppImage 文件。此外，你也应该在 [Flathub][11] 上找到它的列表。因此，你可以在你选择的任何 Linux 发行版上安装它。

如果你需要帮助，你可能想参考我们的 [AppImage][12] 和 [Flatpak 指南][13]来开始。

无论哪种情况，你都可以前往它的 [官方网页][14] 了解更多信息。

- [Logseq][14]

你试过 Logseq 了吗？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/logseq/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/logseq.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/obsidian-markdown-editor/
[3]: https://itsfoss.com/use-onedrive-linux-rclone/
[4]: https://itsfoss.com/insync-linux-review/
[5]: https://linuxhandbook.com/rsync-command-examples/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/logseq-screenshot.jpg?resize=800%2C602&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/logseq-themes.jpg?resize=800%2C479&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/logseq-screenshot-1.jpg?resize=800%2C603&ssl=1
[9]: https://logseq.github.io/#/page/Contents
[10]: https://github.com/logseq/logseq/releases
[11]: https://flathub.org/apps/details/com.logseq.Logseq
[12]: https://itsfoss.com/use-appimage-linux/
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://logseq.com/
