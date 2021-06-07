[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10868-1.html)
[#]: subject: (Linux Shell Script To Monitor Disk Space Usage And Send Email)
[#]: via: (https://www.2daygeek.com/linux-shell-script-to-monitor-disk-space-usage-and-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

用 Linux Shell 脚本来监控磁盘使用情况并发送邮件
============================================

市场上有很多用来监控 Linux 系统的监控工具，当系统到达阀值后它将发送一封邮件。它监控所有的东西例如 CPU 利用率、内存利用率、交换空间利用率、磁盘空间利用率等等。然而，它更适合小环境和大环境。

想一想如果你只有少量系统，那么什么是最好的方式来应对这种情况。

是的，我们想要写一个 [shell 脚本][1] 来实现。

在这篇指南中我们打算写一个 shell 脚本来监控系统的磁盘空间使用率。当系统到达给定的阀值，它将给对应的邮件地址发送一封邮件。在这篇文章中我们总共添加了四个 shell 脚本，每个用于不同的目的。之后，我们会想出其他 shell 脚本来监控 CPU，内存和交换空间利用率。

在此之前，我想澄清一件事，根据我观察的磁盘空间使用率 shell 脚本使用情况。

大多数用户在多篇博客中评论说，当他们运行磁盘空间使用率脚本时他们获得了以下错误。

```
# sh /opt/script/disk-usage-alert-old.sh

/dev/mapper/vg_2g-lv_root
test-script.sh: line 7: [: /dev/mapper/vg_2g-lv_root: integer expression expected
/ 9.8G
```

是的，这是对的。甚至，当我第一次运行这个脚本的时候我遇到了相同的问题。之后，我发现了根本原因。

当你在基于 RHEL 5 & RHEL 6 的系统上运行包含用于磁盘空间警告的 `df -h` 或 `df -H` 的 shell 脚本中时，你会发现上述错误信息，因为输出格式不对，查看下列输出。

为了解决这个问题，我们需要用  `df -Ph` （POSIX 输出格式），但是默认的 `df -h` 在基于 RHEL 7 的系统上运行的很好。

```
# df -h

Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg_2g-lv_root
                       10G  6.7G  3.4G  67% /
tmpfs                 7.8G     0  7.8G   0% /dev/shm
/dev/sda1             976M   95M  830M  11% /boot
/dev/mapper/vg_2g-lv_home
                      5.0G  4.3G  784M  85% /home
/dev/mapper/vg_2g-lv_tmp
                      4.8G   14M  4.6G   1% /tmp
```

### 方法一：Linux Shell 脚本来监控磁盘空间使用率和发送邮件

你可以使用下列 shell 脚本在 Linux 系统中来监控磁盘空间使用率。

当系统到达给定的阀值限制时，它将发送一封邮件。在这个例子中，我们设置阀值为 60% 用于测试目的，你可以改变这个限制来符合你的需求。

如果超过一个文件系统到达给定的阀值，它将发送多封邮件，因为这个脚本使用了循环。

同样，替换你的邮件地址来获取这份警告。

```
# vi /opt/script/disk-usage-alert.sh

#!/bin/sh
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{print $1}' | sed s/%//g)
  partition=$(echo $output | awk '{print $2}')
  if [ $used -ge 60 ]; then
  echo "The partition \"$partition\" on $(hostname) has used $used% at $(date)" | mail -s "Disk Space Alert: $used% Used On $(hostname)" [email protected]
  fi
done
```

输出：我获得了下列两封邮件警告。

```
The partition "/dev/mapper/vg_2g-lv_home" on 2g.CentOS7 has used 85% at Mon Apr 29 06:16:14 IST 2019

The partition "/dev/mapper/vg_2g-lv_root" on 2g.CentOS7 has used 67% at Mon Apr 29 06:16:14 IST 2019
```

最终添加了一个 [cronjob][2] 来自动完成。它会每 10 分钟运行一次。

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert.sh
```

### 方法二：Linux Shell 脚本来监控磁盘空间使用率和发送邮件

作为代替，你可以使用下列的 shell 脚本。对比上面的脚本我们做了少量改变。

```
# vi /opt/script/disk-usage-alert-1.sh

#!/bin/sh
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read output;
do
  max=60%
  echo $output
  used=$(echo $output | awk '{print $1}')
  partition=$(echo $output | awk '{print $2}')
  if [ ${used%?} -ge ${max%?} ]; then
  echo "The partition \"$partition\" on $(hostname) has used $used at $(date)" | mail -s "Disk Space Alert: $used Used On $(hostname)" [email protected]
  fi
done
```

输出：我获得了下列两封邮件警告。


```
The partition "/dev/mapper/vg_2g-lv_home" on 2g.CentOS7 has used 85% at Mon Apr 29 06:16:14 IST 2019

The partition "/dev/mapper/vg_2g-lv_root" on 2g.CentOS7 has used 67% at Mon Apr 29 06:16:14 IST 2019
```

最终添加了一个 [cronjob][2] 来自动完成。它会每 10 分钟运行一次。

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert-1.sh
```

### 方法三：Linux Shell 脚本来监控磁盘空间使用率和发送邮件

我更喜欢这种方法。因为，它工作起来很有魔力，你只会收到一封关于所有事的邮件。

这相当简单和直接。

```
*/10 * * * * df -Ph | sed s/%//g | awk '{ if($5 > 60) print $0;}' | mail -s "Disk Space Alert On $(hostname)" [email protected]
```

输出： 我获得了一封关于所有警告的邮件。

```
Filesystem                            Size  Used Avail Use Mounted on
/dev/mapper/vg_2g-lv_root              10G  6.7G  3.4G  67 /
/dev/mapper/vg_2g-lv_home             5.0G  4.3G  784M  85 /home
```

### 方法四：Linux Shell 脚本来监控某个分区的磁盘空间使用情况和发送邮件

```
# vi /opt/script/disk-usage-alert-2.sh

#!/bin/bash
used=$(df -Ph | grep '/dev/mapper/vg_2g-lv_dbs' | awk {'print $5'})
max=80%
if [ ${used%?} -ge ${max%?} ]; then
echo "The Mount Point "/DB" on $(hostname) has used $used at $(date)" | mail -s "Disk space alert on $(hostname): $used used" [email protected]
fi
```

输出： 我得到了下面的邮件警告。

```
The partition /dev/mapper/vg_2g-lv_dbs on 2g.CentOS6 has used 82% at Mon Apr 29 06:16:14 IST 2019
```

最终添加了一个 [cronjob][2] 来自动完成这些工作。它将每 10 分钟运行一次。

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert-2.sh
```

注意： 你将在 10 分钟后收到一封邮件警告，因为这个脚本被计划为每 10 分钟运行一次（但也不是精确的 10 分钟，取决于时间）。

例如这个例子。如果你的系统在 8:25 到达了限制，你将在 5 分钟后收到邮件警告。希望现在讲清楚了。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-shell-script-to-monitor-disk-space-usage-and-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/







