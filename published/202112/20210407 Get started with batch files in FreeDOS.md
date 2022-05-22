[#]: subject: (Get started with batch files in FreeDOS)
[#]: via: (https://opensource.com/article/21/3/batch-files-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14111-1.html)

在 FreeDOS 中使用批处理文件
======

> 编写你自己的简单程序来自动执行通常需要大量输入的任务的批处理文件，是一种极好的方法。

![](https://img.linux.net.cn/data/attachment/album/202112/24/102751sldikuebf7z4u64l.jpg)

在 Linux 上，创建 _shell 脚本_ 来自动执行重复的任务是很常见的。类似地，在开源版的旧式 DOS 操作系统 [FreeDOS][2] 上，你可以创建一个包含数个 FreeDOS 命令的 _批处理文件_ 。然后，你就可以运行你的批处理文件来按顺序执行每个命令。

你可以使用一个 ASCII 文本编辑器来创建批处理文件，诸如 FeeDOS 的 Edit 应用程序。在你创建一个批处理文件后，你可以使用一个文件名称加上扩展名 `.bat` 来保存它。文件名称应该是唯一的。如果你使用 FreeDOS 的一个命令的名称作为你自己的文件名称，那么可能将会执行 FreeDOS 的命令，而不会是你的批处理文件。

实际上，所有的内部的和外部的 FreeDOS 命令都可以在一个批处理文件中使用。在你创建一个批处理文件时，你其实就是在编写一个程序。FreeDOS 批处理文件可能没有结构化编程语言的功能，但是对于耗时短暂却重复乏味的任务来说，它是非常方便的。

### 注释你的代码

对于任何程序员来说，学习的第一个好习惯都应该是：在一个程序中放置注释来解释该代码正在做什么。这是一件非常容易完成的事情，但是你需要仔细，不要傻傻地让操作系统来执行你的注释。避免出现这种情况的方法是在一个注释行的开头处放置 `REM`（“remark” 的缩写） 。

FreeDOS 忽略以 `REM` 开头的代码行。但是任何查看源文件代码（即你在你的批处理文件中所编写的文本）的人都可以读取你的注释并理解它在做什么。这也是一种临时性禁用一个命令而不需要删除它的一种方法。只需要打开你的批处理文件来进行编辑，在你想要禁用行的开头处放置 `REM` ，并保存它。在你想要重新启用这个命令时，只需要打开文件来进行编辑和移除 `REM` 。这种技巧有时被称为 “注释掉” 一个命令。

### 开始设置

在你开始编写你自己的批处理文件前，我建议在 FreeDOS 中创建一个临时目录。这将会为你提供一个处理批处理文件的安全空间，不会意外地删除、移动，或重命名重要的系统文件或目录。在 FreeDOS 上，你可以使用 `MD` 命令来 [创建一个目录][3] ：

```
C:\>MD TEMP
C:\>CD TEMP
C:\TEMP>
```

FreeDOS 的 `ECHO` 命令会控制当你运行一个批处理文件时在屏幕上显示的东西。例如，这里是一个简单是单行批处理文件：

```
ECHO Hello world
```

如果你创建这个文件并运行它，你将看到在屏幕上显示的句子。从命令行中完成这项操作的最快的方法是：使用 `COPY` 命令来从你的键盘中（`CON`）获取输入，并将其放置到文件 `TEST1.BAT` 之中。接下来，按下组合键 `Ctrl+Z` 来停止复制过程，按下你键盘上的 `Return` 或 `Enter` 按键来返回一个提示。

在你的临时目录中尝试创建这个文件为 `TEST1.BAT` ，接下来运行它：

```
C:\TEMP>COPY CON TEST1.BAT
CON => TEST1.BAT
ECHO Hello world
^Z

C:\TEMP>TEST1
Hello world
```

当你想要显示一段文本时，这可能很有用。例如，在一个程序完成它的任务时，你可能会在你的屏幕上看到一条告诉你需要等待的消息，或者在一个网络环境中时，你可能会看到一条登录消息。

如果你想要显示一个空行怎么办？你可能会认为 `ECHO` 命令本身就可以达到目的，但是单独一个 `ECHO` 命令只会询问 FreeDOS 来响应 `ECHO` 是打开还是关闭：

```
C:\TEMP>ECHO
ECHO is on
```

获取一个空白行的方法是在 `ECHO`后紧接着使用一个 `+`符号：

```
C:\TEMP>ECHO+

C:\TEMP>
```

### 批处理文件变量

变量是一个存储你需要你的批处理文件临时记住的信息的位置。这是编程的一个重要的功能，因为你不能总是知道你的批处理文件需要使用什么样的数据。这里有一个用于演示的简单示例。

创建 `TEST3.BAT` ：

```
@MD BACKUPS
COPY %1 BACKUPS\%1
```

变量是使用百分比符号和随后的数字表示的，因此，这个批处理文件将在你的当前目录中创建一个 `BACKUPS` 子目录，然后将复制变量 `%1` 到 `BACKUPS` 文件夹之中。这个变量是什么？当你运行批处理文件时，变量由你决定：

```
C:\TEMP>TEST3 TEMP1.BAT
TEST1.BAT => BACKUPS\TEST1.BAT
```

你的批处理文件已经复制 `TEST1.BAT` 到一个名称为 `BACKUPS` 的子目录，因为在你运行批处理文件时，你标识这个文件为一个参数。你的批处理文件将把 `%1` 替换为 `TEST1.BAT` 。

变量是按位置的。变量 `%1` 是你提供给命令的第一个参数，变量 `%2` 是第二个参数，以此类推。假设你创建一个批处理文件来列出一个目录的内容：

```
DIR %1
```

尝试运行它：

```
C:\TEMP>TEST4.BAT C:\HOME
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

这像预期一样的工作。但是下面这个却失败了：

```
C:\TEMP>TEST4.BAT C:\HOME C:\DOCS
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

如果你尝试它，你将得到第一个参数（`C:\HOME`）的列表，而得不到第二个参数（`C:\DOCS`）的列表。这是因为你的批处理文件仅查找一个变量（`%1`），此外，`DIR` 命令也仅能获取一个目录。

此外，当你运行一个批处理文件时，你也不需要为其具体指定扩展名 —— 除非你运气相当不好地为批处理文件选取了一个与 FreeDOS 外部命令或类似命令相同的名称。当 FreeDOS 执行命令时，它按下面的顺序执行：

  1. 内部命令
  2. 带有 *.COM 扩展名的外部命令
  3. 带有 *.EXE 扩展名的外部命令
  4. 批处理文件

### 多个参数

好的，选择重新编写 `TEST4.BAT` 文件来使一个命令可以获取两个参数，以便你可以看到这是如何工作的。首先，使用 `EDIT` 应用程序来创建一个简单的名称为 `FILE1.TXT` 的文本文件。在其中放置一段某种类型（例如，“Hello world”）的语句，并在你的 `TEMP` 工作目录中保存文件。

接下来，使用 `EDIT` 来更改你的 `TEST4.BAT` 文件：

```
COPY %1 %2
DIR
```

保存它，然后执行命令：

```
C:\TEMP\>TEST4 FILE1.TXT FILE2.TXT
```

在运行你的批处理文件时，你会看一个你的 `TEMP` 目录的目录列表。在列出的文件之中，你有 `FILE1.TXT` 和 `FILE2.TXT` ，它们是由你的批处理文件所创建的。

### 嵌套批处理文件

批处理文件的另一个功能是能够 “嵌套” ，这意味着一个批处理文件可以在另外一个批处理文件中被调用和运行。为查看这是如何工作的，从一对简单的批处理文件开始：

第一个文件被称为 `NBATCH1.BAT` ：

```
@ECHO OFF
ECHO Hello
CALL NBATCH2.BAT 
ECHO world
```

第一行 （`@ECHO OFF`） 轻轻地告诉批处理文件在你运行它时仅显示命令 （而不是命令本身） 的输出。你可能会在前面的示例中注意到这里有很多关于批处理文件正在做什么的反馈；在这种情况下，你正在允许你的批处理文件仅显示结果。

第二个批处理被称为 NBATCH2.BAT ：

```
echo from FreeDOS
```

使用 `EDIT` 来创建这两个文件，并在你的 TEMP 子目录中保存它们。运行 `NBATCH1.BAT` 来查看会发生什么：

```
C:\TEMP\>NBATCH1.BAT 
Hello
from FreeDOS
world
```

你的第二个批处理文件将在第一个批处理文件之中通过 `CALL` 命令来执行，它将提供在你 “Hello world” 信息中间的字符串 “from FreeDOS” 。

### FreeDOS 脚本

编写你自己的简单程序来自动执行通常需要大量输入的任务的批处理文件，是一种极好的方法。你使用的 FreeDOS 越多, 你将越熟悉它的命令，在你熟知命令后，在一个批处理文件中列出它们仅是一件使你的 FreeDOS 系统让你生活轻松的事情。尝试一下！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/batch-files-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[robsean]](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.freedos.org/
[3]: https://opensource.com/article/21/2/freedos-commands-you-need-know
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-15-introduction-to-batch-files/
[5]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-17-batch-file-variables-nested-batch-files/
