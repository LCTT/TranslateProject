[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11352-1.html)
[#]: subject: (How to Get Average CPU and Memory Usage from SAR Reports Using the Bash Script)
[#]: via: (https://www.2daygeek.com/linux-get-average-cpu-memory-utilization-from-sar-data-report/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何使用 Bash 脚本从 SAR 报告中获取 CPU 和内存使用情况
======

大多数 Linux 管理员使用 [SAR 报告][1]监控系统性能，因为它会收集一周的性能数据。但是，你可以通过更改 `/etc/sysconfig/sysstat` 文件轻松地将其延长到四周。同样，这段时间可以延长一个月以上。如果超过 28，那么日志文件将放在多个目录中，每月一个。

要将覆盖期延长至 28 天，请对 `/etc/sysconfig/sysstat` 文件做以下更改。

编辑 `sysstat` 文件并将 `HISTORY=7` 更改为 `HISTORY=28`。

在本文中，我们添加了三个 bash 脚本，它们可以帮助你在一个地方轻松查看每个数据文件的平均值。

我们过去加过许多有用的 shell 脚本。如果你想查看它们，请进入下面的链接。

* [如何使用 shell 脚本自动化日常操作][2]

这些脚本简单明了。出于测试目的，我们仅包括两个性能指标，即 CPU 和内存。你可以修改脚本中的其他性能指标以满足你的需求。

### 脚本 1：从 SAR 报告中获取平均 CPU 利用率的 Bash 脚本

该 bash 脚本从每个数据文件中收集 CPU 平均值并将其显示在一个页面上。

由于是月末，它显示了 2019 年 8 月的 28 天数据。

```
# vi /opt/scripts/sar-cpu-avg.sh

#!/bin/sh

echo "+----------------------------------------------------------------------------------+"
echo "|Average:         CPU     %user     %nice   %system   %iowait    %steal     %idle  |"
echo "+----------------------------------------------------------------------------------+"

for file in `ls -tr /var/log/sa/sa* | grep -v sar`
do
    dat=`sar -f $file | head -n 1 | awk '{print $4}'`
    echo -n $dat
    sar -f $file  | grep -i Average | sed "s/Average://"
done

echo "+----------------------------------------------------------------------------------+"
```

运行脚本后，你将看到如下输出。

```
# sh /opt/scripts/sar-cpu-avg.sh

+----------------------------------------------------------------------------------+
|Average:         CPU     %user     %nice   %system   %iowait    %steal     %idle  |
+----------------------------------------------------------------------------------+
08/01/2019        all      0.70      0.00      1.19      0.00      0.00     98.10
08/02/2019        all      1.73      0.00      3.16      0.01      0.00     95.10
08/03/2019        all      1.73      0.00      3.16      0.01      0.00     95.11
08/04/2019        all      1.02      0.00      1.80      0.00      0.00     97.18
08/05/2019        all      0.68      0.00      1.08      0.01      0.00     98.24
08/06/2019        all      0.71      0.00      1.17      0.00      0.00     98.12
08/07/2019        all      1.79      0.00      3.17      0.01      0.00     95.03
08/08/2019        all      1.78      0.00      3.14      0.01      0.00     95.08
08/09/2019        all      1.07      0.00      1.82      0.00      0.00     97.10
08/10/2019        all      0.38      0.00      0.50      0.00      0.00     99.12
.
.
.
08/29/2019        all      1.50      0.00      2.33      0.00      0.00     96.17
08/30/2019        all      2.32      0.00      3.47      0.01      0.00     94.20
+----------------------------------------------------------------------------------+
```

### 脚本 2：从 SAR 报告中获取平均内存利用率的 Bash 脚本

该 bash 脚本从每个数据文件中收集内存平均值并将其显示在一个页面上。

由于是月末，它显示了 2019 年 8 月的 28 天数据。

```
# vi /opt/scripts/sar-memory-avg.sh

#!/bin/sh

echo "+-------------------------------------------------------------------------------------------------------------------+"
echo "|Average:       kbmemfree kbmemused  %memused kbbuffers kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty  |"
echo "+-------------------------------------------------------------------------------------------------------------------+"

for file in `ls -tr /var/log/sa/sa* | grep -v sar`
do
    dat=`sar -f $file | head -n 1 | awk '{print $4}'`
    echo -n $dat
    sar -r -f $file  | grep -i Average | sed "s/Average://"
done

echo "+-------------------------------------------------------------------------------------------------------------------+"
```

运行脚本后，你将看到如下输出。

```
# sh /opt/scripts/sar-memory-avg.sh

+--------------------------------------------------------------------------------------------------------------------+
|Average:        kbmemfree kbmemused  %memused kbbuffers kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty  |
+--------------------------------------------------------------------------------------------------------------------+
08/01/2019      1492331   2388461     61.55     29888   1152142   1560615     12.72   1693031    380472         6
08/02/2019      1493126   2387666     61.53     29888   1147811   1569624     12.79   1696387    373346         3
08/03/2019      1489582   2391210     61.62     29888   1147076   1581711     12.89   1701480    370325         3
08/04/2019      1490403   2390389     61.60     29888   1148206   1569671     12.79   1697654    373484         4
08/05/2019      1484506   2396286     61.75     29888   1152409   1563804     12.75   1702424    374628         4
08/06/2019      1473593   2407199     62.03     29888   1151137   1577491     12.86   1715426    371000         8
08/07/2019      1467150   2413642     62.19     29888   1155639   1596653     13.01   1716900    372574        13
08/08/2019      1451366   2429426     62.60     29888   1162253   1604672     13.08   1725931    376998         5
08/09/2019      1451191   2429601     62.61     29888   1158696   1582192     12.90   1728819    371025         4
08/10/2019      1450050   2430742     62.64     29888   1160916   1579888     12.88   1729975    370844         5
.
.
.
08/29/2019      1365699   2515093     64.81     29888   1198832   1593567     12.99   1781733    376157        15
08/30/2019      1361920   2518872     64.91     29888   1200785   1595105     13.00   1784556    375641         8
+-------------------------------------------------------------------------------------------------------------------+
```

### 脚本 3：从 SAR 报告中获取 CPU 和内存平均利用率的 Bash 脚本

该 bash 脚本从每个数据文件中收集 CPU 和内存平均值并将其显示在一个页面上。

该脚本与上面相比稍微不同。它在同一位置同时显示两者（CPU 和内存）平均值，而不是其他数据。

```
# vi /opt/scripts/sar-cpu-mem-avg.sh

#!/bin/bash

for file in `ls -tr /var/log/sa/sa* | grep -v sar`
do
    sar -f $file | head -n 1 | awk '{print $4}'
    echo "-----------"
    sar -u -f $file | awk '/Average:/{printf("CPU Average: %.2f%\n"), 100 - $8}'
    sar -r -f $file | awk '/Average:/{printf("Memory Average: %.2f%\n"),(($3-$5-$6)/($2+$3)) * 100 }'
    printf "\n"
done
```

运行脚本后，你将看到如下输出。

```
# sh /opt/scripts/sar-cpu-mem-avg.sh

08/01/2019
-----------
CPU Average: 1.90%
Memory Average: 31.09%

08/02/2019
-----------
CPU Average: 4.90%
Memory Average: 31.18%

08/03/2019
-----------
CPU Average: 4.89%
Memory Average: 31.29%

08/04/2019
-----------
CPU Average: 2.82%
Memory Average: 31.24%

08/05/2019
-----------
CPU Average: 1.76%
Memory Average: 31.28%
.
.
.
08/29/2019
-----------
CPU Average: 3.83%
Memory Average: 33.15%

08/30/2019
-----------
CPU Average: 5.80%
Memory Average: 33.19%
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-get-average-cpu-memory-utilization-from-sar-data-report/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/sar-system-performance-monitoring-command-tool-linux/
[2]: https://www.2daygeek.com/category/shell-script/
