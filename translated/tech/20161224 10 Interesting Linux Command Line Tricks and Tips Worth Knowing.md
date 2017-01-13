10 个有趣的 Linux 命令行小技巧值得了解
============================================================

我非常喜欢使用命令，因为他们比 GUIs（图形用户界面）应用程序对 Linux 系统提供更多的控制。因此，我一直在寻找一些有趣的方式[让 Linux 的操作变得简单好玩][1]，主要是基于终端操作。

当我们发现[使用 Linux 的新技巧][2]，尤其是像我这样的命令行极客，我们总会感到非常来劲。

而且我们也会很想与数百万 Linux 用户分享新学到的实践或命令，特别是那些依旧使用自己的方式操作这个令人兴奋的操作系统的新手。

**建议阅读：** [10 个对新手有用的 Linux 命令行技巧 - 第二部分][3]

在这篇文章中，我们将回顾一系列[有用的命令行小技巧][4]，他们可以有效地提高你的 Linux 使用技能。

### 1\. 在 Linux 中锁定或隐藏文件或目录

锁定文件或目录最简单的方法是使用 Linux 文件权限。如果你是文件或目录的所有者，你就可以阻止（删除、读、写、执行权限）其他用户和组访问它，如下所示：

```
$ chmod 700 tecmint.info
OR
$ chmod go-rwx tecmint.info
```

想要了解更多有关 Linux 文件权限的内容，请阅读这篇文章[在 Linux 中管理用户和组，文件权限和属性][5]。

为了实现对其他系统用户隐藏文件或目录，可以通过在文件或目录开头添加 `(.)` 的方式执行重命名：

```
$ mv filename .tecmint.info
```

### 2\. 在 Linux 中将 rwx 权限转为八进制格式

默认情况下，当你运行 [ls 命令]之后，它会以 `rwx` 格式显示文件权限，为了理解 rwx 格式和八进制格式的等同性，你可以学习如何[在 Linux 中将 rwx 权限转为八进制格式]。

### 3\. 当 `sudo` 命令运行失败时怎么使用 `su` 命令

虽然 [sudo 命令][8]是用来执行具有超级用户权限的命令，但是在某些情况下它也会执行失败，如下所示。

在这里，我想[清空一个大文件的内容][9]，其文件名为 `uptime.log`，但是即便我是使用 sudo 执行也失败了。

```
$ cat /dev/null >/var/log/uptime.log
$ sudo cat /dev/null >/var/log/uptime.log
```
[
 ![在 Linux 中清空大文件的内容](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Content-in-Linux.png)
][10]

在 Linux 中清空大文件的内容

在这种情况下，你需要使用 su 命令切换到 root 用户，然后像这样去执行这个操作：

