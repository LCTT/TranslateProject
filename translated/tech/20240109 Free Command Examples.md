[#]: subject: "Free Command Examples"
[#]: via: "https://itsfoss.com/free-command/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Free 命令示例
======

free 命令是了解系统内存 (RAM) 消耗情况以及是否启用了交换的最简单方法之一。

但问题是：如何使用 free 命令？ 嗯，这非常简单，不需要任何复杂的步骤。

因此，在本教程中，我将引导你使用 free 命令，并附有示例和练习题供你练习。

### Linux 中如何使用 free 命令

要使用 free 或任何其他命令，最好从命令语法开始，我将从相同的开始。

以下是 free 命令的语法：

````

     free [选项]

````

你有多个选项，这些选项应该在 `[options]` 字段中使用，以更改 free 命令的默认行为。

现在，让我分享一些 free 命令常用的选项：

选项 | 描述
---|---
`-h` | 通过调整 KB、GB 等数据单位，以人类可读的形式打印信息。
`-s` | 在给定的时间间隔后更新 free 输出。
`-t` | 显示系统和交换内存的总量。
`-g` | 以 GB 为单位显示数据。
`-m` | 以兆字节为单位打印信息。
`-k` | 以千字节为单位显示输出。

但是如果执行不带选项的 free 命令会怎样呢？ 你可以看到下面的内容：

![][1]

这里，

   * `total`：表示存储总量。
   * `used`：显示系统已使用的存储空间。
   * `free`：可用于新进程的可用内存量。
   * `shared`：tmpfs（临时文件系统）使用的内存量。
   * `buff/cache`: 表示缓冲区和缓存使用的内存总和。
   * `available`：它估计有多少内存可用于启动新应用而无需交换。它是`free` 内存和可以立即使用的 `buff/cache` 的一部分的总和。



因此，如果你想要各种信息，只需输入不带选项的命令即可。

现在，让我们看一下 free 命令的一些示例。

#### 1\. 以人类可读的形式显示信息

默认情况下，free 命令将以千字节为单位显示数据，这不是最易读的形式。

这就是 `-h` 选项发挥作用的地方，它以人类可读的形式（例如 KB 或 GB）打印值。

````

     free -h

````

![][2]

#### 2\. 连续显示统计数据

一旦执行 free 命令，它只会显示执行该命令时的统计信息。例如，如果我在 `12:45` 执行 `free` 命令，那么它只会显示该时间的统计信息。

所以问题是：如何实现类似的行为，如显示实时统计数据的 [htop][3]？这不完全相同，但你可以使用 `-s` 标志以特定时间间隔刷新统计信息，如下所示：

````

     free -s <秒>

````

例如，如果我想每秒刷新一次 free 命令，那么我将使用以下命令：

````

     free -s 1

````

#### 3\. 定义显示统计数据的次数

在前面的示例中，我解释了如何使用 free 命令连续显示统计信息，但你可能不希望它无休止地刷新，而只刷新几次。

为此，你可以使用 `-c` 标志，如下所示：

````

     free -c <显示统计信息的次数>

````

假设我想查看统计数据 3 次，那么我将使用以下内容：

````

     free -c 3

````

![][5]

默认情况下，它将每秒刷新一次数据，但你可以使用 `-s` 标志来指定间隔时间：

````

     free -c <显示统计数据的次数> -s <秒数>

````

例如，在这里，如果我想以 2 秒的间隔显示统计信息 3 次，那么我将使用以下命令：

````

     free -c 3 -s 2

````

![][6]

#### 4\. 指定输出数据类型

虽然对于大多数用户来说，使用 `-h` 标志以人类可读的形式显示数据就可以完成工作，但是如果你想自己指定数据类型怎么办？

那么，你可以使用以下标志指定数据类型：

标志| 描述
---|---
`--kilo` | 以 KB 为单位显示内存。
`--mega` | 以 MB 节为单位显示内存。
`--giga` | 以 GB 为单位显示内存。
`--tera` | 以 TB 为单位显示内存。

你可以通过以下方式使用上述标志：

````

     free --<kilo/mega/giga/tera>

````

例如，如果我希望以 MB 为单位显示内存统计信息，那么我将使用以下命令：

````

     free --mega

````

![][7]

#### 5\. 获取物理内存和交换内存的总和

默认情况下，可用内存将显示物理内存和交换内存的行，但是如果你想获得它们的总和怎么办？

好吧，你可以使用 `-t` 标志：

````

     free -t

````

![][8]

### 练习题👨‍💻

你可以练习以下一些问题，以更好地使用 free 命令：

   * 连续打印内存统计数据 3 次，中间间隔 3 秒。
   * 以人类可读的形式获取物理内存和交换内存的总和。
   * 重定向 free 命令的输出到文本文件中。
   * 如何从 free 命令的输出中只打印一列？ （提示：使用 [awk 命令][9] 并指定列号）。



如果你对这些问题有任何疑问，你可以在我们的[社区论坛][10]中与我们联系或在此处发表评论。

### 总结

每个命令都会以某种方式派上用场。free 命令也有这样一个被低估的场景来获取有用的信息。

如果你刚刚开始使用 Linux 终端，我们为像你这样渴望学习但找不到起点的用户制作了一个系列：

![][4]

_💬 我希望你发现本指南有用！ 请让我知道你对我接下来应该介绍什么内容的想法？_

--------------------------------------------------------------------------------

via: https://itsfoss.com/free-command/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/Use-free-command-without-any-options.png
[2]: https://itsfoss.com/content/images/2024/01/Get-human-readable-data-through-the-free-command-in-Linux.png
[3]: https://itsfoss.com/use-htop/
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://itsfoss.com/content/images/2024/01/Specify-how-many-times-the-free-command-should-display-the-stats.gif
[6]: https://itsfoss.com/content/images/2024/01/Specify-how-many-times-the-free-command-should-display-the-stats-with-custom-intevals.gif
[7]: https://itsfoss.com/content/images/2024/01/Print-memory-statistics-in-megabytes-using-the-free-command-in-Linux.png
[8]: https://itsfoss.com/content/images/2024/01/Get-the-sum-of-physical-and-swap-memory-using-the-free-command.png
[9]: https://linuxhandbook.com/awk-command-tutorial/
[10]: https://itsfoss.community/
