timedatectl - Control Linux System Time and Date in Systemd
================================================================================
**timedatectl** is a Linux utility that may be used to query and change the system clock and it's settings. It is distributed as part of the [systemd system and service manager][1] and allows you to review and change the configuration of the system clock.

In this article we will cover all aspects of using this small but important utility

### Current status of the time on the system ###

To have a look at the current date/time on the system, as well as the current time settings on the system you can use the command without any arguments like this:

    # timedatectl

And the output should look something like this:

![](http://blog.linoxide.com/wp-content/uploads/2014/10/timedatectl.jpg)

### Changing the date ###

To change the system date you simply have to type timedatectl set-time followed by the date in the format YYYY-MM-DD where YYYY stands for the year, MM for the month in 2 digit and DD for the day in 2 digit. For example if you wish to change the date to 4th of February 2015 you should use the following command:

    # timedatectl 2015-02-04

### Changing the time ###

To change the time you will use the tool in a similar fashion, you will still use timedatectl set-time but use the format HH:MM:SS where HH stands for hour in 24-hour format, MM for minutes and SS for seconds. To set the current time to 22:04:43 use the following command:

    # timedatectl 22:04:43

### Changing the timezone ###

Setting the correct timezone is crucial for time keeping specially if you synchronize it with the NTP protocol. First you you should list the available timezones in your region with the list-timezones option, you can also use grep and more to make the format easier to read like this:

    # timedatectl list-timezones | grep America | more

This will display the list an easy to scroll format.

After you know how the timezone you wish to set is named you can change it with the following command:

    # timedatectl set-timezone America/Los_Angeles

### Setup the local-rtc ###

The **real-time clock (RTC)**, commonly referred to as a hardware clock is completely independent of the current state of the operating system and runs even when the computer is shut down. You can configure the system to maintain the RTC in universal time or in local time. Note that maintaining the RTC in the local timezone is not fully supported and will create various problems with time zone changes and daylight saving adjustments. If at all possible, keep the RTC in UTC mode. The only issue with this may be that other operating systems may not fully support it (in case you run 2 operating systems on the same machine).

To have the RTC set to UTC use the following setting:

    # timedatectl set-local-rtc 0

To have it set in local time, use this:

    # timedatectl set-local-rtc 1

### Setup NTP synchronization ###

**Network Time Protocol (NTP)** is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks. NTP is intended to synchronize all participating computers to within [a few milliseconds of Coordinated Universal Time (UTC)][2]. If you wish to set NTP synchronization you can use the set-ntp option to have this setup. Use “no” to disable NTP synchronization and use “yes” to have it enabled.

    # timedatectl set-ntp yes

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/timedatectl-change-time-date-systemd/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://www.freedesktop.org/wiki/Software/systemd/
[2]:https://en.wikipedia.org/wiki/Coordinated_Universal_Time