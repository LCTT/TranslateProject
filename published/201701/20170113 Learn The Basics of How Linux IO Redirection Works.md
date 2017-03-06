Linux I/O 重定向基础
============================================================

Linux 管理的一个最重要并且[有趣的话题][4]是 I/O 重定向。此功能在命令行中使你能够将命令的输入输出取自或送到文件中，或者可以使用管道将多个命令连接在一起以形成所谓的“**命令管道**”。

我们运行的所有命令基本上产生两种输出：

- 命令结果 - 程序产生的数据，以及
- 程序状态和错误消息，用来通知用户程序的执行细节。

在 Linux 和其他类 Unix 系统中，有三个默认文件（名称如下），这些文件也由 shell 使用文件描述符号标识：

- stdin 或 0 - 它连接键盘，大多数程序从此文件读取输入。
- stdout 或 1 - 它连接屏幕，并且所有程序将其结果发送到此文件
- stderr 或 2 - 程序将状态/错误消息发送到此文件，它也连接到屏幕上。

因此，I/O 重定向允许你更改命令的输入源以及将输出和错误消息发送到其他地方。这可以通过 `<` 和 `>` 重定向操作符来实现。

### 如何在 Linux 中重定向标准输出到文件中

如下面的示例所示，你可以重定向标准输出，这里，我们要存储 [top 命令][5]的输出以供以后检查：

```
$ top -bn 5 >top.log
```

其中标志的含义：

- `-b` - 让 `top` 以批处理模式运行，以便你可以将其输出重定向到一个文件或另一个命令。
- `-n` - 指定命令终止前的迭代次数。

你可以使用 [cat 命令][6]来查看 `top.log` 文件的内容：

```
$ cat top.log
```

要将命令输出**附加**在文件后面，请使用 `>>` 操作符。

例如，要将 [top 命令][7]的输出追加在上面的 `top.log` 文件中，特别是在脚本（或命令行）中，请输入下面的那行：

```
$ top -bn 5 >>top.log
```

**注意**： 也可以使用文件描述符数字，上面的重定向命令等同于：

```
$ top -bn 5 1>top.log
```

### 如何在 Linux 中重定向标准错误到文件中

要重定向命令的标准错误，你需要明确指定文件描述符 `2`，以便让 shell 了解你正在尝试做什么。

例如，下面的 [ls 命令][8]将在没有 root 权限的普通系统用户执行时产生错误：

```
$ ls -l /root/
```

你可以重定向标准错误到文件中：

```
$ ls -l /root/ 2>ls-error.log
$ cat ls-error.log 
```

