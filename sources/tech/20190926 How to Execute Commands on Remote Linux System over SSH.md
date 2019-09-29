[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Execute Commands on Remote Linux System over SSH)
[#]: via: (https://www.2daygeek.com/execute-run-linux-commands-remote-system-over-ssh/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Execute Commands on Remote Linux System over SSH
======

We may need to perform some commands on the remote machine.

To do so, log in to a remote system and do it, if it’s once in a while.

But every time you do this, it can irritate you

If so, what is the better way to get out of it.

Yes, you can do this from your local system instead of logging in to the remote system.

Will it benefit me? Yeah definitely. This will save you good time.

How’s that happening? Yes, SSH allows you to run a command on a remote machine without logging in to a computer.

**The general syntax is as follow:**

```
$ ssh [User_Name]@[Rremote_Host_Name or IP] [Command or Script]
```

### 1) How to Run the Command on a Remote Linux System Over SSH

The following example allows users to run the **[df command][1]** via ssh on a remote Linux machine

```
$ ssh [email protected] df -h

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

### 2) How to Run Multiple Commands on a Remote Linux System Over SSH

The following example allows users to run multiple commands at once over ssh on the remote Linux system.

It’s running uptime command and free command on the remote Linux system simultaneously.

```
$ ssh [email protected] "uptime && free -m"

 23:05:10 up 10 min,  0 users,  load average: 0.00, 0.03, 0.03

              total       used       free     shared    buffers     cached
 Mem:          1878        432       1445          1        100        134
 -/+ buffers/cache:        197       1680
 Swap:         3071          0       3071
```

### 3) How to Run the Command with sudo Privilege on a Remote Linux System Over SSH

The following example allows users to run the **fdisk** command with **[sudo][2]** [][2]**[privilege][2]** on the remote Linux system via ssh.

Normal users are not allowed to execute commands available under the system binary **(/usr/sbin/)** directory. Users need root privileges to run it.

So to run the **[fdisk command][3]** on a Linux system, you need root privileges.

The which command returns the full path of the executable of the given command.

```
$ which fdisk
 /usr/sbin/fdisk
```

```
$ ssh -t [email protected] "sudo fdisk -l"
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

### 4) How to Run the Service Command with sudo Privilege on a Remote Linux System Over SSH

The following example allows users to run the service command with sudo privilege on the remote Linux system via ssh.

```
$ ssh -t [email protected] "sudo systemctl restart httpd"

 [sudo] password for daygeek:
 Connection to centos7.2daygeek.com closed.
```

### 5) How to Run the Command on a Remote Linux System Over SSH With Non-Standard Port

The following example allows users to run the **[hostnamectl command][4]** via ssh on a remote Linux machine with non-standard port.

```
$ ssh -p 2200 [email protected] hostnamectl

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

### 6) How to Save Output from Remote System to Local System

The following example allows users to remotely execute the **[top command][5]** on a Linux system via ssh and save the output to the local system.

```
$ ssh [email protected] "top -bc | head -n 35" > /tmp/top-output.txt
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

Alternatively, you can use the following format to run multiple commands on a remote system.

```
$ ssh [email protected] << EOF
hostnamectl
free -m
grep daygeek /etc/passwd
EOF
```

Output of the above command.

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

### 7) How to Execute Local Bash Scripts on Remote System

The following example allows users to run local **[bash script][6]** “remote-test.sh” via ssh on a remote Linux machine.

Create a shell script and execute it.

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

Output for the above command.

```
$ ssh [email protected] 'bash -s' < /tmp/remote-test.sh

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

Alternatively, the pipe can be used. If you think the output is not good, add few changes to make it more elegant.

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

Output for the above script.

```
$ cat /tmp/remote-test.sh  | ssh [email protected]
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

### 8) How to Run Multiple Commands on Multiple Remote Systems Simultaneously

The following bash script allows users to run multiple commands on multiple remote systems simultaneously. Use simple for loop to achieve it.

For this purpose, you can try with with the **[PSSH command][7]** or **[ClusterShell command][8]** or **[DSH command][9]**

```
$ vi /tmp/multiple-host.sh

 for host in CentOS7.2daygeek.com CentOS6.2daygeek.com
 do
    ssh [email protected]${host} "uname -a;uptime;date;w"
 done
```

Output for the above script:

```
$ sh multiple-host.sh

 Linux CentOS7.2daygeek.com 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

  01:33:57 up 39 min,  1 user,  load average: 0.07, 0.06, 0.06

 Wed Sep 25 01:33:57 CDT 2019

  01:33:57 up 39 min,  1 user,  load average: 0.07, 0.06, 0.06
 USER     TTY      FROM             [email protected]   IDLE   JCPU   PCPU WHAT
 daygeek  pts/0    192.168.1.6      01:08   23:25   0.06s  0.06s -bash

 Linux CentOS6.2daygeek.com 2.6.32-754.el6.x86_64 #1 SMP Tue Jun 19 21:26:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

  23:33:58 up 39 min,  0 users,  load average: 0.00, 0.00, 0.00

 Tue Sep 24 23:33:58 MST 2019

  23:33:58 up 39 min,  0 users,  load average: 0.00, 0.00, 0.00
 USER     TTY      FROM             [email protected]   IDLE   JCPU   PCPU WHAT
```

### 9) How to Add a Password Using the sshpass Command

If you are having trouble entering your password each time, I advise you to go with any one of the methods below as per your requirement.

If you are going to perform this type of activity frequently, I advise you to set up **[password-less authentication][10]** since it’s a standard and permanent solution.

If you only do these tasks a few times a month. I recommend you to use the **“sshpass”** utility.

Just provide a password as an argument using the **“-p”** option.

```
$ sshpass -p 'Your_Password_Here' ssh -p 2200 [email protected] ip a

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
