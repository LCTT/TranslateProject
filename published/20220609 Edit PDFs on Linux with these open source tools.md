 [#]: subject: "Edit PDFs on Linux with these open source tools"
[#]: via: "https://opensource.com/article/22/6/open-source-pdf-editors-linux"
[#]: author: "Michael Korotaev https://opensource.com/users/michaelk"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14761-1.html"

用这些开源工具在 Linux 上编辑 PDF 文件
======

![](https://img.linux.net.cn/data/attachment/album/202206/26/152728d3kajokj34t3agwm.jpg)

> Adobe Acrobat 的开源替代品具有创建、编辑和注释 PDF 的所有必要功能。

开源的 PDF 阅读和编辑工具通常比 “PDF 编辑器” 搜索结果第一页中的应用更安全和可靠。在那里，你很可能看到带有隐藏的限制和关税的专有应用，缺乏关于数据保护政策和托管的足够信息。你可以有更好的。

这里有五个应用，可以安装在你的 Linux 系统上（和其他系统）或托管在服务器上。每一个都是自由而开源的，具有创建、编辑和注释 PDF 文件的所有必要功能。

### LibreOffice

使用 [LibreOffice][2] 套件，你对应用的选择取决于最初的任务。虽然文字处理器 LibreOffice Writer，可以让你创建 PDF 文件，并从 ODF 和其他文本格式导出，但 Draw 更适合于处理现有的 PDF 文件。

Draw 是用来创建和编辑图形文件的，如小册子、杂志和海报。因此，其工具集主要用于视觉对象和布局上。然而，对于 PDF 编辑，当文件具有可编辑属性时，LibreOffice Draw 提供了用于修改和添加 PDF 内容的工具。如果没有的话，你仍然可以在现有的内容层上添加新的文本字段，并对文件进行注释或完成。

Draw 和 Writer 都被捆绑在 LibreOffice 桌面套件中，可在 Linux 系统、macOS 和 Windows 上安装。

### ONLYOFFICE Docs

ONLYOFFICE 一直在改进 PDF 的处理，并在 [ONLYOFFICE Docs][3] 的 7.1 版本中引入了一个全新的 PDF 和电子书的阅读器。

该文档编辑器允许从头开始创建 PDF 文件，使用 DOCX 作为文件的基础，然后可以转换为 PDF 或 PDF/A。通过内置的表单创建功能，ONLYOFFICE Docs 还可以建立可填充的文档模板，并将其导出为可编辑的 PDF，并为不同类型的内容设置可填充的字段：文本、图像、日期等。

除了可以识别 PDF 内的文本进行复制和提取外，ONLYOFFICE Docs 还可以将 PDF 转换为 DOCX，这样你就可以继续使用完全可编辑的文本格式的文件。ONLYOFFICE 还可以让你用密码保护文件，添加水印，并使用桌面版中的数字签名。

ONLYOFFICE Docs 可以作为一个网络套件（内部或云端）集成到文档管理系统（DMS）或作为一个独立的桌面应用程序使用。你可以将后者作为 DEB 或 RPM 文件、AppImage、Flatpack 和其他几种格式在 Linux 中安装。

### PDF Arranger

[PDF Arranger][4] 是 PikePDF 库的一个前端应用。它不像 LibreOffice 和 ONLYOFFICE 那样用于对 PDF 的内容进行编辑，但它对于重新排序页面、将 PDF 分割成更小的文件、将几个 PDF 合并成一个、旋转或裁剪页面等都很好。它的界面是直观的，易于使用。

PDF Arranger 可用于 Linux 和 Windows。

### Okular

[Okular][5] 是一个由 KDE 社区开发的免费开源文档查看器。该应用的功能非常成熟，可以查看 PDF、电子书、图片和漫画。

Okular 完全或部分支持大多数流行的 PDF 功能和使用场景，如添加注释和内联笔记或插入文本框、形状和印章。你还可以为文档添加数字加密签名，这样你的读者就可以确定文档的来源。

除了在 PDF 中添加文本和图像外，还可以从文档中检索到它们，以复制和粘贴到其他地方。Okular 中的区域选择工具可以识别所选区域内的组件，所以你可以从 PDF 中独立提取它们。

你可以使用你的发行版包管理器或以 Flatpak 的形式安装 Okular。

### Xournal++

[Xournal++][6] 是一款带有 PDF 文件注释工具的手写日记软件。

它是一款具有强化手写功能的记事软件，对于处理基于文本的内容和专业布局来说，它可能不是最佳选择。然而，它渲染图形的能力以及对书写和绘图的手写笔输入的支持使它作为一个小众生产力工具脱颖而出。

图层管理工具、可定制的笔尖设置以及对手写笔映射的支持，使 PDF 注释和草图绘制变得更加舒适。Xournal++ 还有一个文本工具，用于添加文本框，并能插入图像。

Xournal++ 可在 Linux 系统（Ubuntu、Debian、Arch、SUSE）、MacOS 和 Windows（10及以上）中安装。

### 总结

如果你正在寻找一个免费和安全的专有 PDF 浏览和编辑软件的替代品，不难找到一个开源的选择，无论是桌面还是在线使用。只要记住，目前可用的解决方案在不同的使用情况下有各自的优势，没有一个工具在所有可能的任务中都同样出色。

这五个方案因其功能或对小众 PDF 任务的有用性而脱颖而出。对于企业使用和协作，我建议使用 ONLYOFFICE 或 LibreOffice Draw。PDF Arranger 是一个简单的、轻量级的工具，当你不需要改变文本时，可以用它来处理页面。Okular 为多种文件类型提供了很好的查看功能，如果你想在 PDF 中画草图和做笔记，Xournal++ 是最佳选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/open-source-pdf-editors-linux

作者：[Michael Korotaev][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/michaelk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/checklist_hands_team_collaboration.png
[2]: https://opensource.com/article/21/9/libreoffice-tips
[3]: https://opensource.com/article/20/12/onlyoffice-docs
[4]: https://flathub.org/apps/details/com.github.jeromerobert.pdfarranger
[5]: https://opensource.com/article/22/4/linux-kde-eco-certification-okular
[6]: http://xournal.sourceforge.net/
