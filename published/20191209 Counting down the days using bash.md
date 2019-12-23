[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11672-1.html)
[#]: subject: (Counting down the days using bash)
[#]: via: (https://www.networkworld.com/article/3487712/counting-down-the-days-using-bash.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

用 bash 倒计时日期
======

> 需要知道重要事件发生前有多少天吗？让 Linux bash 和 date 命令可以帮助你！

![](https://img.linux.net.cn/data/attachment/album/201912/13/140725vdc3c7zj0o7ozc7j.jpg)

随着即将来临的重要假期，你可能需要提醒你还要准备多久。

幸运的是，你可以从 `date` 命令获得很多帮助。在本篇中，我们将研究 `date` 和 bash 脚本如何告诉你从今天到你预期的事件之间有多少天。

首先，在进行之前有几个提示。`date` 命令的 `%j` 选项将以 1 至 366 之间的数字显示当前日期。如你所想的一样，1 月 1 日将显示为 1，12 月 31 日将显示为 365 或 366，这取决于是否是闰年。继续尝试。你应该会看到以下内容：

```
$ date +%j
339
```

但是，你可以通过以下方式，在 `date` 命令中得到一年中*任何*一天的数字：

```
$ date -d "Mar 18" +%j
077
```

要记住的是，即使该日期是过去的日期，上面命令也会向你显示*当年*的日期。但是，你可以在命令中添加年来修复该问题：

```
$ date -d "Apr 29" +%j
119
$ date -d "Apr 29 2020" +%j
120
```

在闰年中，4 月 29 日将是一年的 120 天，而不是 119 天。

如果你想倒数圣诞节之前的日子并且不想在挂历上留下指纹，你可以使用以下脚本：

```
#!/bin/sh

XMAS=`date -d "Dec 25" +%j`
TODAY=`date +%j`
DAYS=$(($XMAS - $TODAY))

case $DAYS in
  0) echo "It's today! Merry Christmas!";;
  [0-9]*) echo "$DAYS days remaining";;
  -[0-9]*) echo "Oops, you missed it";;
esac
```

在此脚本中，我们获取 12 月 25 日和今天的日期，然后相减。如果结果是正数，我们将显示剩余天数。如果为零，则发出 “Merry Christmas” 的消息，如果为负，那么仅告诉运行脚本的人他们错过了假期。也许他们沉迷在蛋酒中了。

`case` 语句由用来打印信息的语句组成，当剩余时间等于 0，或任意数字或以 `-` 符号开头的数字（也就是过去）分别打印不同的信息。

对于人们想要关注的任何日期，都可以使用相同方法。实际上，我们可以要求运行脚本的人员提供日期，然后让他们知道从现在到那天还有多少天。这个脚本是这样的。

```
#!/bin/sh

echo -n "Enter event date (e.g., June 6): "
read dt
EVENT=`date -d "$dt" +%j`
TODAY=`date +%j`
DAYS=`expr $EVENT - $TODAY`

case $DAYS in
  0) echo "It's today!";;
  [0-9]*) echo "$DAYS days remaining";;
  -[0-9]*) echo "Oops, you missed it";;
esac
```

使用此脚本会遇到的一个问题，如果运行该脚本的人希望知道到第二年这个特殊日子还有多少天，他们会感到失望。即使他们输入日期时提供了年，`date -d` 命令仍将仅提供今年中的天数，而不会提供从现在到那时的天数。

计算从今天到某年的日期之间的天数可能有些棘手。你需要包括所有中间年份，并注意那些闰年。

### 使用 Unix 纪元时间

计算从现在到某个特殊日期之间的天数的另一种方法是利用 Unix 系统存储日期的方法。如果将自 1970 年 1 月 1 日开始的秒数转换为天数，那么就可以很容易地执行此操作，如下脚本所示：

```
#!/bin/bash

echo -n "Enter target date (e.g., Mar 18 2021)> "
read target_date
today=`echo $(($(date --utc --date "$1" +%s)/86400))`
target=`echo $(($(date --utc --date "$target_date" +%s)/86400))`
days=`expr $target - $today`
echo "$days days until $target_date"
```

解释一下，86400 是一天中的秒数。将自 Unix 纪元开始以来的秒数除该数即为天数。

```
$ ./countdown
Enter target date (e.g., Mar 18 2021)> Mar 18 2020
104 days until Mar 18 2020
```

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487712/counting-down-the-days-using-bash.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
