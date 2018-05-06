在 Linux 下 9 个有用的 touch 命令示例
=====

`touch` 命令用于创建空文件，也可以更改 Unix 和 Linux 系统上现有文件时间戳。这里所说的更改时间戳意味着更新文件和目录的访问以及修改时间。

![touch-command-examples-linux][2]

让我们来看看 `touch` 命令的语法和选项：

**语法**： 

```
# touch {选项} {文件}
```

`touch` 命令中使用的选项：

![touch-command-options][3]

在这篇文章中，我们将介绍 Linux 中 9 个有用的 `touch` 命令示例。

### 示例：1 使用 touch 创建一个空文件

要在 Linux 系统上使用 `touch` 命令创建空文件，键入 `touch`，然后输入文件名。如下所示：

```
[root@linuxtechi ~]# touch devops.txt
[root@linuxtechi ~]# ls -l devops.txt
-rw-r--r--. 1 root root 0 Mar 29 22:39 devops.txt
```

### 示例：2 使用 touch 创建批量空文件

可能会出现一些情况，我们必须为某些测试创建大量空文件，这可以使用 `touch` 命令轻松实现：

```
[root@linuxtechi ~]# touch sysadm-{1..20}.txt
```

在上面的例子中，我们创建了 20 个名为 `sysadm-1.txt` 到 `sysadm-20.txt` 的空文件，你可以根据需要更改名称和数字。

### 示例：3 改变/更新文件和目录的访问时间

假设我们想要改变名为 `devops.txt` 文件的访问时间，在 `touch` 命令中使用 `-a` 选项，然后输入文件名。如下所示：

```
[root@linuxtechi ~]# touch -a devops.txt
```

现在使用 `stat` 命令验证文件的访问时间是否已更新：
```
[root@linuxtechi ~]# stat devops.txt
  File: 'devops.txt'
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-29 23:03:10.902000000 -0400
Modify: 2018-03-29 22:39:29.365000000 -0400
Change: 2018-03-29 23:03:10.902000000 -0400
 Birth: -
```

**改变目录的访问时间：**

假设我们在 `/mnt` 目录下有一个 `nfsshare` 文件夹，让我们用下面的命令改变这个文件夹的访问时间：

```
[root@linuxtechi ~]# touch -m /mnt/nfsshare/
[root@linuxtechi ~]# stat /mnt/nfsshare/
  File: '/mnt/nfsshare/'
  Size: 6               Blocks: 0          IO Block: 4096   directory
Device: fd00h/64768d    Inode: 2258        Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:mnt_t:s0
Access: 2018-03-29 23:34:38.095000000 -0400
Modify: 2018-03-03 10:42:45.194000000 -0500
Change: 2018-03-29 23:34:38.095000000 -0400
 Birth: -
```

### 示例：4 更改访问时间而不用创建新文件

在某些情况下，如果文件存在，我们希望更改文件的访问时间，并避免创建文件。在 touch 命令中使用 `-c` 选项即可，如果文件存在，那么我们可以改变文件的访问时间，如果不存在，我们也可不会创建它。

```
[root@linuxtechi ~]# touch -c sysadm-20.txt
[root@linuxtechi ~]# touch -c winadm-20.txt
[root@linuxtechi ~]# ls -l winadm-20.txt
ls: cannot access winadm-20.txt: No such file or directory
```

### 示例：5 更改文件和目录的修改时间

在 `touch` 命令中使用 `-m` 选项，我们可以更改文件和目录的修改时间。

让我们更改名为 `devops.txt` 文件的更改时间：

```
[root@linuxtechi ~]# touch -m devops.txt
```

现在使用 `stat` 命令来验证修改时间是否改变：

```
[root@linuxtechi ~]# stat devops.txt
  File: 'devops.txt'
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-29 23:03:10.902000000 -0400
Modify: 2018-03-29 23:59:49.106000000 -0400
Change: 2018-03-29 23:59:49.106000000 -0400
 Birth: -
```

同样的，我们可以改变一个目录的修改时间：

