为初学者介绍 Linux whereis 命令（5个例子）
======

有时，在使用命令行的时候，我们需要快速找到某一个命令的二进制文件所在位置。这种情况下可以选择 [find][1] 命令，但使用它会耗费时间，可能也会出现意料之外的情况。有一个专门为这种情况设计的命令：`whereis`。

在这篇文章里，我们会通过一些便于理解的例子来解释这一命令的基础内容。但在这之前，值得说明的一点是，下面出现的所有例子都在 Ubuntu 16.04 LTS 下测试过。

### Linux whereis 命令

`whereis` 命令可以帮助用户寻找某一命令的二进制文件，源码以及帮助页面。下面是它的格式：

```
whereis [options] [-BMS directory... -f] name...
```

这是这一命令的 man 页面给出的解释：

> `whereis` 可以查找指定命令的二进制文件、源文件和帮助文件。 被找到的文件在显示时，会去掉主路径名，然后再去掉文件的（单个）尾部扩展名 (如: `.c`)，来源于源代码控制的 `s.` 前缀也会被去掉。接下来，`whereis` 会尝试在标准的 Linux 位置里寻找具体程序，也会在由 `$PATH` 和 `$MANPATH` 指定的路径中寻找。


下面这些以 Q&A 形式出现的例子，可以给你一个关于如何使用 whereis 命令的直观感受。

### Q1. 如何用 whereis 命令寻找二进制文件所在位置?

假设你想找，比如说，`whereis` 命令自己所在位置。下面是你具体的操作：

```
whereis whereis
```

[![How to find location of binary file using whereis][2]][3]

需要注意的是，输出的第一个路径才是你想要的结果。使用 `whereis` 命令，同时也会显示帮助页面和源码所在路径。（如果能找到的情况下会显示，但是在这一例中没有找到）所以你在输出中看见的第二个路径就是帮助页面文件所在位置。

### Q2. 怎么在搜索时规定只搜索二进制文件、帮助页面，还是源代码呢？

如果你想只搜索，假设说，二进制文件，你可以使用 `-b`  这一命令行选项。例如：

```
whereis -b cp
```

[![How to specifically search for binaries, manuals, or source code][4]][5]

类似的，  `-m` 和 `-s` 这两个 选项分别对应 帮助页面和源码。


### Q3.如何限制 whereis 命令搜索位置？

默认情况下，`whereis` 是从由匹配符所定义的硬编码路径来寻找文件的。但如果你想的话，你可以用命令行选项来限制搜索。例如，如果你只想在 `/usr/bin` 寻找二进制文件，你可以用 `-B` 这一选项来实现。

```
whereis -B /usr/bin/ -f cp
```

注意：使用这种方式时可以给出多个路径。使用 `-f` 这一选项来明确分隔目录列表和要搜索的文件名。

类似的，如果你想只搜索帮助文件或源码，你可以对应使用  `-M` 和 `-S`  这两个选项。

### Q4. 如何查看 whereis 的搜索路径?

与此相对应的也有一个选项。只要在 `whereis` 后加上 `-l`。

```
whereis -l
```

这是例子的部分输出结果：

[![How to see paths that whereis uses for search][6]][7]

### Q5. 如何找到一个有异常条目的命令?

对于 `whereis` 命令来说，如果一个命令对每个显式的请求类型都不止一项，则该命令被视为异常。例如，没有可用文档的命令，或者对应文档分散在各处的命令都可以算作异常命令。 当使用 `-u` 这一选项，`whereis` 就会显示那些有异常条目的命令。

例如，下面这一例子就显示，在当前目录中，没有对应文档或有多个文档的命令。

```
whereis -m -u *
```

### 总结

我觉得，`whereis` 不是那种你需要经常使用的命令行工具。但在遇到某些特殊情况时，它绝对会让你的生活变得轻松。我们已经涉及了这一工具提供的一些重要命令行选项，所以要注意练习。想了解更多信息，直接去看它的 [man][8] 页面吧。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-whereis-command/

作者：[Himanshu Arora][a]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/tutorial/linux-find-command/
[2]:https://www.howtoforge.com/images/command-tutorial/whereis-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/whereis-basic-usage.png
[4]:https://www.howtoforge.com/images/command-tutorial/whereis-b-option.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/whereis-b-option.png
[6]:https://www.howtoforge.com/images/command-tutorial/whereis-l.png
[7]:https://www.howtoforge.com/images/command-tutorial/big/whereis-l.png
[8]:https://linux.die.net/man/1/whereis
