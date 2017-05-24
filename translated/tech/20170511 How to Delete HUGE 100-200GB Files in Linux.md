如何在 Linux 中删除大（100-200GB）文件
============================================================

通常，要[在 Linux 终端删除一个文件][1]，我们使用 rm 命令(删除文件)、shred 命令（安全删除文件）、wipe 命令(安全擦除文件)或者 secure-deletion 工具包（一个[安全文件删除工具][2]集合）。

我们可以使用上面任意的工具来处理相对较小的文件。如果我们想要删除大的文件/文件夹，比如大概 100-200GB。这个方法在删除文件（I/O 调度）所花费的时间以及 RAM 占用量方面看起来可能并不容易。

在本教程中，我们会解释如何在 Linux 中有效率并可靠地删除大文件/文件夹。

**建议阅读：** [5 个在 Linux 中清空或者删除大文件内容的方法][3]

主要的目标是使用一种不会在删除大文件时拖慢系统的技术，并有合理的 I/O 占用。我们可以用 **ionice 命令**实现这个目标。

### 在 Linux 中使用 ionice 命令删除大（200GB）文件

ionice 是一个可以为另一个程序设置或获取 I/O 调度级别和优先级的有用程序。如果没有给出参数或者只有 `-p`，那么 ionice 将会查询该进程的当前的 I/O 调度级别以及优先级。

如果我们给出命令名称，如 rm 命令，它将使用给定的参数运行此命令。要指定要获取或设置调度参数的[进程的进程 ID][4]，运行这个：

```
# ionice -p PID
```

要指定名字或者调度的数字，使用（0 表示无、1 表示实时、2 表示尽力、3 表示空闲）下面的命令。

这意味这 rm 会属于空闲 I/O 级别，并且只在其他进程不使用的时候使用 I/O：

```
---- Deleting Huge Files in Linux -----
# ionice -c 3 rm /var/logs/syslog
# ionice -c 3 rm -rf /var/log/apache
```

如果系统中没有很多空闲时间，那么我们希望使用尽力调度级别，并且使用低优先级：

```
# ionice -c 2 -n 6 rm /var/logs/syslog
# ionice -c 2 -n 6 rm -rf /var/log/apache
```

注意：要使用安全的方法删除大文件，我们可以使用先前提到的 shred、wipe 以及 secure-deletion 工具包中的不同工具，而不是 rm 命令。

**建议阅读：**[3 个在 Linux 中永久/安全删除文件/文件夹的方法][5]

要获取更多信息，查阅 ionice 的手册页：

```
# man ionice 
```

就是这样了！你脑海里还有其他的方法么？在评论栏中与我们分享。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

------------------

via: https://www.tecmint.com/delete-huge-files-in-linux/

作者：[Aaron Kili  ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[2]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[3]:https://www.tecmint.com/empty-delete-file-content-linux/
[4]:https://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[5]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[6]:https://www.tecmint.com/delete-huge-files-in-linux/#
[7]:https://www.tecmint.com/delete-huge-files-in-linux/#
[8]:https://www.tecmint.com/delete-huge-files-in-linux/#
[9]:https://www.tecmint.com/delete-huge-files-in-linux/#
[10]:https://www.tecmint.com/delete-huge-files-in-linux/#comments
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/
