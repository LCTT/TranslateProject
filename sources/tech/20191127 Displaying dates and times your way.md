[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Displaying dates and times your way)
[#]: via: (https://www.networkworld.com/article/3481602/displaying-dates-and-times-your-way-with-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Displaying dates and times your way
======
The Linux date command provides more options for displaying dates and times than you can shake a stick at (without hurting your wrist anyway). Here are some of the more useful choices.
Thinkstock / Tomislav Jakupec

The date command on Linux systems is very straightforward. You type “date” and the date and time are displayed in a useful way. It includes the day-of-the-week, calendar date, time and time zone:

```
$ date
Tue 26 Nov 2019 11:45:11 AM EST
```

As long as your system is configured properly, you’ll see the date and current time along with your time zone.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

The command, however, also offers a lot of options to display date and time information differently. For example, if you want to display dates in the most useful format for sorting, you might want to use a command like this:

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
$ date "+%Y-%m-%d"
2019-11-26
```

In this case, the year, month and day are arranged in that order. Note that we use a capital Y to get a four-digit year. If we use a lowercase y, we’d see only a two-digit year (e.g., 19). Don’t let this induce you into thinking that if %m gives you a numeric month, **%**M might give you the name of the month. No, **%**M will report on minutes. To get the month in abbreviated name format, you would use **%**b and for a fully spelled out month, you would use **%**B.

```
$ date "+%b %B"
Nov November
```

Alternately, you might want to display the date in this commonly used format:

```
$ date +%D
11/26/19
```

If you need a four-digit year, you can do this:

```
$ date "+%x"
11/26/2019
```

Here’s an example that might be useful. Say that you need to create a daily report and have the file name include the date, you could use a command like this to create the file – probably in a script:

```
touch Report-`date "+%Y-%m-%d"`
```

When you list your reports, they’ll list in date order or reverse date order if you add -r.

```
$ ls -r Report*
Report-2019-11-26
Report-2019-11-25
Report-2019-11-22
Report-2019-11-21
Report-2019-11-20
```

You can add other details to your date strings as well. The variety of options available is surprising. You could show which quarter of the year you’re in by using **date "+%q"** or display the date it was two months ago with a command like this:

```
$ date --date="2 months ago"
Thu 26 Sep 2019 09:02:43 AM EDT
```

Want to see what next Thursday’s date will be? You can use a command like **date --date="next thu"**, but understand that, for Linux, next Thursday means whatever Thursday follows today. That’s tomorrow if today is Wednesday – not Thursday of next week. However, you can specify Thursday of next week as in the second command below.

```
$ date --date="next thu"
Thu 28 Nov 2019 12:00:00 AM EST
$ date --date="next week thu"
Thu 05 Dec 2019 12:00:00 AM EST
```

The man page for the date command lists all of its options. The list is fairly mind boggling, but you’ll probably find some date/time display options that work really well for you. Here are some that you might find interesting.

The date in universal time (UTC):

```
$ date -u
Tue 26 Nov 2019 01:13:59 PM UTC
```

The number of seconds since Jan 1, 1970 (related to how dates are stored on Linux systems):

```
$ date +%s
1574774137
```

Here's a full listing of the date command's options. As I said, it's a lot more extensive than most of us likely imagine.

```
%%  a literal %
%a  locale's abbreviated weekday name (e.g., Sun)
%A  locale's full weekday name (e.g., Sunday)
%b  locale's abbreviated month name (e.g., Jan)
%B  locale's full month name (e.g., January)
%c  locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
%C  century; like %Y, except omit last two digits (e.g., 20)
%d  day of month (e.g., 01)
%D  date; same as %m/%d/%y
%e  day of month, space padded; same as %_d
%F  full date; same as %Y-%m-%d
%g  last two digits of year of ISO week number (see %G)
%G  year of ISO week number (see %V); normally useful only with %V
%h  same as %b
%H  hour (00..23)
%I  hour (01..12)
%j  day of year (001..366)
%k  hour, space padded ( 0..23); same as %_H
%l  hour, space padded ( 1..12); same as %_I
%m  month (01..12)
%M  minute (00..59)
%n  a newline
%N  nanoseconds (000000000..999999999)
%p  locale's equivalent of either AM or PM; blank if not known
%P  like %p, but lower case
%q  quarter of year (1..4)
%r  locale's 12-hour clock time (e.g., 11:11:04 PM)
%R  24-hour hour and minute; same as %H:%M
%s  seconds since 1970-01-01 00:00:00 UTC
%S  second (00..60)
%t  a tab
%T  time; same as %H:%M:%S
%u  day of week (1..7); 1 is Monday
%U  week number of year, with Sunday as first day of week (00..53)
%V  ISO week number, with Monday as first day of week (01..53)
%w  day of week (0..6); 0 is Sunday
%W  week number of year, with Monday as first day of week (00..53)
%x  locale's date representation (e.g., 12/31/99)
%X  locale's time representation (e.g., 23:13:48)
%y  last two digits of year (00..99)
%Y  year
%z  +hhmm numeric time zone (e.g., -0400)
%:z  +hh:mm numeric time zone (e.g., -04:00)
%::z +hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z  numeric  time  zone  with  :  to necessary precision (e.g., -04, +05:30)
%Z  alphabetic time zone abbreviation (e.g., EDT)
```

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3481602/displaying-dates-and-times-your-way-with-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
