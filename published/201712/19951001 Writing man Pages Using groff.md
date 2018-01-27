使用 groff 编写 man 手册页
===================

`groff` 是大多数 Unix 系统上所提供的流行的文本格式化工具 nroff/troff 的 GNU 版本。它一般用于编写手册页，即命令、编程接口等的在线文档。在本文中，我们将给你展示如何使用 `groff` 编写你自己的 man 手册页。

在 Unix 系统上最初有两个文本处理系统：troff 和 nroff，它们是由贝尔实验室为初始的 Unix 所开发的（事实上，开发 Unix 系统的部分原因就是为了支持这样的一个文本处理系统）。这个文本处理器的第一个版本被称作 roff（意为 “runoff”——径流）；稍后出现了 troff，在那时用于为特定的<ruby>排字机<rt>Typesetter</rt></ruby>生成输出。nroff 是更晚一些的版本，它成为了各种 Unix 系统的标准文本处理器。groff 是 nroff 和 troff 的 GNU 实现，用在 Linux 系统上。它包括了几个扩展功能和一些打印设备的驱动程序。

`groff` 能够生成文档、文章和书籍，很多时候它就像是其它的文本格式化系统（如 TeX）的血管一样。然而，`groff`（以及原来的 nroff）有一个固有的功能是 TeX 及其变体所缺乏的：生成普通 ASCII 输出。其它的系统在生成打印的文档方面做得很好，而 `groff` 却能够生成可以在线浏览的普通 ASCII（甚至可以在最简单的打印机上直接以普通文本打印）。如果要生成在线浏览的文档以及打印的表单，`groff` 也许是你所需要的（虽然也有替代品，如 Texinfo、Lametex 等等）。

`groff` 还有一个好处是它比 TeX 小很多；它所需要的支持文件和可执行程序甚至比最小化的 TeX 版本都少。

`groff` 一个特定的用途是用于格式化 Unix 的 man 手册页。如果你是一个 Unix 程序员，你肯定需要编写和生成各种 man 手册页。在本文中，我们将通过编写一个简短的 man 手册页来介绍 `groff` 的使用。

像 TeX 一样，`groff` 使用特定的文本格式化语言来描述如何处理文本。这种语言比 TeX 之类的系统更加神秘一些，但是更加简洁。此外，`groff` 在基本的格式化器之上提供了几个宏软件包；这些宏软件包是为一些特定类型的文档所定制的。举个例子， mgs 宏对于写作文章或论文很适合，而 man 宏可用于 man 手册页。

### 编写 man 手册页

用 `groff` 编写 man 手册页十分简单。要让你的 man 手册页看起来和其它的一样，你需要从源头上遵循几个惯例，如下所示。在这个例子中，我们将为一个虚构的命令 `coffee` 编写 man 手册页，它用于以各种方式控制你的联网咖啡机。

使用任意文本编辑器，输入如下代码，并保存为 `coffee.man`。不要输入每行的行号，它们仅用于本文中的说明。

```
.TH COFFEE 1 "23 March 94"
.SH NAME
coffee \- Control remote coffee machine
.SH SYNOPSIS
\fBcoffee\fP [ -h | -b ] [ -t \fItype\fP ]
\fIamount\fP
.SH DESCRIPTION
\fBcoffee\fP queues a request to the remote
coffee machine at the device \fB/dev/cf0\fR.
The required \fIamount\fP argument specifies
the number of cups, generally between 0 and
12 on ISO standard coffee machines.
.SS Options
.TP
\fB-h\fP
Brew hot coffee. Cold is the default.
.TP
\fB-b\fP
Burn coffee. Especially useful when executing
\fBcoffee\fP on behalf of your boss.
.TP
\fB-t \fItype\fR
Specify the type of coffee to brew, where
\fItype\fP is one of \fBcolumbian\fP,
\fBregular\fP, or \fBdecaf\fP.
.SH FILES
.TP
\fC/dev/cf0\fR
The remote coffee machine device
.SH "SEE ALSO"
milk(5), sugar(5)
.SH BUGS
May require human intervention if coffee
supply is exhausted.
```

*清单 1：示例 man 手册页源文件*

不要让这些晦涩的代码吓坏了你。字符串序列 `\fB`、`\fI` 和 `\fR` 分别用来改变字体为粗体、斜体和正体（罗马字体）。`\fP` 设置字体为前一个选择的字体。

其它的 `groff` <ruby>请求<rt>request</rt></ruby>以点（`.`）开头出现在行首。第 1 行中，我们看到的 `.TH` 请求用于设置该 man 手册页的标题为 `COFFEE`、man 的部分为 `1`、以及该 man 手册页的最新版本的日期。（说明，man 手册的第 1 部分用于用户命令、第 2 部分用于系统调用等等。使用 `man man` 命令了解各个部分）。

在第 2 行，`.SH` 请求用于标记一个<ruby>节<rt>section</rt></ruby>的开始，并给该节名称为 `NAME`。注意，大部分的 Unix man 手册页依次使用 `NAME`、 `SYNOPSIS`、`DESCRIPTION`、`FILES`、`SEE ALSO`、`NOTES`、`AUTHOR` 和 `BUGS` 等节，个别情况下也需要一些额外的可选节。这只是编写 man 手册页的惯例，并不强制所有软件都如此。

第 3 行给出命令的名称，并在一个横线（`-`）后给出简短描述。在 `NAME` 节使用这个格式以便你的 man 手册页可以加到 whatis 数据库中——它可以用于 `man -k` 或 `apropos` 命令。

第 4-6 行我们给出了 `coffee` 命令格式的大纲。注意，斜体 `\fI...\fP` 用于表示命令行的参数，可选参数用方括号扩起来。

