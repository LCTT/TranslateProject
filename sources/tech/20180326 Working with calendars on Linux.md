Working with calendars on Linux
======

![](https://images.idgesg.net/images/article/2018/03/calendars-100753173-large.jpg)
Linux systems can provide more help with your schedule than just reminding you what day today is. You have a lot of options for displaying calendars — some that are likely to prove helpful and others that just might boggle your mind.

### date

To begin, you probably know that you can show the current date with the **date** command.
```
$ date
Mon Mar 26 08:01:41 EDT 2018

```

### cal and ncal

You can show the entire month with the **cal** command. With no arguments, cal displays the current month and, by default, highlights the current day by reversing the foreground and background colors.
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

If you want to display the current month in a “sideways” format, you can use the **ncal** command.
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

That command can be especially useful if, for example, you just want to see the dates for some particular day of the week.
```
$ ncal | grep Th
Th 1 8 15 22 29

```

The ncal command can also display the entire year in the "sideways" format. Just provide the year along with the command.
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

You can also display the entire year with **cal**. Just remember that you need all four digits for the year. If you type  "cal 18", you'll get a calendar year for 18 AD, not 2018.
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

For a particular year and month, use the -d option win a command like this.
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

Another potentially useful calendaring option is the **cal** command’s -j option. Let's take a look at what that shows you.
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

"What???" you might be asking. OK, that -j option is displaying Julian dates — the numeric day of the year that runs from 1 to 365 most years. So, 1 is January 1st and 32 is February 1st. The command **cal -j 2018** will show you the entire year, ending like this:
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

This kind of display might help remind you of how many days have gone by since you made that New Year's resolution that you haven't yet acted on.

Run a similar command for 2020, and you’ll note that it’s a leap year.
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

### calendar

Another interesting and potentially overwhelming command can inform you about holidays. This command has a lot of options, but let’s just say that you’d like to see a list of upcoming holidays and noteworthy days. The calendar's **-l** option allows you to select how many days you want to see beyond today, so 0 means  "today only".
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

For most of us, that's a bit more celebrating than we can manage in a single day. If you're seeing something like this, you can blame it on your **calendar.all** file that's telling the system what international calendars you'd like to include. You can, of course, pare this down by removing some of the lines in this file that include other files. The lines look like these:
```
#include <calendar.world>
#include <calendar.argentina>
#include <calendar.australia>
#include <calendar.belgium>
#include <calendar.birthday>
#include <calendar.christian>
#include <calendar.computer>

```

Say we cut our display down to world calendars only by removing all but the first #include line shown above. We'd then see this:
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

Clearly, the world calendar's special days are quite numerous. A display like this could, however, keep you from forgetting the all-important Popeye statue unveiling day and its role in observing the "spinach capital of the world."

A more useful calendaring choice might be to put work-related calendars in a special file and use that calendar in the calendar.all file to determine what events you will see when you run the command.
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

The format for calendar files is very simple — mm/dd for the date, a tab, and the event's description.
```
$ cat calendar.work
03/26 Describe how the cal and calendar commands work
03/27 Throw a party!

```

### notes and nostalgia

Note that the calendar command might not be available for all Linux distributions. You might have to remember the Popeye statue unveiling day on your own.

And in case you're wondering, you can display a calendar as far ahead as the year 9999 — even for the prophetic [2525][1].

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3265752/linux/working-with-calendars-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.youtube.com/watch?v=izQB2-Kmiic
[2]:https://www.facebook.com/NetworkWorld/
[3]:https://www.linkedin.com/company/network-world