```
[root@linuxtechi ~]# touch -m /mnt/nfsshare/
```

使用 `stat` 交叉验证访问和修改时间：

```
[root@linuxtechi ~]# stat devops.txt
  File: 'devops.txt'
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324178    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2018-03-30 00:06:20.145000000 -0400
Modify: 2018-03-30 00:06:20.145000000 -0400
Change: 2018-03-30 00:06:20.145000000 -0400
 Birth: -
```

### 示例：7 将访问和修改时间设置为特定的日期和时间

每当我们使用 `touch` 命令更改文件和目录的访问和修改时间时，它将当前时间设置为该文件或目录的访问和修改时间。

假设我们想要将特定的日期和时间设置为文件的访问和修改时间，这可以使用 `touch` 命令中的 `-c` 和 `-t` 选项来实现。

日期和时间可以使用以下格式指定：

```
{CCYY}MMDDhhmm.ss
```

其中：

  * `CC` – 年份的前两位数字
  * `YY` – 年份的后两位数字
  * `MM` – 月份 (01-12)
  * `DD` – 天 (01-31)
  * `hh` – 小时 (00-23)
  * `mm` – 分钟 (00-59)

让我们将 `devops.txt` 文件的访问和修改时间设置为未来的一个时间（2025 年 10 月 19 日 18 时 20 分）。

```
[root@linuxtechi ~]# touch -c -t 202510191820 devops.txt
```

使用 `stat` 命令查看更新访问和修改时间：

![stat-command-output-linux][4]

根据日期字符串设置访问和修改时间，在 `touch` 命令中使用 `-d` 选项，然后指定日期字符串，后面跟文件名。如下所示：

```
[root@linuxtechi ~]# touch -c -d "2010-02-07 20:15:12.000000000 +0530" sysadm-29.txt
```

使用 `stat` 命令验证文件的状态：

```
[root@linuxtechi ~]# stat sysadm-20.txt
  File: ‘sysadm-20.txt’
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: fd00h/64768d    Inode: 67324189    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2010-02-07 20:15:12.000000000 +0530
Modify: 2010-02-07 20:15:12.000000000 +0530
Change: 2018-03-30 10:23:31.584000000 +0530
 Birth: -
```

**注意：**在上述命令中，如果我们不指定 `-c`，如果系统中不存在该文件那么 `touch` 命令将创建一个新文件，并将时间戳设置为命令中给出的。

### 示例：8 使用参考文件设置时间戳（-r）

在 `touch` 命令中，我们可以使用参考文件来设置文件或目录的时间戳。假设我想在 `devops.txt` 文件上设置与文件 `sysadm-20.txt` 文件相同的时间戳，`touch` 命令中使用 `-r` 选项可以轻松实现。

**语法：**

```
# touch -r {参考文件} 真正文件
```

```
[root@linuxtechi ~]# touch -r sysadm-20.txt devops.txt
```

### 示例：9 在符号链接文件上更改访问和修改时间

默认情况下，每当我们尝试使用 `touch` 命令更改符号链接文件的时间戳时，它只会更改原始文件的时间戳。如果你想更改符号链接文件的时间戳，则可以使用 `touch` 命令中的 `-h` 选项来实现。

**语法：** 

```
# touch -h {符号链接文件}
```

```
[root@linuxtechi opt]# ls -l /root/linuxgeeks.txt
lrwxrwxrwx. 1 root root 15 Mar 30 10:56 /root/linuxgeeks.txt -> linuxadmins.txt
[root@linuxtechi ~]# touch -t 203010191820 -h linuxgeeks.txt
[root@linuxtechi ~]# ls -l linuxgeeks.txt
lrwxrwxrwx. 1 root root 15 Oct 19  2030 linuxgeeks.txt -> linuxadmins.txt
```

这就是本教程的全部了。我希望这些例子能帮助你理解 `touch` 命令。请分享你的宝贵意见和评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/9-useful-touch-command-examples-linux/

作者：[Pradeep Kumar][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/03/touch-command-examples-linux.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/03/touch-command-options.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2018/03/stat-command-output-linux.jpg
