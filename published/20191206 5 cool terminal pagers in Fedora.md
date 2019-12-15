[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11676-1.html)
[#]: subject: (5 cool terminal pagers in Fedora)
[#]: via: (https://fedoramagazine.org/5-cool-terminal-pagers-in-fedora/)
[#]: author: (Jacob Burns https://fedoramagazine.org/author/jaek/)

5 个最酷的终端分页器
======

![][1]

像日志或源代码这样的大文件可能会多达成千上万行，这使得在文件内导航非常困难，尤其是在终端上。此外，大多数终端仿真器的回滚缓冲区只有几百行。这可能使得无法使用打印到标准输出的实用程序（例如 `cat`、`head` 和 `tail`）在终端中浏览大型文件。在计算时代的早期，程序员通过开发用于以虚拟“页面”形式显示文本的实用程序来解决这些问题，该实用程序被形象地描述为<ruby>分页器<rt>pager</rt></ruby>。

*分页器*提供了许多使文本文件导航更加简单的功能，包括滚动、搜索功能，以及作为命令[管道][2]的一部分而具有的功能。与大多数文本编辑器相比，某些终端分页器不需要加载整个文件即可查看，这使得它们更快，特别是对于非常大的文件。

在现代 Linux 计算时代，终端仿真器比以往更加复杂。它们提供了对缤纷的色彩、终端尺寸调整以及许多其它功能的支持，这些功能使得辨析屏幕上的文本变得更加轻松和高效。从诸如 `pg` 和 `more` 这样极其简单的 UNIX 实用程序，到涵盖各种使用场景的、功能广泛的复杂程序，终端分页器也经历了类似的演变。考虑到这一点，我们或“多”或“少”地汇总了一些最受欢迎的终端分页实用程序的列表。

### more

`more` 是最早的分页器之一，最初在 3.0 BSD 版本中出现。`more` 的第一个实现由 [Daniel Halbert][3] 编写于 1978 年。从那时起，`more` 已成为许多操作系统的普遍功能，包括 Windows、OS/2，MacOS 和大多数 Linux 发行版。

`more` 是一个非常轻量级的实用程序。util-linux 软件包中提供的版本只有不到 2100 行的 C 语言代码。但是，这种较小的代码大小是有代价的。大多数版本的 `more` 的功能相对有限，不支持向后滚动或搜索。命令也同样精简：按回车键可滚动一行，或按空格键滚动一页。其他一些有用的命令包括：

* 在阅读时按 `v` 键以在默认的终端编辑器中打开当前文件。
* `/模式` 可以让你搜索下一个出现的“模式”。
* 以多个文件作为参数调用 `more` 时，`:n` 和 `:p` 将分别打开下一个和上一个文件
   
### less

`less` 最初被认为是 `more` 的继承者，解决了它的一些局限性。`less` 以 `more` 的功能为基础，增加了许多有用的功能，包括向后滚动、向后搜索。它也更适合窗口大小调整。

`less` 中的导航方式与 `more` 类似，尽管 `less` 也从 `vi` 编辑器借用了一些有用的命令。用户可以使用熟悉的<ruby>主行导航键<rt>home row navigational keys</rt></ruby>（LCTT 译注：指 左手的 `A`、`S`、`D`、`F` 和右手的 `J`、`K`、`L`、`;`，及大拇指所在的空格键）浏览文档。看一眼 `less` 的手册页，就会发现相当多的可用命令。一些特别有用的示例包括：

* `?模式` 可让你在文件中向后搜索“模式”。
* `＆模式` 仅显示具有“模式”特征的行。这对于发现自己经常要使用 `$ grep 模式 | less` 的人特别有用。
* 使用 `-s`（或 `–sqeueeze-blank-lines`）标志来调用 `less`，使你可以查看空白较大的文本文件。 多个换行符被简化为单个中断行。
* 在该程序中调用的 `s 文件名` 将输入保存到 `文件名`中（如果输入来自管道）。
* 或者，使用 `-o 文件名` 标志来调用 `less` 将把 `less` 的输入保存到 `文件名` 中。
   
随着这些增强的功能也带来了体积的略微增大。在写作本文时，Fedora 随附的 `less` 版本大约有 25000 行源代码。当然，除非是受存储限制最大的系统，在所有其它的系统上这都不是问题。`less` 比 `more` 功能更多。

### most

`less` 旨在扩展 `more` 的现有功能，而 `most` 采用另一种方法。`most` 不是在传统的单个文件视图上进行扩展，而是使用户能够将其视图拆分为“窗口”。每个窗口以不同的查看模式包含不同的文件。

重要的是，`most` 考虑了其输入文本的宽度。默认的查看模式是不换行的（`less` 中的 `-S` 参数），此功能在处理“宽”文件时特别有用。尽管对于某些用户来说，这些设计决策可能代表着与传统的重大偏离，但最终结果却非常强大。

除了 `more` 提供的导航命令外，`most` 使用直观的助记符进行文件导航。例如，`t` 移至文件的顶部（Top），而 `b` 移至底部（Bottom）。这样，不熟悉 `vi` 及其衍生品的用户会发现 `most` 非常简单好用。

`most` 的与众不同之处在于它能够快速轻松地拆分窗口和上下文。例如，可以使用以下命令打开两个不同的文本文件：

```
$ most textFile1.txt textFile2.txt
```

为了水平拆分屏幕，请使用组合键 `Ctrl+x, 2` 或 `Ctrl+w, 2`。 `:n` 命令将在给定窗口中打开下一个文件参数，提供两个文件的分屏视图：

![][4]

如果在一个窗口中关闭自动换行，它不会影响其他窗口的行为。（行末的）`\` 字符表示换行或折叠，而 `$` 字符表示文件超出了当前窗口的限制。

### pspg

使用 SQL 数据库的人员通常需要能够一目了然地检查数据库的内容。许多流行的开源 DBMS（例如 MySQL 和 PostGreSQL）的命令行界面都使用系统默认的分页器来查看无法显示在单个屏幕上的输出。诸如 `more` 和 `less` 之类的实用程序是围绕呈现文本文件的想法而设计的，但是对于更结构化的数据，还有一些不足之处。天真的文本分页程序没有宽的表格数据的概念，当处理大型查询时，这可能会令人感到沮丧。

[pspg][5] 试图通过为用户提供在查看时冻结列、*原位*排序数据并为输出着色的功能来解决此问题。尽管`pspg` 最初是专门用作 `psql` 的分页器的替代品，但该程序还支持查看 CSV 数据，并且是 `mysql` 和 `pgcli` 的合适的直接替代品。

### Vim

在现代的颜色鲜明的终端中，无休止的黑色页面上的灰色文字感觉太过时了。强大的文本编辑器（如 `vim`）提供的语法高亮显示选项对于浏览源代码很有用。此外，`vim` 提供的搜索功能远远超过了竞争对手。考虑到这一点，`vim` 附带了一个 shell 脚本 `less.sh`，该脚本可以使 `vim` 替代传统的分页器。

要将 `vim` 设置为手册页的[默认分页器][6]，请将以下内容添加到 shell 的配置中（如果使用默认的bash shell 的话是 `~/.bashrc`）：

```
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
```

或者，要将 `vim` 设置为系统范围内的默认分页器，请找到 `less.sh` 脚本。（你可以在当前 Fedora 系统上的 `/usr/share/vim/vim81/macros/` 找到它。）将此位置导出为变量 `PAGER` 以将其设置为默认值，或者将其设置为别名以显式调用它。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-terminal-pagers-in-fedora/

作者：[Jacob Burns][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jaek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/5-pagers-816x345.jpg
[2]: https://fedoramagazine.org/command-line-quick-tips-using-pipes-to-connect-tools/
[3]: https://danhalbert.org/more.html
[4]: https://fedoramagazine.org/wp-content/uploads/2019/11/image-2.png
[5]: https://github.com/okbob/pspg
[6]: https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
[7]: https://unsplash.com/@zyljosa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/pages?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
