[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11784-1.html)
[#]: subject: (Generating numeric sequences with the Linux seq command)
[#]: via: (https://www.networkworld.com/article/3511954/generating-numeric-sequences-with-the-linux-seq-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 Linux seq 命令生成数字序列
======

![](https://img.linux.net.cn/data/attachment/album/202001/15/112717drpb9nuwss84xebu.jpg)

> Linux 的 seq 命令可以以闪电般的速度生成数字列表，而且它也易于使用而且灵活。

在 Linux 中生成数字列表的最简单方法之一是使用 `seq`（<ruby>系列<rt>sequence</rt></ruby>）命令。其最简单的形式是，`seq` 接收一个数字参数，并输出从 1 到该数字的列表。例如：

```
$ seq 5
1
2
3
4
5
```

除非另有指定，否则 `seq` 始终以 1 开头。你可以在最终数字前面插上不同数字开始一个序列。

```
$ seq 3 5
3
4
5
```

### 指定增量

你还可以指定增量步幅。假设你要列出 3 的倍数。指定起点（在此示例中为第一个 3 ），增量（第二个 3）和终点（18）。

```
$ seq 3 3 18
3
6
9
12
15
18
```

你可以选择使用负增量（即减量）将数字从大变小。

```
$ seq 18 -3 3
18
15
12
9
6
3
```

`seq` 命令也非常快。你或许可以在 10 秒内生成一百万个数字的列表。

```
$ time seq 1000000
1
2
3
…
…
999998
999999
1000000

real    0m9.290s  <== 9+ seconds
user    0m0.020s
sys     0m0.899s
```

### 使用分隔符

另一个非常有用的选项是使用分隔符。你可以插入逗号、冒号或其他一些字符，而不是在每行上列出单个数字。`-s` 选项后跟要使用的字符。

```
$ seq -s: 3 3 18
3:6:9:12:15:18
```

实际上，如果只是希望将数字列在一行上，那么可以使用空格代替默认的换行符。

```
$ seq -s' '  3 3 18
3 6 9 12 15 18
```

### 开始数学运算

从生成数字序列到进行数学运算似乎是一个巨大的飞跃，但是有了正确的分隔符，`seq` 可以轻松地传递给 `bc` 进行计算。例如：

```
$ seq -s* 5 | bc
120
```

该命令中发生了什么？让我们来看看。首先，`seq` 生成一个数字列表，并使用 `*` 作为分隔符。

```
$ seq -s* 5
1*2*3*4*5
```

然后，它将字符串传递给计算器（`bc`），计算器立即将数字相乘。你可以在不到一秒的时间内进行相当庞大的计算。

```
$ time seq -s* 117 | bc
39699371608087208954019596294986306477904063601683223011297484643104\
22041758630649341780708631240196854767624444057168110272995649603642\
560353748940315749184568295424000000000000000000000000000

real    0m0.003s
user    0m0.004s
sys     0m0.000s
```

### 局限性

你只能选择一个分隔符，因此计算将非常有限。而单独使用 `bc` 可进行更复杂的数学运算。此外，`seq` 仅适用于数字。要生成单个字母的序列，请改用如下命令：

```
$ echo {a..g}
a b c d e f g
```

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3511954/generating-numeric-sequences-with-the-linux-seq-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://creativecommons.org/licenses/by/2.0/
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
