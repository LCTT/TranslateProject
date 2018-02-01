精通 Linux 上的文件搜索
======

![](https://images.idgesg.net/images/article/2017/09/telescope-100736548-large.jpg)

在 Linux 系统上搜索文件的方法有很多，有的命令很简单，有的很详细。我们的目标是：缩小搜索范围，找到您正在寻找的文件，又不受其他文件的干扰。在今天的文章中，我们将研究一些对文件搜索最有用的命令和选项。我们将涉及：

  * 快速搜索
  * 更复杂的搜索条件
  * 组合条件
  * 反转条件
  * 简单和详细的回应
  * 寻找重复的文件

有很多有用的命令可以搜索文件，`find` 命令可能是其中最有名的，但它不是唯一的命令，也不一定总是找到目标文件的最快方法。

### 快速搜索命令：which 和 locate

搜索文件的最简单的命令可能就是 `which` 和 `locate` 了，但二者都有一些局限性。`which` 命令只会在系统定义的搜索路径中，查找可执行的文件，通常用于识别命令。如果您对输入 `which` 时会运行哪个命令感到好奇，您可以使用命令 `which which`，它会指出对应的可执行文件。

```
$ which which
/usr/bin/which
```

`which` 命令会显示它找到的第一个以相应名称命名的可执行文件（也就是使用该命令时将运行的那个文件），然后停止。

`locate` 命令更大方一点，它可以查找任意数量的文件，但它也有一个限制：仅当文件名被包含在由 `updatedb` 命令构建的数据库时才有效。该文件可能会存储在某个位置，如 `/var/lib/mlocate/mlocate.db`，但不能用 `locate` 以外的任何命令读取。这个文件的更新通常是通过每天通过 cron 运行的 `updatedb` 进行的。

简单的 `find` 命令没有太多限制，不过它需要指定搜索的起点和搜索条件。最简单的 `find` 命令：按文件名搜索文件。如下所示：

```
$ find . -name runme
./bin/runme
```

如上所示，通过文件名搜索文件系统的当前位置将会搜索所有子目录，除非您指定了搜索深度。

### 不仅仅是文件名

`find` 命令允许您搜索除文件名以外的多种条件，包括文件所有者、组、权限、大小、修改时间、缺少所有者或组，和文件类型等。除了查找文件外，您还可以删除文件、对其进行重命名、更改所有者、更改权限和对找到的文件运行几乎任何命令。

下面两条命令会查找：在当前目录中 root 用户拥有的文件，以及不被指定用户（在本例中为 shs）所拥有的文件。在这个例子中，两个输出是一样的，但并不总是如此。

```
$ find . -user root -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./xyz -> /home/peanut/xyz
$ find . ! -user shs -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./xyz -> /home/peanut/xyz
```

感叹号 `!` 字符代表“非”：反转跟随其后的条件。

下面的命令将查找具有特定权限的文件：

```
$ find . -perm 750 -ls
 397176 4 -rwxr-x--- 1 shs shs 115 Sep 14 13:52 ./ll
 398209 4 -rwxr-x--- 1 shs shs 117 Sep 21 08:55 ./get-updates
 397145 4 drwxr-x--- 2 shs shs 4096 Sep 14 15:42 ./newdir
```

接下来的命令显示具有 777 权限的非符号链接文件：

```
$ sudo find /home -perm 777 ! -type l -ls
 397132 4 -rwxrwxrwx 1 shs shs 18 Sep 15 16:06 /home/shs/bin/runme
 396949 4 -rwxrwxrwx 1 root root 558 Sep 21 11:21 /home/oops
```

以下命令将查找大小超过千兆字节的文件。请注意，我们找到了一个非常有趣的文件。它以 ELF core 文件格式表示了该系统的物理内存。

```
$ sudo find / -size +1G -ls
 4026531994 0 -r-------- 1 root root 140737477881856 Sep 21 11:23 /proc/kcore
 1444722 15332 -rw-rw-r-- 1 shs shs 1609039872 Sep 13 15:55 /home/shs/Downloads/ubuntu-17.04-desktop-amd64.iso
```

只要您知道 `find` 命令是如何描述文件类型的，就可以通过文件类型来查找文件。

```
b = 块设备文件
c = 字符设备文件
d = 目录
p = 命名管道
f = 常规文件
l = 符号链接
s = 套接字
D = 门（仅限 Solaris）
```

在下面的命令中，我们要寻找符号链接和套接字：

```
$ find . -type l -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./whatever -> /home/peanut/whatever
$ find . -type s -ls
 395256 0 srwxrwxr-x 1 shs shs 0 Sep 21 08:50 ./.gnupg/S.gpg-agent
```

您还可以根据 inode 号来搜索文件：

```
$ find . -inum 397132 -ls
 397132 4 -rwx------ 1 shs shs 18 Sep 15 16:06 ./bin/runme
```

另一种通过 inode 搜索文件的方法是使用 `debugfs` 命令。在大的文件系统上，这个命令可能比 `find` 快得多，您可能需要安装 icheck。

```
$ sudo debugfs -R 'ncheck 397132' /dev/sda1
debugfs 1.42.13 (17-May-2015)
Inode Pathname
397132 /home/shs/bin/runme
```

在下面的命令中，我们从主目录（`~`）开始，限制搜索的深度（即我们将搜索子目录的层数），并只查看在最近一天内创建或修改的文件（`mtime` 设置）。

```
$ find ~ -maxdepth 2 -mtime -1 -ls
 407928 4 drwxr-xr-x 21 shs shs 4096 Sep 21 12:03 /home/shs
 394006 8 -rw------- 1 shs shs 5909 Sep 21 08:18 /home/shs/.bash_history
 399612 4 -rw------- 1 shs shs 53 Sep 21 08:50 /home/shs/.Xauthority
 399615 4 drwxr-xr-x 2 shs shs 4096 Sep 21 09:32 /home/shs/Downloads
```

### 不仅仅是列出文件

使用 `-exec` 选项，在您使用 `find` 命令找到文件后可以以某种方式更改文件。您只需参照 `-exec` 选项即可运行相应的命令。

```
$ find . -name runme -exec chmod 700 {} \;
$ find . -name runme -ls
 397132 4 -rwx------ 1 shs shs 18 Sep 15 16:06 ./bin/runme
```

在这条命令中，`{}` 代表文件名。此命令将更改当前目录和子目录中任何名为 `runme` 的文件的权限。

把您想运行的任何命令放在 `-exec` 选项之后，并使用类似于上面命令的语法即可。

### 其他搜索条件

如上面的例子所示，您还可以通过其他条件进行搜索：文件的修改时间、所有者、权限等。以下是一些示例。

#### 根据用户查找文件

```
$ sudo find /home -user peanut
/home/peanut
/home/peanut/.bashrc
/home/peanut/.bash_logout
/home/peanut/.profile
/home/peanut/examples.desktop
```

#### 根据权限查找文件

```
$ sudo find /home -perm 777
/home/shs/whatever
/home/oops
```

#### 根据修改时间查找文件

```
$ sudo find /home -mtime +100
/home/shs/.mozilla/firefox/krsw3giq.default/gmp-gmpopenh264/1.6/gmpopenh264.info
/home/shs/.mozilla/firefox/krsw3giq.default/gmp-gmpopenh264/1.6/libgmpopenh264.so
```

#### 通过比较修改时间查找文件

像这样的命令可以让您找到修改时间较近的文件。

```
$ sudo find /var/log -newer /var/log/syslog
/var/log/auth.log
```

### 寻找重复的文件

如果您正在清理磁盘空间，则可能需要删除较大的重复文件。确定文件是否真正重复的最好方法是使用 `fdupes` 命令。此命令使用 md5 校验和来确定文件是否具有相同的内容。使用 `-r`（递归）选项，`fdupes` 将在一个目录下并查找具有相同校验和而被确定为内容相同的文件。

如果以 root 身份运行这样的命令，您可能会发现很多重复的文件，但是很多文件都是创建时被添加到主目录的启动文件。

```
# fdupes -rn /home > /tmp/dups.txt
# more /tmp/dups.txt
/home/jdoe/.profile
/home/tsmith/.profile
/home/peanut/.profile
/home/rocket/.profile

/home/jdoe/.bashrc
/home/tsmith/.bashrc
/home/peanut/.bashrc
/home/rocket/.bashrc
```

同样，您可能会在 `/usr` 中发现很多重复的但不该删除的配置文件。所以，请谨慎利用 `fdupes` 的输出。

`fdupes` 命令并不总是很快，但是要记住，它正在对许多文件运行校验和来做比较，你可能会意识到它是多么有效。

### 总结

有很多方法可以在 Linux 系统上查找文件。如果您可以描述清楚您正在寻找什么，上面的命令将帮助您找到目标。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3227075/linux/mastering-file-searches-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
