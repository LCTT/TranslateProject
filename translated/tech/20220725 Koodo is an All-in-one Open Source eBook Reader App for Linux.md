[#]: subject: "Koodo is an All-in-one Open Source eBook Reader App for Linux"
[#]: via: "https://itsfoss.com/koodo-ebook-reader/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Koodo 是一款适用于 Linux 的一体化开源电子书阅读器应用
======

[有几个可供桌面 Linux 用户使用的电子书阅读器][1]。

几乎所有发行版都带有可以打开 PDF 文件的文档阅读器。它还可能支持其他文件格式，例如 epub 或 Mobi，但这不能保证。

这就是为什么需要像 [Foliate][2] 和 Calibre 这样的专门应用来阅读和管理各种格式的电子书的原因。

最近，我遇到了另一个开源软件，它为电子书阅读器提供了几个令人兴奋的功能。

### Koodo：它有你能想到的一切

[Koodo][3] 是一款多合一的开源电子书阅读器，具有帮助你更好地管理和阅读电子书的功能。它是一个跨平台应用，你可以在 Linux、Windows 和 macOS 上下载。你甚至可以[在网络浏览器中使用它][4]。

用户界面看起来很现代，可能是因为它是一个 Electron 应用。你必须导入书籍并将它们添加到 Koodo。它不按文件夹导入书籍。不过，你可以选择多个文件进行导入。书太多了？将一些添加到你的收藏夹以便快速访问。

![Koodo ebook reader interface][5]

我使用了 AppImage 格式，但由于未知原因，它没有显示文件的缩略图。

![Koodo ebook reader dark mode interface][6]

它支持流行的电子书文件格式，如 PDF、Mobi 和 Epub。但这并没有结束。它还支持 CBR、CBZ 和 CBT 漫画书格式，它还支持更多。它还可以阅读 FictionBooks (.fb2)、Markdown 和富文本格式 (RTF) 以及 MS Office word 文档 (Docx)。

除了支持海量文件格式外，它还提供了多种功能来改善你的阅读体验。

你可以高亮显示文本并使用文本注释对其进行注释。你还可以在当前文档或 Google 上搜索选定的文本。

![Annotate, highlight or translate selected text][7]

可以从主应用窗口的侧边栏中访问高亮显示的文本和注释。

有文本到语音和翻译选定文本的选项。但是，这两个功能在我的测试中都不起作用。我使用了 Koodo 的 AppImage 版本。

Koodo 支持各种布局。你可以以单列、双列或连续滚动布局阅读文档。对于 ePub 和 Mobi 格式，它会自动以双列布局打开。对于 PDF，默认选择单列布局。

你可以根据自己的喜好自定义 UI。更改字体、大小、段落间距、文本颜色、背景颜色、行间距、亮度等。

![koodo additional features][8]

Koodo 支持夜间阅读模式以及五个不同的主题。你可以根据自己的喜好在主题之间切换。

你还可以使用 Dropbox 或其他支持 Webdav 协议的[云服务][9]跨设备同步你的书籍和阅读数据（如高亮、笔记等）。

![You can backup your data in your preferred cloud service][10]

### 在 Linux 上获取 Koodo

如果你想体验 Koodo 进行实验，你可以试试它的在线版本。你可以在网络浏览器中使用 Koodo。你的数据本地存储在浏览器中，如果你清理浏览器缓存，你会丢失数据（高亮、笔记等，但不会丢失计算机上存储的书籍）。

[在线尝试 Koodo][11]

如果你喜欢它的功能，你可以选择在您的计算机上安装 Koodo。

Linux 用户有多种选择。你有 Debian 和基于 Ubuntu 的发行版的 deb 文件、Red Hat 和 Fedora 的 RPM 以及所有发行版的 Snap、AppImage 和可执行文件。

你可以从项目主页获取你选择的安装程序。

[下载 Koodo][12]

### 总结

Koodo 并不完美。它有大量功能，但并非所有功能都能完美运行，正如我在测试中发现的那样。

尽管如此，它仍然是一个很好的应用，有可能在用户中流行起来。只有少数几个应用包含如此多的功能。

感谢 Koodo 开发人员为桌面用户创建了一个有前途的开源应用。

你可以[访问项目的仓库][13]来查看源代码、报告 bug 或者通过给项目加星来向开发者表达一些喜爱。

--------------------------------------------------------------------------------

via: https://itsfoss.com/koodo-ebook-reader/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-ebook-readers-linux/
[2]: https://itsfoss.com/foliate-ebook-viewer/
[3]: https://koodo.960960.xyz/en
[4]: https://reader.960960.xyz/#/manager/empty
[5]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-ebook-reader-interface.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/koobo-ebook-reader-features.webp
[8]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-additional-features.webp
[9]: https://itsfoss.com/cloud-services-linux/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-backup-restore-feature.png
[11]: https://reader.960960.xyz/
[12]: https://koodo.960960.xyz/en
[13]: https://github.com/troyeguo/koodo-reader
