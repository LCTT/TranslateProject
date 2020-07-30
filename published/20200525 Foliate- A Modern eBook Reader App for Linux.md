[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12462-1.html)
[#]: subject: (Foliate: A Modern eBook Reader App for Linux)
[#]: via: (https://itsfoss.com/foliate-ebook-viewer/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Foliate：适用于 Linux 的现代电子书阅读器应用
======

> Foliate 是一款简洁、优雅的开源电子书阅读器，可在 Linux 桌面上提供类似 Kindle 的阅读体验。

![](https://img.linux.net.cn/data/attachment/album/202007/28/230931vpsyu25yua8855u3.jpg)

虽然我们已经有了一个 [Linux 最佳电子书阅读器][2]的列表，但最近我遇到了另一个 Linux 电子书阅读器。它叫 [Foliate][3]。

![][1]

Foliate 是一个现代的 GTK 电子书查看器，它有许多基本功能。如果你拥有亚马逊 Kindle 或其他电子书阅读器，那么你可能会想念那种在桌面上阅读的体验。

![](https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/foliate-library-view.jpg?w=800&ssl=1)

Foliate 解决了那些抱怨。Foliate 会显示书的估计剩余阅读时间和页数。你可以添加书签、高亮文本和添加注释。你可以导出数据，也可以轻松同步它们。

![Foliate Ebook Viewer Features][4]

你也可以使用维基词典和维基百科查询单词。你可以在页面视图和滚动视图之间切换。它还有几个主题，以满足你的阅读偏好。

![][5]

最棒的是，它正在积极维护和开发。

### Foliate 的功能

![][6]

让我们来看看 Foliate 提供的所有功能：

  * 支持 .epub、.mobi、.azw、未打包的 EPUB 文件、文本文件、漫画存档（cbr、.cbz、.cbt、.cb7），小说书（.fb2、.fb2.zip）和 .azw3 文件。它不支持 PDF 文件。
  * 它让你可以在双页浏览模式下阅读电子书，并提供滚动查看模式。
  * 能够自定义字体、行距、边距和亮度。
  * 图书馆视图，显示最近的书籍和阅读进度。
  * 默认主题包括浅色、棕褐色、深色、Solarized 深色/浅色、Gruvbox 浅色/深色、灰色、Nord 和反转模式。
  * 你还可以添加自定义主题调整电子书浏览器的外观。
  * 带有章节标记的阅读进度滑块。
  * 书签和注释支持。
  * 能够在书中查找文本。
  * 能够放大和缩小。
  * 启用/禁用侧边栏进行导航。
  * 使用 [维基词典][7] 和 [维基百科][8] 快速查找字典
  * 使用谷歌翻译翻译文字
  * 触摸板手势，使用两指滑动即可翻页
  * 使用 [eSpeak NG][9] 和 [Festival][10] 支持文字转语音

### 在 Linux 上安装 Foliate

对于基于 Ubuntu 和 Debian 的 Linux 发行版，你可以从它的 [GitHub 发布页面][13]获取 .deb 文件。只需双击即可[从 deb 文件安装应用][14]。

对于 Fedora、Arch、SUSE 等其他 Linux 发行版。Foliate 可提供 [Flatpak][15] 和 [Snap][16] 包。如果你不知道如何使用它们，那么你可以按照我们[使用 flatpak][17] 和[使用 snap 包][18]指南来开始使用。

如果需要，你可以浏览它的 [GitHub 页面][19]以从源代码开始构建。

- [下载 Foliate 应用][20]

### 总结

我使用 GitHub 上提供的最新 .deb 文件在 Pop!_OS 19.10 上进行了尝试，并且效果很好。我不喜欢在桌面上阅读很久，但我喜欢它的功能。

你是否尝试过 Foliate？请随时分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/foliate-ebook-viewer/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/foliate-app.jpg?ssl=1
[2]: https://linux.cn/article-10383-1.html
[3]: https://johnfactotum.github.io/foliate/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/foliate-ebook-viewer-features.jpg?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/foliate-screenshot.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/foliate-options.jpg?ssl=1
[7]: https://en.wiktionary.org/wiki/Wiktionary:Main_Page
[8]: https://en.wikipedia.org/wiki/Main_Page
[9]: https://github.com/espeak-ng/espeak-ng
[10]: http://www.cstr.ed.ac.uk/projects/festival/
[13]: https://github.com/johnfactotum/foliate/releases
[14]: https://itsfoss.com/install-deb-files-ubuntu/
[15]: https://flathub.org/apps/details/com.github.johnfactotum.Foliate
[16]: https://snapcraft.io/foliate
[17]: https://itsfoss.com/flatpak-guide/
[18]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[19]: https://github.com/johnfactotum/foliate
[20]: tmp.6FO70BtAuy