第 7-12 行给出了该命令的摘要介绍。粗体通常用于表示程序或文件的名称。

在 13 行，使用 `.SS` 开始了一个名为 `Options` 的子节。

接着第 14-25 行是选项列表，会使用参数列表样式表示。参数列表中的每一项以 `.TP` 请求来标记；`.TP` 后的行是参数，再之后是该项的文本。例如，第 14-16 行：

```
.TP
\fB-h\P
Brew hot coffee. Cold is the default.
```

将会显示如下：

```
-h     Brew hot coffee. Cold is the default.
```

第 26-29 行创建该 man 手册页的 `FILES` 节，它用于描述该命令可能使用的文件。可以使用 `.TP` 请求来表示文件列表。

第 30-31 行，给出了 `SEE ALSO` 节，它提供了其它可以参考的 man 手册页。注意，第 30 行的 `.SH` 请求中 `"SEE ALSO"` 使用括号扩起来，这是因为 `.SH` 使用第一个空格来分隔该节的标题。任何超过一个单词的标题都需要使用引号扩起来成为一个单一参数。

最后，第 32-34 行，是 `BUGS` 节。

### 格式化和安装 man 手册页

为了在你的屏幕上查看这个手册页格式化的样式，你可以使用如下命令：


```
$ groff -Tascii -man coffee.man | more
```

`-Tascii` 选项告诉 `groff` 生成普通 ASCII 输出；`-man` 告诉 `groff` 使用 man 手册页宏集合。如果一切正常，这个 man 手册页显示应该如下。

```
COFFEE(1)                                               COFFEE(1)
NAME
       coffee - Control remote coffee machine
SYNOPSIS
       coffee [ -h | -b ] [ -t type ] amount
DESCRIPTION
       coffee  queues  a  request to the remote coffee machine at
       the device /dev/cf0\. The required amount  argument  speci-
       fies the number of cups, generally between 0 and 12 on ISO
       standard coffee machines.
   Options
       -h     Brew hot coffee. Cold is the default.
       -b     Burn coffee. Especially useful when executing  cof-
              fee on behalf of your boss.
       -t type
              Specify  the  type of coffee to brew, where type is
              one of columbian, regular, or decaf.
FILES
       /dev/cf0
              The remote coffee machine device
SEE ALSO
       milk(5), sugar(5)
BUGS
       May  require  human  intervention  if  coffee  supply   is
       exhausted.
```

*格式化的 man 手册页*

如之前提到过的，`groff` 能够生成其它类型的输出。使用 `-Tps` 选项替代 `-Tascii` 将会生成 PostScript 输出，你可以将其保存为文件，用 GhostView 查看，或用一个 PostScript 打印机打印出来。`-Tdvi` 会生成设备无关的 .dvi 输出，类似于 TeX 的输出。

如果你希望让别人在你的系统上也可以查看这个 man 手册页，你需要安装这个 groff 源文件到其它用户的 `%MANPATH` 目录里面。标准的 man 手册页放在  `/usr/man`。第一部分的 man 手册页应该放在 `/usr/man/man1` 下，因此，使用命令：

```
$ cp coffee.man /usr/man/man1/coffee.1
```

这将安装该 man 手册页到 `/usr/man` 中供所有人使用（注意使用 `.1` 扩展名而不是 `.man`）。当接下来执行 `man coffee` 命令时，该 man 手册页会被自动重新格式化，并且可查看的文本会被保存到 `/usr/man/cat1/coffee.1.Z` 中。

如果你不能直接复制 man 手册页的源文件到 `/usr/man`（比如说你不是系统管理员），你可创建你自己的 man 手册页目录树，并将其加入到你的 `%MANPATH`。`%MANPATH` 环境变量的格式同 `%PATH` 一样，举个例子，要添加目录 `/home/mdw/man` 到 `%MANPATH` ，只需要：

```
$ export MANPATH=/home/mdw/man:$MANPATH
```

`groff` 和 man 手册页宏还有许多其它的选项和格式化命令。找到它们的最好办法是查看 `/usr/lib/groff` 中的文件； `tmac` 目录包含了宏文件，自身通常会包含其所提供的命令的文档。要让 `groff` 使用特定的宏集合，只需要使用 `-m macro` （或 `-macro`） 选项。例如，要使用 mgs 宏，使用命令：

```
groff -Tascii -mgs files...
```

`groff` 的 man 手册页对这个选项描述了更多细节。

不幸的是，随同 `groff` 提供的宏集合没有完善的文档。第 7 部分的 man 手册页提供了一些，例如，`man 7 groff_mm` 会给你 mm 宏集合的信息。然而，该文档通常只覆盖了在 `groff` 实现中不同和新功能，而假设你已经了解过原来的 nroff/troff 宏集合（称作 DWB：the Documentor's Work Bench）。最佳的信息来源或许是一本覆盖了那些经典宏集合细节的书。要了解更多的编写 man 手册页的信息，你可以看看 man 手册页源文件（`/usr/man` 中），并通过它们来比较源文件的输出。

这篇文章是《Running Linux》 中的一章，由 Matt Welsh 和 Lar Kaufman 著，奥莱理出版（ISBN 1-56592-100-3）。在本书中，还包括了 Linux 下使用的各种文本格式化系统的教程。这期的《Linux Journal》中的内容及《Running Linux》应该可以给你提供在 Linux 上使用各种文本工具的良好开端。

### 祝好，撰写快乐！

Matt Welsh （[mdw@cs.cornell.edu][1]）是康奈尔大学的一名学生和系统程序员，在机器人和视觉实验室从事于时时机器视觉研究。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/article/1158

作者：[Matt Welsh][a]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/user/800006
[1]:mailto:mdw@cs.cornell.edu