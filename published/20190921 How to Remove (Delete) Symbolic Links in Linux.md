[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11382-1.html)
[#]: subject: (How to Remove (Delete) Symbolic Links in Linux)
[#]: via: (https://www.2daygeek.com/remove-delete-symbolic-link-softlink-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中怎样移除（删除）符号链接
======

你可能有时需要在 Linux 上创建或者删除符号链接。如果有，你知道该怎样做吗？之前你做过吗？你踩坑没有？如果你踩过坑，那没什么问题。如果还没有，别担心，我们将在这里帮助你。

使用 `rm` 和 `unlink` 命令就能完成移除（删除）符号链接的操作。

### 什么是符号链接？

符号链接（symlink）又称软链接，它是一种特殊的文件类型，在 Linux 中该文件指向另一个文件或者目录。它类似于 Windows 中的快捷方式。它能在相同或者不同的文件系统或分区中指向一个文件或着目录。

符号链接通常用来链接库文件。它也可用于链接日志文件和挂载的 NFS（网络文件系统）上的文件夹。

### 什么是 rm 命令？

[rm 命令][1] 被用来移除文件和目录。它非常危险，你每次使用 `rm` 命令的时候要非常小心。

### 什么是 unlink 命令？

`unlink` 命令被用来移除特殊的文件。它被作为 GNU Gorutils 的一部分安装了。

### 1) 使用 rm 命令怎样移除符号链接文件

`rm` 命令是在 Linux 中使用最频繁的命令，它允许我们像下列描述那样去移除符号链接。

```
# rm symlinkfile
```

始终将 `rm` 命令与 `-i` 一起使用以了解正在执行的操作。

```
# rm -i symlinkfile1
rm: remove symbolic link ‘symlinkfile1’? y
```

它允许我们一次移除多个符号链接：

```
# rm -i symlinkfile2 symlinkfile3

rm: remove symbolic link ‘symlinkfile2’? y
rm: remove symbolic link ‘symlinkfile3’? y
```

#### 1a) 使用 rm 命令怎样移除符号链接目录

这像移除符号链接文件那样。使用下列命令移除符号链接目录。

```
# rm -i symlinkdir

rm: remove symbolic link ‘symlinkdir’? y
```

使用下列命令移除多个符号链接目录。

```
# rm -i symlinkdir1 symlinkdir2

rm: remove symbolic link ‘symlinkdir1’? y
rm: remove symbolic link ‘symlinkdir2’? y
```

如果你在结尾增加 `/`，这个符号链接目录将不会被删除。如果你加了，你将得到一个错误。

```
# rm -i symlinkdir/

rm: cannot remove ‘symlinkdir/’: Is a directory
```

你可以增加 `-r` 去处理上述问题。**但如果你增加这个参数，它将会删除目标目录下的内容，并且它不会删除这个符号链接文件。**（LCTT 译注：这可能不是你的原意。）

```
# rm -ri symlinkdir/

rm: descend into directory ‘symlinkdir/’? y
rm: remove regular file ‘symlinkdir/file4.txt’? y
rm: remove directory ‘symlinkdir/’? y
rm: cannot remove ‘symlinkdir/’: Not a directory
```

### 2) 使用 unlink 命令怎样移除符号链接

`unlink` 命令删除指定文件。它一次仅接受一个文件。

删除符号链接文件：

```
# unlink symlinkfile
```

删除符号链接目录：

```
# unlink symlinkdir2
```

如果你在结尾增加 `/`，你不能使用 `unlink` 命令删除符号链接目录。

```
# unlink symlinkdir3/

unlink: cannot unlink ‘symlinkdir3/’: Not a directory
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/remove-delete-symbolic-link-softlink-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-remove-files-directories-folders-rm-command/
