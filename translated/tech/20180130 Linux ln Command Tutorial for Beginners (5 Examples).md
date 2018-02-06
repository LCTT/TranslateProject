为初学者准备的 Linux ln 命令教程（5 个示例）
======

当我们在命令行上工作时，您可能需要创建文件链接。这时，您可以可以借助一个专用命令，**ln**。本教程中，我们将基于此命令通过一些简明的例子展开讨论。在此之前，有必要明确，本教程所有测试都是基于 Ubuntu 16.04 设备开展的。

### Linux ln 命令

正如现在你所了解的，ln 命令能够让您链接文件。下面就是 ln 工具的语法（或者使用其他一些可行的语法）。

```
ln [OPTION]... [-T] TARGET LINK_NAME (1st form)
ln [OPTION]... TARGET (2nd form)
ln [OPTION]... TARGET... DIRECTORY (3rd form)
ln [OPTION]... -t DIRECTORY TARGET... (4th form)
```

下面是 ln 工具 man 文档描述的内容：
```
在第一种形式下，创建名为 LINK_NAME 的链接目标。
第二种形式为创建链接在当前目录。
第三和第四中形式中，在 DIRECTORY 目录下创建链接目标。默认创建硬链接，字符链接需要 --symbolic 选项。默认创建硬链接，目标文件必须存在。字符链接可以保存任何文件。
```

同故宫下面问答风格的例子，可能会给你更好的理解。但是在此之前，建议您先了解 [软连接和硬链接的区别][1].

### Q1. 如何通过 ln 命令创建硬链接？

这很简单，你只需要使用下面的 ln 命令：

```
ln [file] [hard-link-to-file]
```

这里有一个示例：

```
ln test.txt test_hard_link.txt
```

[![如何通过 ln 命令创建硬链接][2]][3]

如此，您便可以看见一个已经创建好了的硬链接，名为 test_hard_link.txt。

### Q2. 如何通过 ln 命令创建软/字符链接？

使用 -s 命令行选项

```
ln -s [file] [soft-link-to-file]
```

这里有一个示例：

```
ln -s test.txt test_soft_link.txt
```

[![如何通过 ln 命令创建软/字符链接][4]][5]

test_soft_link.txt 文件就是一个软/字符链接，被天蓝色文本 [标识][6]。

### Q3. 如何通过 ln 命令删除既存的同名目标文件？

默认情况下，ln 不允许您在目标文件目录下创建同名链接。

[![ln 命令示例][7]][8]

然而，如果一定要这么做，您可以使用 **-f** 命令行选项忽视此行为。

[![如何通过 ln 命令创建软/字符链接][9]][10]

**贴士** : 如果您想忽略删除过程中所有的命令行交互，您可以使用 **-i** 选项。

### Q4. 如何通过 ln 命令创建既存文件的同名备份？

如果您不想通过 ln 删除同名的既存文件，您可以让它为此文件创建备份。使用 **-b** 即可实现此效果。被创建的备份文件，会在其文件名结尾处包含一个（~） 字符标识。

[![如何通过 ln 命令创建既存文件的同名备份][11]][12]

使用 **-t** 选项指定一个文件目录（除了当前目录）。比如：

```
ls test* | xargs ln -s -t /home/himanshu/Desktop/
```

上述命令会为所有 test* 文件（当前目录下的 test* 文件）创建链接到桌面。

### 总结

当然，**ln** 并不是日常必备命令，尤其对于新手。但是了解此命令益处良多，有备无患，万一它哪一天刚好可以拯救你。对于这个命令，我们已经讨论了一些实用的选项，更多详情请查询 [man 文档][13]。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-ln-command/

作者：[Himanshu Arora][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

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
