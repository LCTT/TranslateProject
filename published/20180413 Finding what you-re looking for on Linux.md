在 Linux 上寻找你正在寻找的东西
=====

> 怎样在 Linux 系统上使用 find、locate、mlocate、which、 whereis、 whatis 和 apropos 命令寻找文件。

![](https://images.idgesg.net/images/article/2018/04/binoculars-100754967-large.jpg)

在 Linux 系统上找到你要找的文件或命令并不难， 有很多种方法可以寻找。

### find

最显然的无疑是 `find` 命令，并且 `find` 变得比过去几年更容易使用了。它过去需要一个搜索的起始位置，但是现在，如果你想将搜索限制在当下目录中，你还可以使用仅包含文件名或正则表达式的 `find` 命令。

```
$ find e*
empty
examples.desktop
```

这样，它就像 `ls` 命令一样工作，并没有做太多的搜索。

对于更专业的搜索，`find` 命令需要一个起点和一些搜索条件（除非你只是希望它提供该起点目录的递归列表）。命令 `find -type f` 从当前目录开始将递归列出所有常规文件，而 `find ~nemo -type f -empty` 将在 nemo 的主目录中找到空文件。

```
$ find ~nemo -type f -empty
/home/nemo/empty
```

参见：[11 个好玩的 Linux 终端技巧][1]。

### locate

`locate` 命令的名称表明它与 `find` 命令基本相同，但它的工作原理完全不同。`find` 命令可以根据各种条件 —— 名称、大小、所有者、权限、状态（如空文件）等等选择文件并作为搜索选择深度，`locate` 命令通过名为 `/var/lib/mlocate/mlocate.db` 的文件查找你要查找的内容。该数据文件会定期更新，因此你刚创建的文件的位置它可能无法找到。如果这让你感到困扰，你可以运行 `updatedb` 命令立即获得更新。

```
$ sudo updatedb
```

### mlocate

`mlocate` 命令的工作类似于 `locate` 命令，它使用与 `locate` 相同的 `mlocate.db` 文件。

### which

`which` 命令的工作方式与 `find` 命令和 `locate` 命令有很大的区别。它使用你的搜索路径（`$PATH`）并检查其上的每个目录中具有你要查找的文件名的可执行文件。一旦找到一个，它会停止搜索并显示该可执行文件的完整路径。

`which` 命令的主要优点是它回答了“如果我输入此命令，将运行什么可执行文件？”的问题。它会忽略不可执行文件，并且不会列出系统上带有该名称的所有可执行文件 —— 列出的就是它找到的第一个。如果你想查找具有某个名称的所有可执行文件，则可以像这样运行 `find` 命令，但是要比非常高效 `which` 命令用更长的时间。

```
$ find / -name locate -perm -a=x 2>/dev/null
/usr/bin/locate
/etc/alternatives/locate
```

在这个 `find` 命令中，我们在寻找名为 “locate” 的所有可执行文件（任何人都可以运行的文件）。我们也选择了不要查看所有“拒绝访问”的消息，否则这些消息会混乱我们的屏幕。

### whereis

`whereis` 命令与 `which` 命令非常类似，但它提供了更多信息。它不仅仅是寻找可执行文件，它还寻找手册页（man page）和源文件。像 `which` 命令一样，它使用搜索路径（`$PATH`） 来驱动搜索。

```
$ whereis locate
locate: /usr/bin/locate /usr/share/man/man1/locate.1.gz
```

### whatis

`whatis` 命令有其独特的使命。它不是实际查找文件，而是在手册页中查找有关所询问命令的信息，并从手册页的顶部提供该命令的简要说明。

```
$ whatis locate
locate (1) - find files by name
```

如果你询问你刚刚设置的脚本，它不会知道你指的是什么，并会告诉你。

```
$ whatis cleanup
cleanup: nothing appropriate.
```

### apropos

当你知道你想要做什么，但不知道应该使用什么命令来执行此操作时，`apropos` 命令很有用。例如，如果你想知道如何查找文件，那么 `apropos find` 和 `apropos locate` 会提供很多建议。

```
$ apropos find
File::IconTheme (3pm) - find icon directories
File::MimeInfo::Applications (3pm) - Find programs to open a file by mimetype
File::UserDirs (3pm) - find extra media and documents directories
find (1) - search for files in a directory hierarchy
findfs (8) - find a filesystem by label or UUID
findmnt (8) - find a filesystem
gst-typefind-1.0 (1) - print Media type of file
ippfind (1) - find internet printing protocol printers
locate (1) - find files by name
mlocate (1) - find files by name
pidof (8) - find the process ID of a running program.
sane-find-scanner (1) - find SCSI and USB scanners and their device files
systemd-delta (1) - Find overridden configuration files
xdg-user-dir (1) - Find an XDG user dir
$
$ apropos locate
blkid (8) - locate/print block device attributes
deallocvt (1) - deallocate unused virtual consoles
fallocate (1) - preallocate or deallocate space to a file
IO::Tty (3pm) - Low-level allocate a pseudo-Tty, import constants.
locate (1) - find files by name
mlocate (1) - find files by name
mlocate.db (5) - a mlocate database
mshowfat (1) - shows FAT clusters allocated to file
ntfsfallocate (8) - preallocate space to a file on an NTFS volume
systemd-sysusers (8) - Allocate system users and groups
systemd-sysusers.service (8) - Allocate system users and groups
updatedb (8) - update a database for mlocate
updatedb.mlocate (8) - update a database for mlocate
whereis (1) - locate the binary, source, and manual page files for a...
which (1) - locate a command
```

### 总结

Linux 上可用于查找和识别文件的命令有很多种，但它们都非常有用。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268768/linux/finding-what-you-re-looking-for-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
