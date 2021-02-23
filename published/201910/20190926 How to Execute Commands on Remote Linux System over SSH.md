[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11440-1.html)
[#]: subject: (How to Execute Commands on Remote Linux System over SSH)
[#]: via: (https://www.2daygeek.com/execute-run-linux-commands-remote-system-over-ssh/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何通过 SSH 在远程 Linux 系统上运行命令
======

我们有时可能需要在远程机器上运行一些命令。如果只是偶尔进行的操作，要实现这个目的，可以登录到远程系统上直接执行命令。但是每次都这么做的话，就有点烦人了。既然如此，有没有摆脱这种麻烦操作的更佳方案？

是的，你可以从你本地系统上执行这些操作，而不用登录到远程系统上。这有什么好处吗？毫无疑问。这会为你节省很多好时光。

这是怎么实现的？SSH 允许你无需登录到远程计算机就可以在它上面运行命令。

**通用语法如下所示：**

```
$ ssh [用户名]@[远程主机名或 IP] [命令或脚本]
```

### 1) 如何通过 SSH 在远程 Linux 系统上运行命令

下面的例子允许用户通过 ssh 在远程 Linux 机器上运行 [df 命令][1]。

```
$ ssh daygeek@CentOS7.2daygeek.com df -h

 Filesystem               Size  Used Avail Use% Mounted on
 /dev/mapper/centos-root   27G  4.4G   23G  17% /
 devtmpfs                 903M     0  903M   0% /dev
 tmpfs                    920M     0  920M   0% /dev/shm
 tmpfs                    920M  9.3M  910M   2% /run
 tmpfs                    920M     0  920M   0% /sys/fs/cgroup
 /dev/sda1               1014M  179M  836M  18% /boot
 tmpfs                    184M  8.0K  184M   1% /run/user/42
 tmpfs                    184M     0  184M   0% /run/user/1000
```

### 2) 如何通过 SSH 在远程 Linux 系统上运行多条命令

下面的例子允许用户通过 ssh 在远程 Linux 机器上一次运行多条命令。

同时在远程 Linux 系统上运行 `uptime` 命令和 `free` 命令。

```
$ ssh daygeek@CentOS7.2daygeek.com "uptime && free -m"

 23:05:10 up 10 min,  0 users,  load average: 0.00, 0.03, 0.03

              total       used       free     shared    buffers     cached
 Mem:          1878        432       1445          1        100        134
 -/+ buffers/cache:        197       1680
 Swap:         3071          0       3071
```

### 3) 如何通过 SSH 在远程 Linux 系统上运行带 sudo 权限的命令

下面的例子允许用户通过 ssh 在远程 Linux 机器上运行带有 [sudo 权限][2] 的 `fdisk` 命令。

普通用户不允许执行系统二进制（`/usr/sbin/`）目录下提供的命令。用户需要 root 权限来运行它。

所以你需要 root 权限，好在 Linux 系统上运行 [fdisk 命令][3]。`which` 命令返回给定命令的完整可执行路径。

```
$ which fdisk
 /usr/sbin/fdisk
```

```
$ ssh -t daygeek@CentOS7.2daygeek.com "sudo fdisk -l"
 [sudo] password for daygeek:

 Disk /dev/sda: 32.2 GB, 32212254720 bytes, 62914560 sectors
 Units = sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes
 Disk label type: dos
 Disk identifier: 0x000bf685

 Device Boot      Start         End      Blocks   Id  System
 /dev/sda1   *        2048     2099199     1048576   83  Linux
 /dev/sda2         2099200    62914559    30407680   8e  Linux LVM

 Disk /dev/sdb: 10.7 GB, 10737418240 bytes, 20971520 sectors
 Units = sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes

 Disk /dev/mapper/centos-root: 29.0 GB, 28982640640 bytes, 56606720 sectors
 Units = sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes

 Disk /dev/mapper/centos-swap: 2147 MB, 2147483648 bytes, 4194304 sectors
 Units = sectors of 1 * 512 = 512 bytes
 Sector size (logical/physical): 512 bytes / 512 bytes
 I/O size (minimum/optimal): 512 bytes / 512 bytes

 Connection to centos7.2daygeek.com closed.
```

### 4) 如何通过 SSH 在远程 Linux 系统上运行带 sudo 权限的服务控制命令

下面的例子允许用户通过 ssh 在远程 Linux 机器上运行带有 sudo 权限的服务控制命令。

```
$ ssh -t daygeek@CentOS7.2daygeek.com "sudo systemctl restart httpd"

 [sudo] password for daygeek:
 Connection to centos7.2daygeek.com closed.
```

### 5) 如何通过非标准端口 SSH 在远程 Linux 系统上运行命令

下面的例子允许用户通过 ssh 在使用了非标准端口的远程 Linux 机器上运行 [hostnamectl 命令][4]。

```
$ ssh -p 2200 daygeek@CentOS7.2daygeek.com hostnamectl

    Static hostname: Ubuntu18.2daygeek.com
          Icon name: computer-vm
            Chassis: vm
         Machine ID: 27f6c2febda84dc881f28fd145077187
            Boot ID: bbeccdf932be41ddb5deae9e5f15183d
     Virtualization: oracle
   Operating System: Ubuntu 18.04.2 LTS
             Kernel: Linux 4.15.0-60-generic
       Architecture: x86-64
```

### 6) 如何将远程系统的输出保存到本地系统

下面的例子允许用户通过 ssh 在远程 Linux 机器上运行 [top 命令][5]，并将输出保存到本地系统。

```
$ ssh daygeek@CentOS7.2daygeek.com "top -bc | head -n 35" > /tmp/top-output.txt
```

```
cat /tmp/top-output.txt

 top - 01:13:11 up 18 min,  1 user,  load average: 0.01, 0.05, 0.10
 Tasks: 168 total,   1 running, 167 sleeping,   0 stopped,   0 zombie
 %Cpu(s):  0.0 us,  6.2 sy,  0.0 ni, 93.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
 KiB Mem :  1882300 total,  1176324 free,   342392 used,   363584 buff/cache
 KiB Swap:  2097148 total,  2097148 free,        0 used.  1348140 avail Mem
 PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
  4943 daygeek   20   0  162052   2248   1612 R 10.0  0.1   0:00.07 top -bc
     1 root      20   0  128276   6936   4204 S  0.0  0.4   0:03.08 /usr/lib/sy+
     2 root      20   0       0      0      0 S  0.0  0.0   0:00.00 [kthreadd]
     3 root      20   0       0      0      0 S  0.0  0.0   0:00.25 [ksoftirqd/+
     4 root      20   0       0      0      0 S  0.0  0.0   0:00.00 [kworker/0:+
     5 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [kworker/0:+
     7 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 [migration/+
     8 root      20   0       0      0      0 S  0.0  0.0   0:00.00 [rcu_bh]
     9 root      20   0       0      0      0 S  0.0  0.0   0:00.77 [rcu_sched]
    10 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [lru-add-dr+
    11 root      rt   0       0      0      0 S  0.0  0.0   0:00.01 [watchdog/0]
    13 root      20   0       0      0      0 S  0.0  0.0   0:00.00 [kdevtmpfs]
    14 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [netns]
    15 root      20   0       0      0      0 S  0.0  0.0   0:00.00 [khungtaskd]
    16 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [writeback]
    17 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [kintegrity+
    18 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [bioset]
    19 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [bioset]
    20 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 [bioset]
```

或者你也可以使用以下格式在远程系统上运行多条命令：

```
$ ssh daygeek@CentOS7.2daygeek.com << EOF
hostnamectl
free -m
grep daygeek /etc/passwd
EOF
```

上面命令的输出如下：

```
Pseudo-terminal will not be allocated because stdin is not a terminal.
    Static hostname: CentOS7.2daygeek.com
          Icon name: computer-vm
            Chassis: vm
         Machine ID: 002f47b82af248f5be1d67b67e03514c
            Boot ID: dca9a1ba06374d7d96678f9461752482
     Virtualization: kvm
   Operating System: CentOS Linux 7 (Core)
        CPE OS Name: cpe:/o:centos:centos:7
             Kernel: Linux 3.10.0-957.el7.x86_64
       Architecture: x86-64

               total        used        free      shared  buff/cache   available
 Mem:           1838         335        1146          11         355        1314
 Swap:          2047           0        2047

 daygeek:x:1000:1000:2daygeek:/home/daygeek:/bin/bash
```

### 7) 如何在远程系统上运行本地 Bash 脚本

下面的例子允许用户通过 ssh 在远程 Linux 机器上运行本地 [bash 脚本][5] `remote-test.sh`。

创建一个 shell 脚本并执行它。

```
$ vi /tmp/remote-test.sh

#!/bin/bash
#Name: remote-test.sh
#--------------------
 uptime
 free -m
 df -h
 uname -a
 hostnamectl
```

上面命令的输出如下：

```
$ ssh daygeek@CentOS7.2daygeek.com 'bash -s' < /tmp/remote-test.sh

  01:17:09 up 22 min,  1 user,  load average: 0.00, 0.02, 0.08

               total        used        free      shared  buff/cache   available
 Mem:           1838         333        1148          11         355        1316
 Swap:          2047           0        2047

 Filesystem               Size  Used Avail Use% Mounted on
 /dev/mapper/centos-root   27G  4.4G   23G  17% /
 devtmpfs                 903M     0  903M   0% /dev
 tmpfs                    920M     0  920M   0% /dev/shm
 tmpfs                    920M  9.3M  910M   2% /run
 tmpfs                    920M     0  920M   0% /sys/fs/cgroup
 /dev/sda1               1014M  179M  836M  18% /boot
 tmpfs                    184M   12K  184M   1% /run/user/42
 tmpfs                    184M     0  184M   0% /run/user/1000

 Linux CentOS7.2daygeek.com 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

    Static hostname: CentOS7.2daygeek.com
          Icon name: computer-vm
            Chassis: vm
         Machine ID: 002f47b82af248f5be1d67b67e03514c
            Boot ID: dca9a1ba06374d7d96678f9461752482
     Virtualization: kvm
   Operating System: CentOS Linux 7 (Core)
        CPE OS Name: cpe:/o:centos:centos:7
             Kernel: Linux 3.10.0-957.el7.x86_64
       Architecture: x86-64
```

或者也可以使用管道。如果你觉得输出不太好看，再做点修改让它更优雅些。

```
$ vi /tmp/remote-test-1.sh

#!/bin/bash
#Name: remote-test.sh
 echo "---------System Uptime--------------------------------------------"
 uptime
 echo -e "\n"
 echo "---------Memory Usage---------------------------------------------"
 free -m
 echo -e "\n"
 echo "---------Disk Usage-----------------------------------------------"
 df -h
 echo -e "\n"
 echo "---------Kernel Version-------------------------------------------"
 uname -a
 echo -e "\n"
 echo "---------HostName Info--------------------------------------------"
 hostnamectl
 echo "------------------------------------------------------------------"
```

上面脚本的输出如下：

```
$ cat /tmp/remote-test.sh  | ssh daygeek@CentOS7.2daygeek.com
 Pseudo-terminal will not be allocated because stdin is not a terminal.
 ---------System Uptime--------------------------------------------
  03:14:09 up  2:19,  1 user,  load average: 0.00, 0.01, 0.05

 ---------Memory Usage---------------------------------------------
               total        used        free      shared  buff/cache   available
 Mem:           1838         376        1063          11         398        1253
 Swap:          2047           0        2047

 ---------Disk Usage-----------------------------------------------
 Filesystem               Size  Used Avail Use% Mounted on
 /dev/mapper/centos-root   27G  4.4G   23G  17% /
 devtmpfs                 903M     0  903M   0% /dev
 tmpfs                    920M     0  920M   0% /dev/shm
 tmpfs                    920M  9.3M  910M   2% /run
 tmpfs                    920M     0  920M   0% /sys/fs/cgroup
 /dev/sda1               1014M  179M  836M  18% /boot
 tmpfs                    184M   12K  184M   1% /run/user/42
 tmpfs                    184M     0  184M   0% /run/user/1000
 tmpfs                    184M     0  184M   0% /run/user/0

 ---------Kernel Version-------------------------------------------
 Linux CentOS7.2daygeek.com 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

 ---------HostName Info--------------------------------------------
    Static hostname: CentOS7.2daygeek.com
          Icon name: computer-vm
            Chassis: vm
         Machine ID: 002f47b82af248f5be1d67b67e03514c
            Boot ID: dca9a1ba06374d7d96678f9461752482
     Virtualization: kvm
   Operating System: CentOS Linux 7 (Core)
        CPE OS Name: cpe:/o:centos:centos:7
             Kernel: Linux 3.10.0-957.el7.x86_64
       Architecture: x86-64
```

### 8) 如何同时在多个远程系统上运行多条指令

下面的 bash 脚本允许用户同时在多个远程系统上运行多条指令。使用简单的 `for` 循环实现。

为了实现这个目的，你可以尝试 [PSSH 命令][7] 或 [ClusterShell 命令][8] 或 [DSH 命令][9]。

```
$ vi /tmp/multiple-host.sh

 for host in CentOS7.2daygeek.com CentOS6.2daygeek.com
 do
    ssh daygeek@CentOS7.2daygeek.com${host} "uname -a;uptime;date;w"
 done
```

上面脚本的输出如下：

```
$ sh multiple-host.sh

 Linux CentOS7.2daygeek.com 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

  01:33:57 up 39 min,  1 user,  load average: 0.07, 0.06, 0.06

 Wed Sep 25 01:33:57 CDT 2019

  01:33:57 up 39 min,  1 user,  load average: 0.07, 0.06, 0.06
 USER     TTY      FROM             daygeek@CentOS7.2daygeek.com   IDLE   JCPU   PCPU WHAT
 daygeek  pts/0    192.168.1.6      01:08   23:25   0.06s  0.06s -bash

 Linux CentOS6.2daygeek.com 2.6.32-754.el6.x86_64 #1 SMP Tue Jun 19 21:26:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

  23:33:58 up 39 min,  0 users,  load average: 0.00, 0.00, 0.00

 Tue Sep 24 23:33:58 MST 2019

  23:33:58 up 39 min,  0 users,  load average: 0.00, 0.00, 0.00
 USER     TTY      FROM             daygeek@CentOS7.2daygeek.com   IDLE   JCPU   PCPU WHAT
```

### 9) 如何使用 sshpass 命令添加一个密码

如果你觉得每次输入密码很麻烦，我建议你视你的需求选择以下方法中的一项来解决这个问题。

如果你经常进行类似的操作，我建议你设置 [免密码认证][10]，因为它是标准且永久的解决方案。

如果你一个月只是执行几次这些任务，我推荐你使用 `sshpass` 工具。只需要使用 `-p` 参数选项提供你的密码即可。

```
$ sshpass -p '在这里输入你的密码' ssh -p 2200 daygeek@CentOS7.2daygeek.com ip a

 1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
     inet6 ::1/128 scope host
        valid_lft forever preferred_lft forever
 2: eth0:  mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
     link/ether 08:00:27:18:90:7f brd ff:ff:ff:ff:ff:ff
     inet 192.168.1.12/24 brd 192.168.1.255 scope global dynamic eth0
        valid_lft 86145sec preferred_lft 86145sec
     inet6 fe80::a00:27ff:fe18:907f/64 scope link tentative dadfailed
        valid_lft forever preferred_lft forever
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/execute-run-linux-commands-remote-system-over-ssh/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
[2]: https://www.2daygeek.com/how-to-configure-sudo-access-in-linux/
[3]: https://www.2daygeek.com/linux-fdisk-command-to-manage-disk-partitions/
[4]: https://www.2daygeek.com/four-methods-to-change-the-hostname-in-linux/
[5]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
[6]: https://www.2daygeek.com/category/shell-script/
[7]: https://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
[8]: https://www.2daygeek.com/clustershell-clush-run-commands-on-cluster-nodes-remote-system-in-parallel-linux/
[9]: https://www.2daygeek.com/dsh-run-execute-shell-commands-on-multiple-linux-servers-at-once/
[10]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
