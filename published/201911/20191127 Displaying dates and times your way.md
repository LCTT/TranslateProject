[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11623-1.html)
[#]: subject: (Displaying dates and times your way)
[#]: via: (https://www.networkworld.com/article/3481602/displaying-dates-and-times-your-way-with-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在终端里按你的方式显示日期和时间
======

> Linux 的 date 命令提供了很多显示日期和时间的选项，要比你想的还要多。这是一些有用的选择。

![](https://img.linux.net.cn/data/attachment/album/201911/29/144555a8mq82mcc9cfttt9.jpg)

在 Linux 系统上，`date` 命令非常简单。你键入 `date`，日期和时间将以一种有用的方式显示。它包括星期几、日期、时间和时区：

```
$ date
Tue 26 Nov 2019 11:45:11 AM EST
```

只要你的系统配置正确，你就会看到日期和当前时间以及时区。

但是，该命令还提供了许多选项来以不同方式显示日期和时间信息。例如，如果要显示日期以便进行排序，则可能需要使用如下命令：

```
$ date "+%Y-%m-%d"
2019-11-26
```

在这种情况下，年、月和日按该顺序排列。请注意，我们使用大写字母 `Y` 来获得四位数的年份。如果我们使用小写的 `y`，则只会看到两位数字的年份（例如 19）。不要让这种做法使你错误地联想到如果 `％m` 给你一个数字月份，`％M` 可能会给你月份的名称。不，`％M` 将给你分钟数。要以缩写名称格式获得月份，你要使用 `％b`，而对于完全拼写的月份，则要使用 `％B`。

```
$ date "+%b %B"
Nov November
```

或者，你可能希望以这种常用格式显示日期：

```
$ date "+%D"
11/26/19
```

如果你需要四位数的年份，则可以执行以下操作：

```
$ date "+%x"
11/26/2019
```

下面是一个可能有用的示例。假设你需要创建一个每日报告并在文件名中包含日期，则可以使用以下命令来创建文件（可能用在脚本中）：

```
$ touch Report-`date "+%Y-%m-%d"`
```

当你列出你的报告时，它们将按日期顺序或反向日期顺序（如果你添加 `-r`）列出。

```
$ ls -r Report*
Report-2019-11-26
Report-2019-11-25
Report-2019-11-22
Report-2019-11-21
Report-2019-11-20
```

你还可以在日期字符串中添加其他详细信息。可用的各种选项多得令人惊讶。你可以使用 `date "+%q"` 来显示你所在的一年中的哪个季度，或使用类似以下命令来显示两个月前的日期：

```
$ date --date="2 months ago"
Thu 26 Sep 2019 09:02:43 AM EDT
```

是否想知道下周四的日期？你可以使用类似 `date --date="next thu"` 的命令，但是要理解，对于Linux，下个周四意味着今天之后的周四。如果今天是星期三，那就是明天，而不是下周的星期四。但是，你可以像下面的第二个命令一样指定下周的星期四。

```
$ date --date="next thu"
Thu 28 Nov 2019 12:00:00 AM EST
$ date --date="next week thu"
Thu 05 Dec 2019 12:00:00 AM EST
```

`date` 命令的手册页列出了其所有选项。该列表多得令人难以置信，但是你可能会发现一些日期/时间显示选项非常适合你。以下是一些你可能会发现有趣的东西。

世界标准时间（UTC）：

```
$ date -u
Tue 26 Nov 2019 01:13:59 PM UTC
```

自 1970 年 1 月 1 日以来的秒数（与 Linux 系统上日期的存储方式有关）：

```
$ date +%s
1574774137
```

以下是 `date` 命令选项的完整列表。正如我所说，它比我们大多数人想象的要广泛得多。

- `%%` 显示字母 ％
- `％a` 本地语言环境的缩写星期名称（例如，日 / Sun）
- `％A` 本地语言环境的完整星期名称（例如，星期日 / Sunday）
- `％b` 本地语言环境的缩写月份名称（例如 一 / Jan）
- `％B` 本地语言环境的完整月份名称（例如，一月 / January）
- `％c` 本地语言环境的日期和时间（例如 2005年3月3日 星期四 23:05:25 / Thu Mar  3 23:05:25 2005）
- `％C` 世纪；类似于 `％Y`，但省略了后两位数字（例如，20）
- `%d` 月份的天（例如，01）
- `％D` 日期；与 `％m/％d/％y` 相同
- `％e` 月份的天，填充前缀空格；与 `％_d` 相同
- `％F` 完整日期；与 `％Y-％m-％d` 相同
- `％g` ISO 周号的年份的后两位数字（请参见 `％G`）
- `%G` ISO 周号的年份（请参阅 `％V`）；通常仅配合 `％V` 使用
- `％h` 与 `％b` 相同
- `％H` 24 小时制的小时（00..23）
- `％I` 12 小时制的小时（01..12）
- `%j` 一年的天（001..366）
- `％k` 24 小时制的小时，填充前缀空格（ 0..23）；与 `％_H` 相同
- `％l` 12 小时制的小时，填充前缀空格（ 1..12）；与 `％_I` 相同
- `％m` 月份（01..12）
- `％M` 分钟（00..59）
- `％n` 换行符
- `％N` 纳秒（000000000..999999999）
- `%p` 本地语言环境中等同于 AM 或 PM 的字符串；如果未知，则为空白
- `％P` 像 `％p`，但使用小写
- `％q` 季度（1..4）
- `％r` 本地语言环境的 12 小时制时间（例如，晚上 11:11:04 / 11:11:04 PM）
- `％R` 24 小时制的小时和分钟；与 `％H:％M` 相同
- `%s` 自 1970-01-01 00:00:00 UTC 以来的秒数
- `％S` 秒（00..60）
- `％t` 制表符
- `％T` 时间；与 `％H:％M:％S` 相同
- `％u` 星期（1..7）；1 是星期一
- `％U` 年的周号，以星期日为一周的第一天，从 00 开始（00..53）
- `％V` ISO 周号，以星期一为一周的第一天，从 01 开始（01..53）
- `％w` 星期（0..6）；0 是星期日
- `％W` 年的周号，星期一为一周的第一天，从 00 开始（00..53）
- `％x` 本地语言环境的日期表示形式（例如，1999年12月31日 / 12/31/99）
- `％X` 本地语言环境的时间表示形式（例如，23:13:48）
- `％y` 年的最后两位数字（00..99）
- `％Y` 年份
- `％z` +hhmm 格式的数字时区（例如，-0400）
- `％:z` +hh:mm 格式的数字时区（例如，-04:00）
- `％::z` +hh:mm:ss 格式的数字时区（例如，-04:00:00）
- `％:::z` 数字时区，`:` 指明精度（例如，-04, +05:30）
- `％Z` 字母时区缩写（例如，EDT）

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3481602/displaying-dates-and-times-your-way-with-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
