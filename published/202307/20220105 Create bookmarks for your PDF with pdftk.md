[#]: subject: "Create bookmarks for your PDF with pdftk"
[#]: via: "https://opensource.com/article/22/1/pdf-metadata-pdftk"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15973-1.html"

使用 pdftk 为 PDF 文档创建书签
======

> 充分利用现有的技术，提供书签以帮助用户。

![][0]

在 [介绍 pdftk-java][2] 中, 我展示了如何在脚本中使用 `pdftk-java` 来快速修改 PDF 文件。

但是，`pdftk-java` 最有用的场景是处理那种动辄几百页的没有目录的大 PDF 文件。这里所谓的目录不是指文档前面供打印的目录，而是指显示在 PDF 阅读器侧边栏里的目录，它在 PDF 格式中的正式叫法是“<ruby>书签<rt>bookmarks</rt></ruby>”。

![Screenshot of a sidebar table of contents next to a PDF][3]

如果没有书签，就只能通过上下滚动或全局搜索文本来定位想要的章节，这非常麻烦。

PDF 文件的另一个恼人的小问题是缺乏元数据，比如标题和作者。如果你打开过一个标题栏上显示类似 “Microsoft Word - 04_Classics_Revisited.docx” 的 PDF 文件，你就能体会那种感觉了。

`pdftk-java` 让我能够创建自己的书签，我再也不面对这些问题了。

### 在 Linux 上安装 pdftk-java

正如 `pdftk-java` 的名称所示的，它是用 Java 编写的。它能够在所有主流操作系统上运行，只要你安装了 Java。

Linux 和 macOS 用户可以从 [AdoptOpenJDK.net][5] 安装 Java（LCTT 译注：原文为 Linux，应为笔误）。

Windows 用户可以安装 [Red Hat's Windows build of OpenJDK][6]。

在 Linux 上安装 pdftk-java：

  1. 从 Gitlab 仓库下载 [pdftk-all.jar release][7]，保存至 `~/.local/bin/` 或 [其它路径][8] 下.
  2. 用文本编辑器打开 `~/.bashrc`，添加 `alias pdftk='java -jar $HOME/.local/bin/pdftk-all.jar'`
  3. 运行 `source ~/.bashrc` 使新的 Bash 设置生效。

### 数据转储

修改元数据的第一步是抽取 PDF 当前的数据文件。

现在的数据文件可能并没包含多少内容，但这也是一个不错的开端。

```
$ pdftk mybigfile.pdf \
  data_dump \
  output bookmarks.txt
```
生成的 `bookmarks.txt` 文件中包含了输入 PDF 文件 `mybigfile.pdf` 的所有元数据和一大堆无用数据。

### 编辑元数据

用文本编辑器（比如 [Atom][9] 或 [Gedit][10]）打开 `bookmarks.txt` 以编辑 PDF 元数据。

元数据的格式和数据项直观易懂：

```
InfoBegin
InfoKey: Creator
InfoValue: Word
InfoBegin
InfoKey: ModDate
InfoValue: D:20151221203353Z00&amp;apos;00&amp;apos;
InfoBegin
InfoKey: CreationDate
InfoValue: D:20151221203353Z00&amp;apos;00&amp;apos;
InfoBegin
InfoKey: Producer
InfoValue: Mac OS X 10.10.4 Quartz PDFContext
InfoBegin
InfoKey: Title
InfoValue: Microsoft Word - 04_UA_Classics_Revisited.docx
PdfID0: f049e63eaf3b4061ddad16b455ca780f
PdfID1: f049e63eaf3b4061ddad16b455ca780f
NumberOfPages: 42
PageMediaBegin
PageMediaNumber: 1
PageMediaRotation: 0
PageMediaRect: 0 0 612 792
PageMediaDimensions: 612 792
[...]
```

你可以将 `InfoValue` 的值修改为对当前 PDF 有意义的内容。比如可以将 `Creator` 字段从 `Word` 修改为实际的作者或出版社名称。比起使用导出程序自动生成的标题，使用书籍的实际标题会更好。

你也可以做一些清理工作。在 `NumberOfPages` 之后的行都不是必需的，可以删除这些行的内容。

### 添加书签

PDF 书签的格式如下：

```
BookmarkBegin
BookmarkTitle: My first bookmark
BookmarkLevel: 1
BookmarkPageNumber: 2
```

  * `BookmarkBegin` 表示这是一个书签。
  * `BookmarkTitle` 书签在 PDF 阅读器中显示的文本。
  * `BookmarkLevel` 书签层级。如果书签层级为 2，它将出现在上一个书签的小三角下。如果设置为 3，它会显示在上一个 2 级书签的小三角下。这让你能为章以及其中的节设置书签。
  * `BookmarkPageNumber` 点击书签时转到的页码。

为你需要的章节创建书签，然后保存文件。

### 更新书签信息

现在已经准备好了元数据和书签，你可以将它们导入到 PDF 文件中。实际上是将这些信息导入到一个新的 PDF 文件中，它的内容与原 PDF 文件相同：

```
$ pdftk mybigfile.pdf \
  update_info bookmarks.txt \
  output mynewfile.pdf
```

生成的 `mynewfile.pdf` 包含了你设置的全部元数据和书签。

### 体现专业性

PDF 文件中是否包含定制化的元数据和书签可能并不会影响销售。

但是，关注元数据可以向用户表明你重视质量保证。增加书签可以为用户提供便利，同时亦是充分利用现有技术。

使用 `pdftk-java` 来简化这个过程，用户会感激不尽。

*（题图：MJ/f8869a66-562d-4ee4-9f2d-1949944d6a9c）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/pdf-metadata-pdftk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/12/edit-pdf-linux-pdftk
[3]: https://opensource.com/sites/default/files/uploads/pdtfk_update.jpeg (table of contents)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://adoptopenjdk.net/releases.html
[6]: https://developers.redhat.com/products/openjdk/download
[7]: https://gitlab.com/pdftk-java/pdftk/-/jobs/1527259628/artifacts/raw/build/libs/pdftk-all.jar
[8]: https://opensource.com/article/17/6/set-path-linux
[9]: https://opensource.com/article/20/12/atom
[10]: https://opensource.com/article/20/12/gedit
[0]: https://img.linux.net.cn/data/attachment/album/202307/06/185044ioz6nw1jqkqnhx66.jpg