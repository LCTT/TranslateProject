# Linux 初学者的 rmdir 命令(含例程)

我们已经讨论了 [rm][1] 命令，它主要用于从 Linux 命令行中删除文件和目录。但是，还有另一个相关的命令，专门用于删除目录。这就是 **rmdir**，在本教程中，我们将使用一些容易理解的例子来讨论它的一些基础知识。

#### rmdir 命令

顾名思义，rmdir 命令主要用于删除目录，该目录必须为空目录。 下面是它的使用语法：

```
rmdir [OPTION]... DIRECTORY...
```

下面是 man 手册的解释:

```
Remove the DIRECTORY(ies), if they are empty.

```

下面的问答形式的案例应该可以让你更好的理解该命令是如何使用的.

#### 问题1. 如何使用 rmdir ？

这非常简单，只需将目录名称作为输入传递给命令。例如:

```
rmdir test-dir
```

[![How rmdir works][2]][3]

#### 问题2.如何使 rmdir 忽略非空目录。

默认情况下，如果尝试删除非空目录，则 rmdir 命令会引发错误。 但是，如果需要，可以使用--ignore-fail-on-non-empty 选项来关闭 rmdir 的这种行为。

例如:

[![How to make rmdir ignore non-empty directories][4]][5]

#### 问题3.如何使 rmdir 删除父目录？

就像在例子 [mkdir][6] 的情况一样，您也可以让 rmdir 在父目录上执行操作。 这意味着，您也可以一次删除目录的父目录。 该功能可通过 -p 命令行选项开启。

例如，以下命令将删除 'test' 和 'test-dir' 目录。

```
rmdir -p test/test-dir/
```

**注意**：要使此操作起作用，所有父目录不应包含除被删除的空目录之外的任何内容。

#### 问题4. rmdir 和 rm -r 有何区别？

如果您还记得，还可以使用 rm 命令通过启用它提供的 -r 选项来删除目录。 那和 rmdir 有什么区别？ 答案是 rmdir 只适用于空目录的情况，你无法使用 rmdir 删除非空目录。

因此，rmdir 是一种非常有用的工具，在这种情况下，您需要在删除目录之前检查目录是否为空。

#### 总结

您会同意，rmdir 并不是一个难以理解和使用的命令。另外，它只提供少量命令行选项。我们在这里已经讨论了几乎所有的内容，所以请实践本文中提到的示例，您应该很好地去做。如果需要的话，这里是 [rmdir 的参考手册][7]。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-rmdir-command/

作者：[Himanshu Arora][a]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/linux-rm-command/
[2]:https://www.howtoforge.com/images/command-tutorial/rm-basic-usage1.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/rm-basic-usage1.png
[4]:https://www.howtoforge.com/images/command-tutorial/rmdir-ignore-nonempty.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/rmdir-ignore-nonempty.png
[6]:https://www.howtoforge.com/linux-mkdir-command/
[7]:https://linux.die.net/man/1/rmdir
