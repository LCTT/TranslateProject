[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12477-1.html)
[#]: subject: (Bash Script to Check How Long the High CPU/Memory Consumption Processes Runs on Linux)
[#]: via: (https://www.2daygeek.com/bash-script-to-check-how-long-the-high-cpu-memory-consumption-processes-runs-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

实用脚本：检查高 CPU / 内存消耗进程
======

![](https://img.linux.net.cn/data/attachment/album/202008/01/205420jllu1nsngu9qszu5.jpg)

过去，我们写了三篇不同的文章来使用 Linux 命令来识别这些进程。

你可以通过下面相关的 URL 立即访问：

  * [如何在 Linux 中找出 CPU 占用高的进程][1]
  * [如何在 Linux 中找出内存消耗最大的进程][2]
  * [在 Linux 中如何查找一个命令或进程的执行时间][3]

本教程中包含两个脚本，它们可以帮助你确定 Linux 上高 CPU/内存消耗进程的运行时间。

该脚本将显示进程 ID、进程的所有者、进程的名称以及进程的运行时间。这将帮助你确定哪些（必须事先完成）作业正在超时运行。这可以使用 `ps` 命令来实现。

### 什么是 ps 命令

`ps` 是<ruby>进程状态<rt>processes status</rt></ruby>，它显示有关系统上活动/正在运行的进程的信息。

它提供了当前进程的快照以及详细信息，例如用户名、用户 ID、CPU 使用率、内存使用率、进程开始日期和时间等。

#### 1）检查高 CPU 消耗进程在 Linux 上运行了多长时间的 Bash 脚本

该脚本将帮助你确定高 CPU 消耗进程在 Linux 上运行了多长时间。

```
# vi /opt/scripts/long-running-cpu-proc.sh

#!/bin/bash
ps -eo pid,user,ppid,%mem,%cpu,cmd --sort=-%cpu | head | tail -n +2 | awk '{print $1}' > /tmp/long-running-processes.txt
echo "--------------------------------------------------"
echo "UName     PID  CMD            Process_Running_Time"
echo "--------------------------------------------------"
for userid in `cat /tmp/long-running-processes.txt`
do
username=$(ps -u -p $userid | tail -1 | awk '{print $1}')
pruntime=$(ps -p $userid -o etime | tail -1)
ocmd=$(ps -p $userid | tail -1 | awk '{print $4}')
echo "$username $userid $ocmd $pruntime"
done | column -t
echo "--------------------------------------------------"
```

给 `long-running-cpu-proc.sh` 设置可执行的 [Linux 文件权限][4]。

```
# chmod +x /opt/scripts/long-running-cpu-proc.sh
```

运行此脚本时，你将获得类似以下的输出：

```
# sh /opt/scripts/long-running-cpu-proc.sh

----------------------------------------------------
UName     PID  CMD       Process_Running_Time
----------------------------------------------------
daygeek  5214  Web       01:18:48
daygeek  5748  Web       01:08:20
daygeek  8043  inkscape  22:11
daygeek  5269  Web       01:18:31
daygeek  1712  Web       10:44:50
daygeek  5335  RDD       01:17:54
daygeek  1639  firefox   10:44:51
daygeek  7793  nautilus  24:14
daygeek  6301  Web       57:40
----------------------------------------------------
```

#### 2）检查高内存消耗进程在 Linux 上运行了多长时间的 Bash 脚本

该脚本将帮助你确定最大的内存消耗进程在 Linux 上运行了多长时间。

```
# sh /opt/scripts/long-running-memory-proc.sh

#!/bin/bash
ps -eo pid,user,ppid,%mem,%cpu,cmd --sort=-%mem | head | tail -n +2 | awk '{print $1}' > /tmp/long-running-processes-1.txt
echo "--------------------------------------------------"
echo "UName     PID  CMD          Process_Running_Time"
echo "--------------------------------------------------"
for userid in `cat /tmp/long-running-processes-1.txt`
do
username=$(ps -u -p $userid | tail -1 | awk '{print $1}')
pruntime=$(ps -p $userid -o etime | tail -1)
ocmd=$(ps -p $userid | tail -1 | awk '{print $4}')
echo "$username $userid $ocmd $pruntime"
done | column -t
echo "--------------------------------------------------"
```

给 `long-running-memory-proc.sh` 设置可执行的 Linux 文件权限。

```
# chmod +x /opt/scripts/long-running-memory-proc.sh
```

运行此脚本时，你将获得类似以下的输出：

```
# sh /opt/scripts/long-running-memory-proc.sh

----------------------------------------------------
UName    PID   CMD       Process_Running_Time
----------------------------------------------------
daygeek  1639  firefox   10:44:56
daygeek  2997  Web       10:39:54
daygeek  5269  Web       01:18:37
daygeek  1712  Web       10:44:55
daygeek  8043  inkscape  22:17
daygeek  5214  Web       01:18:54
daygeek  1898  Web       10:44:48
daygeek  1129  Xorg      10:45:07
daygeek  6301  Web       57:45
----------------------------------------------------
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-check-how-long-the-high-cpu-memory-consumption-processes-runs-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11678-1.html
[2]: https://linux.cn/article-11542-1.html
[3]: https://linux.cn/article-10261-1.html
[4]: https://www.2daygeek.com/understanding-linux-file-permissions/
