[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12523-1.html)
[#]: subject: (Perform Common PDF Editing Tasks Like Merge, Split, Rotate With Free and Open Source PDF Mix Tool)
[#]: via: (https://itsfoss.com/pdf-mix-tool/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

使用 PDF Mix Tool 执行常见的 PDF 编辑任务
======

> PDF Mix Tool 是一个简单、轻巧的开源 PDF 编辑应用，可让你从 PDF 中提取页面、合并两个 PDF、从 PDF 中删除页面等。

![](https://img.linux.net.cn/data/attachment/album/202008/16/203411puozfr91f1pmzg9z.jpg)

### PDF Mix Tool：一个简单的开源 PDF 编辑工具

![][1]

有[几个可以在 Linux 中使用的 PDF 编辑器][2]，我通常将它们分为两类：

  * 可让你编辑内容（注释、高亮、更改文本、添加/删除图像等）的 PDF 编辑器，
  * 可让你通过合并、分割、提取页面等来修改文件的 PDF 编辑器。

[PDF Mix Tool][3] 属于第二类。它是用 C++ 和 Qt5 编写的开源软件。它可让你合并两个或更多 PDF 文件，并为每个文件指定页面，还有旋转页面、添加空白页、删除页面以及从 PDF 文件提取页面。

在本周的开源软件亮点中，让我们看一下使用 PDF Mix Tool。

### 使用 PDF Mix Tool 在 Linux 中编辑 PDF

![][4]

PDF Mix Tool 并没有很多功能，但是有一些非常重要的功能。

#### 合并 PDF 文件

![][5]

你可以轻松合并多个 PDF 文件，同时指定确切的页面。它让你能够调整页面数、旋转，还能使用 “<ruby>交替混合<rt>Alternate mix</rt></ruby>” 反转页面顺序合并。

![][6]

你只需要单击 “<ruby>添加 PDF 文件<rt>Add PDF File</rt></ruby>” 添加文件，然后使用可用的选项对其进行编辑（如上图所示），最后生成编辑的 PDF。

#### 旋转页面

你可以在合并多个文件或仅对单个 PDF 文件进行操作时旋转 PDF 文件的页面。

对于合并文件，你可以参考上面的截图。但是当你选择一个文件时，它看上去像这样：

![][7]

你有多种选择，但是要旋转页面，需要选择 “<ruby>编辑页面布局<rt>Edit page layout</rt></ruby>” 选项，如上截图所示。

#### 添加或删除页面

要从其他 PDF 文件添加新页面，最好利用此选项。

但是，如果要添加空白页，你可以选择一个文件进行添加。不只是添加空白页面，还可以删除特定页面。下面的截图圈出了高亮选项：

![][8]

#### 从 PDF 文件提取页面

![][9]

除了所有其他选项之外，你还可以从给定的 PDF 文件中提取特定页面（或全部）。你还可以为所有提取的页面生成一个新的 PDF 文件，或者为提取的每个页面制作单独的 PDF 文件。在许多场景中，它应该派上用场。

#### 其他功能

利用上面所有功能，你可以生成自己选择的全新 PDF，颠倒顺序、提取页面、制作单独的 PDF 文件等等。

它不会减小 PDF 文件的大小。你必须使用其他工具[在 Linux 中压缩 PDF 文件][10]。

因此，当你组合使用可用选项时，它是功能丰富的工具。

### 在 Linux 上安装 PDF Mix Tool

![PDF Mix Tool in Ubuntu Software Center][11]

PDF Mix Tool 存在于 Snap 和 [Flatpak 软件包][12]中。这意味着如果发行版支持这任意一种，你都可以在软件管理器中找到它。

或者，如果你[启用了 Snap 软件包支持][13]，那么可以使用以下命令进行安装：

```
sudo snap install pdfmixtool
```

如果你想[使用 Flatpak][14]，那么使用：

```
flatpak install flathub eu.scarpetta.PDFMixTool
```

如果你使用的是 Arch Linux，那么可以从[社区仓库][15]中获取。

```
sudo pacman -S pdfmixtool
```

你也可以选择查看它的 [GitLab 页面][16]获取源码。

- [下载 PDF Mix Tool 源码][17]

### 总结

它可能不是功能最丰富的 PDF 编辑工具，但考虑到它是轻量级的开源工具，因此它是已安装的应用中非常有用的。过去我们也介绍过类似的工具 [PDF Arranger][18]。你可能会想了解一下。

你如何看待它？你有尝试过么？在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pdf-mix-tool/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool.png?ssl=1
[2]: https://itsfoss.com/pdf-editors-linux/
[3]: https://scarpetta.eu/pdfmixtool/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-merge.png?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-edit.png?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-merge-edit.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-layout.png?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-add-delete.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-extract.png?ssl=1
[10]: https://itsfoss.com/compress-pdf-linux/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-ubuntu.png?ssl=1
[12]: https://flathub.org/apps/details/eu.scarpetta.PDFMixTool
[13]: https://itsfoss.com/install-snap-linux/
[14]: https://itsfoss.com/flatpak-guide/
[15]: https://www.archlinux.org/packages/community/x86_64/pdfmixtool/
[16]: https://gitlab.com/scarpetta/pdfmixtool
[17]: https://www.scarpetta.eu/pdfmixtool/
[18]: https://itsfoss.com/pdfarranger-app/
