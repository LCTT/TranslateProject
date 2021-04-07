[#]: subject: (Understanding file names and directories in FreeDOS)
[#]: via: (https://opensource.com/article/21/3/files-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13208-1.html)

了解 FreeDOS 中的文件名和目录
======

> 了解如何在 FreeDOS 中创建，编辑和命名文件。

![](https://img.linux.net.cn/data/attachment/album/202103/16/094544qanrpbnlmltilump.jpg)

开源操作系统 [FreeDOS][2] 是一个久经考验的项目，可帮助用户玩复古游戏、更新固件、运行过时但受欢迎的应用以及研究操作系统设计。FreeDOS 提供了有关个人计算历史的见解（因为它实现了 80 年代初的事实上的操作系统），但是它是在现代环境中进行的。在本文中，我将使用 FreeDOS 来解释文件名和扩展名是如何发展的。

### 了解文件名和 ASCII 文本

FreeDOS 文件名遵循所谓的 *8.3 惯例*。这意味着所有的 FreeDOS 文件名都有两个部分，分别包含最多八个和三个字符。第一部分通常被称为*文件名*（这可能会让人有点困惑，因为文件名和文件扩展名的组合也被称为文件名）。这一部分可以有一个到八个字符。之后是*扩展名*，可以有零到三个字符。这两部分之间用一个点隔开。

文件名可以使用任何字母或数字。键盘上的许多其他字符也是允许的，但不是所有的字符。这是因为许多其他字符在 FreeDOS 中被指定了特殊用途。一些可以出现在 FreeDOS 文件名中的字符有：


```
~ ! @ # $ % ^ & ( ) _ - { } `
```

扩展 [ASCII][3] 字符集中也有一些字符可以使用，例如 `�`。

在 FreeDOS 中具有特殊意义的字符，因此不能用于文件名中，包括：

```
* / + | \ = ? [ ] ; : " . < > ,
```

另外，你不能在 FreeDOS 文件名中使用空格。FreeDOS 控制台[使用空格将命令的与选项和参数分隔][4]。

FreeDOS 是*不区分大小写*的，所以不管你是使用大写字母还是小写字母都无所谓。所有的字母都会被转换为大写字母，所以无论你做什么，你的文件最终都会在名称中使用大写字母。

#### 文件扩展名

FreeDOS 中的文件不需要有扩展名，但文件扩展名确实有一些用途。某些文件扩展名在 FreeDOS 中有内置的含义，例如：

  * **EXE**：可执行文件
  * **COM**：命令文件
  * **SYS**：系统文件
  * **BAT**：批处理文件

特定的软件程序使用其他扩展名，或者你可以在创建文件时使用它们。这些扩展名没有绝对的文件关联，因此如果你使用 FreeDOS 的文字处理器，你的文件使用什么扩展名并不重要。如果你愿意，你可以发挥创意，将扩展名作为你的文件系统的一部分。例如，你可以用 `*.JAN`、`*.FEB`、`*.MAR`、`*.APR` 等等来命名你的备忘录。

### 编辑文件

FreeDOS 自带的 Edit 应用可以快速方便地进行文本编辑。它是一个简单的编辑器，沿屏幕顶部有一个菜单栏，可以方便地访问所有常用的功能（如复制、粘贴、保存等）。

![Editing in FreeDOS][5]

正如你所期望的那样，还有很多其他的文本编辑器可以使用，包括小巧但用途广泛的 [e3 编辑器][7]。你可以在 GitLab 上找到各种各样的 [FreeDOS 应用][8] 。

### 创建文件

你可以在 FreeDOS 中使用 `touch` 命令创建空文件。这个简单的工具可以更新文件的修改时间或创建一个新文件。

```
C:\>touch foo.txt
C:\>dir
FOO      TXT    0  01-12-2021 10:00a
```

你也可以直接从 FreeDOS 控制台创建文件，而不需要使用 Edit 文本编辑器。首先，使用 `copy` 命令将控制台中的输入（简称 `con`）复制到一个新的文件对象中。用 `Ctrl+Z` 终止输入，然后按**回车**键：

```
C:\>copy con test.txt
con => test.txt
This is a test file.
^Z
```

`Ctrl+Z` 字符在控制台中显示为 `^Z`。它并没有被复制到文件中，而是作为文件结束（EOF）的分隔符。换句话说，它告诉 FreeDOS 何时停止复制。这是一个很好的技巧，可以用来做快速的笔记或开始一个简单的文档，以便以后工作。

### 文件和 FreeDOS

FreeDOS 是开源的、免费的且 [易于安装][9]。探究 FreeDOS 如何处理文件，可以帮助你了解多年来计算的发展，不管你平时使用的是什么操作系统。启动 FreeDOS，开始探索现代复古计算吧！

_本文中的部分信息曾发表在 [DOS 课程 7：DOS 文件名；ASCII][10] 中（CC BY-SA 4.0）。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/files-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.freedos.org/
[3]: tmp.2sISc4Tp3G#ASCII
[4]: https://opensource.com/article/21/2/set-your-path-freedos
[5]: https://opensource.com/sites/default/files/uploads/freedos_2_files-edit.jpg (Editing in FreeDOS)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/20/12/e3-linux
[8]: https://gitlab.com/FDOS/
[9]: https://opensource.com/article/18/4/gentle-introduction-freedos
[10]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-7-dos-filenames-ascii/
