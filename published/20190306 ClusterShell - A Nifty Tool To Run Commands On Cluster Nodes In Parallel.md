[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11147-1.html)
[#]: subject: (ClusterShell – A Nifty Tool To Run Commands On Cluster Nodes In Parallel)
[#]: via: (https://www.2daygeek.com/clustershell-clush-run-commands-on-cluster-nodes-remote-system-in-parallel-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

ClusterShell：一个在集群节点上并行运行命令的好工具
======

![](https://img.linux.net.cn/data/attachment/album/201907/26/053202pgcgg1y1rc5l5mgg.jpg)

我们过去曾写过两篇如何并行地在多个远程服务器上运行命令的文章：[并行 SSH（PSSH）][1] 和[分布式 Shell（DSH）][2]。今天，我们将讨论相同类型的主题，但它允许我们在集群节点上执行相同的操作。你可能会想，我可以编写一个小的 shell 脚本来实现这个目的，而不是安装这些第三方软件包。

当然，你是对的，如果要在十几个远程系统中运行一些命令，那么你不需要使用它。但是，你的脚本需要一些时间来完成此任务，因为它是按顺序运行的。想想你要是在一千多台服务器上运行一些命令会是什么样子？在这种情况下，你的脚本用处不大。此外，完成任务需要很长时间。所以，要克服这种问题和情况，我们需要可以在远程计算机上并行运行命令。

为此，我们需要在一个并行应用程序中使用它。我希望这个解释可以解决你对并行实用程序的疑虑。

### ClusterShell

[ClusterShell][3] 是一个事件驱动的开源 Python 库，旨在在服务器场或大型 Linux 集群上并行运行本地或远程命令。（`clush` 即 [ClusterShell][3]）。

它将处理在 HPC 集群上遇到的常见问题，例如在节点组上操作，使用优化过的执行算法运行分布式命令，以及收集结果和合并相同的输出，或检索返回代码。

ClusterShell 可以利用已安装在系统上的现有远程 shell 设施，如 SSH。

ClusterShell 的主要目标是通过为开发人员提供轻量级、但可扩展的 Python API 来改进高性能集群的管理。它还提供了 `clush`、`clubak` 和 `cluset`/`nodeset` 等方便的命令行工具，可以让传统的 shell 脚本利用这个库的一些功能。

ClusterShell 是用 Python 编写的，它需要 Python（v2.6+ 或 v3.4+）才能在你的系统上运行。

### 如何在 Linux 上安装 ClusterShell？

ClusterShell 包在大多数发行版的官方包管理器中都可用。因此，使用发行版包管理器工具进行安装。

对于 Fedora 系统，使用 [DNF 命令][4]来安装 clustershell。

```
$ sudo dnf install clustershell
```

如果系统默认是 Python 2，这会安装 Python 2 模块和工具，可以运行以下命令安装 Python 3 开发包。

```
$ sudo dnf install python3-clustershell
```

在执行 clustershell 安装之前，请确保你已在系统上启用 [EPEL 存储库][5]。

对于 RHEL/CentOS 系统，使用 [YUM 命令][6] 来安装 clustershell。

```
$ sudo yum install clustershell
```

如果系统默认是 Python 2，这会安装 Python 2 模块和工具，可以运行以下命令安装 Python 3 开发包。

```
$ sudo yum install python34-clustershell
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][7] 来安装 clustershell。

```
$ sudo zypper install clustershell
```

如果系统默认是 Python 2，这会安装 Python 2 模块和工具，可以运行以下命令安装 Python 3 开发包。

```
$ sudo zypper install python3-clustershell
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][8] 或 [APT 命令][9] 来安装 clustershell。

```
$ sudo apt install clustershell
```

### 如何在 Linux 使用 PIP 安装 ClusterShell？

可以使用 PIP 安装 ClusterShell，因为它是用 Python 编写的。

在执行 clustershell 安装之前，请确保你已在系统上启用了 [Python][10] 和 [PIP][11]。

```
$ sudo pip install ClusterShell
```

### 如何在 Linux 上使用 ClusterShell？

与其他实用程序（如 `pssh` 和 `dsh`）相比，它是直接了当的优秀工具。它有很多选项可以在远程并行执行。

在开始使用 clustershell 之前，请确保你已启用系统上的[无密码登录][12]。

以下配置文件定义了系统范围的默认值。你不需要修改这里的任何东西。

```
$ cat /etc/clustershell/clush.conf
```

如果你想要创建一个服务器组，那也可以。默认情况下有一些示例，请根据你的要求执行相同操作。

```
$ cat /etc/clustershell/groups.d/local.cfg
```

只需按以下列格式运行 clustershell 命令即可从给定节点获取信息：

```
$ clush -w 192.168.1.4,192.168.1.9 cat /proc/version
192.168.1.9: Linux version 4.15.0-45-generic ([email protected]) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #48-Ubuntu SMP Tue Jan 29 16:28:13 UTC 2019
192.168.1.4: Linux version 3.10.0-957.el7.x86_64 ([email protected]) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC) ) #1 SMP Thu Nov 8 23:39:32 UTC 2018
```

选项：

  * `-w:` 你要运行该命令的节点。

你可以使用正则表达式而不是使用完整主机名和 IP：

```
$ clush -w 192.168.1.[4,9] uname -r
192.168.1.9: 4.15.0-45-generic
192.168.1.4: 3.10.0-957.el7.x86_64
```

或者，如果服务器位于同一 IP 系列中，则可以使用以下格式：

```
$ clush -w 192.168.1.[4-9] date
192.168.1.6: Mon Mar  4 21:08:29 IST 2019
192.168.1.7: Mon Mar  4 21:08:29 IST 2019
192.168.1.8: Mon Mar  4 21:08:29 IST 2019
192.168.1.5: Mon Mar  4 09:16:30 CST 2019
192.168.1.9: Mon Mar  4 21:08:29 IST 2019
192.168.1.4: Mon Mar  4 09:16:30 CST 2019
```

clustershell 允许我们以批处理模式运行命令。使用以下格式来实现此目的：

```
$ clush -w 192.168.1.4,192.168.1.9 -b
Enter 'quit' to leave this interactive mode
Working with nodes: 192.168.1.[4,9]
clush> hostnamectl
---------------
192.168.1.4
---------------
   Static hostname: CentOS7.2daygeek.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 002f47b82af248f5be1d67b67e03514c
           Boot ID: f9b37a073c534dec8b236885e754cb56
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-957.el7.x86_64
      Architecture: x86-64
---------------
192.168.1.9
---------------
   Static hostname: Ubuntu18
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 27f6c2febda84dc881f28fd145077187
           Boot ID: f176f2eb45524d4f906d12e2b5716649
    Virtualization: oracle
  Operating System: Ubuntu 18.04.2 LTS
            Kernel: Linux 4.15.0-45-generic
      Architecture: x86-64
clush> free -m
---------------
192.168.1.4
---------------
              total        used        free      shared  buff/cache   available
Mem:           1838         641         217          19         978         969
Swap:          2047           0        2047
---------------
192.168.1.9
---------------
              total        used        free      shared  buff/cache   available
Mem:           1993         352        1067           1         573        1473
Swap:          1425           0        1425
clush> w
---------------
192.168.1.4
---------------
 09:21:14 up  3:21,  3 users,  load average: 0.00, 0.01, 0.05
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
daygeek  :0       :0               06:02   ?xdm?   1:28   0.30s /usr/libexec/gnome-session-binary --session gnome-classic
daygeek  pts/0    :0               06:03    3:17m  0.06s  0.06s bash
daygeek  pts/1    192.168.1.6      06:03   52:26   0.10s  0.10s -bash
---------------
192.168.1.9
---------------
 21:13:12 up  3:12,  1 user,  load average: 0.08, 0.03, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
daygeek  pts/0    192.168.1.6      20:42   29:41   0.05s  0.05s -bash
clush> quit
```

如果要在一组节点上运行该命令，请使用以下格式：

```
$ clush -w @dev uptime
or
$ clush -g dev uptime
or
$ clush --group=dev uptime

192.168.1.9:  21:10:10 up  3:09,  1 user,  load average: 0.09, 0.03, 0.01
192.168.1.4:  09:18:12 up  3:18,  3 users,  load average: 0.01, 0.02, 0.05
```

如果要在多个节点组上运行该命令，请使用以下格式：

```
$ clush -w @dev,@uat uptime
or
$ clush -g dev,uat uptime
or
$ clush --group=dev,uat uptime

192.168.1.7: 07:57:19 up 59 min, 1 user, load average: 0.08, 0.03, 0.00
192.168.1.9: 20:27:20 up 1:00, 1 user, load average: 0.00, 0.00, 0.00
192.168.1.5: 08:57:21 up 59 min, 1 user, load average: 0.00, 0.01, 0.05
```

clustershell 允许我们将文件复制到远程计算机。将本地文件或目录复制到同一个远程节点：

```
$ clush -w 192.168.1.[4,9] --copy /home/daygeek/passwd-up.sh
```

我们可以通过运行以下命令来验证它：

```
$ clush -w 192.168.1.[4,9] ls -lh /home/daygeek/passwd-up.sh
192.168.1.4: -rwxr-xr-x. 1 daygeek daygeek 159 Mar 4 09:00 /home/daygeek/passwd-up.sh
192.168.1.9: -rwxr-xr-x 1 daygeek daygeek 159 Mar 4 20:52 /home/daygeek/passwd-up.sh
```

将本地文件或目录复制到不同位置的远程节点：

```
$ clush -g uat --copy /home/daygeek/passwd-up.sh --dest /tmp
```

我们可以通过运行以下命令来验证它：

```
$ clush --group=uat ls -lh /tmp/passwd-up.sh
192.168.1.7: -rwxr-xr-x. 1 daygeek daygeek 159 Mar 6 07:44 /tmp/passwd-up.sh
```

将文件或目录从远程节点复制到本地系统：

```
$ clush -w 192.168.1.7 --rcopy /home/daygeek/Documents/magi.txt --dest /tmp
```

我们可以通过运行以下命令来验证它：

```
$ ls -lh /tmp/magi.txt.192.168.1.7
-rw-r--r-- 1 daygeek daygeek 35 Mar 6 20:24 /tmp/magi.txt.192.168.1.7
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/clustershell-clush-run-commands-on-cluster-nodes-remote-system-in-parallel-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
[2]: https://www.2daygeek.com/dsh-run-execute-shell-commands-on-multiple-linux-servers-at-once/
[3]: https://cea-hpc.github.io/clustershell/
[4]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/3-methods-to-install-latest-python3-package-on-centos-6-system/
[11]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[12]: https://www.2daygeek.com/linux-passwordless-ssh-login-using-ssh-keygen/
