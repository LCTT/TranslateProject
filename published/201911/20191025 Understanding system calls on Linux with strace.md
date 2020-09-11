[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11545-1.html)
[#]: subject: (Understanding system calls on Linux with strace)
[#]: via: (https://opensource.com/article/19/10/strace)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

在 Linux 上用 strace 来理解系统调用
======

> 使用 strace 跟踪用户进程和 Linux 内核之间的交互。

![Hand putting a Linux file folder into a drawer][1]

<ruby>系统调用<rt>system call</rt></ruby>是程序从内核请求服务的一种编程方式，而 `strace` 是一个功能强大的工具，可让你跟踪用户进程与 Linux 内核之间的交互。

要了解操作系统的工作原理，首先需要了解系统调用的工作原理。操作系统的主要功能之一是为用户程序提供抽象机制。

操作系统可以大致分为两种模式：

* 内核模式：操作系统内核使用的一种强大的特权模式
* 用户模式：大多数用户应用程序运行的地方
   
用户大多使用命令行实用程序和图形用户界面（GUI）来执行日常任务。系统调用在后台静默运行，与内核交互以完成工作。

系统调用与函数调用非常相似，这意味着它们都接受并处理参数然后返回值。唯一的区别是系统调用进入内核，而函数调用不进入。从用户空间切换到内核空间是使用特殊的 [trap][2] 机制完成的。

通过使用系统库（在 Linux 系统上又称为 glibc），大部分系统调用对用户隐藏了。尽管系统调用本质上是通用的，但是发出系统调用的机制在很大程度上取决于机器（架构）。

本文通过使用一些常规命令并使用 `strace` 分析每个命令进行的系统调用来探索一些实际示例。这些示例使用 Red Hat Enterprise Linux，但是这些命令运行在其他 Linux 发行版上应该也是相同的：

```
[root@sandbox ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.7 (Maipo)
[root@sandbox ~]#
[root@sandbox ~]# uname -r
3.10.0-1062.el7.x86_64
[root@sandbox ~]#
```

首先，确保在系统上安装了必需的工具。你可以使用下面的 `rpm` 命令来验证是否安装了 `strace`。如果安装了，则可以使用 `-V` 选项检查 `strace` 实用程序的版本号：

```
[root@sandbox ~]# rpm -qa | grep -i strace
strace-4.12-9.el7.x86_64
[root@sandbox ~]#
[root@sandbox ~]# strace -V
strace -- version 4.12
[root@sandbox ~]#
```

如果没有安装，运行命令安装：

```
yum install strace
```

出于本示例的目的，在 `/tmp` 中创建一个测试目录，并使用 `touch` 命令创建两个文件：

```
[root@sandbox ~]# cd /tmp/
[root@sandbox tmp]#
[root@sandbox tmp]# mkdir testdir
[root@sandbox tmp]#
[root@sandbox tmp]# touch testdir/file1
[root@sandbox tmp]# touch testdir/file2
[root@sandbox tmp]#
```

（我使用 `/tmp` 目录是因为每个人都可以访问它，但是你可以根据需要选择另一个目录。）

在 `testdir` 目录下使用 `ls` 命令验证该文件已经创建：

```
[root@sandbox tmp]# ls testdir/
file1  file2
[root@sandbox tmp]#
```

你可能每天都在使用 `ls` 命令，而没有意识到系统调用在其下面发挥的作用。抽象地来说，该命令的工作方式如下：

> 命令行工具 -> 从系统库（glibc）调用函数 -> 调用系统调用

`ls` 命令内部从 Linux 上的系统库（即 glibc）调用函数。这些库去调用完成大部分工作的系统调用。

如果你想知道从 glibc 库中调用了哪些函数，请使用 `ltrace` 命令，然后跟上常规的 `ls testdir/`命令：

```
ltrace ls testdir/
```

如果没有安装 `ltrace`，键入如下命令安装：

```
yum install ltrace
```

大量的输出会被堆到屏幕上；不必担心，只需继续就行。`ltrace` 命令输出中与该示例有关的一些重要库函数包括：

```
opendir("testdir/")                                  = { 3 }
readdir({ 3 })                                       = { 101879119, "." }
readdir({ 3 })                                       = { 134, ".." }
readdir({ 3 })                                       = { 101879120, "file1" }
strlen("file1")                                      = 5
memcpy(0x1665be0, "file1\0", 6)                      = 0x1665be0
readdir({ 3 })                                       = { 101879122, "file2" }
strlen("file2")                                      = 5
memcpy(0x166dcb0, "file2\0", 6)                      = 0x166dcb0
readdir({ 3 })                                       = nil
closedir({ 3 })                                         
```

通过查看上面的输出，你或许可以了解正在发生的事情。`opendir` 库函数打开一个名为 `testdir` 的目录，然后调用 `readdir` 函数，该函数读取目录的内容。最后，有一个对 `closedir` 函数的调用，该函数将关闭先前打开的目录。现在请先忽略其他 `strlen` 和 `memcpy` 功能。

你可以看到正在调用哪些库函数，但是本文将重点介绍由系统库函数调用的系统调用。

与上述类似，要了解调用了哪些系统调用，只需将 `strace` 放在 `ls testdir` 命令之前，如下所示。 再次，一堆乱码丢到了你的屏幕上，你可以按照以下步骤进行操作：

```
[root@sandbox tmp]# strace ls testdir/
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
brk(NULL)                               = 0x1f12000
<<< truncated strace output >>>
write(1, "file1  file2\n", 13file1  file2
)          = 13
close(1)                                = 0
munmap(0x7fd002c8d000, 4096)            = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
[root@sandbox tmp]#
```

运行 `strace` 命令后屏幕上的输出就是运行 `ls` 命令的系统调用。每个系统调用都为操作系统提供了特定的用途，可以将它们大致分为以下几个部分：

* 进程管理系统调用
* 文件管理系统调用
* 目录和文件系统管理系统调用
* 其他系统调用

分析显示到屏幕上的信息的一种更简单的方法是使用 `strace` 方便的 `-o` 标志将输出记录到文件中。在 `-o` 标志后添加一个合适的文件名，然后再次运行命令：

```
[root@sandbox tmp]# strace -o trace.log ls testdir/
file1  file2
[root@sandbox tmp]#
```

这次，没有任何输出干扰屏幕显示，`ls` 命令如预期般工作，显示了文件名并将所有输出记录到文件 `trace.log` 中。仅仅是一个简单的 `ls` 命令，该文件就有近 100 行内容：

```
[root@sandbox tmp]# ls -l trace.log
-rw-r--r--. 1 root root 7809 Oct 12 13:52 trace.log
[root@sandbox tmp]#
[root@sandbox tmp]# wc -l trace.log
114 trace.log
[root@sandbox tmp]#
```

让我们看一下这个示例的 `trace.log` 文件的第一行:

```
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
```

* 该行的第一个单词 `execve` 是正在执行的系统调用的名称。
* 括号内的文本是提供给该系统调用的参数。
* 符号 `=` 后的数字（在这种情况下为 `0`）是 `execve` 系统调用的返回值。

现在的输出似乎还不太吓人，对吧。你可以应用相同的逻辑来理解其他行。

现在，将关注点集中在你调用的单个命令上，即 `ls testdir`。你知道命令 `ls` 使用的目录名称，那么为什么不在 `trace.log` 文件中使用 `grep` 查找 `testdir` 并查看得到的结果呢？让我们详细查看一下结果的每一行：

```
[root@sandbox tmp]# grep testdir trace.log
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
stat("testdir/", {st_mode=S_IFDIR|0755, st_size=32, ...}) = 0
openat(AT_FDCWD, "testdir/", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
[root@sandbox tmp]#
```

回顾一下上面对 `execve` 的分析，你能说一下这个系统调用的作用吗？

```
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
```

你无需记住所有系统调用或它们所做的事情，因为你可以在需要时参考文档。手册页可以解救你！在运行 `man` 命令之前，请确保已安装以下软件包：

```
[root@sandbox tmp]# rpm -qa | grep -i man-pages
man-pages-3.53-5.el7.noarch
[root@sandbox tmp]#
```

请记住，你需要在 `man` 命令和系统调用名称之间添加 `2`。如果使用 `man man` 阅读 `man` 命令的手册页，你会看到第 2 节是为系统调用保留的。同样，如果你需要有关库函数的信息，则需要在 `man` 和库函数名称之间添加一个 `3`。

以下是手册的章节编号及其包含的页面类型：

* `1`：可执行的程序或 shell 命令
* `2`：系统调用（由内核提供的函数）
* `3`：库调用（在程序的库内的函数）
* `4`：特殊文件（通常出现在 `/dev`）

使用系统调用名称运行以下 `man` 命令以查看该系统调用的文档：

```
man 2 execve
```

按照 `execve` 手册页，这将执行在参数中传递的程序（在本例中为 `ls`）。可以为 `ls` 提供其他参数，例如本例中的 `testdir`。因此，此系统调用仅以 `testdir` 作为参数运行 `ls`：

```
execve - execute program

DESCRIPTION
       execve()  executes  the  program  pointed to by filename
```

下一个系统调用，名为 `stat`，它使用 `testdir` 参数：

```
stat("testdir/", {st_mode=S_IFDIR|0755, st_size=32, ...}) = 0
```

使用 `man 2 stat` 访问该文档。`stat` 是获取文件状态的系统调用，请记住，Linux 中的一切都是文件，包括目录。

接下来，`openat` 系统调用将打开 `testdir`。密切注意返回的 `3`。这是一个文件描述符，将在以后的系统调用中使用：

```
openat(AT_FDCWD, "testdir/", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
```

到现在为止一切都挺好。现在，打开 `trace.log` 文件，并转到 `openat` 系统调用之后的行。你会看到 `getdents` 系统调用被调用，该调用完成了执行 `ls testdir` 命令所需的大部分操作。现在，从 `trace.log` 文件中用 `grep` 获取 `getdents`：

```
[root@sandbox tmp]# grep getdents trace.log
getdents(3, /* 4 entries */, 32768)     = 112
getdents(3, /* 0 entries */, 32768)     = 0
[root@sandbox tmp]#
```

`getdents` 的手册页将其描述为 “获取目录项”，这就是你要执行的操作。注意，`getdents` 的参数是 `3`，这是来自上面 `openat` 系统调用的文件描述符。

现在有了目录列表，你需要一种在终端中显示它的方法。因此，在日志中用 `grep` 搜索另一个用于写入终端的系统调用 `write`：

```
[root@sandbox tmp]# grep write trace.log
write(1, "file1  file2\n", 13)          = 13
[root@sandbox tmp]#
```

在这些参数中，你可以看到将要显示的文件名：`file1` 和 `file2`。关于第一个参数（`1`），请记住在 Linux 中，当运行任何进程时，默认情况下会为其打开三个文件描述符。以下是默认的文件描述符：

* `0`：标准输入
* `1`：标准输出
* `2`：标准错误

因此，`write` 系统调用将在标准显示（就是这个终端，由 `1` 所标识的）上显示 `file1` 和 `file2`。

现在你知道哪个系统调用完成了 `ls testdir/` 命令的大部分工作。但是在 `trace.log` 文件中其它的 100 多个系统调用呢？操作系统必须做很多内务处理才能运行一个进程，因此，你在该日志文件中看到的很多内容都是进程初始化和清理。阅读整个 `trace.log` 文件，并尝试了解 `ls` 命令是怎么工作起来的。

既然你知道了如何分析给定命令的系统调用，那么就可以将该知识用于其他命令来了解正在执行哪些系统调用。`strace` 提供了许多有用的命令行标志，使你更容易使用，下面将对其中一些进行描述。

默认情况下，`strace` 并不包含所有系统调用信息。但是，它有一个方便的 `-v` 冗余选项，可以在每个系统调用中提供附加信息：

```
strace -v ls testdir
```

在运行 `strace` 命令时始终使用 `-f` 选项是一种好的作法。它允许 `strace` 对当前正在跟踪的进程创建的任何子进程进行跟踪：

```
strace -f ls testdir
```

假设你只需要系统调用的名称、运行的次数以及每个系统调用花费的时间百分比。你可以使用 `-c` 标志来获取这些统计信息：

```
strace -c ls testdir/
```

假设你想专注于特定的系统调用，例如专注于 `open` 系统调用，而忽略其余部分。你可以使用`-e` 标志跟上系统调用的名称：

```
[root@sandbox tmp]# strace -e open ls testdir
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libcap.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libacl.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpcre.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libattr.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
file1  file2
+++ exited with 0 +++
[root@sandbox tmp]#
```

如果你想关注多个系统调用怎么办？不用担心，你同样可以使用 `-e` 命令行标志，并用逗号分隔开两个系统调用的名称。例如，要查看 `write` 和 `getdents` 系统调用：

```
[root@sandbox tmp]# strace -e write,getdents ls testdir
getdents(3, /* 4 entries */, 32768)     = 112
getdents(3, /* 0 entries */, 32768)     = 0
write(1, "file1  file2\n", 13file1  file2
)          = 13
+++ exited with 0 +++
[root@sandbox tmp]#
```

到目前为止，这些示例是明确地运行的命令进行了跟踪。但是，要跟踪已经运行并正在执行的命令又怎么办呢？例如，如果要跟踪用来长时间运行进程的守护程序，该怎么办？为此，`strace` 提供了一个特殊的 `-p` 标志，你可以向其提供进程 ID。

我们的示例不在守护程序上运行 `strace`，而是以 `cat` 命令为例，如果你将文件名作为参数，通常 `cat` 会显示文件的内容。如果没有给出参数，`cat` 命令会在终端上等待用户输入文本。输入文本后，它将重复给定的文本，直到用户按下 `Ctrl + C` 退出为止。

从一个终端运行 `cat` 命令；它会向你显示一个提示，并等待在那里（记住 `cat` 仍在运行且尚未退出）：

```
[root@sandbox tmp]# cat
```

在另一个终端上，使用 `ps` 命令找到进程标识符（PID）：

```
[root@sandbox ~]# ps -ef | grep cat
root      22443  20164  0 14:19 pts/0    00:00:00 cat
root      22482  20300  0 14:20 pts/1    00:00:00 grep --color=auto cat
[root@sandbox ~]#
```

现在，使用 `-p` 标志和 PID（在上面使用 `ps` 找到）对运行中的进程运行 `strace`。运行 `strace` 之后，其输出说明了所接驳的进程的内容及其 PID。现在，`strace` 正在跟踪 `cat` 命令进行的系统调用。看到的第一个系统调用是 `read`，它正在等待文件描述符 `0`（标准输入，这是运行 `cat` 命令的终端）的输入：

```
[root@sandbox ~]# strace -p 22443
strace: Process 22443 attached
read(0,
```

现在，返回到你运行 `cat` 命令的终端，并输入一些文本。我出于演示目的输入了 `x0x0`。注意 `cat` 是如何简单地重复我输入的内容的。因此，`x0x0` 出现了两次。我输入了第一个，第二个是 `cat` 命令重复的输出：

```
[root@sandbox tmp]# cat
x0x0
x0x0
```

返回到将 `strace` 接驳到 `cat` 进程的终端。现在你会看到两个额外的系统调用：较早的 `read` 系统调用，现在在终端中读取 `x0x0`，另一个为 `write`，它将 `x0x0` 写回到终端，然后是再一个新的 `read`，正在等待从终端读取。请注意，标准输入（`0`）和标准输出（`1`）都在同一终端中：

```
[root@sandbox ~]# strace -p 22443
strace: Process 22443 attached
read(0, "x0x0\n", 65536)                = 5
write(1, "x0x0\n", 5)                   = 5
read(0,
```

想象一下，对守护进程运行 `strace` 以查看其在后台执行的所有操作时这有多大帮助。按下 `Ctrl + C` 杀死 `cat` 命令；由于该进程不再运行，因此这也会终止你的 `strace` 会话。

如果要查看所有的系统调用的时间戳，只需将 `-t` 选项与 `strace` 一起使用：

```
[root@sandbox ~]#strace -t ls testdir/

14:24:47 execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
14:24:47 brk(NULL)                      = 0x1f07000
14:24:47 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2530bc8000
14:24:47 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
14:24:47 open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
```

如果你想知道两次系统调用之间所花费的时间怎么办？`strace` 有一个方便的 `-r` 命令，该命令显示执行每个系统调用所花费的时间。非常有用，不是吗？

```
[root@sandbox ~]#strace -r ls testdir/

0.000000 execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
0.000368 brk(NULL)                 = 0x1966000
0.000073 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fb6b1155000
0.000047 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
0.000119 open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
```

### 总结

`strace` 实用程序非常有助于理解 Linux 上的系统调用。要了解它的其它命令行标志，请参考手册页和在线文档。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/strace

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://en.wikipedia.org/wiki/Trap_(computing)
