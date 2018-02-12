为初学者准备的 Linux ln 命令教程（5 个示例）
======

当我们在命令行上工作时，您可能需要在文件之间创建链接。这时，您可以可以借助一个专用命令，**ln**。本教程中，我们将通过一些简单易理解的例子来讨论此工具的基础知识。在此之前，值得一提的是，本教程所有例子都已在 Ubuntu 16.04 上测试通过。

### Linux ln 命令

正如你现在所了解的，ln 命令能够让您在文件之间创建链接。下面就是 ln 工具的语法（或者使用其他一些可行的语法）。

```
ln [OPTION]... [-T] TARGET LINK_NAME (1st form)
ln [OPTION]... TARGET (2nd form)
ln [OPTION]... TARGET... DIRECTORY (3rd form)
ln [OPTION]... -t DIRECTORY TARGET... (4th form)
```

下面是 ln 工具 man 文档描述的内容：
```
在第一种形式下，为 TARGET 创建一个叫 LINK_NAME 的链接。在第二种形式下，为 TARGET 在当前目录下创建一个链接（ LCTT 译注：创建的为同名链接）。在第三和第四中形式中，在 DIRECTORY 目录下为每一个 TARGET 创建链接。默认创建硬链接，符号链接需要 --symbolic 选项。默认创建的每一个目标（新链接的名字）都不能已经存在。当创建硬链接时，TARGET 文件必须存在。符号链接可以保存任意文本，如果之后解析，相对链接的解析与其父目录有关。
```

通过下面问答风格的例子，可能会给你更好的理解。但是在此之前，建议您先了解 [硬链接和软链接的区别][1].

### Q1. 如何使用 ln 命令创建硬链接？

这很简单，你只需要像下面使用 ln 命令：

```
ln [file] [hard-link-to-file]
```

例如：

```
ln test.txt test_hard_link.txt
```

[![如何使用 ln 命令创建硬链接][2]][3]

如此，您便可以看见一个已经创建好的，名为 test_hard_link.txt 的硬链接。

### Q2. 如何使用 ln 命令创建软/符号链接？

使用 -s 命令行选项

```
ln -s [file] [soft-link-to-file]
```

例如：

```
ln -s test.txt test_soft_link.txt
```

[![如何使用 ln 命令创建软/符号链接][4]][5]

test_soft_link.txt 文件就是一个软/符号链接，被天蓝色文本 [标识][6]。

### Q3. 如何使用 ln 命令删除既存的同名目标文件？

默认情况下，ln 不允许您在目标目录下创建已存在的链接。

[![ln 命令示例][7]][8]

然而，如果一定要这么做，您可以使用 **-f** 命令行选项覆盖此行为。

[![如何使用 ln 命令创建软/符号链接][9]][10]

**贴士** : 如果您想在此删除过程中有所交互，您可以使用 **-i** 选项。

### Q4. 如何使用 ln 命令创建现有文件的同名备份？

如果您不想 ln 删除同名的现有文件，您可以为这些文件创建备份。使用 **-b** 即可实现此效果，以这种方式创建的备份文件，会在其文件名结尾处包含一个波浪号（~）。

[![如何使用 ln 命令创建现有文件的同名备份][11]][12]

### Q5. 如何在当前目录以外的其它目录创建链接？

使用 **-t** 选项指定一个文件目录（除了当前目录）。比如：

```
ls test* | xargs ln -s -t /home/himanshu/Desktop/
```

上述命令会为所有 test* 文件（当前目录下的 test* 文件）创建链接，并放到桌面目录下。

### 总结

当然，尤其对于新手来说，**ln** 并不是日常必备命令。但是，这是一个有用的命令，因为你永远不知道它什么时候能够节省你一天的时间。对于这个命令，我们已经讨论了一些实用的选项，如果你已经完成了这些，可以查询 [man 文档][13] 来了解更多详情。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-ln-command/

作者：[Himanshu Arora][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[Locez](https://github.com/locez)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://medium.com/meatandmachines/explaining-the-difference-between-hard-links-symbolic-links-using-bruce-lee-32828832e8d3
[2]:https://www.howtoforge.com/images/command-tutorial/ln-hard-link.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/ln-hard-link.png
[4]:https://www.howtoforge.com/images/command-tutorial/ln-soft-link.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/ln-soft-link.png
[6]:https://askubuntu.com/questions/17299/what-do-the-different-colors-mean-in-ls
[7]:https://www.howtoforge.com/images/command-tutorial/ln-file-exists.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/ln-file-exists.png
[9]:https://www.howtoforge.com/images/command-tutorial/ln-f-option.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/ln-f-option.png
[11]:https://www.howtoforge.com/images/command-tutorial/ln-b-option.png
[12]:https://www.howtoforge.com/images/command-tutorial/big/ln-b-option.png
[13]:https://linux.die.net/man/1/ln
