[#]: subject: "A look inside an EPUB file"
[#]: via: "https://opensource.com/article/22/8/epub-file"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14967-1.html"

深入了解 EPUB 文件
======

![](https://img.linux.net.cn/data/attachment/album/202208/25/223832eo3gq2o32uz0u0ll.jpg)

> EPUB 文件是使用开放格式发布内容的好方法。

电子书提供了一种随时随地阅读书籍、杂志和其他内容的好方法。读者可以在长途飞行和乘坐火车时享受电子书打发时间。最流行的电子书文件格式是 EPUB 文件，它是“<ruby>电子出版物<rt>electronic publication</rt></ruby>”的缩写。 EPUB 文件受到各种电子阅读器的支持，并且是当今电子书出版的有效标准。

EPUB 文件格式基于 XHTML 内容和 XML 元数据的开放标准，包含在 zip 存档中。由于一切都基于开放标准，我们可以使用通用工具来创建或检查 EPUB 文件。让我们探索一个 EPUB 文件以了解更多信息。《[C 编程技巧和窍门指南][2]》，于今年早些时候在 Opensource.com 上发布，提供 PDF 或 EPUB 格式。

因为 EPUB 文件是放在 zip 文件中的 XHTML 内容和 XML 元数据，所以你可以用 `unzip` 命令在命令行检查 EPUB：

```
$ unzip -l osdc_Jim-Hall_C-Programming-Tips.epub 
Archive: osdc_Jim-Hall_C-Programming-Tips.epub
Length Date Time Name
--------- ---------- ----- ----
20 06-23-2022 00:20 mimetype
8259 06-23-2022 00:20 OEBPS/styles/stylesheet.css
1659 06-23-2022 00:20 OEBPS/toc.xhtml
4460 06-23-2022 00:20 OEBPS/content.opf
44157 06-23-2022 00:20 OEBPS/sections/section0018.xhtml
1242 06-23-2022 00:20 OEBPS/sections/section0002.xhtml
22429 06-23-2022 00:20 OEBPS/sections/section0008.xhtml
[...]
9628 06-23-2022 00:20 OEBPS/sections/section0016.xhtml
748 06-23-2022 00:20 OEBPS/sections/section0001.xhtml
3370 06-23-2022 00:20 OEBPS/toc.ncx
8308 06-23-2022 00:21 OEBPS/images/image0011.png
6598 06-23-2022 00:21 OEBPS/images/image0009.png
[...]
14492 06-23-2022 00:21 OEBPS/images/image0005.png
239 06-23-2022 00:20 META-INF/container.xml
--------- -------
959201 41 files
```

这个 EPUB 包含很多文件，但其中大部分是内容。要了解 EPUB 文件是如何组合在一起的，请遵循电子书阅读器的流程：

1、电子书阅读器需要验证 EPUB 文件是否真的是 EPUB 文件。他们通过检查 EPUB 存档根目录中的 `mimetype` 文件来验证文件。该文件仅包含一行描述 EPUB 文件的 MIME 类型：

```
application/epub+zip
```

2、为了定位内容，电子书阅读器从 `META-INF/container.xml` 文件开始。这是一个简短的 XML 文档，指示在哪里可以找到内容。对于此 EPUB 文件，`container.xml` 文件如下所示：

```
<?xml version="1.0" encoding="UTF-8"?>
  <container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
    <rootfiles>
      <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>
```

为了使 `container.xml` 文件更易于阅读，我将单行拆分为多行，并添加了一些间距来缩进每行。XML 文件并不关心新行和空格等额外的空白，因此这种额外的间距不会影响 XML 文件。

3、`container.xml` 文件表示 EPUB 的根从 `OEBPS` 目录中的 `content.opf` 文件开始。OPF 扩展名是因为 EPUB 基于 “<ruby>开放打包格式<rt>Open Packaging Format</rt></ruby>”，但 `content.opf` 文件实际上只是另一个 XML 文件。

4、`content.opf` 文件包含一个完整的 EPUB 内容清单，以及一个有序的目录，以及查找每一章或每一节的引用。这个 EPUB 的 `content.opf` 文件很长，因此我将在此仅展示一小部分作为示例。

XML 数据包含在 `<package>` 块中，该块本身具有 `<metadata>` 块、`<manifest>` 数据和包含电子书目录的 `<spine>` 块：

```
<?xml version="1.0" encoding="UTF-8"?>
<package unique-identifier="unique-identifier" version="3.0" xmlns="http://www.idpf.org/2007/opf" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:opf="http://www.idpf.org/2007/opf">
  <metadata>
    <dc:identifier id="unique-identifier">osdc002</dc:identifier>
    <dc:title>Tips and Tricks for C Programming</dc:title>
    <dc:creator>Jim Hall</dc:creator>
    <dc:language>English</dc:language>
    <meta property="dcterms:modified">2022-06-23T12:09:13Z</meta>
    <meta content="LibreOffice/7.3.0.3$Linux_X86_64 LibreOffice_project/0f246aa12d0eee4a0f7adcefbf7c878fc2238db3 (libepubgen/0.1.1)" name="generator"/>
  </metadata>
  <manifest>
    ...
    <item href="sections/section0001.xhtml" id="section0001" media-type="application/xhtml+xml"/>
    <item href="images/image0003.png" id="image0003" media-type="image/png"/>
    <item href="styles/stylesheet.css" id="stylesheet.css" media-type="text/css"/>
    <item href="toc.ncx" id="toc.ncx" media-type="application/x-dtbncx+xml"/>
    ...
  </manifest>
  <spine toc="toc.ncx">
    <itemref idref="section0001"/>
    <itemref idref="section0002"/>
    <itemref idref="section0003"/>
    ...
  </spine>
</package>
```

你可以把数据匹配起来，看看在哪里可以找到每个部分。EPUB 阅读器就是这样做的。例如，目录中的第一项引用了 `section0001`，它在清单中被定义为位于 `sections/section0001.xhtml` 文件中。该文件的名称不需要与 `idref` 条目相同，但 LibreOffice Writer 的自动程序就是这样创建该文件的。（你可以在元数据中看到，这个 EPUB 是在 Linux 上用 LibreOffice 7.3.0.3 版本创建的，它可以将内容导出为 EPUB 文件。）

### EPUB 格式

EPUB 文件是一种使用开放格式发布内容的好方法。EPUB 文件格式是 XML 元数据与 XHTML 内容，包含在一个 zip 文件内。虽然大多数技术作家使用工具来创建 EPUB 文件，因为 EPUB 是基于开放标准，意味着你可以使用其他方式创建自己的 EPUB 文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/epub-file

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/find-file-linux-code_magnifying_glass_zero.png
[2]: https://opensource.com/downloads/guide-c-programming
