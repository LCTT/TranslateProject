Linux FAQs with Answers--How to change date and time from the command line on Linux
================================================================================
> **Question**: In Linux, how can I change date and time from the command line? 

Keeping the date and time up-to-date in a Linux system is an important responsibility of every Linux user and system administrator. Many applications rely on accurate timing information to operate properly. Besides, inaccurate date and time render timestamp information in log files meaningless, diminishing their usefulness for system inspection and troubleshooting. For production systems, accurate date and time are even more critical. For example, the production in a retail company must be accounted precisely at all times (and stored in a database server) so that the finance department can calculate the expenses and net income of the day, current week, month, and year.

We must note that there are two kinds of clocks in a Linux machine: the software clock (aka system clock), which is maintained by the kernel, and the (battery-driven) hardware clock, which is used to keep track of time when the machine is powered down. During boot, the kernel sets the system clock to the same time as the hardware clock. Afterwards, both clocks run independent from each other.

### Method One: Date Command ###

In Linux, you can use the date command to change the date and time of your system:

    # date --set='NEW_DATE' 

where NEW_DATE is a mostly free format human readable date string such as "Sun, 28 Sep 2014 16:21:42" or "2014-09-29 16:21:42".

The date format can also be specified to obtain more accurate results:

    # date +FORMAT --set='NEW_DATE' 

For example:

    # date +’%Y%m%d %H%m’ --set='20140928 1518' 

![](https://farm3.staticflickr.com/2944/15220890657_858528a186_o.png)

You can also increment or decrement date or time by a number of days, weeks, months or years, and seconds, minutes or hours, respectively. You may combine date and time parameters in one command as well.

    # date --set='+5 minutes'
    # date --set='-2 weeks'
    # date --set='+3 months'
    # date --set='-3 months +2 weeks -5 minutes' 

![](https://farm3.staticflickr.com/2943/15220655239_deba528dce_o.png)

Finally, set the hardware clock to the current system time:

    # hwclock --systohc 

The purpose of running **hwclock --systohc** is to update the hardware clock with the software clock. This is to correct the systematic drift of the hardware clock, where it consistently gains or loses time at a certain rate.

On the other hand, if the hardware clock shows correct date and time, but the system clock does not, the latter can be updated as follows:

     # hwclock --hctosys 

In either case, hwclock command synchronizes both clocks. Otherwise, the time will be wrong after the next reboot, since the hardware clock keeps the time when power is turned off. However, keep in mind that this is not applicable to virtual machines, as they cannot access the hardware clock of the host machine directly.

If the default timezone is not correct on your Linux system, you can change it by following [this guideline][1].

### Method Two: NTP ###

Another way to keep your system's date and time accurate is using NTP (network time protocol). On Linux, ntpdate command can synchronize system clock against [public NTP servers][2] using NTP.

You can install **ntpdate** as follows:

On Debian and derivatives:

    # aptitude install ntpdate

On Red Hat-based distributions:

    # yum install ntpdate

To synchronize system clock using NTP:

    # ntpdate -u <NTP server name or IP address>
    # hwclock --systohc 

![](https://farm4.staticflickr.com/3930/15404223021_8da3b44a62_z.jpg)

As opposed to one-time clock sync using ntpdate, you can also set up NTP daemon (ntpd) on your system, so that ntpd always runs in the background, continuously adjusting system clock via NTP. Refer to [this guideline][3] to set up **ntpd**.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-date-time-command-line-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/change-timezone-linux.html
[2]:http://www.pool.ntp.org/
[3]:http://xmodulo.com/how-to-synchronize-time-with-ntp.html