使用 sar 和 kSar 来发现 Linux 性能瓶颈
======

`sar` 命令用用收集、报告、或者保存 UNIX / Linux 系统的活动信息。它保存选择的计数器到操作系统的 `/var/log/sa/sadd` 文件中。从收集的数据中，你可以得到许多关于你的服务器的信息：

1. CPU 使用率
2. 内存页面和使用率
3. 网络 I/O 和传输统计
4. 进程创建活动
5. 所有的块设备活动
6. 每秒中断数等等

`sar` 命令的输出能够用于识别服务器瓶颈。但是，分析 `sar` 命令提供的信息可能比较困难，所以要使用 kSar 工具。kSar 工具可以将 `sar` 命令的输出绘制成基于时间周期的、易于理解的图表。

### sysstat 包

`sar`、`sa1`、和 `sa2` 命令都是 sysstat 包的一部分。它是 Linux 包含的性能监视工具集合。

1. `sar`：显示数据
2. `sa1` 和 `sa2`：收集和保存数据用于以后分析。`sa2` shell 脚本在 `/var/log/sa` 目录中每日写入一个报告。`sa1` shell 脚本将每日的系统活动信息以二进制数据的形式写入到文件中。
3. sadc —— 系统活动数据收集器。你可以通过修改 `sa1` 和 `sa2` 脚本去配置各种选项。它们位于以下的目录：
    * `/usr/lib64/sa/sa1` （64 位）或者 `/usr/lib/sa/sa1` （32 位） —— 它调用 `sadc` 去记录报告到 `/var/log/sa/sadX` 格式。
    * `/usr/lib64/sa/sa2` （64 位）或者 `/usr/lib/sa/sa2` （32 位） —— 它调用 `sar` 去记录报告到 `/var/log/sa/sarX` 格式。

#### 如何在我的系统上安装 sar？

在一个基于 CentOS/RHEL 的系统上，输入如下的 [yum 命令][1] 去安装 sysstat：

```
# yum install sysstat
```

示例输出如下：

```
Loaded plugins: downloadonly, fastestmirror, priorities,
              : protectbase, security
Loading mirror speeds from cached hostfile
 * addons: mirror.cs.vt.edu
 * base: mirror.ash.fastserv.com
 * epel: serverbeach1.fedoraproject.org
 * extras: mirror.cogentco.com
 * updates: centos.mirror.nac.net
0 packages excluded due to repository protections
Setting up Install Process
Resolving Dependencies
--&gt; Running transaction check
---&gt; Package sysstat.x86_64 0:7.0.2-3.el5 set to be updated
--&gt; Finished Dependency Resolution
 
Dependencies Resolved
 
====================================================================
 Package        Arch          Version             Repository   Size
====================================================================
Installing:
 sysstat        x86_64        7.0.2-3.el5         base        173 k
 
Transaction Summary
====================================================================
Install      1 Package(s)
Update       0 Package(s)
Remove       0 Package(s)
 
Total download size: 173 k
Is this ok [y/N]: y
Downloading Packages:
sysstat-7.0.2-3.el5.x86_64.rpm               | 173 kB     00:00
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing     : sysstat                                      1/1
 
Installed:
  sysstat.x86_64 0:7.0.2-3.el5
 
Complete!
```

#### 为 sysstat 配置文件

编辑 `/etc/sysconfig/sysstat` 文件去指定日志文件保存多少天（最长为一个月）：

```
# vi /etc/sysconfig/sysstat
```

示例输出如下 ：

```
# keep log for 28 days
# the default is 7
HISTORY=28
```

保存并关闭这个文件。

### 找到 sar 默认的 cron 作业

[默认的 cron 作业位于][2] `/etc/cron.d/sysstat`：

```
# cat /etc/cron.d/sysstat
```

示例输出如下：

```
# run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 1 1
# generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
```

#### 告诉 sadc 去报告磁盘的统计数据

使用一个文本编辑器去编辑 `/etc/cron.d/sysstat` 文件，比如使用 `vim` 命令，输入如下：

