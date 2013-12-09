Linux date command – Display and Set System Date and Time
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/12/date-linux-command.jpg)

Date on the operating system may only be considered as a timepiece. Especially on console mode, we do generally not see date as an important think. But for Administrator, this assumption is false. Do you know that a wrong date and time can make you can’t compile an application?

Because date and time is important, this is may be the reason why Network Time Protocol is developed. Let’s start to see what date command do for you.

### Display system date ###

To display your system date, just type

    $ date
    Thu Dec 5 22:55:41 WIB 2013

### Formatting Date ###

Date come with many formats. If you are unhappy with default format you can change it. You may think “Why I need to change the format? A default output is enough for me”.
Yes. It is true. But when you do programming, default output may not meet the user need. So here’s some custom outputs.

### Output date and time in RFC 2822 format ###

    $ date -R
    Thu, 05 Dec 2013 23:40:53 +0700

**RFC 2822** has a format like this : **day, date-month-year, hours:minutes:second timezone**
Timezone +0700 is same with GMT +7

By default **date** is using the timezone which defined in **/etc/localtime**. Valid timezones data are defined in **/usr/share/timezones**

### Print or set Coordinated Universal Time ###

From [Wikipedia][1], UTC means

> The primary standard which the world regulates clocks and time. It is one several closely related successors to Greenwich Mean Time.

To display your date and time with UTC format, use -u parameter

    $ date -u
    Thu Dec 5 16:45:58:UTC 2013

### Using formatting options ###

To custom your date format, **use a plus sign (+)**

    $ date +”Day : %d Month : %m Year : %Y”
    Day: 05 Month: 12 Year: 2013

    $ date +%D
    12/05/13

**%D** format follows **Year/Month/Day format**.

You can also put the day name if you want. Here’s some examples :

    $ date +”%a %b %d %y”
    Fri 06 Dec 2013

    $ date +”%A %B %d %Y”
    Friday December 06 2013

    $ date +”%A %B %d %Y %T”
    Friday December 06 2013 00:30:37

    $ date +”%A %B-%d-%Y %c”
    Friday December-06-2013 12:30:37 AM WIB

There are still a lot of format options available. Just type

    $ date –help

Or

    $ man date

To show date command syntax and parameters.

So basically, date command will interpret all percent sign (%) and print anything inside a quotes sign (“ “)

### Set system date and time ###

Generally, you want your system date and time is set automatically. If for some reason you have to change it manually, we can use this command :

    # date –set=”20140125 09:17:00”

It will **set** your current date and time of your system into **January 25, 2014 and 09:17:00 AM. Please note**, that you **must** have root privilege to do this. Otherwise you will have an error message like this :

    date: cannot set date: Operation not permitted
    Sat Jan 25 09:17:00 WIB 2014

### Reset your time back ###

If you need to reset your system date and time back to the original, you can do this trick.

    # hwclock
    Fri 06 Dec 2013 03:44:10 AM WIB -0.314082 seconds

And set your system date and time to the output of hwclock command.

### Using date command on a script ###

Remember when I said before about why you may need to change the date output? One of the answer may be because you do programming. Let’s see an example on bash script.

    $ vi display.date

    #! /bin/bash
    DATETIME=$(date +”DATE: %a %b-%d-%Y TIME: %T WEEK NUMBER: %W”)
    echo $DATETIME

Save it and run it using :

    $ ./display.date
    DATE : Fri Dec-06-2013 TIME: 03:08:19 WEEK Number :40

If you find error permission denied error message, type :

    $ chmod 755 display.date

### Using date on a backup procedure ###

Another example is when you are using date on a backup procedure.

    $ date +%F
    2013-12-06

    $ tar zcfv /daily_backup/backup-`date +%F`.tar.gz /home/pungki/Documents

It will compress folder **/home/pungki/Documents** into a a file with name **backup-2013-12-06.tar.gz** which located in **/daily_backup folder**.

### Conclusion ###

Date may be seen as something that is not important. But dates play an important role. As usual, to have more detail in using date command, please visit date manual page by typing man date in your console.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/date-command-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/Coordinated_Universal_Time