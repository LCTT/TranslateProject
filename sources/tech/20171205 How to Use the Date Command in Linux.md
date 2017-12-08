translating by lujun9972
translating by lujun9972
How to Use the Date Command in Linux
======
In this post, we will show you some examples on how to use the date command in Linux. The date command can be used to print or set the system date and time. Using the Date Command in Linux its simple, just follow the examples and the syntax below.

By default when running the date command in Linux, without any arguments it will display the current system date and time:

```
date
```

```
Sat  2 Dec 12:34:12 CST 2017
```

#### Syntax

```
Usage: date [OPTION]... [+FORMAT]
  or:  date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
Display the current time in the given FORMAT, or set the system date.

```

### Date examples

The following examples will show you how to use the date command to find the date and time from a period of time in the past or future.

### 1\. Find the date 5 weeks in the future

```
date -d "5 weeks"
Sun Jan  7 19:53:50 CST 2018

```

### 2\. Find the date 5 weeks and 4 days in the future

```
date -d "5 weeks 4 days"
Thu Jan 11 19:55:35 CST 2018

```

### 3\. Get the next month date

```
date -d "next month"
Wed Jan  3 19:57:43 CST 2018
```

### 4\. Get the last sunday date

```
date -d last-sunday
Sun Nov 26 00:00:00 CST 2017
```

The date command comes with various formatting option, the following examples will show you how to format the date command output.

### 5\. Display the date in yyyy-mm-dd format

```
date +"%F"
2017-12-03
```

### 6\. Display date in mm/dd/yyyy format

```
date +"%m/%d/%Y"
12/03/2017

```

### 7\. Display only the time

```
date +"%T"
20:07:04

```

### 8\. Display the day of the year

```
date +"%j"
337

```

### 9\. Formatting Options

| **%%** | A literal percent sign (“**%**“). |
| **%a** | The abbreviated weekday name (e.g., **Sun**). |
| **%A** | The full weekday name (e.g., **Sunday**). |
| **%b** | The abbreviated month name (e.g., **Jan**). |
| **%B** | Locale’s full month name (e.g., **January**). |
| **%c** | The date and time (e.g., **Thu Mar 3 23:05:25 2005**). |
| **%C** | The current century; like **%Y**, except omit last two digits (e.g., **20**). |
| **%d** | Day of month (e.g., **01**). |
| **%D** | Date; same as **%m/%d/%y**. |
| **%e** | Day of month, space padded; same as **%_d**. |
| **%F** | Full date; same as **%Y-%m-%d**. |
| **%g** | Last two digits of year of ISO week number (see **%G**). |
| **%G** | Year of ISO week number (see **%V**); normally useful only with **%V**. |
| **%h** | Same as **%b**. |
| **%H** | Hour (**00**..**23**). |
| **%I** | Hour (**01**..**12**). |
| **%j** | Day of year (**001**..**366**). |
| **%k** | Hour, space padded ( **0**..**23**); same as **%_H**. |
| **%l** | Hour, space padded ( **1**..**12**); same as **%_I**. |
| **%m** | Month (**01**..**12**). |
| **%M** | Minute (**00**..**59**). |
| **%n** | A newline. |
| **%N** | Nanoseconds (**000000000**..**999999999**). |
| **%p** | Locale’s equivalent of either **AM** or **PM**; blank if not known. |
| **%P** | Like **%p**, but lower case. |
| **%r** | Locale’s 12-hour clock time (e.g., **11:11:04 PM**). |
| **%R** | 24-hour hour and minute; same as **%H:%M**. |
| **%s** | Seconds since 1970-01-01 00:00:00 UTC. |
| **%S** | Second (**00**..**60**). |
| **%t** | A tab. |
| **%T** | Time; same as **%H:%M:%S**. |
| **%u** | Day of week (**1**..**7**); 1 is **Monday**. |
| **%U** | Week number of year, with Sunday as first day of week (**00**..**53**). |
| **%V** | ISO week number, with Monday as first day of week (**01**..**53**). |
| **%w** | Day of week (**0**..**6**); 0 is **Sunday**. |
| **%W** | Week number of year, with Monday as first day of week (**00**..**53**). |
| **%x** | Locale’s date representation (e.g., **12/31/99**). |
| **%X** | Locale’s time representation (e.g., **23:13:48**). |
| **%y** | Last two digits of year (**00**..**99**). |
| **%Y** | Year. |
| **%z** | +hhmm numeric time zone (e.g., **-0400**). |
| **%:z** | +hh:mm numeric time zone (e.g., **-04:00**). |
| **%::z** | +hh:mm:ss numeric time zone (e.g., **-04:00:00**). |
| **%:::z** | Numeric time zone with “**:**” to necessary precision (e.g., **-04**, **+05:30**). |
| **%Z** | Alphabetic time zone abbreviation (e.g., EDT). |

### 10\. Set the system clock

With the date command in Linux, you can also manually  set the system clock using the --set switch, in the following example we will set the system date to 4:22pm August 30, 2017

```
date --set="20170830 16:22"

```

Of course, if you use one of our [VPS Hosting services][1], you can always contact and ask our expert Linux admins (via chat or ticket) about date command in linux and anything related to date examples on Linux. They are available 24×7 and will provide information or assistance immediately.

PS. If you liked this post on How to Use the Date Command in Linux please share it with your friends on the social networks using the buttons below or simply leave a reply. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/use-the-date-command-in-linux/

作者：[][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/hosting-services.html
