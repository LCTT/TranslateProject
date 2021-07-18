[#]: subject: "Use XMLStarlet to parse XML in your the Linux terminal"
[#]: via: "https://opensource.com/article/21/7/parse-xml-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在你的 Linux 终端中使用 XMLStarlet 来解析 XML
======

借助 XMLStarlet，一个终端上的 XML 工具包，你就是 XML 之星。
![Penguin with green background][1]

学习解析 XML 通常被认为是一件复杂的事情，但其实大可不必。[XML 是高度严格结构化的][2]，所以也是相对来说可预测的。也有许多其他工具可以帮助你管理工作。

我最喜欢的 XML 实用程序之一是 [XMLStarlet][3]， 用于终端的 XML 工具包，借助 XML 工具包，你可以验证、解析、编辑、格式化和转换 XML 数据。XMLStarLet 是个相对最小的命令，但指导 XML 却充满潜力，因此本文演示了如何使用它来查询 XML 数据。

### 安装

XMLStarLet 默认安装在 CentOS，Fedora，和许多其他现代 Linux 发行版上，所以你可以打开终端，输入 `xmlstarlet` 来访问它。如果 XMLStarLet 还没有被安装，你的操作系统则会为你安装它。

或者，你可以用包管理器安装 `xmlstarlet`：


```
`$ sudo dnf install xmlstarlet`
```

在 macOS 上，使用 [MacPorts][4] 或 [Homebrew][5]。在 Windows 上，使用 [Chocolatey][6]。

如果都失败了，您可以从 [Sourceforge 上的源代码][7]手动安装它。

### 用 XMLStarlet 解析 XML

有许多工具可以帮助解析和转换XML数据，包括允许您[编写自己的解析器][8]和复杂命令的软件库，如 `fop` 和 `xsltproc`。尽管有时您不需要处理XML数据；您可以很方便的从 XML 数据中来提取、更新或验证重要数据。对于自发的XML交互，我使用 `xmlstarlet`，这是常见的处理 XML任务的一个典型的“瑞士军刀”式应用。通过运行 `--help` 命令，您可以看到它提供哪些选项：


```
$ xmlstarlet --help
Usage: xmlstarlet [&lt;options&gt;] &lt;command&gt; [&lt;cmd-options&gt;]
where &lt;command&gt; is one of:
  ed    (or edit)      - Edit/Update XML document(s)
  sel   (or select)    - Select data or query XML document(s) (XPATH, etc)
  tr    (or transform) - Transform XML document(s) using XSLT
  val   (or validate)  - Validate XML document(s) (well-formed/DTD/XSD/RelaxNG)
  fo    (or format)    - Format XML document(s)
  el    (or elements)  - Display element structure of XML document
  c14n  (or canonic)   - XML canonicalization
  ls    (or list)      - List directory as XML
[...]
```

您可以通过在这些子命令的末尾附加 `-help` 来获得进一步的帮助：


```
$ xmlstarlet sel --help
  -Q or --quiet             - do not write anything to standard output.
  -C or --comp              - display generated XSLT
  -R or --root              - print root element &lt;xsl-select&gt;
  -T or --text              - output is text (default is XML)
  -I or --indent            - indent output
[...]
```

#### 用 sel 命令选择数据

可以使用 `xmlstarlet select`（简称 `sel`）命令查看XML格式的数据。下面是一个简单的XML文档：


```
&lt;?xml version="1.0" encoding="UTF-8" standalone="no"?&gt;
&lt;xml&gt;
  &lt;os&gt;
   &lt;linux&gt;
    &lt;distribution&gt;
      &lt;name&gt;Fedora&lt;/name&gt;
      &lt;release&gt;7&lt;/release&gt;
      &lt;codename&gt;Moonshine&lt;/codename&gt;
      &lt;spins&gt;
        &lt;name&gt;Live&lt;/name&gt;
        &lt;name&gt;Fedora&lt;/name&gt;
        &lt;name&gt;Everything&lt;/name&gt;
      &lt;/spins&gt;
    &lt;/distribution&gt;

    &lt;distribution&gt;
      &lt;name&gt;Fedora Core&lt;/name&gt;
      &lt;release&gt;6&lt;/release&gt;
      &lt;codename&gt;Zod&lt;/codename&gt;
      &lt;spins&gt;&lt;/spins&gt;
    &lt;/distribution&gt;
   &lt;/linux&gt;
  &lt;/os&gt;    
&lt;/xml&gt;
```

在 XML 文件中查找数据时，您的第一个任务是关注要探索的节点。如果知道节点的路径，请使用 `-value of` 选项指定完整路径。您越早浏览 [Document Object Model][9]（DOM）树，就可以看到更多信息：


```
$ xmlstarlet select --template \
\--value-of /xml/os/linux/distribution \
\--nl myfile.xml
      Fedora
      7
      Moonshine
     
        Live
        Fedora
        Everything     
     
      Fedora Core
      6
      Zod
```

`--nl` 代表“新的一行”，它插入大量的空白，以确保在输入结果后，终端在新的一行显示。我已经删除了样本输出中的一些多余空间。

通过进一步深入 DOM 树来凝聚焦点：


```
$ xmlstarlet select --template \
\--value-of /xml/os/linux/distribution/name \
\--nl myfile.xml
Fedora
Fedora Core
```

#### 条件选择

用于导航和解析 XML 的最强大工具之一被称为 XPath。它控制 XML 搜索中使用的语法，并从 XML 库调用函数。XMLStarlet 能够解析 XPath 表达式，因此可以使用 XPath 函数来有条件的进行选择。XPath 具有丰富的函数，[由 W3C 详细记录][10]，但我觉得 [Mozilla 的 XPath 文档][11]更简洁。

可以使用方括号作为测试函数，将元素的内容与某个值进行比较。下面是对 `<name>` 元素的值的测试，它仅返回与特定匹配相关联的版本号。

想象一下，示例 XML 文件包含以 1 开头的所有 Fedora 版本。要查看与旧名称 “Fedora Core” 关联的所有版本号（项目从版本 7 开始名称中的 “Core” 被删除掉了），请执行以下操作：


```
$ xmlstarlet sel --template \
\--value-of '/xml/os/linux/distribution[name = "Fedora Core"]/release' \
\--nl myfile.xml
6
5
4
3
2
1
```

通过将 `--path 的值`更改为 `/xml/os/linux/distribution[name=“Fedora Core”]/codename`，您便可以查看这些版本的所有代号。

### 匹配路径和获取目标值

将 XML 标记视为节点的一个优点是，一旦找到节点，就可以将其视为当前的数据“目录”。它不是一个真正的目录，至少不是文件系统意义上的目录，但它是一个可以查询的数据集合。为了帮助您将目标和“其他”的数据分开，XMLStarlet 把您试图用 `--match` 选项匹配的内容和用 `--value` 选项匹配的数据值进行了区分。

假设你知道 `<spin>` 节点包含几个元素。这就是你的目的节点了。一旦到了这一步，就可以使用 `-value of` 指定要为哪个元素赋值。要查看所有元素，可以使用点（`.`）展示当前位置的所有元素：


```
$ xmlstarlet sel --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '.' --nl myfile.xml \
Live
Fedora
Everything
```

与导航 DOM 一样，可以使用 XPath 表达式来限制返回数据的范围。在本例中，我使用 `last（）` 函数来检索 `spin` 节点中的最后一个元素：


```
$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '*[last()]' --nl myfile.xml
Everything
```

在本例中，我使用 `position（）` 函数选择 `spin` 节点中的特定元素：


```
$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '*[position() = 2]' --nl myfile.xml
Fedora
```

The `--match` and `--value-of` options can overlap, so it's up to you how you want to use them together. These two expressions, in the case of the sample XML, do the same thing:

`--match` 和 `--value` 选项可以重叠，因此如何将它们一起使用取决于您自己。对于示例 XML，这两个表达式执行的是相同的操作：


```
$ xmlstarlet select  --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '.' \
\--nl myfile.xml
Live
Fedora
Everything     

$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution' \
\--value-of 'spin' \
\--nl myfile.xml
Live
Fedora
Everything
```

### 熟悉XML

XML 有时看起来过于冗长和笨拙，但为与之交互和构建的工具却总是让我吃惊。如果您想要好好使用 XML，那么XMLStarlet 可能是一个很好的切入点。下次要打开 XML 文件查看结构化数据时，请尝试使用 XMLStarlet，看看是否可以改为查询该数据。当 XML 越适合你时，它就越能作为一种健壮灵活的数据格式而存在。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/parse-xml-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 "Penguin with green background"
[2]: https://opensource.com/article/21/6/what-xml
[3]: https://en.wikipedia.org/wiki/XMLStarlet
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
[7]: http://xmlstar.sourceforge.net
[8]: https://opensource.com/article/21/6/parsing-config-files-java
[9]: https://opensource.com/article/21/6/what-xml#dom
[10]: https://www.w3.org/TR/1999/REC-xpath-19991116
[11]: https://developer.mozilla.org/en-US/docs/Web/XPath/Functions

