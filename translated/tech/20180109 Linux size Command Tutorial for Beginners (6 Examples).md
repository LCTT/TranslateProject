六个例子带你入门 size 命令
======

正如你所知道的那样，Linux 中的目标文件或着说可执行文件由多个段组成(比如 txt 和 data)。若你想知道每个段的大小，那么确实存在这么一个命令行工具 - 那就是 `size`。在本教程中，我们将会用几个简单易懂的案例来讲解该工具的基本用法。

在我们开始前，有必要先声明一下，本文的所有案例都在 Ubuntu 16.04LTS 中测试过了 .04LTS。

## Linux size 命令

size 命令基本上就是输出指定木比奥文件各段及其总和的大小。下面是该命令的语法：
```
size [-A|-B|--format=compatibility]
            [--help]
            [-d|-o|-x|--radix=number]
            [--common]
            [-t|--totals]
            [--target=bfdname] [-V|--version]
            [objfile...]
```

man 页是这样描述它的：
```
GNU的size程序列出参数列表objfile中,各目标文件(object)或存档库文件(archive)的段节(section)大小 — 以及总大小.默认情况下,对每目标文件或存档库中的每个模块都会产生一行输出.

objfile... 是待检查的目标文件(object). 如果没有指定, 则默认为文件 "a.out".
```

下面是一些问答方式的案例，希望能让你对 size 命令有所了解。

## Q1。如何使用 size 命令？

size 的基本用法很简单。你只需要将目标文件/可执行文件名称作为输入就行了。下面是一个例子：

```
size apl
```

该命令在我的系统中的输出如下：

[![How to use size command][1]][2]

前三部分的内容是 text，data，和 bss 段及其相应的大小。然后是十进制格式和十六进制格式的总大小。最后是文件名。

## Q2。如何切换不同的输出格式？

根据 man 页的说法，size 的默认输出格式类似于 Berkeley 的格式。然而，如果你想的话，你也可以使用 System V 规范。要做到这一点，你可以使用 `--format` 选项加上 `SysV` 值。

```
size apl --format=SysV
```

下面是它的输出：

[![How to switch between different output formats][3]][4]

## Q3。如何切换使用其他的单位？

默认情况下，段的大小是以十进制的方式来展示。然而，如果你想的话，也可以使用八进制或十六进制来表示。对应的命令行参数分别为 `o` 和 `-x`。

[![How to switch between different size units][5]][6]

关于这些参数，man 页是这么说的：
```
-d
-o
-x
--radix=number

使用这几个选项,你可以让各个段节的大小以十进制(`-d',或`--radix 10');八进制(`-o',或`--radix 8');或十六进制(`-x',或`--radix 16')数字的格式显示.`--radix  number' 只支持三个数值参数 (8, 10, 16).总共大小以两种进制给出; `-d'或`-x'的十进制和十六进制输出,或`-o'的 八进制和 十六进制 输出.
```

## Q4。如何让 size 命令显示所有对象文件的总大小？

如果你用 size 一次性查找多个文件的段大小，则通过使用 `-t` 选项还可以让它显示各列值的总和。

```
size -t [file1] [file2] ...
```

下面是该命令的执行的截屏：

[![How to make size command show totals of all object files][7]][8]

`-t` 选项让它多加了最后那一行。

## Q5。如何让 size 输出每个文件中公共符号的总大小？

若你为 size 提供多个输入文件作为参数，而且想让它显示每个文件中公共符号(指 common segment 中的 symbol) 的大小，则你可以带上 `--common` 选项。

```
size --common [file1] [file2] ...
```

另外需要指出的是，当使用 Berkeley 格式时，和谐公共符号的大小被纳入了 bss 大小中。

## Q6。还有什么其他的选项？

除了刚才提到的那些选项外，size 还有一些一般性的命令行选项，比如 `v` (显示版本信息) 和 `-h` (可选参数和选项的 summary)

[![What are the other available command line options][9]][10]

除此之外，你也可以使用 `@file` 选项来让 size 从文件中读取命令行选项。下面是详细的相关说明：
```
读出来的选项会插入并替代原来的@file选项。若文件不存在或着无法读取，则该选项不会被删除，而是会以字面意义来解释该选项。

文件中的选项以空格分隔。当选项中要包含空格时需要用单引号或双引号将整个选项包起来。
通过在字符前面添加一个反斜杠可以将任何字符（包括反斜杠本身）纳入到选项中。
文件本身也能包含其他的@file选项;任何这样的选项都会被递归处理。
```

## 结论

很明显，size 命令并不适用于所有人。它的目标群体是那些需要处理 Linux 中目标文件/可执行文件结构的人。因此，如果你刚好是目标受众，那么多试试我们这里提到的那些选项，你应该做好每天都使用这个工具的准备。想了解关于 size 的更多信息，请阅读它的 [man 页 ][11]。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-size-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/size-basic-usage.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/size-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/size-format-option.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/size-format-option.png
[5]:https://www.howtoforge.com/images/command-tutorial/size-o-x-options.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/size-o-x-options.png
[7]:https://www.howtoforge.com/images/command-tutorial/size-t-option.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/size-t-option.png
[9]:https://www.howtoforge.com/images/command-tutorial/size-v-x1.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/size-v-x1.png
[11]:https://linux.die.net/man/1/size
