[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11724-1.html)
[#]: subject: (Unix is turning 50. What does that mean?)
[#]: via: (https://www.networkworld.com/article/3511428/unix-is-turning-50-what-does-that-mean.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Unix 即将迎来 50 岁
======

Unix 时间（又称为“<ruby>纪元时间<rt>epoch time</rt></ruby>”）是自 1970 年 1 月 1 日以来经过的秒数。当 Unix 即将 50 岁时，让我们看一下让内核开发人员担心的地方。

![](https://img.linux.net.cn/data/attachment/album/201912/28/120311hzghpxux1hp5t4xo.jpg)

对于 Unix 而言，2020 年是重要的一年。在这一年年初，Unix 进入 50 岁。

尽管 Unix 的某些早期开发早于其“纪元”的正式开始，但 1970 年 1 月 1 日仍然是 POSIX 时间的零点，也是公认的 Unix 的万物之始。自那一刻算起，2020 年 1 月 1 日将是其 50 周年。（LCTT 译注：实际上，在 1971/11/3 出版的第一版《Unix 程序员手册》中，将 1971/1/1 作为 Unix 纪元的开始，并且一秒钟记录 60 个数，但是后来发现这样 32 位整型数字只能记录两年多，后来这个纪元被一再重新定义，改为从 1970/1/1 开始，每秒 1 个数。）

### Unix 时间与人类时间

就人类时间而言，50 年是很重要的。就 Unix 时间而言，50 年没有什么特别的。48.7 年同样重要。

Unix（包括 Linux）系统将日期/时间值存储为自 1970-01-01 00:00:00 UTC 以来经过的秒数（32  位整型）。要确定自该时间以来经过了多少秒钟，看看 Unix 时间值是什么样子，你可以发出如下命令：

```
$ date +%s
1576883876
```

`％s` 参数告诉 `date` 命令将当前日期/时间显示为自 1970-01-01 开始以来的秒数。

### Unix 系统可以管理多少时间？

要了解 Unix 系统可以容纳多少时间，我们需要查看 32 位字段的容量。可以这样计算：

```
$ echo '2^32' | bc
4294967296
```

但是，由于 Unix 需要容纳负数，因此它会为数字的符号保留一位，从而将其减少为：

```
$ echo '2^31' | bc
2147483648
```

并且，由于 Unix 计数以 0 开头，这意味着我们有 2,147,483,648 个值，但最大的可能值为 2,147,483,647 个。Unix 日期/时间值不能超过该数字——就像汽车上的里程表可能不能超过 999,999 英里一样。加 1 该值就变为了 -2147483648。（LCTT 译注：此处原文描述有误，已修改。在达到最大值之后，即 2038/1/19 03:14:07，下 1 秒导致符号位变为 1，其余 31 位为 0，即 -2147483648，时间变为 1901/12/13 20:45:52，这就是 Y2K38 问题。）

### 一年有多少秒？

大多数年份的秒数可以这样计算：每天的小时数乘以每小时的分钟数乘以每分钟的秒数乘以一年中的天数：

```
$ expr 24 \* 60 \* 60 \* 365
31536000
```

在闰年，我们再增加一天：

```
$ expr 24 \* 60 \* 60 \* 366
31622400
```

（LCTT 译注：Unix 时间将一天精确定义为 24 * 60 * 60 = 86400 秒，忽略闰秒。）

### Unix 将如何庆祝其 50 岁生日？

2020 年 1 月 1 日中午 12:00 是纪元时间的 1577836800。这个计算有些棘手，但主要是因为我们必须适应闰年。自该纪元开始以来，我们经历了 12 个闰年，从 1972 年开始，到上一个闰年是 2016 年。而且，当我们达到 2020 年时，我们将有 38 个常规年份。

这是使用 `expr` 命令进行的计算，以计算这 50 年的秒数：

```
$ expr 24 \* 60 \* 60 \* 365 \* 38 + 24 \* 60 \* 60 \* 366 \* 12
1577836800
```

前半部分是计算 38 个非闰年的秒数。然后，我们加上闰年的 366 天的类似计算。或者，你可以使用前面介绍的每年秒数，然后执行以下操作：

```
$ expr 31536000 \* 38 + 31622400 \* 12
1577836800
```

这种跟踪日期和时间的方式使 Unix 系统完全不受 Y2K 恐慌的影响，1999 年末人们开始担心进入 2000 年会对计算机系统造成严重破坏，但是实际遇到的问题比人们担心的少得多。实际上，只有以两位数格式存储年份的应用程序才会将年份变为 00，以表示时间倒退。尽管如此，许多应用程序开发人员还是做了很多额外的繁琐工作，以确保 2000 年到来时，他们的系统不会出现严重问题。

### Unix 时间何时会遇到问题？

在 2038 年之前，Unix 系统不会遇到 Y2K 类型的问题，直到如上所述存储的日期将超过其 32 位空间分配。但这距离现在已经只有 18 年了，内核开发人员已经在研究如何避免灾难。但现在开始恐慌还为时过早。

2038 年的问题有时称为 Y2K38 问题。我们必须在 2038 年 1 月 19 日星期二之前解决这个问题。如果问题到时候仍未解决，则该日期之后的系统可能会认为是 1901 年。解决该问题的一种方法是切换为日期/时间信息的 64 位表示形式。有些人认为，即使那样，也会有比听起来更复杂的问题。无论如何，恐慌还为时过早。并且，与此同时，也许在新年前夜演唱了《Auld Lang Syne》之后，你可以向 Unix 唱《生日快乐》歌了。Unix 50 岁了，这仍然是大事。

（LCTT 译注：建议阅读一下 Unix 时间的[维基百科][6]页面，有更多有趣和不为人知的信息。）

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3511428/unix-is-turning-50-what-does-that-mean.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/10/birthday-cake-candles-100739452-large.jpg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
[6]: https://en.wikipedia.org/wiki/Unix_time
