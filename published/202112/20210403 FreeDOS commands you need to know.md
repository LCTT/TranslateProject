[#]: subject: (FreeDOS commands you need to know)
[#]: via: (https://opensource.com/article/21/4/freedos-commands)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14074-1.html)

FreeDOS 操作目录和文件的基本命令
======

> 学习如何在 FreeDOS 中对目录和文件执行创建、移除、复制等任务。

![](https://img.linux.net.cn/data/attachment/album/202112/12/100340gffegjttbn0n7iox.jpg)

DOS 的开源实现 [FreeDOS][2] 提供了一个轻量级的操作系统，可以在现代硬件（或模拟器）上用于运行历史遗留下来的应用程序，可以更新硬件供应商不兼容于 Linux 的固件闪存。熟悉 FreeDOS 不仅是一种对旧计算机时代的有趣考古，也是一种获取有用的计算机技能的投入。在这篇文章中，我将介绍一些在 FreeDOS 系统上工作所需要知道的基本命令。

### 基本的命令和文件命令

FreeDOS 在硬盘驱动器上使用目录来组织文件。这意味着你需要使用目录命令来创建一个结构，用于存储和查找你在其中存储的文件。你所需要的用于管理目录结构的命令有：

  * `MD` （或 `MKDIR`） 创建一个新的目录或子目录。
  * `RD` （或 `RMDIR`） 移除（删除） 一个目录或子目录。
  * `CD` （或 `CHDIR`） 从当前工作目录更改到另一个命令。
  * `DELTREE` 删除一个目录，包括其包含的任意文件或子目录。
  * `DIR` 列出当前工作目录的内容。

因为使用目录是 FreeDOS 的主要工作，所有的这些命令（除  DELTREE 以外）是包含在 `COMMAND.COM` 中的内部命令。因此，它们将被加载到内存之中，并在你启动（即使是从启动盘启动）时随时可用。前三个命令有两个版本：一个版本是两个字母的短名，一个版本是长名。在实践中没有区别，因此，我将在这篇文章中使用短名。

### 使用 MD 创建一个目录

FreeDOS 的 `MD` 命令会创建一个新的目录或子目录。（实际上，由于 `\` 是根目录，从技术上讲，所有的目录都是子目录，因此，我更喜欢在所有的示例中使用“子目录”的说法）。有一个可选的参数是你所想要创建目录的路径，但是如果不包含路径，将在当前工作子目录中创建子目录。

例如，为在你的当前位置创建一个名称为 `letters` 的子目录：

```
C:\HOME\>MD LETTERS
```

这会创建子目录 `C:\letters` 。

通过包含一个路径，你可以在任意位置创建一个子目录：

```
C:\>MD C:\HOME\LETTERS\LOVE
```

这和先移动到 `C:\HOME\LETTERS` ，然后在其中创建一个子目录的结果相同：

```
C:\CD HOME\LETTERS
C:\HOME\LETTERS\>MD LOVE
C:\HOME\LETTERS\>DIR
LOVE
```

一个路径描述不能超过 63 个字符，包括反斜杠在内。

### 使用 RD 移除一个目录

FreeDOS 的 `RD` 命令会移除一个子目录。这个子目录必须是空的。如果它包含文件或其它是子目录，你将会得到错误信息。它也有一个可选的路径参数，语法与 `MD` 的相同。

你不能移除你的当前工作子目录。为移除此目录，你必须 `CD` 到其父目录，然后再移除不需要的子目录。

### 使用 DELTREE 删除文件和目录

`RD` 命令可能会让人有点迷糊，因为在该命令中内置了保护 FreeDOS 的措施。例如，你不能删除一个包含内容的子目录是一种安全措施。`DELTREE` 就是解决方案。

`DELTREE` 命令会删除整个子目录“树”（子目录）、其包含的所有的文件，以及其包含的所有的子目录及其包含的所有的文件等等，上述的一切都在一个简单的命令中完成。有时，它可能有点 _太_ 容易了，因为它可以如此快速地擦除数据。它是忽略文件属性的，因此你可以擦除隐藏、只读，和未知的系统文件。

你甚至可以在命令中具体指定多个目录树来擦除它们。这条命令将在一个命令中擦除这两个目录中的所有子目录：

```
C:\>DELTREE C:\FOO C:\BAR
```

这是那些使用前需要三思的命令中的其中一个。毫无疑问，它自然有其价值。我仍然对转到每个子目录，删除个别文件，检查每个子目录的内容，一次删除一个子目录, 然后再跳转到上一层目录，重复上述过程的乏味而记忆犹新。`DELTREE` 在你需要时是非常省时。但是我从不会将其用于日常维护，因为一此失误都能造成重大的损失。

### 格式化一个硬盘驱动器

`FORMAT` 命令也可以用于准备一个空白的硬盘驱动器来将文件写入其中。这将格式化 `D:` 驱动器：

```
C:\>FORMAT D:
```

### 复制文件

`COPY` 命令，顾名思义，将文件从一个位置复制到另一个位置。所需要的参数是：将要被复制的文件、要将其复制到的路径和文件。开关选项包含：

  * `/Y` 当一个文件要被覆盖时，避免出现提示。
  * `/-Y` 当一个文件要被覆盖时，需要出现提示。
  * `/V` 验证副本的内容。

这将从 `C:` 上的工作目录中复制文件 `MYFILE.TXT` 到 `D:` 驱动器的根目录，并将其重命名为 `EXAMPLE.TXT` ：

```
C:\>COPY MYFILE.TXT D:\EXAMPLE.TXT
```

这将从 `C:` 上的工作目录中复制文件 `EXAMPLE.TXT` 到 `C:\DOCS\` 目录，接下来验证文件的内容来确保副本是完整的：

```
C:\>COPY EXAMPLE.TXT C:\DOCS\EXAMPLE.TXT /V
```

你也可以使用 `COPY` 命名来合并和追加文件。这个命令将合并两个文件 `MYFILE1.TXT` 和 `MYFILE2.TXT` ，并将其放置到一个新的名称为 `MYFILE3.TXT` 的文件之中：

```
C:\>COPY MYFILE1.TXT+MYFILE2.TXT MYFILE3.TXT
```

### 使用 XCOPY 复制目录

`XCOPY` 命令将复制整个目录以及它们的所有的子目录和这些子目录中包含的所有的文件。参数是将要复制的文件和其路径，以及将要复制到的目的地。重要的开关选项是：

  * `/S` 复制当前目录及其子目录中的所有文件。
  * `/E` 复制子目录，即使它们是空的。这个选项必须和 `/S` 一起使用。
  * `/V` 验证其所制作的副本。

这是一个非常强大和有用的命令，尤其是用于备份目录或整个硬盘驱动器。

这个命令将复制目录 `C:\DOCS` 的全部内容，包括所有的子目录及其内容（除了空的子目录以外），并将其放置到驱动器 `D:` 的目录 `D:\BACKUP\DOCS\` 之中：

```
C:\>XCOPY C:\DOCS D:\BACKUP\DOCS\ /S
```

### 使用 FreeDOS

FreeDOS 是一个有趣的、轻量的、开源的操作系统。不管你正在使用它来更新你的主板的固件，还是给予旧计算机新生，它都能提供很多有用的实用程序，可以使你能够很好地使用它工作。学习 FreeDOS 的基本知识。你都可能会被它的多才多艺所惊讶。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/freedos-commands

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://www.freedos.org/
[3]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-8-format-copy-diskcopy-xcopy/
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-10-directory-commands/
[5]: https://allaboutdosdirectoires.blogspot.com/