```
# vi /etc/cron.d/sysstat
```

像下面的示例那样更新这个文件，以记录所有的硬盘统计数据（`-d` 选项强制记录每个块设备的统计数据，而 `-I` 选项强制记录所有系统中断的统计数据）：

```
# run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 -I -d 1 1
# generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A 
```

在 CentOS/RHEL 7.x 系统上你需要传递 `-S DISK` 选项去收集块设备的数据。传递 `-S XALL` 选项去采集如下所列的数据：

1. 磁盘
2. 分区
3. 系统中断
4. SNMP
5. IPv6

```
# Run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 -S DISK 1 1
# 0 * * * * root /usr/lib64/sa/sa1 600 6 &
# Generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
# Run system activity accounting tool every 10 minutes
```

保存并关闭这个文件。

#### 打开 CentOS/RHEL 版本 5.x/6.x 的服务

输入如下命令:

```
chkconfig sysstat on
service sysstat start
```

示例输出如下：

```
Calling the system activity data collector (sadc):
```

对于 CentOS/RHEL 7.x，运行如下的命令：

```
# systemctl enable sysstat
# systemctl start sysstat.service
# systemctl status sysstat.service 
```

示例输出：

```
● sysstat.service - Resets System Activity Logs
   Loaded: loaded (/usr/lib/systemd/system/sysstat.service; enabled; vendor preset: enabled)
   Active: active (exited) since Sat 2018-01-06 16:33:19 IST; 3s ago
  Process: 28297 ExecStart=/usr/lib64/sa/sa1 --boot (code=exited, status=0/SUCCESS)
 Main PID: 28297 (code=exited, status=0/SUCCESS)
 
Jan 06 16:33:19 centos7-box systemd[1]: Starting Resets System Activity Logs...
Jan 06 16:33:19 centos7-box systemd[1]: Started Resets System Activity Logs.
```

### 如何使用 sar？如何查看统计数据？

使用 `sar` 命令去显示操作系统中选定的累积活动计数器输出。在这个示例中，运行 `sar` 命令行，去实时获得 CPU 使用率的报告：

```
# sar -u 3 10
```

示例输出：

```
Linux 2.6.18-164.2.1.el5 (www-03.nixcraft.in) 	12/14/2009

09:49:47 PM CPU %user %nice %system %iowait %steal %idle
09:49:50 PM all 5.66 0.00 1.22 0.04 0.00 93.08
09:49:53 PM all 12.29 0.00 1.93 0.04 0.00 85.74
09:49:56 PM all 9.30 0.00 1.61 0.00 0.00 89.10
09:49:59 PM all 10.86 0.00 1.51 0.04 0.00 87.58
09:50:02 PM all 14.21 0.00 3.27 0.04 0.00 82.47
09:50:05 PM all 13.98 0.00 4.04 0.04 0.00 81.93
09:50:08 PM all 6.60 6.89 1.26 0.00 0.00 85.25
09:50:11 PM all 7.25 0.00 1.55 0.04 0.00 91.15
09:50:14 PM all 6.61 0.00 1.09 0.00 0.00 92.31
09:50:17 PM all 5.71 0.00 0.96 0.00 0.00 93.33
Average: all 9.24 0.69 1.84 0.03 0.00 88.20
```

其中：

  * 3 表示间隔时间
  * 10 表示次数

查看进程创建的统计数据，输入：

```
# sar -c 3 10
```

查看 I/O 和传输率统计数据，输入：

```
# sar -b 3 10
```

查看内存页面统计数据，输入：

```
# sar -B 3 10
```

查看块设备统计数据，输入：

```
# sar -d 3 10
```

查看所有中断的统计数据，输入：

```
# sar -I XALL 3 10
```

查看网络设备特定的统计数据，输入：

```
# sar -n DEV 3 10
# sar -n EDEV 3 10
```

查看 CPU 特定的统计数据，输入：

