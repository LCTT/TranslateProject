[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10549-1.html)
[#]: subject: (10 Methods To Create A File In Linux)
[#]: via: (https://www.2daygeek.com/linux-command-to-create-a-file/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

在 Linux 上创建文件的 10 个方法
======

我们都知道，在 Linux 上，包括设备在内的一切都是文件。Linux 管理员每天应该会多次执行文件创建活动（可能是 20 次，50 次，甚至是更多，这依赖于他们的环境）。如果你想 [在Linux上创建一个特定大小的文件][1]，查看前面的这个链接。

高效创建一个文件是非常重要的能力。为什么我说高效？如果你了解一些高效进行你当前活动的方式，你就可以事半功倍。这将会节省你很多的时间。你可以把这些有用的时间用到到其他重要的事情上。  

我下面将会介绍多个在 Linux 上创建文件的方法。我建议你选择几个简单高效的来辅助你的工作。你不必安装下列的任何一个命令，因为它们已经作为 Linux 核心工具的一部分安装到你的系统上了。

创建文件可以通过以下六个方式来完成。  

  * `>`：标准重定向符允许我们创建一个 0KB 的空文件。  
  * `touch`：如果文件不存在的话，`touch` 命令将会创建一个 0KB 的空文件。  
  * `echo`：通过一个参数显示文本的某行。
  * `printf`：用于显示在终端给定的文本。
  * `cat`：它串联并打印文件到标准输出。
  * `vi`/`vim`：Vim 是一个向上兼容 Vi 的文本编辑器。它常用于编辑各种类型的纯文本。
  * `nano`：是一个简小且用户友好的编辑器。它复制了 `pico` 的外观和优点，但它是自由软件。
  * `head`：用于打印一个文件开头的一部分。
  * `tail`：用于打印一个文件的最后一部分。
  * `truncate`：用于缩小或者扩展文件的尺寸到指定大小。

### 在 Linux 上使用重定向符（>）创建一个文件  

标准重定向符允许我们创建一个 0KB 的空文件。它通常用于重定向一个命令的输出到一个新文件中。在没有命令的情况下使用重定向符号时，它会创建一个文件。  

但是它不允许你在创建文件时向其中输入任何文本。然而它对于不是很勤劳的管理员是非常简单有用的。只需要输入重定向符后面跟着你想要的文件名。

```
$ > daygeek.txt
```

使用 `ls` 命令查看刚刚创建的文件。  

```
$ ls -lh daygeek.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:00 daygeek.txt
```

### 在 Linux 上使用 touch 命令创建一个文件  

`touch` 命令常用于将每个文件的访问和修改时间更新为当前时间。

如果指定的文件名不存在，将会创建一个新的文件。`touch` 不允许我们在创建文件的同时向其中输入一些文本。它默认创建一个 0KB 的空文件。  

```
$ touch daygeek1.txt
```

使用 `ls` 命令查看刚刚创建的文件。  

```
$ ls -lh daygeek1.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:02 daygeek1.txt
```

### 在 Linux 上使用 echo 命令创建一个文件

`echo` 内置于大多数的操作系统中。它常用于脚本、批处理文件，以及作为插入文本的单个命令的一部分。  

它允许你在创建一个文件时就向其中输入一些文本。当然也允许你在之后向其中输入一些文本。  

```
$ echo "2daygeek.com is a best Linux blog to learn Linux" > daygeek2.txt
```

使用 `ls` 命令查看刚刚创建的文件。  

```
$ ls -lh daygeek2.txt
-rw-rw-r-- 1 daygeek daygeek 49 Feb 4 02:04 daygeek2.txt
```

可以使用 `cat` 命令查看文件的内容。  

```
$ cat daygeek2.txt
2daygeek.com is a best Linux blog to learn Linux
```

你可以使用两个重定向符 (`>>`) 添加其他内容到同一个文件。  

```
$ echo "It's FIVE years old blog" >> daygeek2.txt
```

你可以使用 `cat` 命令查看添加的内容。  

```
$ cat daygeek2.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### 在 Linux 上使用 printf 命令创建一个新的文件  

`printf` 命令也可以以类似 `echo` 的方式执行。  

`printf` 命令常用来显示在终端窗口给出的字符串。`printf` 可以有格式说明符、转义序列或普通字符。  

```
$ printf "2daygeek.com is a best Linux blog to learn Linux\n" > daygeek3.txt
```

使用 `ls` 命令查看刚刚创建的文件。  

```
$ ls -lh daygeek3.txt
-rw-rw-r-- 1 daygeek daygeek 48 Feb 4 02:12 daygeek3.txt
```

使用 `cat` 命令查看文件的内容。  

```
$ cat daygeek3.txt
2daygeek.com is a best Linux blog to learn Linux
```

你可以使用两个重定向符 (`>>`) 添加其他的内容到同一个文件中去。  

```
$ printf "It's FIVE years old blog\n" >> daygeek3.txt
```

你可以使用 `cat` 命令查看这个文件中添加的内容。  

```
$ cat daygeek3.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### 在 Linux 中使用 cat 创建一个文件

`cat` 表示<ruby>串联<rt>concatenate</rt></ruby>。在 Linux 经常用于读取一个文件中的数据。  

`cat` 是在类 Unix 系统中最常使用的命令之一。它提供了三个与文本文件相关的功能：显示一个文件的内容、组合多个文件的内容到一个输出以及创建一个新的文件。（LCTT 译注：如果 `cat` 命令后如果不带任何文件的话，下面的命令在回车后也不会立刻结束，回车后的操作可以按 `Ctrl-C` 或 `Ctrl-D` 来结束。）  

```
$ cat > daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

使用 `ls` 命令查看创建的文件。  

```
$ ls -lh daygeek4.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:18 daygeek4.txt
```

使用 `cat` 命令查看文件的内容。  

```
$ cat daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

如果你想向同一个文件中添加其他内容，使用两个连接的重定向符（`>>`）。 

```
$ cat >> daygeek4.txt
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

你可以使用 `cat` 命令查看添加的内容。  

```
$ cat daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

### 在 Linux 上使用 vi/vim 命令创建一个文件

`vim` 是一个向上兼容 `vi` 的文本编辑器。它通常用来编辑所有种类的纯文本。在编辑程序时特别有用。  

`vim` 中有很多功能可以用于编辑单个文件。  

```
$ vi daygeek5.txt

2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

使用 `ls` 查看刚才创建的文件。  

```
$ ls -lh daygeek5.txt
-rw-rw-r-- 1 daygeek daygeek 75 Feb 4 02:23 daygeek5.txt
```

使用 `cat` 命令查看文件的内容。  

```
$ cat daygeek5.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### 在 Linux 上使用 nano 命令创建一个文件

`nano` 是一个编辑器，它是一个自由版本的 `pico` 克隆。`nano` 是一个小且用户友好的编辑器。它复制了 `pico` 的外观及优点，并且是一个自由软件，它添加了 `pico` 缺乏的一系列特性，像是打开多个文件、逐行滚动、撤销/重做、语法高亮、行号等等。  

```
$ nano daygeek6.txt

2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

使用 `ls` 命令查看创建的文件。  

```
$ ls -lh daygeek6.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:26 daygeek6.txt
```

使用 `cat` 命令来查看一个文件的内容。  

```
$ cat daygeek6.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

### 在 Linux 上使用 head 命令创建一个文件  

`head` 命令通常用于输出一个文件开头的一部分。它默认会打印一个文件的开头 10 行到标准输出。如果有多个文件，则每个文件前都会有一个标题，用来表示文件名。

```
$ head -c 0K /dev/zero > daygeek7.txt
```

使用 `ls` 命令查看创建的文件。  

```
$ ls -lh daygeek7.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:30 daygeek7.txt
```

### 在 Linux 上使用 tail 创建一个文件

`tail` 命令通常用来输出一个文件最后的一部分。它默认会打印每个文件的最后 10 行到标准输出。如果有多个文件，则每个文件前都会有一个标题，用来表示文件名。

```
$ tail -c 0K /dev/zero > daygeek8.txt
```

使用 `ls` 命令查看创建的文件。  

```
$ ls -lh daygeek8.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:31 daygeek8.txt
```

### 在 Linux 上使用 truncate 命令创建一个文件

`truncate` 命令通常用作将一个文件的尺寸缩小或者扩展为某个指定的尺寸。  

```
$ truncate -s 0K daygeek9.txt
```

使用 `ls` 命令检查创建的文件。  

```
$ ls -lh daygeek9.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:37 daygeek9.txt
```

在这篇文章中，我使用这十个命令分别创建了下面的这十个文件。  

```
$ ls -lh daygeek*
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:02 daygeek1.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:07 daygeek2.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:15 daygeek3.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:20 daygeek4.txt
-rw-rw-r-- 1 daygeek daygeek 75 Feb 4 02:23 daygeek5.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:26 daygeek6.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:32 daygeek7.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:32 daygeek8.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:38 daygeek9.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:00 daygeek.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-to-create-a-file/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-a-file-in-specific-certain-size-linux/
