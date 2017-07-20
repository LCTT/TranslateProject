如何在 Linux 中恢复仍在活动进程中的已删除文件
============================================================

> 使用终端恢复你 Linux 系统上仍在运行进程的已删除文件的快速指南。

许多情况下，删除的文件都可以恢复，比如在该文件有活动的进程在操作它，并且目前被单个或多个用户使用时。在 Linux 系统中，每个当前正在运行的进程都会获得 ID，其被称之为进程标识符 “PID”，并将它们存放在 `/proc` 目录中。这正是我们恢复仍在运行的进程中（具有PID）已删除的文件所需要的东西。这里就是介绍我们如何做到这一点的。

假设你打开了一个压缩文件，之后你删除了这个文件。为了演示目的，压缩文件称为 “opengapps.zip”，这将是之后我们将打开和删除的文件。

### 计算原始文件的 MD5 哈希

删除之前，我们将计算该文件的 MD5。这样我们可以将原来的 MD5 哈希值与恢复文件的 MD5 哈希进行比较。这个过程将保证我们恢复的压缩文件的完整性是一样的，它没有被破坏。

```
md5sum opengapps.zip >> md5-opengapps.txt
```

要显示文本文件的内容。

```
cat md5-opengapps.txt

86489b68b40d144f0e00a0ea8407f7c0  opengapps.zip
```

检查压缩文件的 MD5 哈希值之后。我们将压缩文件保持打开（LCTT 译注：此处是使用 file-roller 这个图形界面的解压程序保持对该压缩文件的打开，其内置在 GNOME 环境中；在桌面环境中，使用桌面工具打开一个压缩包也能起到同样的作用。又及，本文举例不是很恰当，如果是删除了某个服务进程的已经打开的配置文件，那么这种恢复就很有意义），并将其删除。之后，我们将从文件的恢复过程开始，步骤如下：

```
rm opengapps.zip
```

### 删除文件的恢复过程

正如我们前面提到的，运行的进程在 `/proc` 目录中。我们可以使用以下命令搜索该目录中需要的进程：

由于我们已经知道文件名包括 .zip 扩展名，因此我们可以使用 .zip 扩展名进行搜索。它将限制输出结果并显示所需的进程。

```
ps -axu | grep .zip

m        13119  0.8  1.0 121788 30788 ?        Sl   06:17   0:00 file-roller /home/m/Downloads/Compressed/opengapps.zip
m        13164  0.0  0.0   5108   832 pts/20   S+   06:18   0:00 grep --color=auto .zip
```

然后我们将进入到包含 PID `13119` 的目录并打开 `fd` 子目录。

```
cd /proc/13119/fd
```

`fd` （文件描述符）目录包含多个文件，包括我们需要恢复的文件。该文件以硬链接的方式链接到原始文件。 `fd` 目录中的所有文件都以数字链接到“文件名”。因此，要确定这些文件中的哪一个链接到该原始文件，我们将用详细列表选项列出 /fd 目录。

```
ls -l

total 0
lr-x------ 1 m m 64 Jul 14 06:17 0 -> /dev/null
lrwx------ 1 m m 64 Jul 14 06:17 1 -> socket:[26161]
lrwx------ 1 m m 64 Jul 14 06:17 10 -> anon_inode:[eventfd]
lr-x------ 1 m m 64 Jul 14 06:17 11 -> anon_inode:inotify
lrwx------ 1 m m 64 Jul 14 06:17 12 -> socket:[5752671]
lr-x------ 1 m m 64 Jul 14 06:17 13 -> /home/m/Downloads/Compressed/opengapps.zip (deleted)
lrwx------ 1 m m 64 Jul 14 06:17 2 -> socket:[26161]
lrwx------ 1 m m 64 Jul 14 06:17 3 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 4 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 5 -> socket:[5751361]
lrwx------ 1 m m 64 Jul 14 06:17 6 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 7 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 8 -> socket:[5751363]
lrwx------ 1 m m 64 Jul 14 06:17 9 -> socket:[5751365]
```

正如你在终端输出中看到的，原始文件 “opengapps.zip” 已被删除，但它仍然链接到一个文件名 `13`，其进程 PID `13119`。但是，我们仍然可以通过将链接的文件复制到安全的地方来恢复它。

```
cp 13 /home/m/Downloads/Compressed
```

文件复制后。我们将返回包含恢复文件的目录，并使用以下命令重命名它。

```
mv 13 opengapps-recovered.zip
```

### 计算恢复文件的 MD5 哈希

由于我们已经恢复了该文件。让我们检查该文件的完整性，这只是为了确保文件没有损坏，并且和原来一样。早先我们保存了原始文件的 MD5 哈希值。

```
md5sum opengapps-recovered.zip >> md5-opengapps.txt
```

该命令将检查文件的 MD5 哈希值，并在文件中追加新恢复文件的 MD5 哈希值，以轻松比较两个 MD5 哈希值。

可以显示文本文件的内容来比较原始文件和恢复文件的 MD5 哈希值。

```
cat md5-opengapps.txt

86489b68b40d144f0e00a0ea8407f7c0  opengapps.zip
86489b68b40d144f0e00a0ea8407f7c0  opengapps-recovered.zip
```

恢复文件的 MD5 哈希是一样的。所以，我们成功地恢复了我们以前删除的文件，并且恢复后文件完整性一致，并且工作正常。

 [![](http://www.linuxnov.com/wp-content/uploads/2017/07/Recovering-a-deleted-file-using-terminal-LinuxNov.png)][5] 

**注意：** 在某些情况下，某些文件无法通过 `ps -axu` 命令看到。 所以，尝试检查运行的程序，并从中恢复文件。

假设我们有一个使用 Totem 媒体播放器播放中的以 .avi 为扩展名的视频。你需要做的就是检查 Totem 的 PID，并按照本示例中提到的相同说明进行操作。

要查找正在运行的程序的 PID，请使用以下命令，后面跟程序的名称。

```
pidof 程序名
```

通过分享支持我们。

--------------------------------------------------------------------------------

via: http://www.linuxnov.com/recover-deleted-files-still-running-active-processes-linux/

作者：[mhnassif][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxnov.com/author/mhnassif/
[1]:http://www.linuxnov.com/author/mhnassif/
[2]:http://www.linuxnov.com/category/how-to/
[3]:http://www.linuxnov.com/category/shell-cli/
[4]:http://www.linuxnov.com/recover-deleted-files-still-running-active-processes-linux/#comments
[5]:http://www.linuxnov.com/wp-content/uploads/2017/07/Recovering-a-deleted-file-using-terminal-LinuxNov.png
