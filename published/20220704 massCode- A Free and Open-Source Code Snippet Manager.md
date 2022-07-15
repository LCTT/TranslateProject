[#]: subject: "massCode: A Free and Open-Source Code Snippet Manager"
[#]: via: "https://itsfoss.com/masscode/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14827-1.html"

massCode：一个自由开源的代码片段管理器
======

![](https://img.linux.net.cn/data/attachment/album/202207/14/151504ti9twf2u5kft2wh2.jpg)

> massCode 是一个开源的代码片段管理器，使你能够涉足代码，提高生产力，并节省时间。

如果一个工具能让事情变得更快、更有效率，那对许多开发者来说就是救命稻草。

虽然有各种服务和平台试图使编码体验更快，但你仍然有其他几个选择可以考虑。

例如，代码片段管理器。使用代码片段管理器，你的目的是保存你想快速访问的代码片段。它更像是指定快捷方式，在你的程序中添加所需的代码。

这不是一个新的概念，但可用于这项工作的工具可能不完全是开源的。

幸运的是，我偶然发现了一个不错的项目，它为你提供了一个自由开源的片段管理器，即 massCode。

### massCode：跨平台的开源片段管理器

![masscode][1]

massCode 是一个有用的代码片段管理器，具有一些基本功能。

它支持广泛的编程语言，还包括对 Markdown 的支持。你可以使用文件夹组织你的代码片段，添加标签等。

massCode 可用于 Linux、Windows 或 macOS。让我们来看看一些主要功能。

### massCode 的特点

![masscode screenshot][2]

massCode 包括许多有用的功能。其中一些是：

* 多层次的文件夹结构
* 每个片段都可以存储在片段（标签）中
* 集成的编码编辑器 [Ace][3]
* 代码格式化或高亮显示
* 支持带预览的 Markdown
* 能够搜索片段
* 给你的代码段添加描述，以了解它的用途
* 各种深色/浅色主题可用
* 能够从 [SnippetsLab][4] 迁移
* 自动保存以帮助你保留你的工作
* 将其与云同步文件夹整合
* 支持 VSCode、Raycast 和 Alfred 的扩展

除了上述所有功能外，你还可以轻松地复制保存代码片段，只需点击一下。

对于自定义，你可以调整字体大小和系列、切换自动换行、高亮显示行、使用单引号或添加尾随命令，这要归功于 [Prettier][5]。

此外，一份片段可以有多个分片。因此，它使你有机会将其用于各种用例。

如前所述，你也可以通过改变同步文件夹的存储位置将其与你的任何云同步服务整合。

![masscode migrate preferences][6]

总的来说，它工作得很好，有一些局限性，比如缺乏将嵌套文件夹从 SnippetsLab 迁移到 masCode 的能力。

### 在 Linux 上安装 massCode

massCode 有 [Snap 包][7]，但不在 Snap 商店中。你可以直接下载该软件包，并使用以下命令来安装它：

```
sudo snap install --dangerous ~/Downloads/masscode_2.6.1_amd64.snap
```

我们的一份故障排除指南可以帮助你了解 [snap 的 dangerous 选项][8]。

你可以通过其 [官方网站][9] 或 [GitHub 发布区][10] 下载 Windows/MacOS 版。

> **[massCode][11]**

你试过 massCode 吗？还有其他可用于 Linux 的代码片段管理器吗？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/masscode/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/masscode-screenshot-1.png
[2]: https://itsfoss.com/wp-content/uploads/2022/07/masscode-screenshot.png
[3]: https://github.com/ajaxorg/ace
[4]: https://apps.apple.com/us/app/snippetslab/id1006087419?mt=12
[5]: https://prettier.io/
[6]: https://itsfoss.com/wp-content/uploads/2022/07/masscode-migrate-preferences.jpg
[7]: https://itsfoss.com/install-snap-linux/
[8]: https://itsfoss.com/snap-metadata-signature-error/
[9]: https://masscode.io/
[10]: https://github.com/massCodeIO/massCode/releases/tag/v2.6.1
[11]: https://masscode.io/