```
$ su
$ sudo cat /dev/null >/var/log/uptime.log
$ cat /var/log/uptime.log
```
[
 ![切换到超级用户](http://www.tecmint.com/wp-content/uploads/2016/12/Switch-to-Super-User.png)
][11]

切换到超级用户

尝试理解 [su 和 sudo 之间的区别][12]，另外，通过阅读他们的手册页以了解更多使用指南：

```
$ man sudo
$ man su
```

### 4\. 在 Linux 中结束一个进程

有些时候，你想要[使用 kill、killall、pkill 命令结束一个进程][13]，它们可能会执行失败，你意识到这个进程仍然还在系统上运行。

为了强制结束一个进程，发送 `-KILL` 信号给它。

首先[确定指定进程 ID][14]，然后像这样结束该进程：

```
$ pidof vlc
$ sudo kill -KILL 10279
```
[
 ![在 Linux 中查找和结束进程](http://www.tecmint.com/wp-content/uploads/2016/12/Find-and-Kill-Process-in-Linux.png) 
][15]

在 Linux 中查找和结束进程

查看 [kill 命令][16]以获取更多的使用选项和信息。

### 5\. 在 Linux 中永久删除文件

通常，我们使用 rm 命令将文件从 Linux 系统中删除，然而，这些文件并没有被完全删除，它们只是被简单地隐藏存放在硬盘中，其他用户仍然可以[在 Linux 中恢复这些文件][17]并查看。

为了防止这种情况发生，我们可以使用 shred 命令来重复覆盖文件的内容，并在完成覆盖后选择删除文件。

```
$ shred -zvu tecmint.pdf
```

上述命令中使用的选项：

1.  `-z` – 最后一次使用 0 进行覆盖以隐藏覆盖动作。
2.  `-u` – 覆盖后截断并移除文件。
3.  `-v` – 显示详细过程。

[
 ![在 Linux 中永久删除文件](http://www.tecmint.com/wp-content/uploads/2016/12/Delete-File-Permanently-in-Linux.png) 
][18]

在 Linux 中永久删除文件

阅读 shred 手册以获取更多的使用说明。

```
$ man shred
```

### 6\. 在 Linux 中重命名多个文件

你可以通过使用 rename 命令随时[在 Linux 中重命名多个文件][19]。

rename 命令会根据第一个参数中的规则重命名指定文件。

以下命令会将所有 `.pdf` 文件重命名为 `.doc` 文件，使用的规则为 `'s/\.pdf$/\.doc/'`：

```
$ rename -v 's/\.pdf$/\.doc/' *.pdf
```
 ![在 Linux 中重命名多个文件](http://www.tecmint.com/wp-content/uploads/2016/12/Rename-Multiple-Files-in-Linux.png) 
][20]

在 Linux 中重命名多个文件

The next example renames all files matching `"*.bak"` to strip the extension, where `'s/\e.bak$//'` is the rule:
接下来的例子将会重命名所有匹配 `"*.bak"` 的文件来移除其拓展名，使用的规则为 `'s/\e.bak$//'`：

```
$ rename -v 's/\e.bak$//' *.bak
```

### 7\. 在 Linux 中检查单词拼写

The look command displays lines beginning with a given string, it can help you to check for the spelling of word from within the command line. Although it is not so effective and reliable, look is still a useful alternative to other powerful spelling-checkers:
look 命令显示以给定字符串开头的行，它可以帮你检查命令行中的单词拼写。尽管它并不是那么有效和可靠，但它仍然算得上是其他强大的拼写检查工具的一个有用替代品。


```
$ look linu
$ look docum
```
[
 ![在 Linux 中检查单词拼写](http://www.tecmint.com/wp-content/uploads/2016/12/Spell-Checking-in-Linux.png) 
][21]

在 Linux 中检查单词拼写

### 8\. 在手册页中查找关键字的说明

man 命令用于显示命令的手册页，当使用 `-k` 选项时，它会将关键字 `printf`（或者如下命令中的关键字 adjust、apache、php ）作为正则表达式，来搜索相应的手册页说明。

```
$ man -k adjust
$ man -k apache
$ man -k php
```
[
 ![在手册页中显示关键字的说明](http://www.tecmint.com/wp-content/uploads/2016/12/Show-Description-of-Keyword-in-Manual-Pages.png)
][22]

在手册页中显示关键字的说明

### 9\. 在 Linux 中实时查看日志

With watch command, you can run [another Linux command periodically][23] while displaying its output on fullscreen and alongside [tail command][24] which is used to view the last parts of a file, it is possible to watch the recording of log entries in a logfile.
使用 watch 命令，你可以在全屏显示该命令输出的同时运行[另一个 Linux 命令][23]，并与用于查看文件最后部分的 [tail 命令]一起使用时，可以在日志文件中看到日志条目的记录。

在以下示例中，你将查看系统认证日志文件。打开两个终端窗口，在第一个窗口中实时监控日志文件，如下：

```
$ sudo watch tail /var/log/auth.log
```

你也可以使用 [tail 命令][25]显示文件的最后部分。使用 `-t` 选项可以实时查看到文件内容的变化，因此我们就可以在日志文件看到日志条目的记录。

```
$ sudo tail -f /var/log/auth.log
```

接着，在第二个终端窗口中运行以下命令，你就能从第一个终端窗口观察日志文件内容：

```
$ sudo mkdir -p /etc/test
$ sudo rm -rf /etc/test
```

### 10\. 列出所有 Shell 内置命令

shell 内置命令是一个命令或者函数，从内部调用并直接在 shell 里执行，而不是从硬盘加载外部的可执行程序来执行。

列出所有 shell 内置命令以及他们的语法，执行如下命令：

```
$ help
```

作为结束语，[命令行小技巧][26]不仅能派得上用场，而且让学习和使用 Linux 变得更加简单有趣，尤其是对新手来讲。

你也可以通过留言给我们分享其他在 Linux 中[有用有趣的命令行小技巧][27]，

--------------------------------------------------------------------------------


作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是一名 Linux 和 F.O.S.S 的爱好者，未来的 Linux 系统管理员、网站开发人员，目前是 TecMint 的写作者，他喜欢用电脑工作，并且乐忠于分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-command-line-tricks-and-tips-worth-knowing/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/zhb127)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
[2]:http://www.tecmint.com/tag/linux-tricks/
[3]:http://www.tecmint.com/10-useful-linux-command-line-tricks-for-newbies/
[4]:http://www.tecmint.com/10-useful-linux-command-line-tricks-for-newbies/
[5]:http://www.tecmint.com/manage-users-and-groups-in-linux/
[6]:http://www.tecmint.com/tag/linux-ls-command/
[7]:http://www.tecmint.com/check-linux-file-octal-permissions-using-stat-command/
[8]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[9]:http://www.tecmint.com/empty-delete-file-content-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Content-in-Linux.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Switch-to-Super-User.png
[12]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[13]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
[14]:http://www.tecmint.com/find-process-name-pid-number-linux/
[15]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-and-Kill-Process-in-Linux.png
[16]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
[17]:http://www.tecmint.com/recover-deleted-file-in-linux/
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Delete-File-Permanently-in-Linux.png
[19]:http://www.tecmint.com/rename-multiple-files-in-linux/
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/Rename-Multiple-Files-in-Linux.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/Spell-Checking-in-Linux.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/12/Show-Description-of-Keyword-in-Manual-Pages.png
[23]:http://www.tecmint.com/run-repeat-linux-command-every-x-seconds/
[24]:http://www.tecmint.com/view-contents-of-file-in-linux/
[25]:http://www.tecmint.com/view-contents-of-file-in-linux/
[26]:http://www.tecmint.com/tag/linux-tricks/
[27]:http://www.tecmint.com/5-linux-command-line-tricks/
