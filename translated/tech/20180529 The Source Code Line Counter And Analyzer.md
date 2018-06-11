源代码行计数器和分析器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-720x340.png)

**Ohcount** 是一个简单的命令行工具，可用于分析源代码并打印代码的总行数。它不仅仅是代码行计数器，还可以在含有大量代码的目录中检测流行的开源许可证，例如 GPL。此外，Ohcount 还可以检测针对特定编程 API（例如 KDE 或 Win32）的代码。在编写本指南时，Ohcount 目前支持 70 多种流行的编程语言。它用 **C** 语言编写，最初由 **Ohloh** 开发，用于在 [www.openhub.net][1] 中生成报告。

在这篇简短的教程中，我们将介绍如何安装和使用 Ohcount 来分析 Debian、Ubuntu 及其变体（如 Linux Mint）中的源代码文件。

### Ohcount – 代码行计数器

**安装**

Ohcount 存在于 Debian 和 Ubuntu 及其派生版的默认仓库中，因此你可以使用 APT 软件包管理器来安装它，如下所示。
```
$ sudo apt-get install ohcount

```

**用法**

Ohcount 的使用非常简单。

你所要做的就是进入你想要分析代码的目录并执行程序。

举例来说，我将分析 [**coursera-dl**][2] 程序的源代码。
```
$ cd coursera-dl-master/

$ ohcount

```

以下是 Coursera-dl 的行数摘要：

![][4]

如你所见，Coursera-dl 的源代码总共包含 141 个文件。第一列说明源码含有的编程语言的名称。第二列显示每种编程语言的文件数量。第三列显示每种编程语言的总行数。第四行和第五行显示代码中由多少行注释及其百分比。第六列显示空行的数量。最后一列和第七列显示每种语言的全部代码行数以及 coursera-dl 的总行数。

或者，直接使用下面的完整路径。
```
$ ohcount coursera-dl-master/

```

路径可以是任何数量的单个文件或目录。目录将被递归探测。如果没有给出路径，则使用当前目录。

如果你不想每次都输入完整目录路径，只需 cd 进入它，然后使用 ohcount 来分析该目录中的代码。

要计算每个文件的代码行数，请使用 **-i** 标志。
```
$ ohcount -i

```

**示例输出：**

![][5]

当您使用 **-a**  标志时，ohcount 还可以显示带标注的源码。
```
$ ohcount -a

```

![][6]

如你所见，显示了目录中所有源代码的内容。每行都以制表符分隔的语言名称和语义分类（代码、注释或空白）为前缀。

有时候，你只是想知道源码中使用的许可证。为此，请使用 **-l** 标志。
```
$ ohcount -l
lgpl3, coursera_dl.py
gpl coursera_dl.py

```

另一个可用选项是 **-re**，用于将原始实体信息打印到屏幕（主要用于调试）。
```
$ ohcount -re

```

要递归地查找给定路径内的所有源码文件，请使用 **-d** 标志。
```
$ ohcount -d

```

上述命令将显示当前工作目录中的所有源码文件，每个文件名将以制表符分隔的语言名称为前缀。

要了解更多详细信息和支持的选项，请运行：
```
$ ohcount --help

```

对于想要分析自己或其他开发人员开发的代码，并检查代码的行数，用于编写这些代码的语言以及代码的许可证详细信息等，ohcount 非常有用。

就是这些了。希望对你有用。会有更好的东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ohcount-the-source-code-line-counter-and-analyzer/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.openhub.net
[2]:https://www.ostechnix.com/coursera-dl-a-script-to-download-coursera-videos/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-1-5.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-2-2.png