```
# sar -P ALL
# Only 1st CPU stats
# sar -P 1 3 10 
```

查看队列长度和平均负载的统计数据，输入：

```
# sar -q 3 10
```

查看内存和交换空间的使用统计数据，输入：

```
# sar -r 3 10
# sar -R 3 10
```

查看 inode、文件、和其它内核表统计数据状态，输入：

```
# sar -v 3 10
```

查看系统切换活动统计数据，输入：

```
# sar -w 3 10
```

查看交换统计数据，输入：

```
# sar -W 3 10
```

查看一个 PID 为 3256 的  Apache 进程，输入：

```
# sar -x 3256 3 10
```

### kSar 介绍

`sar` 和 `sadf` 提供了基于命令行界面的输出。这种输出可能会使新手用户/系统管理员感到无从下手。因此，你需要使用 kSar，它是一个图形化显示你的 `sar` 数据的 Java 应用程序。它也允许你以 PDF/JPG/PNG/CSV 格式导出数据。你可以用三种方式去加载数据：本地文件、运行本地命令、以及通过 SSH 远程运行的命令。kSar 可以处理下列操作系统的 `sar` 输出：

1. Solaris 8, 9 和 10
2. Mac OS/X 10.4+
3. Linux (Systat Version >= 5.0.5)
4. AIX (4.3 & 5.3)
5. HPUX 11.00+

#### 下载和安装 kSar

访问 [官方][3] 网站去获得最新版本的源代码。使用 [wget][4] 去下载源代码，输入：

```
$ wget https://github.com/vlsi/ksar/releases/download/v5.2.4-snapshot-652bf16/ksar-5.2.4-SNAPSHOT-all.jar
```

#### 如何运行 kSar？

首先要确保你的机器上 [JAVA jdk][5] 已安装并能够正常工作。输入下列命令去启动 kSar：

```
$ java -jar ksar-5.2.4-SNAPSHOT-all.jar
```

![Fig.01: kSar welcome screen][6]

接下来你将看到 kSar 的主窗口，和有两个菜单的面板。

![Fig.02: kSar - the main window][7]

左侧有一个列表，是 kSar 根据数据已经解析出的可用图表的列表。右侧窗口将展示你选定的图表。

#### 如何使用 kSar 去生成 sar 图表？

首先，你需要从命名为 server1 的服务器上采集 `sar` 命令的统计数据。输入如下的命令：

```
[ server1 ]# LC_ALL=C sar -A  > /tmp/sar.data.txt
```

接下来，使用 `scp` 命令从本地桌面拷贝到远程电脑上：

```
[ desktop ]$ scp user@server1.nixcraft.com:/tmp/sar.data.txt /tmp/
```

切换到 kSar 窗口，点击  “Data” > “Load data from text file” >  从 `/tmp/` 中选择 `sar.data.txt` > 点击 “Open” 按钮。

现在，图表类型树已经出现在左侧面板中并选定了一个图形：

![Fig.03: Processes for server1][8]

![Fig.03: Disk stats (blok device) stats for server1][9]

![Fig.05: Memory stats for server1][10]

##### 放大和缩小

通过移动你可以交互式缩放图像的一部分。在要缩放的图像的左上角点击并按下鼠标，移动到要缩放区域的右下角，可以选定要缩放的区域。返回到未缩放状态，点击并拖动鼠标到除了右下角外的任意位置，你也可以点击并选择 zoom 选项。

##### 了解 kSar 图像和 sar 数据

我强烈建议你去阅读 `sar` 和 `sadf` 命令的 man 页面：

```
$ man sar
$ man sadf
```

### 案例学习：识别 Linux 服务器的 CPU 瓶颈

使用 `sar` 命令和 kSar 工具，可以得到内存、CPU、以及其它子系统的详细快照。例如，如果 CPU 使用率在一个很长的时间内持续高于 80%，有可能就是出现了一个 CPU 瓶颈。使用 `sar -x ALL` 你可以找到大量消耗 CPU 的进程。

