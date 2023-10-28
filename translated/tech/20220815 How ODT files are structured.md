[#]: subject: "How ODT files are structured"
[#]: via: "https://opensource.com/article/22/8/odt-files"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

ODT 文件格式简介
======
ODF 格式基于开放标准，你可以使用其它工具检查它们，甚至从中提取数据。你只需要知道从哪里开始。

文字处理文件过去是封闭的专有格式。在一些较旧的文字处理程序中，文档文件本质上是软件的内存转储。虽然这样可以让加载文件更快，但也使文档文件格式变得不透明。

2005 年左右，<ruby>结构化信息标准促进组织<rt> Organization for the Advancement of Structured Information Standards</rt></ruby>（OASIS）为所有类型的办公文档定义了一种开放格式，即办公应用程序<ruby>开放文档格式<rt>Open Document Format</rt></ruby>(ODF)。你也可以将 ODF 称为“OpenDocument Format”，因为它是基于[OpenOffice.org][4] 的 XML 文件规范制定的。ODF 包括几种文件类型，包括用于 OpenDocument Text 文档的 ODT。ODT 文件中有很多东西可以讲的，它的本质是一个 zip 文件。

### ODT 文件结构

跟所有 ODF 文件一样，ODT 文件实际上是一个 XML 文档和其它文件的 zip 压缩包。使用zip 可以占用更少的磁盘空间，同时也意味着可以用标准 zip 工具来检查它。

我有一篇关于 IT 领导力的文章，名为“Nibbled to death by ducks”，我将其保存为 ODT 文件。由于 ODF 文件是一个 zip 容器，你可以用 unzip 命令来检查它：

```
$ unzip -l 'Nibbled to death by ducks.odt'
Archive: Nibbled to death by ducks.odt
Length Date Time Name
39 07-15-2022 22:18 mimetype
12713 07-15-2022 22:18 Thumbnails/thumbnail.png
915001 07-15-2022 22:18 Pictures/10000201000004500000026DBF6636B0B9352031.png
10879 07-15-2022 22:18 content.xml
20048 07-15-2022 22:18 styles.xml
9576 07-15-2022 22:18 settings.xml
757 07-15-2022 22:18 meta.xml
260 07-15-2022 22:18 manifest.rdf
0 07-15-2022 22:18 Configurations2/accelerator/
0 07-15-2022 22:18 Configurations2/toolpanel/
0 07-15-2022 22:18 Configurations2/statusbar/
0 07-15-2022 22:18 Configurations2/progressbar/
0 07-15-2022 22:18 Configurations2/toolbar/
0 07-15-2022 22:18 Configurations2/popupmenu/
0 07-15-2022 22:18 Configurations2/floater/
0 07-15-2022 22:18 Configurations2/menubar/
1192 07-15-2022 22:18 META-INF/manifest.xml
970465 17 files
```

我想强调 zip 文件结构的以下几个元素：

1. `mimetype` 文件用于定义 ODF 文档。处理 ODT 文件的程序，如文字处理程序，可以使用该文件来验证文档的 MIME 类型。对于 ODT 文件，它应该总是：

```
application/vnd.oasis.opendocument.text
```

1. `META-INF` 目录中有一个 `manifest.xml` 文件。它包含查找 ODT 文件其它组件的所有信息。任何读取 ODT 文件的程序都从这个文件开始定位其它内容。例如，我的 ODT 文档的 `manifest.xml` 文件包含这一行，它定义了在哪里可以找到主要内容:

```
<manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/>
```

1. `content.xml` 文件包含文档的实际内容。
2. 我的文档中只有一张截图，它位于 `Pictures` 目录中。

### 从 ODT 中提取文件

由于 ODT 文档是一个具有特定结构的 zip 文件，因此可以从中提取文件。你可以先解压缩整个 ODT 文件，例如使用 unzip 命令：

```
$ unzip -q 'Nibbled to death by ducks.odt' -d Nibbled
```

一位同事最近向我要了一份我在文章中提到的图片。通过查看 `META-INF/manifest.xml` 文件，我找到了嵌入图像的确切位置。用 `grep` 命令可以找到描述图像的行:

```
$ cd Nibbled
$ grep image META-INF/manifest.xml
<manifest:file-entry manifest:full-path="Thumbnails/thumbnail.png" manifest:media-type="image/png"/>
<manifest:file-entry manifest:full-path="Pictures/10000201000004500000026DBF6636B0B9352031.png" manifest:media-type=" image/png”/>
```

我要找的图像保存在 `Pictures` 文件夹中。可以通过列出目录的内容来验证：

```
$ ls -F
Configurations2/ manifest.rdf meta.xml Pictures/ styles.xml
content.xml META-INF/ mimetype settings.xml Thumbnails/
```

就是这张图片：

![Image of rubber ducks in two bowls][5]

Image by: (Jim Hall, CC BY-SA 40)

### 开放文档格式

ODF 是一种开放的文件格式，它可以描述文字处理文件（ODT）、电子表格文件（ODS）、演示文稿（ODP）和其它文件类型。由于 ODF 格式基于开放标准，因此可以使用其他工具检查它们，甚至从中提取数据。你只需要知道从哪里开始。所有 ODF 文件都以 `META-INF/manifest.xml` 为“引导”文件，通过它你能找到其余的所有内容。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/odt-files

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://OpenOffice.org
[5]: https://opensource.com/sites/default/files/2022-07/ducks.png
