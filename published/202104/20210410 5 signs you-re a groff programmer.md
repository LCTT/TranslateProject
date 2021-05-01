[#]: subject: (5 signs you're a groff programmer)
[#]: via: (https://opensource.com/article/21/4/groff-programmer)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (liweitianux)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13316-1.html)

groff 程序员的 5 个标志
======

> 学习一款老派的文本处理软件 groff，就像是学习骑自行车。

![](https://img.linux.net.cn/data/attachment/album/202104/20/221218y34lew4gewqw2xg2.jpg)

我第一次发现 Unix 系统是在 20 世纪 90 年代早期，当时我还在大学读本科。我太喜欢这个系统了，所以我将家里电脑上的 MS-DOS 也换成了 Linux 系统。

在 90 年代早期至中期，Linux 所缺失的一个东西是<ruby>字处理软件<rt>word processor</rt></ruby>。作为其他桌面操作系统的标准办公程序，字处理软件能让你轻松地编辑文本。我经常在 DOS 上使用字处理软件来撰写课程论文。直到 90 年代末，我都没能找到一款 Linux 原生的字处理软件。直到那时，文字处理是我在第一台电脑上保留双启动的少有的原因之一，那样我可以偶尔切换到 DOS 系统写论文。

后来，我发现 Linux 提供了一款文字处理软件：GNU troff，它一般称为 [groff][2]，是经典的文本处理系统 troff 的一个现代实现。troff 是 “<ruby>排版工快印<rt>typesetter roff</rt></ruby>” 的简称，是 nroff 系统的改进版本，而 nroff 又是最初的 roff 系统的新实现。roff 表示<ruby>快速印出<rt>run off</rt></ruby>，比如“快速印出”一份文档。

利用文本处理系统，你在纯文本编辑器里编辑内容，通过<ruby>宏<rt>macro</rt></ruby>或其他处理命令来添加格式。然后将文件输入文本处理系统，比如 groff，来生成适合打印的格式化输出。另一个知名的文本处理系统是 LaTeX，但是 groff 已经满足我的需求，而且足够简单。

经过一点实践，我发现在 Linux 上使用 groff 来撰写课程论文与使用字处理软件一样容易。尽管我现在不再使用 groff 来写文档了，我依然记得它的那些宏和命令。如果你也是这样并且在那么多年之前学会了使用 groff 写作，你可能会认出这 5 个 groff 程序员的标志。

### 1、你有一个喜欢的宏集

输入由宏点缀的纯文本，你便能在 groff 里对文档进行格式化。groff 里的宏是行首为单个句点（`.`）的短命令。例如：如果你想在输出里插入几行，宏命令 `.sp 2` 会添加两个空行。groff 还具有其他一些基本的宏，支持各种各样的格式化。

为了能让作者更容易地格式化文档，groff 还提供了不同的 <ruby>宏集<rt>macro set</rt></ruby>，即一组能够让你以自己的方式格式化文档的宏的集合。我学会的第一个宏集是 `-me` 宏集。这个宏集的名称其实是 `e`，你在处理文件时使用 `-me` 选项来指定这个 `e` 宏集。

groff 还包含其他宏集。例如，`-man` 宏集以前是用于格式化 Unix 系统内置的 <ruby>手册页<rt>manual page</rt></ruby> 的标准宏集，`-ms` 宏集经常用于格式化其他一些技术文档。如果你学会了使用 groff 写作，你可能有一个喜欢的宏集。

### 2、你想专注于内容而非格式

使用 groff 写作的一个很好的特点是，你能专注于你的 _内容_，而不用太担心它看起来会怎么样。对于技术作者而言这是一个很实用的特点。对专业作家来说，groff 是一个很好的、“不会分心”的写作环境。至少，使用 groff `-T` 选项所支持的任何格式来交付内容时你不用担心，这包括 PDF、PostScript、HTML、以及纯文本。不过，你无法直接从 groff 生成 LibreOffice ODT 文件或者 Word DOC 文件。

一旦你使用 groff 写作变得有信心之后，宏便开始 _消失_。用于格式化的宏变成了背景的一部分，而你纯粹地专注于眼前的文本内容。我已经使用 groff 写了足够多内容，以至于我甚至不再看见那些宏。也许，这就像写代码，而你的大脑随意换档，于是你就像计算机一样思考，看到的代码就是一组指令。对我而言，使用 groff 写作就像那样：我仅仅看到文本，而我的大脑将宏自动地翻译成格式。

### 3、你喜欢怀旧复古的感觉

当然，使用一个更典型的字处理软件来写你的文档可能更 _简单_，比如 LibreOffice Writer、甚至 Google Docs 或 Microsoft Word。而且对于某些种类的文档，桌面型字处理软件才是正确的选择。但是，如果你想要这种怀旧复古的感觉，使用 groff 写作很难被打败。

我承认，我的大部分写作是用 LibreOffice Writer 完成的，它的表现很出色。但是当我渴望以一种怀旧复古的方式去做时，我会打开编辑器用 groff 来写文档。

### 4、你希望能到处使用它

groff 及其同类软件在几乎所有的 Unix 系统上都是标准软件包。此外，groff 宏不会随系统而变化。比如，`-me` 宏集在不同系统上都应该相同。因此，一旦你在一个系统上学会使用宏，你能在下一个系统上同样地使用它们。

另外，因为 groff 文档就是纯文本文档，所以你能使用任何你喜欢的编辑器来编辑文档。我喜欢使用 GNU Emacs 来编辑我的 groff 文档，但是你可能使用 GNOME Gedit、Vim、其他你 [最喜欢的文本编辑器][3]。大部分编辑器会支持这样一种模式，其中 groff 宏会以不同的颜色高亮显示，帮助你在处理文件之前便能发现错误。

### 5、你使用 -me 写了这篇文章

当我决定要写这篇文章时，我认为最佳的方式便是直接使用 groff。我想要演示 groff 在编写文档方面是多么的灵活。所以，虽然你正在网上读这篇文章，但是它最初是用 groff 写的。

我希望这激发了你学习如何使用 groff 撰写文档的兴趣。如果你想学习 `-me` 宏集里更高级的函数，参考 Eric Allman 的《Writing papers with groff using -me》，你应该能在系统的 groff 文档找到这本书，文件名为 `meintro.me`。这是一份很好的参考资料，还解释了使用 `-me` 宏集格式化论文的其他方式。

我还提供了这篇文章的原始草稿，其中使用了 `-me` 宏集。下载这个文件并保存为 `five-signs-groff.me`，然后运行 groff 处理来查看它。`-T` 选项设置输出类型，比如 `-Tps` 用于生成 PostScript 输出，`-Thtml` 用于生成 HTML 文件。比如：

```
groff -me -Thtml five-signs-groff.me > five-signs-groff.html
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/groff-programmer

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[liweitianux](https://github.com/liweitianux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead.png?itok=h3fCkVmU (Typewriter in the grass)
[2]: https://en.wikipedia.org/wiki/Groff_(software)
[3]: https://opensource.com/article/21/2/open-source-text-editors
