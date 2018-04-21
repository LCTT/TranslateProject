在 Linux 上使用日历
=====

![](https://images.idgesg.net/images/article/2018/03/calendars-100753173-large.jpg)
Linux 系统可以为你的日程安排提供更多帮助，而不仅仅是提醒你今天是星期几。日历显示有很多选项 -- 有些可能会证明有帮助，有些可能会让你大开眼界。

### 日期

首先，你可能知道可以使用 **date** 命令显示当前日期。
```
$ date
Mon Mar 26 08:01:41 EDT 2018

```

### cal 和 ncal

你可以使用 **cal** 命令显示整个月份。没有参数时，cal 显示当前月份，默认情况下，通过反转前景色和背景颜色来突出显示当天。
```
$ cal
 March 2018
Su Mo Tu We Th Fr Sa
 1 2 3
 4 5 6 7 8 9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

```

如果你想以“横向”格式显示当前月份，则可以使用 **ncal** 命令。
```
$ ncal
 March 2018
Su 4 11 18 25
Mo 5 12 19 26
Tu 6 13 20 27
We 7 14 21 28
Th 1 8 15 22 29
Fr 2 9 16 23 30
Sa 3 10 17 24 31

```

例如，如果你只想查看一周特定某天的日期，这个命令可能特别有用。
```
$ ncal | grep Th
Th 1 8 15 22 29

```

ncal 命令还可以以“横向”格式显示一整年，只需在命令后提供年份。
```
$ ncal 2018
 2018
 January February March April
Su 7 14 21 28 4 11 18 25 4 11 18 25 1 8 15 22 29
Mo 1 8 15 22 29 5 12 19 26 5 12 19 26 2 9 16 23 30
Tu 2 9 16 23 30 6 13 20 27 6 13 20 27 3 10 17 24
We 3 10 17 24 31 7 14 21 28 7 14 21 28 4 11 18 25
Th 4 11 18 25 1 8 15 22 1 8 15 22 29 5 12 19 26
Fr 5 12 19 26 2 9 16 23 2 9 16 23 30 6 13 20 27
Sa 6 13 20 27 3 10 17 24 3 10 17 24 31 7 14 21 28
...

```

你也可以使用 **cal** 命令显示一整年。请记住，你需要输入年份的四位数字。如果你输入 "cal 18"，你将获得公元 18 年的历年，而不是 2018 年。
```
$ cal 2018
 2018
 January February March
Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
 1 2 3 4 5 6 1 2 3 1 2 3
 7 8 9 10 11 12 13 4 5 6 7 8 9 10 4 5 6 7 8 9 10
14 15 16 17 18 19 20 11 12 13 14 15 16 17 11 12 13 14 15 16 17
21 22 23 24 25 26 27 18 19 20 21 22 23 24 18 19 20 21 22 23 24
28 29 30 31 25 26 27 28 25 26 27 28 29 30 31


 April May June
Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
 1 2 3 4 5 6 7 1 2 3 4 5 1 2
 8 9 10 11 12 13 14 6 7 8 9 10 11 12 3 4 5 6 7 8 9
15 16 17 18 19 20 21 13 14 15 16 17 18 19 10 11 12 13 14 15 16
22 23 24 25 26 27 28 20 21 22 23 24 25 26 17 18 19 20 21 22 23
29 30 27 28 29 30 31 24 25 26 27 28 29 30


 July August September
Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
 1 2 3 4 5 6 7 1 2 3 4 1
 8 9 10 11 12 13 14 5 6 7 8 9 10 11 2 3 4 5 6 7 8
15 16 17 18 19 20 21 12 13 14 15 16 17 18 9 10 11 12 13 14 15
22 23 24 25 26 27 28 19 20 21 22 23 24 25 16 17 18 19 20 21 22
29 30 31 26 27 28 29 30 31 23 24 25 26 27 28 29
 30

 October November December
Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
 1 2 3 4 5 6 1 2 3 1
 7 8 9 10 11 12 13 4 5 6 7 8 9 10 2 3 4 5 6 7 8
14 15 16 17 18 19 20 11 12 13 14 15 16 17 9 10 11 12 13 14 15
21 22 23 24 25 26 27 18 19 20 21 22 23 24 16 17 18 19 20 21 22
28 29 30 31 25 26 27 28 29 30 23 24 25 26 27 28 29
 30 31

```

对于特定的年份和月份，使用 -d 选项，如下所示：
```
$ cal -d 1949-03
 March 1949
Su Mo Tu We Th Fr Sa
 1 2 3 4 5
 6 7 8 9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

```

另一个可能有用的日历选项是 **cal** 命令的 -j 选项。让我们来看看它显示的是什么。
```
$ cal -j
 March 2018
 Su Mo Tu We Th Fr Sa
 60 61 62
 63 64 65 66 67 68 69
 70 71 72 73 74 75 76
 77 78 79 80 81 82 83
 84 85 86 87 88 89 90

```

你可能会问：“什么？？？” OK，那么 -j 选项显示 Julian 日期 -- 一年中从 1 到 365 年的数字日期。所以，1 是 1 月 1 日，32 是 2 月 1 日。命令 **cal -j 2018** 将显示一整年的数字，像这样：
```
$ cal -j 2018 | tail -9

 November December
 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
 305 306 307 335
308 309 310 311 312 313 314 336 337 338 339 340 341 342
315 316 317 318 319 320 321 343 344 345 346 347 348 349
322 323 324 325 326 327 328 350 351 352 353 354 355 356
329 330 331 332 333 334 357 358 359 360 361 362 363
 364 365

```

这种显示可能有助于提醒你，自从你做了新年计划之后，你已经有多少天没有采取行动了。

运行类似的命令，使用 2020 年，你会注意到这是一个闰年：
```
$ cal -j 2020 | tail -9

 November December
 Su Mo Tu We Th Fr Sa Su Mo Tu We Th Fr Sa
306 307 308 309 310 311 312 336 337 338 339 340
313 314 315 316 317 318 319 341 342 343 344 345 346 347
320 321 322 323 324 325 326 348 349 350 351 352 353 354
327 328 329 330 331 332 333 355 356 357 358 359 360 361
334 335 362 363 364 365 366

```

### 日历

另一个有趣但潜在的令人沮丧的命令可以告诉你关于假期的事情，这个命令有很多选项，但我们只是说，你想看到即将到来的假期和值得注意的日历列表。日历的 **-l** 选项允许你选择今天想要查看的天数，因此 0 表示“仅限今天”。
```
$ calendar -l 0
Mar 26 Benjamin Thompson born, 1753, Count Rumford; physicist
Mar 26 David Packard died, 1996; age of 83
Mar 26 Popeye statue unveiled, Crystal City TX Spinach Festival, 1937
Mar 26 Independence Day in Bangladesh
Mar 26 Prince Jonah Kuhio Kalanianaole Day in Hawaii
Mar 26* Seward's Day in Alaska (last Monday)
Mar 26 Emerson, Lake, and Palmer record "Pictures at an Exhibition" live, 1971
Mar 26 Ludwig van Beethoven dies in Vienna, Austria, 1827
Mar 26 Bonne fête aux Lara !
Mar 26 Aujourd'hui, c'est la St(e) Ludger.
Mar 26 N'oubliez pas les Larissa !
Mar 26 Ludwig van Beethoven in Wien gestorben, 1827
Mar 26 Emánuel

```

对于我们大多数人来说，这比我们在一天之内可以管理的庆祝活动要多一点。如果你看到类似这样的内容，可以将其归咎于你的 **calendar.all** 文件，该文件告诉系统你希望包含哪些国际日历。当然，你可以通过删除此文件中包含其他文件的一些行来削减此问题。文件看起来像这样：
```
#include <calendar.world>
#include <calendar.argentina>
#include <calendar.australia>
#include <calendar.belgium>
#include <calendar.birthday>
#include <calendar.christian>
#include <calendar.computer>

```

假设我们只通过移除除上面显示的第一个 #include 行之外的所有行，将我们的显示切换到世界日历。 我们会看到这个：
```
$ calendar -l 0
Mar 26 Benjamin Thompson born, 1753, Count Rumford; physicist
Mar 26 David Packard died, 1996; age of 83
Mar 26 Popeye statue unveiled, Crystal City TX Spinach Festival, 1937
Mar 26 Independence Day in Bangladesh
Mar 26 Prince Jonah Kuhio Kalanianaole Day in Hawaii
Mar 26* Seward's Day in Alaska (last Monday)
Mar 26 Emerson, Lake, and Palmer record "Pictures at an Exhibition" live, 1971
Mar 26 Ludwig van Beethoven dies in Vienna, Austria, 1827

```

显然，世界日历的特殊日子非常多。但是，像这样的展示可以让你忘记所有重要的“大力神雕像”揭幕日以及它在观察“世界菠菜之都”中的作用。

更有用的日历选择可能是将与工作相关的日历放入特殊文件中，并在 calendar.all 文件中使用该日历来确定在运行命令时将看到哪些事件。
```
$ cat /usr/share/calendar/calendar.all
/*
 * International and national calendar files
 *
 * This is the calendar master file. In the standard setup, it is
 * included by /etc/calendar/default, so you can make any system-wide
 * changes there and they will be kept when you upgrade. If you want
 * to edit this file, copy it into /etc/calendar/calendar.all and
 * edit it there.
 *
 */

#ifndef _calendar_all_
#define _calendar_all_

#include <calendar.usholiday>
#include <calendar.work>          <==

#endif /bin /boot /dev /etc /home /lib /lib64 /lost+found /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var !_calendar_all_ */

```

日历文件的格式非常简单 - mm/dd 格式日期，空格和事件描述。
```
$ cat calendar.work
03/26 Describe how the cal and calendar commands work
03/27 Throw a party!

```

### 注意事项和 nostalgia

注意，有关日历的命令可能不适用于所有 Linux 发行版，你可能必须记住自己的“大力水手”雕像。

如果你想知道，你可以显示一个日历，远远早于 9999 -- 即使是预言性的 [2525][1]。

在 [Facebook][2] 和 [LinkedIn][3] 上加入网络社区，对那些重要的话题发表评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3265752/linux/working-with-calendars-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.youtube.com/watch?v=izQB2-Kmiic
[2]:https://www.facebook.com/NetworkWorld/
[3]:https://www.linkedin.com/company/network-world