[
 ![Redirect Standard Error to File](http://www.tecmint.com/wp-content/uploads/2017/01/Redirect-Standard-Error-in-Linux.png) 
][9]

*重定向标准错误到文件中*

为了将标准错误附加在文件后，使用下面的命令：

```
$ ls -l /root/ 2>>ls-error.log
```

### 如何重定向标准输出及标准错误到一个文件中

还可以将命令的所有输出（包括标准输出和标准错误）捕获到单个文件中。这可以用两种可能的方式，通过指定文件描述符来完成：

1、 第一种是相对较旧的方法，其工作方式如下：

```
$ ls -l /root/ >ls-error.log 2>&1
```

上面的命令意思是 shell 首先将 [ls 命令][10]的输出发送到文件 `ls-error.log`（使用 `>ls-error.log`），然后将所有写到文件描述符 `2`（标准错误）的错误消息重定向到文件 `ls-error.log`（使用`2>＆1`）中。（LCTT 译注：此处原文有误，径改。）这表示标准错误也被发送到与标准输出相同的文件中。


2、 第二种并且更直接的方法是：

```
$ ls -l /root/ &>ls-error.log
```

你也可以这样将标准输出和标准错误附加到单个文件后：

```
$ ls -l /root/ &>>ls-error.log
```

### 如何将标准输入重定向到文件中

大多数（如果不是全部）命令从标准输入获得其输入，并且标准输入默认连接到键盘。

要从键盘以外的文件重定向标准输入，请使用 `<` 操作符，如下所示：

```
$ cat <domains.list 
```

[
 ![Redirect Standard Input to File](http://www.tecmint.com/wp-content/uploads/2017/01/Redirect-Standard-Input-to-File.png) 
][11]

*重定向文件到标准输入中*

### 如何重定向标准输入/输出到文件中

你可以如下在 [sort 命令中][12] 同时执行标准输入、标准输出的重定向：

```
$ sort <domains.list >sort.output
```

### 如何使用管道进行 I/O 重定向
 
要将一个命令的输出重定向为另一个命令的输入，你可以使用管道，这是用于构建复杂操作命令的有力方法。


例如，以下命令将[列出最近修改的前五个文件][13]。

```
$ ls -lt | head -n 5 
```

选项的意思是：

- `-l` - 启用长列表格式
- `-t` - [最新修改的文件][1]首先显示
- `-n` - 指定要显示的标题行数

### 构建管道的重要命令

在这里，我们将简要回顾一下构建命令管道的两个重要命令，它们是：

`xargs` 用于从标准输入构建和执行命令行。下面是使用 `xargs` 的管道示例，此命令用于[将文件复制到 Linux 中的多个目录][14]：

```
$ echo /home/aaronkilik/test/ /home/aaronkilik/tmp | xargs -n 1 cp -v /home/aaronkilik/bin/sys_info.sh
```

[
 ![Copy Files to Multiple Directories](http://www.tecmint.com/wp-content/uploads/2017/01/Copy-Files-to-Multiple-Directories.png) 
][15]

*复制文件到多个目录*

选项含义：

- `-n 1` - 让 `xargs` 对每个命令行最多使用一个参数，并发送到 [cp命令][2]
- `cp` - 复制文件
- `-v` - [显示 `cp` 命令的进度][3]。

有关更多的使用选项和信息，请阅读 `xargs` 手册页：

```
$ man xargs 
```

`tee` 命令从标准输入读取，并写入到标准输出和文件中。我们可以演示 `tee` 如何工作：

```
$ echo "Testing how tee command works" | tee file1 
```
[
 ![tee Command Example](http://www.tecmint.com/wp-content/uploads/2017/01/tee-command-example.png) 
][16]

*tee 命令示例*

[文件或文本过滤器][17]通常与管道一起用于[有效地操作 Linux 文件][18]，来以强大的方式来处理信息，例如命令的重组输出（这对于[生成有用的 Linux 报告][19]是必不可少的）、修改文件中的文本和其他的 [Linux 系统管理任务][20]。

要了解有关 Linux 过滤器和管道的更多信息，请阅读这篇文章[查找前十个访问 Apache 服务器的 IP 地址][21]，这里展示了使用过滤器和管道的一个例子。

在本文中，我们解释了 Linux 中 I/O 重定向的基本原理。请通过下面的反馈栏分享你的想法。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin、web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-io-input-output-redirection-operators/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/find-and-sort-files-modification-date-and-time-in-linux/
[2]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[3]:http://www.tecmint.com/monitor-copy-backup-tar-progress-in-linux-using-pv-command/
[4]:http://www.tecmint.com/how-to-setup-and-configure-static-network-routing-in-rhel/
[5]:http://www.tecmint.com/12-top-command-examples-in-linux/
[6]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[7]:http://www.tecmint.com/12-top-command-examples-in-linux/
[8]:http://www.tecmint.com/tag/linux-ls-command/
[9]:http://www.tecmint.com/wp-content/uploads/2017/01/Redirect-Standard-Error-in-Linux.png
[10]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2017/01/Redirect-Standard-Input-to-File.png
[12]:http://www.tecmint.com/sort-command-linux/
[13]:http://www.tecmint.com/find-recent-modified-files-in-linux/
[14]:http://www.tecmint.com/copy-file-to-multiple-directories-in-linux/
[15]:http://www.tecmint.com/wp-content/uploads/2017/01/Copy-Files-to-Multiple-Directories.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/01/tee-command-example.png
[17]:http://www.tecmint.com/linux-file-operations-commands/
[18]:http://www.tecmint.com/linux-file-operations-commands/
[19]:http://www.tecmint.com/linux-performance-monitoring-and-file-system-statistics-reports/
[20]:http://www.tecmint.com/automating-linux-system-administration-tasks/
[21]:http://www.tecmint.com/find-top-ip-address-accessing-apache-web-server/