[mpstat 命令][11] 的输出（sysstat 包的一部分）也会帮你去了解 CPU 的使用率。但你可以使用 kSar 很容易地去分析这些信息。

#### 找出 CPU 瓶颈后 …

对 CPU 执行如下的调整：

1. 确保没有不需要的进程在后台运行。关闭 [Linux 上所有不需要的服务][12]。
2. 使用 [cron][13] 在一个非高峰时刻运行任务（比如，备份）。
3. 使用 [top 和 ps 命令][14] 去找出所有非关键的后台作业/服务。使用 [renice 命令][15] 去调整低优先级作业。
4. 使用 [taskset 命令去设置进程使用的 CPU ][16] （卸载所使用的 CPU），即，绑定进程到不同的 CPU 上。例如，在 2# CPU 上运行 MySQL 数据库，而在 3# CPU 上运行 Apache。
5. 确保你的系统使用了最新的驱动程序和固件。
6. 如有可能在系统上增加额外的 CPU。
7. 为单线程应用程序使用更快的 CPU（比如，Lighttpd web 服务器应用程序）。
8. 为多线程应用程序使用多个 CPU（比如，MySQL 数据库服务器应用程序）。
9. 为一个 web 应用程序使用多个计算节点并设置一个 [负载均衡器][17]。

### isag —— 交互式系统活动记录器（替代工具）

`isag` 命令图形化显示了以前运行 `sar` 命令时存储在二进制文件中的系统活动数据。`isag` 命令引用 `sar` 并提取出它的数据来绘制图形。与 kSar 相比，`isag` 的选项比较少。

![Fig.06: isag CPU utilization graphs][18]

### 关于作者

本文作者是 nixCraft 的创始人和一位经验丰富的 Linux 操作系统/Unix shell 脚本培训师。他与包括 IT、教育、国防和空间研究、以及非营利组织等全球各行业客户一起合作。可以在 [Twitter][19]、[Facebook][20]、[Google+][21] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/identifying-linux-bottlenecks-sar-graphs-with-ksar.html

作者：[Vivek Gite][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ "See Linux/Unix yum command examples for more info"
[2]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/
[3]:https://github.com/vlsi/ksar
[4]:https://www.cyberciti.biz/tips/linux-wget-your-ultimate-command-line-downloader.html
[5]:https://www.cyberciti.biz/faq/howto-ubuntu-linux-install-configure-jdk-jre/
[6]:https://www.cyberciti.biz/media/new/tips/2009/12/sar-welcome.png "kSar welcome screen"
[7]:https://www.cyberciti.biz/media/new/tips/2009/12/screenshot-kSar-a-sar-grapher-01.png "kSar - the main window"
[8]:https://www.cyberciti.biz/media/new/tips/2009/12/cpu-ksar.png "Linux kSar Processes for server1 "
[9]:https://www.cyberciti.biz/media/new/tips/2009/12/disk-stats-ksar.png "Linux Disk I/O Stats Using kSar"
[10]:https://www.cyberciti.biz/media/new/tips/2009/12/memory-ksar.png "Linux Memory paging and its utilization stats"
[11]:https://www.cyberciti.biz/tips/how-do-i-find-out-linux-cpu-utilization.html
[12]:https://www.cyberciti.biz/faq/check-running-services-in-rhel-redhat-fedora-centoslinux/
[13]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/
[14]:https://www.cyberciti.biz/faq/show-all-running-processes-in-linux/
[15]:https://www.cyberciti.biz/faq/howto-change-unix-linux-process-priority/
[16]:https://www.cyberciti.biz/faq/taskset-cpu-affinity-command/
[17]:https://www.cyberciti.biz/tips/load-balancer-open-source-software.html
[18]:https://www.cyberciti.biz/media/new/tips/2009/12/isag.cpu_.png "Fig.06: isag CPU utilization graphs"
[19]:https://twitter.com/nixcraft
[20]:https://facebook.com/nixcraft
[21]:https://plus.google.com/+CybercitiBiz
