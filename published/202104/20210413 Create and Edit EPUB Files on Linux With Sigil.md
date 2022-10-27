[#]: subject: (Create and Edit EPUB Files on Linux With Sigil)
[#]: via: (https://itsfoss.com/sigile-epub-editor/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13325-1.html)

用 Sigil 在 Linux 上创建和编辑 EPUB 文件
======

![](https://img.linux.net.cn/data/attachment/album/202104/23/184455qn6u6oozmf6gmnec.jpg)

Sigil 是一个开源的 Linux、Windows 和 MacOS 上的 EPUB 编辑器。你可以使用 Sigil 创建一个新的 EPUB 格式的电子书，或编辑现有的 EPUB 电子书（以 `.epub` 扩展结尾的文件）。

如果你感到好奇，EPUB 是一个标准的电子书格式，并被几个数字出版集团认可。它被许多设备和电子阅读器支持，除了亚马逊的 Kindle。

### Sigil 让你创建或编辑 EPUB 文件

[Sigil][1] 是一个允许你编辑 EPUB 文件的开源软件。当然，你可以从头开始创建一个新的 EPUB 文件。

![][2]

很多人在 [创建或编辑电子书时非常相信 Calibre][3]。它确实是一个完整的工具，它有很多的功能，支持的格式不只是 EPUB 格式。然而，Calibre 有时可能需要过多的资源。

Sigil 只专注于 EPUB 书籍，它有以下功能：

  * 支持 EPUB 2 和 EPUB 3（有一定的限制）
  * 提供代码视图预览
  * 编辑 EPUB 语法
  * 带有多级标题的目录生成器
  * 编辑元数据
  * 拼写检查
  * 支持正则查找和替换
  * 支持导入 EPUB、HTML 文件、图像和样式表
  * 额外插件
  * 多语言支持的接口
  * 支持 Linux、Windows 和 MacOS

Sigil 不是你可以直接输入新书章节的 [所见即所得][4] 类型的编辑器。由于 EPUB 依赖于 XML，因此它专注于代码。可以将其视为用于 EPUB 文件的 [类似于 VS Code 的代码编辑器][5]。出于这个原因，你应该使用一些其他 [开源写作工具][6]，以 epub 格式导出你的文件（如果可能的话），然后在 Sigil 中编辑它。

![][7]

Sigil 有一个 [Wiki][8] 来提供一些安装和使用 Sigil 的文档。

### 在 Linux 上安装 Sigil

Sigil 是一款跨平台应用，支持 Windows 和 macOS 以及 Linux。它是一个流行的软件，有超过十年的历史。这就是为什么你应该会在你的 Linux 发行版仓库中找到它。只要在你的发行版的软件中心应用中寻找它就可以了。

![Sigil in Ubuntu Software Center][9]

你可能需要事先启用 universe 仓库。你也可以在 Ubuntu发行版中使用 `apt` 命令：

```
sudo apt install sigil
```

Sigil 有很多对 Python 库和模块的依赖，因此它下载和安装了大量的包。

![][10]

我不会列出 Fedora、SUSE、Arch 和其他发行版的命令。你可能已经知道如何使用你的发行版的软件包管理器，对吧？

你的发行版提供的版本不一定是最新的。如果你想要 Sigil 的最新版本，你可以查看它的 GitHub 仓库。

- [Sigil 的 GitHub 仓库][11]

### 并不适合所有人，当然也不适合用于阅读 ePUB 电子书

我不建议使用 Sigil 阅读电子书。Linux 上有 [其他专门的应用来阅读 .epub 文件][12]。

如果你是一个必须处理 EPUB 书籍的作家，或者如果你在数字化旧书，并在各种格式间转换，Sigil 可能是值得一试。

我还没有大量使用 过 Sigil，所以我不提供对它的评论。我让你去探索它，并在这里与我们分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/sigile-epub-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://sigil-ebook.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/open-epub-sigil.png?resize=800%2C621&ssl=1
[3]: https://itsfoss.com/create-ebook-calibre-linux/
[4]: https://www.computerhope.com/jargon/w/wysiwyg.htm
[5]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[6]: https://itsfoss.com/open-source-tools-writers/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/sigil-epub-editor-800x621.png?resize=800%2C621&ssl=1
[8]: https://github.com/Sigil-Ebook/Sigil/wiki
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/sigil-software-center-ubuntu.png?resize=800%2C424&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/installing-sigil-ubuntu.png?resize=800%2C547&ssl=1
[11]: https://github.com/Sigil-Ebook/Sigil
[12]: https://itsfoss.com/open-epub-books-ubuntu-linux/
