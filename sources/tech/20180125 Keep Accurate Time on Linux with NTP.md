Keep Accurate Time on Linux with NTP
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/usno-amc.jpg?itok=KA8HwI02)

How to keep the correct time and keep your computers synchronized without abusing time servers, using NTP and systemd.

### What Time is It?

Linux is funky when it comes to telling the time. You might think that the `time` tells the time, but it doesn't because it is a timer that measures how long a process runs. To get the time, you run the `date` command, and to view more than one date, you use `cal`. Timestamps on files are also a source of confusion as they are typically displayed in two different ways, depending on your distro defaults. This example is from Ubuntu 16.04 LTS:
```
$ ls -l
drwxrwxr-x 5 carla carla 4096 Mar 27 2017 stuff
drwxrwxr-x 2 carla carla 4096 Dec 8 11:32 things
-rw-rw-r-- 1 carla carla 626052 Nov 21 12:07 fatpdf.pdf
-rw-rw-r-- 1 carla carla 2781 Apr 18 2017 oddlots.txt

```

Some display the year, some display the time, which makes ordering your files rather a mess. The GNU default is files dated within the last six months display the time instead of the year. I suppose there is a reason for this. If your Linux does this, try `ls -l --time-style=long-iso` to display the timestamps all the same way, sorted alphabetically. See [How to Change the Linux Date and Time: Simple Commands][1] to learn all manner of fascinating ways to manage the time on Linux.

### Check Current Settings

NTP, the network time protocol, is the old-fashioned way of keeping correct time on computers. `ntpd`, the NTP daemon, periodically queries a public time server and adjusts your system time as needed. It's a simple lightweight protocol that is easy to set up for basic use. Systemd has barged into NTP territory with the `systemd-timesyncd.service`, which acts as a client to `ntpd`.

Before messing with NTP, let's take a minute to check that current time settings are correct.

There are (at least) two timekeepers on your system: system time, which is managed by the Linux kernel, and the hardware clock on your motherboard, which is also called the real-time clock (RTC). When you enter your system BIOS, you see the hardware clock time and you can change its settings. When you install a new Linux, and in some graphical time managers, you are asked if you want your RTC set to the UTC (Coordinated Universal Time) zone. It should be set to UTC, because all time zone and daylight savings time calculations are based on UTC. Use the `hwclock` command to check:
```
$ sudo hwclock --debug
hwclock from util-linux 2.27.1
Using the /dev interface to the clock.
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
...got clock tick
Time read from Hardware Clock: 2018/01/22 22:14:31
Hw clock time : 2018/01/22 22:14:31 = 1516659271 seconds since 1969
Time since last adjustment is 1516659271 seconds
Calculated Hardware Clock drift is 0.000000 seconds
Mon 22 Jan 2018 02:14:30 PM PST .202760 seconds

```

"Hardware clock is kept in UTC time" confirms that your RTC is on UTC, even though it translates the time to your local time. If it were set to local time it would report "Hardware clock is kept in local time."

You should have a `/etc/adjtime` file. If you don't, sync your RTC to system time:
```
$ sudo hwclock -w

```

This should generate the file, and the contents should look like this example:
```
$ cat /etc/adjtime
0.000000 1516661953 0.000000
1516661953
UTC

```

The new-fangled systemd way is to run `timedatectl`, which does not need root permissions:
```
$ timedatectl
 Local time: Mon 2018-01-22 14:17:51 PST
 Universal time: Mon 2018-01-22 22:17:51 UTC
 RTC time: Mon 2018-01-22 22:17:51
 Time zone: America/Los_Angeles (PST, -0800)
 Network time on: yes
NTP synchronized: yes
 RTC in local TZ: no

```

"RTC in local TZ: no" confirms that it is on UTC time. What if it is on local time? There are, as always, multiple ways to change it. The easy way is with a nice graphical configuration tool, like YaST in openSUSE. You can use `timedatectl`:
```
$ timedatectl set-local-rtc 0
```

Or edit `/etc/adjtime`, replacing UTC with LOCAL.

### systemd-timesyncd Client

Now I'm tired, and we've just gotten to the good part. Who knew timekeeping was so complex? We haven't even scratched the surface; read `man 8 hwclock` to get an idea of how time is kept on computers.

Systemd provides the `systemd-timesyncd.service` client, which queries remote time servers and adjusts your system time. Configure your servers in `/etc/systemd/timesyncd.conf`. Most Linux distributions provide a default configuration that points to time servers that they maintain, like Fedora:
```
[Time]
#NTP=
#FallbackNTP=0.fedora.pool.ntp.org 1.fedora.pool.ntp.org

```

You may enter any other servers you desire, such as your own local NTP server, on the `NTP=` line in a space-delimited list. (Remember to uncomment this line.) Anything you put on the `NTP=` line overrides the fallback.

What if you are not using systemd? Then you need only NTP.

### Setting up NTP Server and Client

It is a good practice to set up your own LAN NTP server, so that you are not pummeling public NTP servers from all of your computers. On most Linuxes NTP comes in the `ntp` package, and most of them provide `/etc/ntp.conf` to configure the service. Consult [NTP Pool Time Servers][2] to find the NTP server pool that is appropriate for your region. Then enter 4-5 servers in your `/etc/ntp.conf` file, with each server on its own line:
```
driftfile /var/ntp.drift
logfile /var/log/ntp.log
server 0.europe.pool.ntp.org
server 1.europe.pool.ntp.org
server 2.europe.pool.ntp.org
server 3.europe.pool.ntp.org

```

The `driftfile` tells `ntpd` where to store the information it needs to quickly synchronize your system clock with the time servers at startup, and your logs should have their own home instead of getting dumped into the syslog. Use your Linux distribution defaults for these files if it provides them.

Now start the daemon; on most Linuxes this is `sudo systemctl start ntpd`. Let it run for a few minutes, then check its status:
```
$ ntpq -p
 remote refid st t when poll reach delay offset jitter
==============================================================
+dev.smatwebdesi 192.168.194.89 3 u 25 64 37 92.456 -6.395 18.530
*chl.la 127.67.113.92 2 u 23 64 37 75.175 8.820 8.230
+four0.fairy.mat 35.73.197.144 2 u 22 64 37 116.272 -10.033 40.151
-195.21.152.161 195.66.241.2 2 u 27 64 37 107.559 1.822 27.346

```

I have no idea what any of that means, other than your daemon is talking to the remote time servers, and that is what you want. To permanently enable it, run `sudo systemctl enable ntpd`. If your Linux doesn't use systemd then it is your homework to figure out how to run `ntpd`.

Now you can set up `systemd-timesyncd` on your other LAN hosts to use your local NTP server, or install NTP on them and enter your local server in their `/etc/ntp.conf` files.

NTP servers take a beating, and demand continually increases. You can help by running your own public NTP server. Come back next week to learn how.

Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/keep-accurate-time-linux-ntp

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/how-change-linux-date-and-time-simple-commands
[2]:http://support.ntp.org/bin/view/Servers/NTPPoolServers
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
