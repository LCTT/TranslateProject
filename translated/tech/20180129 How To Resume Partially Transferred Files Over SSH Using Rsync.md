如何使用 Rsync 通过 SSH 恢复部分传输的文件
======

![](https://www.ostechnix.com/wp-content/uploads/2016/02/Resume-Partially-Transferred-Files-Over-SSH-Using-Rsync.png)

由于诸如电源故障、网络故障或用户干预等各种原因，使用 SCP 命令通过 SSH 复制的大型文件可能会中断，取消或损坏。有一天，我将 Ubuntu 16.04 ISO 文件复制到我的远程系统。不幸的是断电了，网络连接立即丢失。结果么？复制过程终止！这只是一个简单的例子。Ubuntu ISO 并不是那么大，一旦电源恢复，我就可以重新启动复制过程。但在生产环境中，当你在传输大型文件时，你可能并不希望这样做。

而且，你不能总是使用 **scp** 命令恢复被中止的进度。因为，如果你这样做，它只会覆盖现有的文件。这时你会怎么做？别担心！这是 **Rsync** 派上用场的地方！Rsync 可以帮助你恢复中断的复制或下载过程。对于那些好奇的人，Rsync 是一个快速、多功能的文件复制程序，可用于复制和传输远程和本地系统中的文件或文件夹。

它提供了大量控制其行为的每个方面的选项，并允许非常灵活地指定要复制的一组文件。它以增量传输算法而闻名，它通过仅发送源文件和目标中现有文件之间的差异来减少通过网络发送的数据量。 Rsync 广泛用于备份和镜像，以及日常使用中改进的复制命令。

就像 SCP 一样，rsync 也会通过 SSH 复制文件。如果你想通过 SSH 下载或传输大文件和文件夹，我建议您使用 rsync。请注意，**应该在两边都安装 rsync**（远程和本地系统）来恢复部分传输的文件。

### 使用 Rsync 恢复部分传输的文件

好吧，让我给你看一个例子。我将使用命令将 Ubuntu 16.04 ISO 从本地系统复制到远程系统：

```
$ scp Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

这里，

  * **sk**是我的远程系统的用户名
  * **192.168.43.2** 是远程机器的 IP 地址。



现在，我按下 **CTRL+c** 结束它。

**示例输出：**

```
sk@192.168.43.2's password: 
ubuntu-16.04-desktop-amd64.iso 26% 372MB 26.2MB/s 00:39 ETA^c
```

[![][1]][2]

正如你在上面的输出中看到的，当它达到 26％ 时，我终止了复制过程。

如果我重新运行上面的命令，它只会覆盖现有的文件。换句话说，复制过程不会在我断开的地方恢复。

为了恢复复制过程，我们可以使用 **rsync** 命令，如下所示。

```
$ rsync -P -rsh=ssh Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

**示例输出：**
```
sk@192.168.1.103's password:
sending incremental file list
ubuntu-16.04-desktop-amd64.iso
                   380.56M 26% 41.05MB/s 0:00:25
```

[![][1]][4]

看见了吗？现在，复制过程在我们之前断开的地方恢复了。你也可以像下面那样使用 “-partial” 而不是 “-P” 参数。
```
$ rsync --partial -rsh=ssh Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

这里，参数 “-partial” 或 “-P” 告诉 rsync 命令保留部分下载的文件并恢复进度。

或者，我们也可以使用以下命令通过 SSH 恢复部分传输的文件。

```
$ rsync -avP Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

或者，

```
rsync -av --partial Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

就是这样了。你现在知道如何使用 rsync 命令恢复取消、中断和部分下载的文件。正如你所看到的，它也不是那么难。如果两个系统都安装了 rsync，我们可以轻松地通过上面描述的那样恢复复制进度。

如果你觉得本教程有帮助，请在你的社交、专业网络上分享，并支持 OSTechNix。还有更多的好东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-resume-partially-downloaded-or-transferred-files-using-rsync/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/02/scp.png ()
[3]:/cdn-cgi/l/email-protection
[4]:http://www.ostechnix.com/wp-content/uploads/2016/02/rsync.png ()
