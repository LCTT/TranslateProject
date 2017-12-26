如何使用 pdfgrep 从终端搜索 PDF 文件
======
诸如 [grep][1] 和 [ack-grep][2] 之类的命令行工具对于搜索匹配指定[正则表达式][3]的纯文本非常有用。但是你有没有试过使用这些工具在 PDF 中搜索模板？不要这么做！由于这些工具无法读取PDF文件，因此你不会得到任何结果。他们只能读取纯文本文件。

顾名思义，[pdfgrep][4] 是一个小的命令行程序，可以在不打开文件的情况下搜索 PDF 中的文本。它非常快速 - 比几乎所有 PDF 浏览器提供的搜索更快。grep 和 pdfgrep 的区别在于 pdfgrep 对页进行操作，而 grep 对行操作。grep 如果在一行上找到多个匹配项，它也会多次打印单行。让我们看看如何使用该工具。

对于 Ubuntu 和其他基于 Ubuntu 的 Linux 发行版来说，这非常简单：
```
sudo apt install pdfgrep
```

对于其他发行版，只要将 `pdfgrep` 作为[包管理器][5]的输入，它就应该能够安装。万一你想浏览代码，你也可以查看项目的[ GitLab 页面][6]。

现在你已经安装了这个工具，让我们去测试一下。pdfgrep 命令采用以下格式：
```
pdfgrep [OPTION...] PATTERN [FILE...]
```

 **OPTION** 是一个额外的属性列表，给出诸如 `-i` 或 `--ignore-case` 这样的命令，这两者都会忽略匹配正则中的大小写。

 **PATTERN** 是一个扩展的正则表达式。

 **FILE** 如果它在相同的工作目录或文件的路径，这是文件的名称。

我根据官方文档用 Python 3.6 运行命令。下图是结果。

![pdfgrep search][7]

![pdfgrep search][7]

红色高亮显示所有遇到单词 “queue” 的地方。在命令中加入 `-i` 选项将会匹配单词 “Queue”。请记住，当加入 `-i` 时，大小写并不重要。

pdfgrep 有相当多的有趣的选项。不过，我只会在这里介绍几个。


  * `-c` 或者 `--count`：这会抑制匹配的正常输出。它只显示在文件中遇到该单词的次数，而不是显示匹配的长输出，
  * `-p` 或者 `--page-count`：这个选项打印页面上匹配的页码和页面上的模式出现次数
  * `-m` 或者 `--max-count` [number]：指定匹配的最大数目。这意味着当达到匹配次数时，该命令停止读取文件。



支持的选项的完整列表可以在 man 页面或者 pdfgrep 在线[文档][8]中找到。以防你在处理一些批量文件，不要忘记，pdfgrep 可以同时搜索多个文件。可以通过更改 GREP_COLORS 环境变量来更改默认的匹配高亮颜色。

下一次你想在 PDF 中搜索一些东西。请考虑使用 pdfgrep。该工具会派上用场，并且节省你的时间。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/search-pdf-files-pdfgrep/

作者：[Bruno Edoh][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com
[1] https://www.maketecheasier.com/what-is-grep-and-uses/
[2] https://www.maketecheasier.com/ack-a-better-grep/
[3] https://www.maketecheasier.com/the-beginner-guide-to-regular-expressions/
[4] https://pdfgrep.org/
[5] https://www.maketecheasier.com/install-software-in-various-linux-distros/
[6] https://gitlab.com/pdfgrep/pdfgrep
[7] https://www.maketecheasier.com/assets/uploads/2017/11/pdfgrep-screenshot.png (pdfgrep search)
[8] https://pdfgrep.org/doc.html
