[#]: collector: (lujun9972)
[#]: translator: (Mjseven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12920-1.html)
[#]: subject: (How to Save the Output of a Command to a File in Linux Terminal [Beginner’s Tip])
[#]: via: (https://itsfoss.com/save-command-output-to-file-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何将 Linux 终端中命令的输出保存到文件中
======

![](https://img.linux.net.cn/data/attachment/album/202012/14/223956pidmznldldnnk87f.jpg)

当你在 Linux 终端中运行命令或脚本时，它会在终端中打印输出方便你立即查看。

有时你需要将输出保存到文件中以备将来参考。[当然你可以在 Linux 终端中复制和粘贴][1]，但是有更好的方法可以在 Linux 命令行中保存 shell 脚本或命令的输出，让我演示给你看。

### 方法 1：使用重定向将命令输出保存到文件中

你可以[在 Linux 中使用重定向来达成目的][2]。使用重定向操作符，它会将输出保存到文件中而不是在屏幕上显示。

  * `>` 会将命令输出重定向到文件，它会替换文件中的所有内容。
  * `>>` 会将命令输出添加到文件现有内容的末尾。

使用标准输出重定向运算符 `>` 将输出重定向到文件：

```
command > file.txt
```

如果 `file.txt` 不存在，它会自动创建。如果你使用 `>` 再次重定向到相同的文件，文件内容将被替换为新的输出。

下面的示例将更好地演示它。它首先会保存 `ls -l` 命令的输出，然后，它将用 `ls *.c` 命令的输出替换文件的内容。

![将命令输出重定向到文件][3]

如果你不想在保存脚本或命令的输出时丢失现有文件的内容，可以使用 `>>` ：

```
command >> file.txt
```

下面这个例子更好地展示了它：

![将命令输出重定向到文件][4]

即使文件不存在，它也会自动创建。

温馨提示：将 Linux 命令输出和错误保存到一个文件中。

如果 Linux 命令返回错误，那么错误不会保存在文件中。你可以使用 `2>&1` 将命令的输出和错误保存到同一个文件中，如下所示：

```
command > file.txt 2>&1
```

通常，`0` 代表标准输入，`1` 代表标准输出，`2` 代表标准错误。在这里，你要将标准错误（`2`） 重定向（`&`）到与标准输出（`1`）相同的地址。

### 方法 2：使用 tee 命令显示输出并将其保存到文件中

顺便说一句，你是否注意到，当你将命令输出发送到一个文件时，你再也无法在终端上看到它了？[Linux 的 tee 命令][5]解决了这个问题。

类似于将水流发送到两个方向的三通管，`tee` 命令将输出发送到终端以及文件（或作为另一个命令的输入）。你可以像这样使用它：

```
command | tee file.txt
```

同样，如果该文件不存在，它将自动创建。

你还可以使用 `tee` 命令 `-a` 选项进入附加模式：

```
command | tee -a file.txt
```

让我用一些简单的例子来演示：

![][6]

我在例子中使用了简单的 Linux 命令。但是请放心，你也可以使用这些方法来保存 bash 脚本的输出。

### 注意：将命令输出保存到文件时，避免管道陷阱

你可能对管道重定向很熟悉，可以使用它来组合 Linux 命令，但不能将输出通过管道传输到文件，它显示找不到 `output.txt` 命令：

![][7]

这是因为管道将一个命令的输出重定向到另一个命令的输入。在本例中，你向它传递一个了一个文件名而它期望一个命令。

如果你是一个 Linux 命令行新手，我希望这个快速教程对你的 Linux 知识有所帮助。[I/O 重定向][8]是一个需要注意的基本概念。

一如既往，欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/save-command-output-to-file-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/copy-paste-linux-terminal/
[2]: https://linuxhandbook.com/redirection-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/redirecting_command_output_to_file_in_linux.png?resize=741%2C456&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/redirecting_command_output_to_file.png?resize=741%2C494&ssl=1
[5]: https://linuxhandbook.com/tee-command/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/display-and-save-linux-command-output.png?resize=741%2C494&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/pipe-output-to-file-linux.png?resize=687%2C266&ssl=1
[8]: https://tldp.org/LDP/abs/html/io-redirection.html#FTN.AEN17894
