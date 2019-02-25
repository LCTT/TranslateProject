[#]: collector: (lujun9972)
[#]: translator: (luming)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10569-1.html)
[#]: subject: (How To Copy A File/Folder From A Local System To Remote System In Linux?)
[#]: via: (https://www.2daygeek.com/linux-scp-rsync-pscp-command-copy-files-folders-in-multiple-servers-using-shell-script/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

如何在 Linux 上复制文件/文件夹到远程系统？
======

从一个服务器复制文件到另一个服务器，或者从本地到远程复制是 Linux 管理员的日常任务之一。

我觉得不会有人不同意，因为无论在哪里这都是你的日常操作之一。有很多办法都能处理这个任务，我们试着加以概括。你可以挑一个喜欢的方法。当然，看看其他命令也能在别的地方帮到你。

我已经在自己的环境下测试过所有的命令和脚本了，因此你可以直接用到日常工作当中。

通常大家都倾向 `scp`，因为它是文件复制的<ruby>原生命令<rt>native command</rt></ruby>之一。但本文所列出的其它命令也很好用，建议你尝试一下。

文件复制可以轻易地用以下四种方法。

- `scp`：在网络上的两个主机之间复制文件，它使用 `ssh` 做文件传输，并使用相同的认证方式，具有相同的安全性。
- `rsync`：是一个既快速又出众的多功能文件复制工具。它能本地复制、通过远程 shell 在其它主机之间复制，或者与远程的 `rsync` <ruby>守护进程<rt>daemon</rt></ruby> 之间复制。
- `pscp`：是一个并行复制文件到多个主机上的程序。它提供了诸多特性，例如为 `scp` 配置免密传输，保存输出到文件，以及超时控制。
- `prsync`：也是一个并行复制文件到多个主机上的程序。它也提供了诸多特性，例如为 `ssh` 配置免密传输，保存输出到 文件，以及超时控制。

### 方式 1：如何在 Linux 上使用 scp 命令从本地系统向远程系统复制文件/文件夹？

`scp` 命令可以让我们从本地系统复制文件/文件夹到远程系统上。

我会把 `output.txt` 文件从本地系统复制到 `2g.CentOS.com` 远程系统的 `/opt/backup` 文件夹下。

```
# scp output.txt root@2g.CentOS.com:/opt/backup

output.txt                                                                                              100% 2468     2.4KB/s   00:00
```

从本地系统复制两个文件 `output.txt` 和 `passwd-up.sh` 到远程系统 `2g.CentOs.com` 的 `/opt/backup` 文件夹下。

```
# scp output.txt passwd-up.sh root@2g.CentOS.com:/opt/backup

output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
```

从本地系统复制 `shell-script` 文件夹到远程系统 `2g.CentOs.com` 的 `/opt/back` 文件夹下。 

这会连同`shell-script` 文件夹下所有的文件一同复制到`/opt/back` 下。

```
# scp -r /home/daygeek/2g/shell-script/ root@:/opt/backup/

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00
```

### 方式 2：如何在 Linux 上使用 scp 命令和 Shell 脚本复制文件/文件夹到多个远程系统上？

如果你想复制同一个文件到多个远程服务器上，那就需要创建一个如下面那样的小 shell 脚本。

并且，需要将服务器添加进 `server-list.txt` 文件。确保添加成功后，每个服务器应当单独一行。

最终，你想要的脚本就像下面这样：

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
  scp /home/daygeek/2g/shell-script/output.txt root@$server:/opt/backup
done
```

完成之后，给 `file-copy.sh` 文件设置可执行权限。

```
# chmod +x file-copy.sh
```

最后运行脚本完成复制。

```
# ./file-copy.sh

output.txt 100% 2468 2.4KB/s 00:00
output.txt 100% 2468 2.4KB/s 00:00
```

使用下面的脚本可以复制多个文件到多个远程服务器上。

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
  scp /home/daygeek/2g/shell-script/output.txt passwd-up.sh root@$server:/opt/backup
done
```

下面结果显示所有的两个文件都复制到两个服务器上。

```
# ./file-cp.sh

output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
```

使用下面的脚本递归地复制文件夹到多个远程服务器上。

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
  scp -r /home/daygeek/2g/shell-script/ root@$server:/opt/backup
done
```

上述脚本的输出。

```
# ./file-cp.sh

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00
```

### 方式 3：如何在 Linux 上使用 pscp 命令复制文件/文件夹到多个远程系统上？

`pscp` 命令可以直接让我们复制文件到多个远程服务器上。

使用下面的 `pscp` 命令复制单个文件到远程服务器。

```
# pscp.pssh -H 2g.CentOS.com /home/daygeek/2g/shell-script/output.txt /opt/backup

[1] 18:46:11 [SUCCESS] 2g.CentOS.com
```

使用下面的 `pscp` 命令复制多个文件到远程服务器。

```
# pscp.pssh -H 2g.CentOS.com /home/daygeek/2g/shell-script/output.txt ovh.sh /opt/backup

[1] 18:47:48 [SUCCESS] 2g.CentOS.com
```

使用下面的 `pscp` 命令递归地复制整个文件夹到远程服务器。

```
# pscp.pssh -H 2g.CentOS.com -r /home/daygeek/2g/shell-script/ /opt/backup

[1] 18:48:46 [SUCCESS] 2g.CentOS.com
```

使用下面的 `pscp` 命令使用下面的命令复制单个文件到多个远程服务器。

```
# pscp.pssh -h server-list.txt /home/daygeek/2g/shell-script/output.txt /opt/backup

[1] 18:49:48 [SUCCESS] 2g.CentOS.com
[2] 18:49:48 [SUCCESS] 2g.Debian.com
```

使用下面的 `pscp` 命令复制多个文件到多个远程服务器。

```
# pscp.pssh -h server-list.txt /home/daygeek/2g/shell-script/output.txt passwd-up.sh /opt/backup

[1] 18:50:30 [SUCCESS] 2g.Debian.com
[2] 18:50:30 [SUCCESS] 2g.CentOS.com
```

使用下面的命令递归地复制文件夹到多个远程服务器。

```
# pscp.pssh -h server-list.txt -r /home/daygeek/2g/shell-script/ /opt/backup

[1] 18:51:31 [SUCCESS] 2g.Debian.com
[2] 18:51:31 [SUCCESS] 2g.CentOS.com
```

### 方式 4：如何在 Linux 上使用 rsync 命令复制文件/文件夹到多个远程系统上？

`rsync` 是一个即快速又出众的多功能文件复制工具。它能本地复制、通过远程 shell 在其它主机之间复制，或者在远程 `rsync` <ruby>守护进程<rt>daemon</rt></ruby> 之间复制。

使用下面的 `rsync` 命令复制单个文件到远程服务器。

```
# rsync -avz /home/daygeek/2g/shell-script/output.txt root@2g.CentOS.com:/opt/backup

sending incremental file list
output.txt

sent 598 bytes received 31 bytes 1258.00 bytes/sec
total size is 2468 speedup is 3.92
```

使用下面的 `rsync` 命令复制多个文件到远程服务器。

```
# rsync -avz /home/daygeek/2g/shell-script/output.txt passwd-up.sh root@2g.CentOS.com:/opt/backup

sending incremental file list
output.txt
passwd-up.sh

sent 737 bytes received 50 bytes 1574.00 bytes/sec
total size is 2537 speedup is 3.22
```

使用下面的 `rsync` 命令通过 `ssh` 复制单个文件到远程服务器。

```
# rsync -avzhe ssh /home/daygeek/2g/shell-script/output.txt root@2g.CentOS.com:/opt/backup

sending incremental file list
output.txt

sent 598 bytes received 31 bytes 419.33 bytes/sec
total size is 2.47K speedup is 3.92
```

使用下面的 `rsync` 命令通过 `ssh` 递归地复制文件夹到远程服务器。这种方式只复制文件不包括文件夹。

```
# rsync -avzhe ssh /home/daygeek/2g/shell-script/ root@2g.CentOS.com:/opt/backup

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.85K bytes received 281 bytes 8.26K bytes/sec
total size is 9.12K speedup is 2.21
```

### 方式 5：如何在 Linux 上使用 rsync 命令和 Shell 脚本复制文件/文件夹到多个远程系统上？

如果你想复制同一个文件到多个远程服务器上，那也需要创建一个如下面那样的小 shell 脚本。

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
 rsync -avzhe ssh /home/daygeek/2g/shell-script/ root@2g.CentOS.com$server:/opt/backup
done
```

上面脚本的输出。

```
# ./file-copy.sh

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.86K bytes received 281 bytes 8.28K bytes/sec
total size is 9.13K speedup is 2.21

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.86K bytes received 281 bytes 2.76K bytes/sec
total size is 9.13K speedup is 2.21
```

### 方式 6：如何在 Linux 上使用 scp 命令和 Shell 脚本从本地系统向多个远程系统复制文件/文件夹？

在上面两个 shell 脚本中，我们需要事先指定好文件和文件夹的路径，这儿我做了些小修改，让脚本可以接收文件或文件夹作为输入参数。当你每天需要多次执行复制时，这将会非常有用。

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
scp -r $1 root@2g.CentOS.com$server:/opt/backup
done
```

输入文件名并运行脚本。

```
# ./file-copy.sh output1.txt

output1.txt 100% 3558 3.5KB/s 00:00
output1.txt 100% 3558 3.5KB/s 00:00
```

### 方式 7：如何在 Linux 系统上用非标准端口复制文件/文件夹到远程系统？

如果你想使用非标准端口，使用下面的 shell 脚本复制文件或文件夹。

如果你使用了<ruby>非标准<rt>Non-Standard</rt></ruby>端口，确保像下面 `scp` 命令那样指定好了端口号。

```
# file-copy-scp.sh

#!/bin/sh
for server in `more server-list.txt`
do
scp -P 2222 -r $1 root@2g.CentOS.com$server:/opt/backup
done
```

运行脚本，输入文件名。

```
# ./file-copy.sh ovh.sh

ovh.sh 100% 3558 3.5KB/s 00:00
ovh.sh 100% 3558 3.5KB/s 00:00
```

如果你使用了<ruby>非标准<rt>Non-Standard</rt></ruby>端口，确保像下面 `rsync` 命令那样指定好了端口号。

```
# file-copy-rsync.sh

#!/bin/sh
for server in `more server-list.txt`
do
rsync -avzhe 'ssh -p 2222' $1 root@2g.CentOS.com$server:/opt/backup
done
```

运行脚本，输入文件名。

```
# ./file-copy-rsync.sh passwd-up.sh
sending incremental file list
passwd-up.sh

sent 238 bytes received 35 bytes 26.00 bytes/sec
total size is 159 speedup is 0.58

sending incremental file list
passwd-up.sh

sent 238 bytes received 35 bytes 26.00 bytes/sec
total size is 159 speedup is 0.58
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-scp-rsync-pscp-command-copy-files-folders-in-multiple-servers-using-shell-script/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
