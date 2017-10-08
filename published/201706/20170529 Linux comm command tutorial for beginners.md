使用 comm 比较两个排序好的文件
===========================================================

Linux 中的 `comm` 命令可以让用户按行比较两个**已经排序好**的文件。在本教程中，我们将使用一些浅显易懂的例子来讨论这个命令行工具。在开始之前，请注意，本教程中提到的所有例子都已经在 Ubuntu 16.04LTS 版本中测试过。

下面的例子将会告诉你 `comm` 命令是如何工作的。

### 1、 如何使用 `comm` 比较两个排序好的文件

要使用 `comm` 命令比较两个排序好的文件，只需要把它们的名字作为 `comm` 命令的参数。下面是通常的语法：

```
comm [name-of-first-file] [name-of-second-file]
```

比如，假设 `file1` 和 `file2` 是这种情况下的两个文件。前者包含下面几行内容：

```
001
056
127
258
```

而后者包含下面几行内容：

```
002
056
167
369
```

此时，`comm` 命令的输出如下图所示：

```
comm file1 file2
```

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-output.png)][8] 

你可以看到，输出包含 3 列。第一列是仅包含在 `file1` 中的内容，第二列是仅包含在 `file2` 中的内容，最后，第三列是两个文件中均包含的内容。

### 2、 如何不输出 `comm` 命令输出中的某些列

如果你想，你可以不输出 `comm` 命令输出中的某些列。对于该特性，你有三个命令行选项可用：`-1`、`-2` 和 `-3` 。正如你所猜想的，这些数字表示你不想输出的列。

比如，下面这个命令将会不输出上面例子中的第三列：

```
comm -3 file1 file2
```
[![](https://www.howtoforge.com/images/linux_comm_command/comm-supress-column.png)][9] 


因此，你可以看到，第三列并没有输出。

注意，你可以通过一个单一命令同时不输出多列内容。比如：

```
comm -12 file1 file2
```

上面这个命令将会不输出第一、二列。

### 3、 如何使用 `comm` 命令比较两个未排序好的文件

正如我们所知道的，`comm` 只可用于排序好的文件。如果发现其中一个文件未排序好，那么便会在输出中产生一条信息来告诉用户。比如，我们交换 `file1` 的第一行和第二行，然后与 `file2` 进行比较。下面是该命令的输出：

[![](https://www.howtoforge.com/images/linux_comm_command/comm-not-sorted-message.png)][10] 

你可以看到，这个命令产生一个输出告诉我们：`file1` 还没有排序好。此时，如果你不想让这个工具检查输入是否已经排序好，那么你可以使用 `--nocheck-order` 选项：

```
comm --nocheck-order file1 file2
```

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-nocheck-order.png)][11] 

你可以看到，前面出现的提示信息已经消失了。

注意，如果你想明确告诉 `comm` 命令来检查输入文件是否排序好，那么你可以使用 `--check-order` 选项。

### 4、 如何用自定义字符串分隔 `comm` 命令的输出列

默认情况下，`comm` 命令的输出列之间是以空格分隔的。然而，如何你想使用一个自定义字符串作为分隔符，那么你可以使用 `--output-delimiter` 选项。使用该选项时需要指定你想用来作为分隔符的字符串。

```
comm --output-delimiter=+ file1 file2
```

比如，我们使用加号来作为分隔符：

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-output-delimiter.png)][12] 

### 5、 如何使 `comm` 的输出行以 `NUL` 字符终止

默认情况下，`comm` 命令的输出行以新行终止。然而，如果你想，那么你可以改为以 `NUL` 字符终止，只需要使用 `-z` 选项即可：

```
comm -z file1 file2
```

### 结论

`comm` 命令并没有特别多的特性性，我们在这儿已经讨论了它的绝大多数命令行选项。只需要理解和练习在这篇教程中讨论的内容，那么你便可以在日常工作中知道如何使用这个工具了。如果你有任何问题或者疑问，请前往该命令的 [man 手册][13]，或者在下面评论。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-comm-command/

作者：[Himanshu Arora][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/linux-comm-command/
[1]:https://www.howtoforge.com/linux-comm-command/#linux-comm-command
[2]:https://www.howtoforge.com/linux-comm-command/#-how-to-compare-two-sorted-files-using-comm
[3]:https://www.howtoforge.com/linux-comm-command/#-how-tonbspsuppress-individual-columns-in-comm-command-output
[4]:https://www.howtoforge.com/linux-comm-command/#-how-to-make-comm-compare-files-that-are-not-sorted
[5]:https://www.howtoforge.com/linux-comm-command/#-how-to-separate-comm-output-columns-with-custom-string
[6]:https://www.howtoforge.com/linux-comm-command/#-how-to-make-comm-output-lines-nul-terminated
[7]:https://www.howtoforge.com/linux-comm-command/#conclusion
[8]:https://www.howtoforge.com/images/linux_comm_command/big/comm-output.png
[9]:https://www.howtoforge.com/images/linux_comm_command/big/comm-supress-column.png
[10]:https://www.howtoforge.com/images/linux_comm_command/big/comm-not-sorted-message.png
[11]:https://www.howtoforge.com/images/linux_comm_command/big/comm-nocheck-order.png
[12]:https://www.howtoforge.com/images/linux_comm_command/big/comm-output-delimiter.png
[13]:https://linux.cn/man/1/comm
