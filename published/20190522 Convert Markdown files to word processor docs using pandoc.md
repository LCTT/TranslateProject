[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11160-1.html)
[#]: subject: (Convert Markdown files to word processor docs using pandoc)
[#]: via: (https://opensource.com/article/19/5/convert-markdown-to-word-pandoc)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt/users/jason-van-gumster/users/kikofernandez)

使用 pandoc 将 Markdown 转换为格式化文档
======

> 生活在普通文本世界么？以下是无需使用文字处理器而创建别人要的格式化文档的方法。

![][1]

如果你生活在[普通文本][2]世界里，总会有人要求你提供格式化文档。我就经常遇到这个问题，特别是在 Day JobTM。虽然我已经给与我合作的开发团队之一介绍了用于撰写和审阅发行说明的 [Docs Like Code][3] 工作流程，但是还有少数人对 GitHub 和使用 [Markdown][4] 没有兴趣，他们更喜欢为特定的专有应用格式化的文档。

好消息是，你不会被卡在将未格式化的文本复制粘贴到文字处理器的问题当中。使用 [pandoc][5]，你可以快速地给人们他们想要的东西。让我们看看如何使用 pandoc 将文档从 Markdown 转换为 Linux 中的文字处理器格式。

请注意，pandoc 也可用于从两种 BSD（[NetBSD][7] 和 [FreeBSD][8]）到 Chrome OS、MacOS 和 Windows 等的各种操作系统。

### 基本转换

首先，在你的计算机上[安装 pandoc][9]。然后，打开控制台终端窗口，并导航到包含要转换的文件的目录。

输入此命令以创建 ODT 文件（可以使用 [LibreOffice Writer][10] 或 [AbiWord][11] 等字处理器打开）：

```
pandoc -t odt filename.md -o filename.odt
```

记得用实际文件名称替换 `filename`。如果你需要为其他文字处理器（你知道我的意思）创建一个文件，替换命令行的 `odt` 为 `docx`。以下是本文转换为 ODT 文件时的内容：

![Basic conversion results with pandoc.][12]

这些转换结果虽然可用，但有点乏味。让我们看看如何为转换后的文档添加更多样式。

### 带样式转换

`pandoc` 有一个漂亮的功能，使你可以在将带标记的纯文本文件转换为字处理器格式时指定样式模板。在此文件中，你可以编辑文档中的少量样式，包括控制段落、文章标题和副标题、段落标题、说明、基本的表格和超链接的样式。

让我们来看看能做什么。

#### 创建模板

要设置文档样式，你不能只是使用任何一个模板就行。你需要生成 pandoc 称之为引用模板的文件，这是将文本文件转换为文字处理器文档时使用的模板。要创建此文件，请在终端窗口中键入以下内容：

```
pandoc -o custom-reference.odt --print-default-data-file reference.odt
```

此命令创建一个名为 `custom-reference.odt` 的文件。如果你正在使用其他文字处理程序，请将命令行中的 “odt” 更改为 “docx”。

在 LibreOffice Writer 中打开模板文件，然后按 `F11` 打开 LibreOffice Writer 的 “样式” 窗格。虽然 [pandoc 手册][13]建议不要对该文件进行其他更改，但我会在必要时更改页面大小并添加页眉和页脚。

#### 使用模板

那么，你要如何使用刚刚创建的模板？有两种方法可以做到这一点。

最简单的方法是将模板放在家目录的 `.pandoc` 文件夹中，如果该文件夹不存在，则必须先创建该文件夹。当转换文档时，`pandoc` 会使用此模板文件。如果你需要多个模板，请参阅下一节了解如何从多个模板中进行选择。

使用模板的另一种方法是在命令行键入以下转换选项：

```
pandoc -t odt file-name.md --reference-doc=path-to-your-file/reference.odt -o file-name.odt
```

如果你想知道使用自定义模板转换后的文件是什么样的，这是一个示例：

![A document converted using a pandoc style template.][14]

#### 选择模板

很多人只需要一个 `pandoc` 模板，但是，有些人需要不止一个。

例如，在我的日常工作中，我使用了几个模板：一个带有 DRAFT 水印，一个带有表示内部使用的水印，另一个用于文档的最终版本。每种类型的文档都需要不同的模板。

如果你有类似的需求，可以像使用单个模板一样创建文件 `custom-reference.odt`，将生成的文件重命名为例如 `custom-reference-draft.odt` 这样的名字，然后在 LibreOffice Writer 中打开它并修改样式。对你需要的每个模板重复此过程。

接下来，将文件复制到家目录中。如果你愿意，你甚至可以将它们放在 `.pandoc` 文件夹中。

要在转换时选择特定模板，你需要在终端中运行此命令：

```
pandoc -t odt file-name.md --reference-doc=path-to-your-file/custom-template.odt -o file-name.odt
```

改变 `custom-template.odt` 为你的模板文件名。

### 结语

为了不用记住我不经常使用的一组选项，我拼凑了一些简单的、非常蹩脚的单行脚本，这些脚本封装了每个模板的选项。例如，我运行脚本 `todraft.sh` 以使用带有 DRAFT 水印的模板创建文字处理器文档。你可能也想要这样做。

以下是使用包含 DRAFT 水印的模板的脚本示例：

```
pandoc -t odt $1.md -o $1.odt --reference-doc=~/Documents/pandoc-templates/custom-reference-draft.odt
```

使用 pandoc 是一种不必放弃命令行生活而以人们要求的格式提供文档的好方法。此工具也不仅适用于 Markdown。我在本文中讨论的内容还可以让你在各种标记语言之间创建和转换文档。有关更多详细信息，请参阅前面链接的 [pandoc 官网][5]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt/users/jason-van-gumster/users/kikofernandez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb
[2]: https://plaintextproject.online/
[3]: https://www.docslikecode.com/
[4]: https://en.wikipedia.org/wiki/Markdown
[5]: https://pandoc.org/
[6]: /resources/linux
[7]: https://www.netbsd.org/
[8]: https://www.freebsd.org/
[9]: https://pandoc.org/installing.html
[10]: https://www.libreoffice.org/discover/writer/
[11]: https://www.abisource.com/
[12]: https://opensource.com/sites/default/files/uploads/pandoc-wp-basic-conversion_600_0.png (Basic conversion results with pandoc.)
[13]: https://pandoc.org/MANUAL.html
[14]: https://opensource.com/sites/default/files/uploads/pandoc-wp-conversion-with-tpl_600.png (A document converted using a pandoc style template.)
