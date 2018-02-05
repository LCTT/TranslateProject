Linux 的 fmt 命令用法与案例
======

有时你会发现需要格式化某个文本文件中的内容。比如，该文本文件每行一个单词，而任务是把所有的单词都放在同一行。当然，你可以手工来做，但没人喜欢手工做这么耗时的工作。而且，这只是一个例子 - 事实上的任务可能千奇百怪。

好在，有一个命令可以满足至少一部分的文本格式化的需求。这个工具就是 `fmt`。本教程将会讨论 `fmt` 的基本用法以及它提供的一些主要功能。文中所有的命令和指令都在 Ubuntu 16.04LTS 下经过了测试。

### Linux fmt 命令

`fmt` 命令是一个简单的文本格式化工具，任何人都能在命令行下运行它。它的基本语法为：

```
fmt [-WIDTH] [OPTION]... [FILE]...
```

它的 man 页是这么说的：

> 重新格式化文件中的每一个段落，将结果写到标准输出。选项 `-WIDTH` 是 `--width=DIGITS` 形式的缩写。

下面这些问答方式的例子应该能让你对 `fmt` 的用法有很好的了解。

### Q1、如何使用 fmt 来将文本内容格式成同一行？

使用 `fmt` 命令的基本形式（省略任何选项）就能做到这一点。你只需要将文件名作为参数传递给它。

```
fmt [file-name]
```

下面截屏是命令的执行结果：

[![format contents of file in single line][1]][2]

你可以看到文件中多行内容都被格式化成同一行了。请注意，这并不会修改原文件（file1）。

### Q2、如何修改最大行宽？

默认情况下，`fmt` 命令产生的输出中的最大行宽为 75。然而，如果你想的话，可以用 `-w` 选项进行修改，它接受一个表示新行宽的数字作为参数值。

```
fmt -w [n] [file-name]
```

下面这个例子把行宽削减到了 20：

[![change maximum line width][3]][4]

### Q3、如何让 fmt 突出显示第一行？

这是通过让第一行的缩进与众不同来实现的，你可以使用 `-t` 选项来实现。

```
fmt -t [file-name]
```

[![make fmt highlight the first line][5]][6]

### Q4、如何使用 fmt 拆分长行？

fmt 命令也能用来对长行进行拆分，你可以使用 `-s` 选项来应用该功能。

```
fmt -s [file-name]
```

下面是一个例子：

[![make fmt split long lines][7]][8]

### Q5、如何在单词与单词之间，句子之间用空格分开？

fmt 命令提供了一个 `-u` 选项，这会在单词与单词之间用单个空格分开，句子之间用两个空格分开。你可以这样用：

```
fmt -u [file-name]
```

注意，在我们的案例中，这个功能是默认开启的。

### 总结

没错，`fmt` 提供的功能不多，但不代表它的应用就不广泛。因为你永远不知道什么时候会用到它。在本教程中，我们已经讲解了 `fmt` 提供的主要选项。若想了解更多细节，请查看该工具的 [man 页][9]。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-fmt-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/linux_fmt_command/fmt-basic-usage.png
[2]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-basic-usage.png
[3]:https://www.howtoforge.com/images/linux_fmt_command/fmt-w-option.png
[4]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-w-option.png
[5]:https://www.howtoforge.com/images/linux_fmt_command/fmt-t-option.png
[6]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-t-option.png
[7]:https://www.howtoforge.com/images/linux_fmt_command/fmt-s-option.png
[8]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-s-option.png
[9]:https://linux.die.net/man/1/fmt
