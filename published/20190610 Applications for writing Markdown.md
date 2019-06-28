[#]: collector: (lujun9972)
[#]: translator: (murphyzhao)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11027-1.html)
[#]: subject: (Applications for writing Markdown)
[#]: via: (https://fedoramagazine.org/applications-for-writing-markdown/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

三个在 Fedora 平台上撰写 Markdown 的软件
======

![][1]

Markdown 是一种轻量级标记语言，可以在添加格式后以纯文本格式查看时依然保持可读性。Markdown（和 Markdown 衍生物）被广泛用作 GitHub 和 pagure 等服务上格式化文档的主要形式。根据其设计，可以在文本编辑器中轻松创建和编辑 Markdown，但是，有许多编辑器可以提供 Markdown 标记的格式化预览，或提供 Markdown 语法高亮显示。

本文介绍了针对 Fedora 平台的 3 个桌面应用程序，以帮助编辑 Markdown。

### UberWriter

[UberWriter][2] 是一个小巧的 Markdown 编辑器和预览器，允许你以文本方式编辑，并预览渲染的文档。

![][3]

该编辑器本身具有内置的内联预览，因此标记为粗体的文本以粗体显示。编辑器还提供图像、公式、脚注等标记的内联预览。按住 `Ctrl` 键单击其中的一个标记可以即时预览要显示的元素。

除了编辑器功能外，UberWriter 还具有全屏模式和聚焦模式，有助于最大限度地减少干扰。焦点模式将以灰色显示除当前段落以外的所有内容，以帮助你专注于文档中当前元素。

从第三方 Flathub 存储库安装 UberWriter 到 Fedora 平台。在将系统[设置为从 Flathub 安装][4]后，可以直接从 Software 应用程序中安装它。

### Marker

Marker 是一个 Markdown 编辑器，它提供了一个简单的文本编辑器来编写 Markdown，并提供渲染文档的实时预览。界面采用分屏设计，左侧为编辑器，右侧为实时预览。

![][5]

此外，Marker 允许你以各种格式导出文档，包括 HTML、PDF 和开放文档格式（ODF）。

从第三方 Flathub 存储库安装 Marker 到 Fedora 平台。在将系统[设置为从 Flathub 安装][4]后，可以直接从 Software 应用程序中安装它。

### Ghostwriter

以前的编辑更专注于最小的用户体验，Ghostwriter 提供了更多的功能和选项。Ghostwriter 提供了一个文本编辑器，当你以 Markdown 格式书写时，编辑器将 Markdown 部分样式化。粗体标记文本显示为粗体，标题标记显示为较大的字体，以帮助编写 Markdown 标记。

![][6]

它还提供了一个分屏，包含渲染文档的实时更新预览。

![][7]

Ghostwriter 还包括一系列其他功能，包括能够选择渲染预览的 Markdown 风格，以及用于渲染预览的样式表。

此外，它还提供了一个格式菜单（和键盘快捷键）来插入一些频繁的 Markdown 标记，如粗体、项目符号和斜体。

从第三方 Flathub 存储库安装 Ghostwriter 到 Fedora 平台。在将系统[设置为从 Flathub 安装][4]后，可以直接从 Software 应用程序中安装它。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/applications-for-writing-markdown/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[murphyzhao](https://github.com/murphyzhao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/markdownapps.png-816x345.jpg
[2]: https://uberwriter.github.io/uberwriter/#1
[3]: https://fedoramagazine.org/wp-content/uploads/2019/06/uberwriter-editor-1.png
[4]: https://fedoramagazine.org/install-flathub-apps-fedora/
[5]: https://fedoramagazine.org/wp-content/uploads/2019/06/marker-screenshot-1024x500.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/06/ghostwriter-1024x732.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/06/ghostwriter2-1024x566.png
