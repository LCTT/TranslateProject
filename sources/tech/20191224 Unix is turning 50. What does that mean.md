[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Unix is turning 50. What does that mean?)
[#]: via: (https://www.networkworld.com/article/3511428/unix-is-turning-50-what-does-that-mean.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Unix is turning 50. What does that mean?
======
Unix time, also known as 'epoch time,' is the number of seconds that have passed since Jan 1, 1970. As Unix turns 50, let's take a look at what worries kernel developers.
[cbaquiran][1] [(CC0)][2]

2020 is a significant year for Unix. At the very start of the year, Unix turns 50.

While some of the early development of Unix predates the official start of its "epoch," Jan 1, 1970 remains the zero-point in POSIX time and the recognized beginning of all things Unix. Jan 1, 2020 will mark 50 years since that moment.

### Unix time vs human time

In terms of human time, 50 years is a big deal. In terms of Unix time, there's nothing particularly special about 50 years. 48.7 years would be no less significant.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Unix (including Linux) systems store date/time values as the number of seconds that have elapsed since 1970-01-01 00:00:00 UTC in 32 bits. To determine how many seconds have passed since that time and, thus, what right now looks like as a Unix time value, you can issue a command like this:

```
$ date +%s
1576883876
```

The **%s** argument tells the date command to display the current date/time as the number of seconds since the start of 1970-01-01.

### How much time can Unix systems manage?

To understand how much time Unix systems can accommodate, we need to look at the capacity of a 32-bit field. It can be calculated like this:

```
$ echo '2^32' | bc
4294967296
```

However, since Unix needs to accommodate negative numbers, it reserves one bit for a number's sign, thus reducing this to:

```
$ echo '2^31' | bc
2147483648
```

And, since Unix numbering begins with 0, that means we have 2,147,483,648 values, but the largest possible value is 2,147,483,647. Unix date/time values cannot exceed that number – just like the odometer on your car probably can't exceed 999,999 miles. Add 1 and the value turns to 0.

### How long is a year in seconds?

The number of seconds in most years can be calculated like this – hours/day multiplied by minutes/hour multiplied by seconds/minute multiplied by the number of days in a year:

```
$ expr 24 \* 60 \* 60 \* 365
31536000
```

In leap years, we just add another day:

```
$ expr 24 \* 60 \* 60 \* 366
31622400
```

### **How will Unix see its 50 year birthday?**

12:00 AM on Jan 1, 2020 will be **1577836800** in epoch time. The calculation is a little tricky, but mostly because we have to accommodate leap years. Since the start of the epoch, we've had 12 leap years, starting in 1972, the last in 2016. And, when we reach 2020, we will have had 38 regular years.

Here’s a calculation using the **expr** command to count the seconds in these 50 years:

```
$ expr 24 \* 60 \* 60 \* 365 \* 38 + 24 \* 60 \* 60 \* 366 \* 12
1577836800
```

The first half of that is calculating the seconds in the 38 non-leap years. We then add a similar calculation for leap years with their 366 days. Conversely, you could use the seconds per year figures presented earlier and just do this:

```
$ expr 31536000 \* 38 + 31622400 \* 12
1577836800
```

This way of tracking dates and times made Unix systems fairly impervious to the Y2K scare that had people in late 1999 worried that moving into the year 2000 would wreak havoc on computer systems. Far fewer problems were experienced than people feared. In fact, only applications which stored years in a two-digit format would see the year going to 00 as a sign that time jumping backwards. Still, lots of application developers had some tedious extra work piled onto their plates to ensure that their systems wouldn’t run into serious problems when 2000 hit.

### When Unix time will run into problems

Unix systems won’t run into a **Y2K** type of problem until **2038** when dates stored as described above will overrun their 32-bit space allotments. But that’s 18 years from now, and kernel developers are already working on how they will avert disaster. It’s a bit too early to start panicking.

The year 2038 problem is sometimes referred to as the **Y2K38** problem. We have until Tuesday, January 19, 2038 to address it. If the problem isn’t resolved, systems after that date may think it’s 1901. One way to address the problem would be to switch to 64-bit representations of date/time information. Some people believe that even that will be a lot more complex than it sounds. In any case, it’s probably still too early to panic. And, in the meantime, maybe after singing "Auld Lang Syne" this New Year’s Eve, you can sing "Happy Birthday" to Unix. It’s turning 50, and that’s still a very big deal.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3511428/unix-is-turning-50-what-does-that-mean.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://pixabay.com/en/birthday-cake-cake-birthday-380178/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
