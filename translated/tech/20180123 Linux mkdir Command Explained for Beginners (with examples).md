Linux mkdir 命令的初学者教程
======

当你使用命令行的时候，无论什么时候，你都位于一个目录中，它告诉了命令行当前所位于的完整目录。在 Linux 中，你可以使用 `rm` 命令删除目录，但是首先，你需要使用 `mkdir` 命令来创建目录。在这篇教程中，我将使用一些易于理解的例子来讲解这个工具的基本用法。

在开始之前，值得一提的是，这篇教程中的所有例子都已经在 Ubuntu 16.04 LTS 中测试过。

### Linux `mkdir` 命令

正如上面所提到的，用户可以使用 `mkdir` 命令来创建目录。它的语法如下：

```
mkdir [OPTION]... DIRECTORY...
```

下面的内容是 man 手册对这个工具的描述：
```
Create the DIRECTORY(ies), if they do not already exist.
```

下面这些问答式的例子将能够帮助你更好的理解 `mkdir` 这个命令是如何工作的。

### Q1. 如何使用 `mkdir` 命令创建目录？

创建目录非常简单，你唯一需要做的就是把你想创建的目录的名字跟在 `mkdir` 命令的后面作为参数。

```
mkdir [dir-name]
```

下面是一个简单例子：

```
mkdir test-dir
```

### Q2. 如何确保当父目录不存在的时候，同时创建父目录？

有时候，我们需要使用一条 `mkdir` 命令来创建一个完整的目录结构，这时候，你只需要使用 `-p` 这个命令行选项即可。

比如，你想创建目录 `dir1/dir2/dir3`，但是，该目录的父目录都不存在，这时候，你可以像下面这样做：

```
mkdir -p dir1/dir2/dir3
```

[![How to make sure parent directories \(if non-existent\) are created][1]][2]

### Q3. 如何在创建目录时自定义权限？

默认情况下，`mkdir` 命令创建目录时会把权限设置为 `rwx, rwx, r-x` 。

[![How to set permissions for directory being created][3]][4]

但是，如果你想自定义权限，那么你可以使用 `-m` 这一命令行选项。

[![mkdir -m command option][5]][6]

### Q4. 如何使 `mkdir` 命令显示操作细节？

如果你希望 `mkdir` 命令显示它所执行的操作的完整细节，那么你可以使用 `-v` 这一命令行选项。

```
mkdir -v [dir]
```

下面是一个例子：

[![How to make mkdir emit details of operation][7]][8]

### 结论

你已经看到，`mkdir` 是一个非常简单，易于理解和使用的命令。学习这一命令不会遇到任何屏障。在这篇教程中，我们讨论到了它的绝大部分命令行选项。记得练习这些命令，并在日复一日的工作中使用这些命令。如果你想了解关于这一命令的更过内容，请查看它的 [man][9] 手册。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-mkdir-command/

作者：[Himanshu Arora][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/mkdir-p.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-p.png
[3]:https://www.howtoforge.com/images/command-tutorial/mkdir-def-perm.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-def-perm.png
[5]:https://www.howtoforge.com/images/command-tutorial/mkdir-custom-perm.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-custom-perm.png
[7]:https://www.howtoforge.com/images/command-tutorial/mkdir-verbose.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-verbose.png
[9]:https://linux.die.net/man/1/mkdir
