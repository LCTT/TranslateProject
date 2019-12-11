[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Counting down the days using bash)
[#]: via: (https://www.networkworld.com/article/3487712/counting-down-the-days-using-bash.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Counting down the days using bash
======
Need to know how many days there are before some important event? Let Linux bash and the date command help with that!
Thinkstock

With some pretty important holidays right around the corner, you might need to be reminded how much longer you have to prepare.

Fortunately, you can get a lot of help from the **date** command. In this post, we’ll look at ways that **date** and bash scripts can tell you how many days there are between today and some event that you’re anticipating.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

First a couple hints at how this is going to work. The **date** command’s **%j** option is going to show you today’s date as a number between 1 and 366. January 1st, as you’d expect, will be displayed as 1 and December 31st will be 365 or 366 depending on whether it’s leap year. Go ahead and try it. You should see something like this:

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
$ date +%j
339
```

You can, however, get the **date** command to give you the day-of-the-year number for _any_ date by supplying it in a **date** command like this:

```
$ date -d "Mar 18" +%j
077
```

One important thing to keep in mind is that this command will show you the date in the _current year_ even if that date is in the past. However, you can add a year to the command and fix that:

```
$ date -d "Apr 29" +%j
119
$ date -d "Apr 29 2020" +%j
120
```

In a leap year, Apr 29th will be the 120th day of the year, not the 119th.

If you want to count down the days until Christmas and don’t want to end up with fingerprints on your wall calendar, you can use a script like this:

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

In this script, we get the day numbers for Dec 25th and today and then subtract one from the other. If the result is positive, we display the number of days remaining. If it’s zero, we issue a “Merry Christmas” message and, if it’s negative, we just tell the person running the script that they missed the holiday. Maybe they got carried away with the egg nog.

The case statement is made up of ready-to-print statements for remaining-day counts that equal zero, those that that include any digits and those that start with a **-** sign (i.e., in the past).

The same idea can be generalized for any date that someone wants to keep in focus. In fact, we can ask the person running our script to supply the date and then let them know how many days remain between now and then. This version of the script does just that.

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

One problem you’ll have with this script is that, if the person running it is hoping to find out how many days must pass before they reach a special day the following year, they’ll be disappointed. Even if they supply a year when they enter the date, the date -d command will still only supply the day number in that year, not the days between now and then.

Calculating the number of days between today and some date years from now can be a bit tricky. You’d need to include all the intervening years and pay attention to those that are leap years.

### Using Unix (Epoch) time

Another way to calculate the number of days between now and some special date is to take advantage of the way that Unix systems store dates. If you convert the number of seconds since the start of the day on Jan 1, 1970 to days, you can do this quite easily as in this script:

```
#!/bin/bash

echo -n "Enter target date (e.g., Mar 18 2021)> "
read target_date
today=`echo $(($(date --utc --date "$1" +%s)/86400))`
target=`echo $(($(date --utc --date "$target_date" +%s)/86400))`
days=`expr $target - $today`
echo "$days days until $target_date"
```

To explain, 86400 is the number of seconds in a day. Dividing the number of seconds since the epoch began by this number gives us the number of days.

```
$ ./countdown
Enter target date (e.g., Mar 18 2021)> Mar 18 2020
104 days until Mar 18 2020
```

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487712/counting-down-the-days-using-bash.html

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
