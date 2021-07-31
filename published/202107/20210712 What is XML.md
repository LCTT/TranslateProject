[#]: subject: "What is XML?"
[#]: via: "https://opensource.com/article/21/7/what-xml"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "amwps290"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13624-1.html"

什么是 XML？
======

> 了解一下 XML 吧，它是一种严格但灵活的标记语言，无论是在文档还是图像方面应用都十分广泛。

![](https://img.linux.net.cn/data/attachment/album/202107/28/082605rhju4ckqez0zvcwc.jpg)

XML 是一种分层的标记语言。它使用打开和关闭标签来定义数据，它常用来存储和交换数据，而且由于它极大的灵活性，不论是在 [文档][2] 还是 [图像][3] 中都用的非常多。

这里是一个 XML 文档的例子：

```
<xml>
  <os>
   <linux>
    <distribution>
      <name>Fedora</name>
      <release>8</release>
      <codename>Werewolf</codename>
    </distribution>

    <distribution>
      <name>Slackware</name>
      <release>12.1</release>
      <mascot>
        <official>Tux</official>
        <unofficial>Bob Dobbs</unofficial>
      </mascot>
    </distribution>
   </linux>
  </os>    
</xml>
```

阅读这个示例 XML，你可能会发现这个 XML 的格式具有直观的特性。 无论你是否熟悉这个文档的主题，你都可能理解本文档中的数据。 这部分原因是因为 XML 被认为是冗长的。 它使用了很多标签，标签可以有很长的描述性名称，并且数据以分层的方式排序，这有助于解释数据之间的关系。 你可能从这个示例中了解到 Fedora 发行版和 Slackware 发行版是两个不同且不相关的 Linux 发行版，因为每个实例都“包含”在自己独立的 `<distribution>` 标签中。

XML 也非常灵活。 与 HTML 不同，它没有预定义的标签列表。 你可以自由创建你需要表示任何数据结构的标签。

### XML 的组成

数据的存在为了读取，当计算机“读取”数据时，该过程称为 _解析_。 再次使用示例 XML 数据，以下是大多数 XML 解析器认为重要的术语。

  * **文档**：`<xml>` 标签标记文档的开始， `</xml>` 标签标记文档的结束。
  * **节点**：`<os>`、`<distribution>`、`<mascot>` 这些都是节点，在解析术语中，节点是包含其他标签的标签。
  * **元素**：像 `<name>Fedora</name>` 和 `<official>Tux</official>` 这些都是元素。从第一个`<`开始，到最后一个 `>`  结束是一个元素。
  * **内容**：在两个元素标签之间的数据被称之为内容，在第一个 `<name>` 标签中，`Fedora` 字符串就是一个内容。

### XML 模式

XML 文档中的标签和标签继承性称为 _模式_。

一些模式是随意组成的（例如，本文中的示例 XML 代码纯粹是即兴创作的），而其他模式则由标准组织严格定义。 例如，可缩放矢量图形（SVG）模式 [由 W3C 定义][4]，而 [DocBook 模式][5] 由 Norman Walsh 定义。

模式强制执行一致性。 最基本的模式通常也是最严格的。 在我的示例 XML 代码中，将发行版名称放在 `<mascot>` 节点中是没有意义的，因为文档的隐含模式清楚地表明 `mascot` 必须是发行版的“子”元素。

### 数据对象模型（DOM）

如果你必须不断地描述标签和位置（例如，“系统部分中的 Linux 部分中第二个发行版标签的名称标签”），那么谈论 XML 会让人感到困惑，因此解析器使用文档对象模型（DOM）的概念来表示 XML 数据。 DOM 将 XML 数据放入一种“家谱”结构中，从根元素（在我的示例 XML 中，即 `os` 标记）开始并包括路径上的每个标记。

![Document Object Model][6]

这种相同的 XML 数据结构可以表示为路径，就像 Linux 系统中的文件或互联网上网页的位置一样。 例如，`<mascot>` 标签的路径可以表示为 `//os/linux/distribution/slackware/mascot`。

两个 `<distribution>` 标签可以被表示为 `//os/linux/distribution` ，因为这里有两个发行版的节点，因此一个解析器可以直接将两个节点的内容载入到一个数组中，可以进行查询。

### 严格的 XML

XML 也以严格而著称。 这意味着大多数应用程序被设计为在遇到 XML 错误时就会故意失败。 这听起来可能有问题，但这是开发人员最欣赏 XML 的事情之一，因为当应用程序试图猜测如何解决错误时，可能会发生不可预测的事情。 例如，在 HTML 定义明确之前，大多数 Web 浏览器都包含“怪癖模式”，因此当人们试图查看糟糕的 HTML 代码时，Web 浏览器却可以加载作者可能想要的内容。 结果非常难以预测，尤其是当一个浏览器的猜测与另一个浏览器不同时。

XML 通过在出现故意错误时失败而不允许这样做。 这让作者可以修复错误，直到它们生成有效的 XML。 因为 XML 是良好定义的，所以有许多应用程序的验证器插件以及像 `xmllint` 和 `xmlstarlet` 这样的独立命令来帮助你及早定位错误。

### 转换 XML

因为 XML 通常用作数据交换，所以将 XML 转换为其他数据格式或其他 XML 模式是很常见的。 经典示例包括 XSLTProc、xmlto 和 [pandoc][8]，但从技术上讲，还有许多其他应用程序或者至少程序的一部分就是在转换 XML。

事实上，LibreOffice 使用 XML 来布局其文字处理器和电子表格文档，因此无论何时你导出或 [从 LibreOffice 转换文件][9]，你都在转换 XML。

[开源 EPUB 格式的电子书][10] 使用 XML，因此无论何时你 [将文档转换为 EPUB][11] 或从 EPUB 转换，你都在转换 XML。

Inkscape 是基于矢量的插图应用程序，它将其文件保存在 SVG 中，这是一种专为图形设计的 XML 模式。 任何时候你将 Inkscape 中的图像导出为 PNG 文件时，你都在转换 XML。

名单还可以一直继续下去。 XML 是一种数据存储格式，旨在确保你的数据，无论是画布上的点和线、图表上的节点，还是文档中的文字，都可以轻松准确地提取、更新和转换。

### 学习 XML

编写 XML 很像编写 HTML。 感谢 Jay Nick 的辛勤工作，[在线提供免费且有趣的 XML 课程][3] 可以教你如何使用 XML 创建图形。

通常，探索 XML 所需的特殊工具很少。 由于 HTML 和 XML 之间的密切关系，你可以 [使用 Web 浏览器查看 XML][12]。 此外，[QXmlEdit][13]、[NetBeans][14] 和 [Kate][15] 等开源文本编辑器通过有用的提示、自动完成、语法验证等，使键入和阅读 XML 变得容易。

### 选择 XML

XML 起初可能看起来有很多数据，但它与 HTML 并没有太大的不同（实际上，HTML 已经 [以 XHTML 的形式重新实现为 XML][16]）。 XML 有一个独特的好处，即构成其结构的标签也恰好是元数据，提供有关其存储内容的信息。 精心设计的 XML 模式包含并描述你的数据，使用户能够一目了然并快速解析它，并使开发人员能够使用一些库 [快速解析][17]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/what-xml

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY "Computer screen with files or windows open"
[2]: https://opensource.com/article/17/9/docbook
[3]: https://opensource.com/article/17/5/coding-scalable-vector-graphics-make-steam
[4]: https://www.w3.org/TR/SVG11/
[5]: http://docbook.org
[6]: https://opensource.com/sites/default/files/uploads/dom.jpg "Document Object Model"
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[9]: https://opensource.com/article/21/3/libreoffice-command-line
[10]: https://opensource.com/education/15/11/ebook-open-formats
[11]: https://opensource.com/life/13/8/how-create-ebook-open-source-way
[12]: https://opensource.com/article/18/12/xml-browser
[13]: https://opensource.com/article/17/7/7-ways-handle-xml-qxmledit
[14]: https://opensource.com/article/20/12/netbeans
[15]: https://opensource.com/article/20/12/kate-text-editor
[16]: https://www.w3.org/TR/xhtml1/
[17]: https://opensource.com/article/21/6/parsing-config-files-java
