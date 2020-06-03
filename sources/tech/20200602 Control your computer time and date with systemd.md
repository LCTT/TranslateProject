[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Control your computer time and date with systemd)
[#]: via: (https://opensource.com/article/20/6/time-date-systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

Control your computer time and date with systemd
======
Keep your computer time in sync with NTP, Chrony, and systemd-timesyncd.
![Alarm clocks with different time][1]

Most people are concerned with time. We get up in time to perform our morning rituals and commute to work (a short trip for many of us these days), take a break for lunch, meet a project deadline, celebrate birthdays and holidays, catch a plane, and so much more.

Some of us are even _obsessed_ with time. My watch is solar-powered and obtains the exact time from the [National Institute of Standards and Technology][2] (NIST) in Fort Collins, Colorado, via the [WWVB][3] time signal radio station located there. The time signals are synced to the atomic clock, also located in Fort Collins. My Fitbit syncs up to my phone, which is synced to a [Network Time Protocol][4] (NTP) server, which is ultimately synced to the atomic clock.

### Why time is important to computers

There are many reasons our devices and computers need the exact time. For example, in banking, stock markets, and other financial businesses, transactions must be maintained in the proper order, and exact time sequences are critical for that.

Our phones, tablets, cars, GPS systems, and computers all require precise time and date settings. I want the clock on my computer desktop to be correct, so I can count on my local calendar application to pop up reminders at the correct time. The correct time also ensures SystemV cron jobs and systemd timers trigger at the correct time.

The correct time is also important for logging, so it is a bit easier to locate specific log entries based on the time. For one example, I once worked in DevOps (it was not called that at the time) for the State of North Carolina email system. We used to process more than 20 million emails per day. Following the trail of email through a series of servers or determining the exact sequence of events by using log files on geographically dispersed hosts can be much easier when the computers in question keep exact times.

### Multiple times

Linux hosts have two times to consider: system time and RTC time. RTC stands for real-time clock, which is a fancy and not particularly accurate name for the system hardware clock.

The hardware clock runs continuously, even when the computer is turned off, by using a battery on the system motherboard. The RTC's primary function is to keep the time when a connection to a time server is not available. In the dark ages of personal computers, there was no internet to connect to a time server, so the only time a computer had available was the internal clock. Operating systems had to rely on the RTC at boot time, and the user had to manually set the system time using the hardware BIOS configuration interface to ensure it was correct.

The hardware clock does not understand the concept of time zones; only the time is stored in the RTC, not the time zone nor an offset from UTC (Universal Coordinated Time, which is also known as GMT, or Greenwich Mean Time). You can set the RTC with a tool I will explore later in this article.

The system time is the time known by the operating system. It is the time you see on the GUI clock on your desktop, in the output from the `date` command, in timestamps for logs, and in file access, modify, and change times.

The [`rtc` man page][5] contains a more complete discussion of the RTC and system clocks and RTC's functionality.

### What about NTP?

Computers worldwide use the NTP (Network Time Protocol) to synchronize their time with internet standard reference clocks through a hierarchy of NTP servers. The primary time servers are at stratum 1, and they are connected directly to various national time services at stratum 0 via satellite, radio, or even modems over phone lines. The time services at stratum 0 may be an atomic clock, a radio receiver that is tuned to the signals broadcast by an atomic clock, or a GPS receiver using the highly accurate clock signals broadcast by GPS satellites.

To prevent time requests from time servers or clients lower in the hierarchy (i.e., with a higher stratum number) from overwhelming the primary reference servers, several thousand public NTP stratum 2 servers are open and available for all to use. Many organizations and users (including me) with large numbers of hosts that need an NTP server choose to set up their own time servers, so only one local host accesses the stratum 2 or 3 time servers. Then they configure the remaining hosts in the network to use the local time server. In the case of my home network, that is a stratum 3 server.

### NTP implementation options

The original NTP implementation is **ntpd**, and it has been joined by two newer ones, **chronyd** and **systemd-timesyncd**. All three keep the local host's time synchronized with an NTP time server. The systemd-timesyncd service is not as robust as chronyd, but it is sufficient for most purposes. It can perform large time jumps if the RTC is far out of sync, and it can adjust the system time gradually to stay in sync with the NTP server if the local system time drifts a bit. The systemd-timesync service cannot be used as a time server.

[Chrony][6] is an NTP implementation containing two programs: the chronyd daemon and a command-line interface called chronyc. As I explained in a [previous article][7], Chrony has some features that make it the best choice for many environments, chiefly:

  * Chrony can synchronize to the time server much faster than the old ntpd service. This is good for laptops or desktops that do not run constantly.
  * It can compensate for fluctuating clock frequencies, such as when a host hibernates or enters sleep mode, or when the clock speed varies due to frequency stepping that slows clock speeds when loads are low.
  * It handles intermittent network connections and bandwidth saturation.
  * It adjusts for network delays and latency.
  * After the initial time sync, Chrony never stops the clock. This ensures stable and consistent time intervals for many system services and applications.
  * Chrony can work even without a network connection. In this case, the local host or server can be updated manually.
  * Chrony can act as an NTP server.



Just to be clear, NTP is a protocol that is implemented on a Linux host using either Chrony or the systemd-timesyncd.service.

The NTP, Chrony, and systemd-timesyncd RPM packages are available in standard Fedora repositories. The systemd-udev RPM is a rule-based device node and kernel event manager that is installed by default with Fedora but not enabled.

You can install all three and switch between them, but that is a pain and not worth the trouble. Modern releases of Fedora, CentOS, and RHEL have moved from NTP to Chrony as their default timekeeping implementation, and they also install systemd-timesyncd. I find that Chrony works well, provides a better interface than the NTP service, presents much more information, and increases control, which are all advantages for the sysadmin.

### Disable other NTP services

It's possible an NTP service is already running on your host. If so, you need to disable it before switching to something else. I have been using chronyd, so I used the following commands to stop and disable it. Run the appropriate commands for whatever NTP daemon you are using on your host:


```
[root@testvm1 ~]# systemctl disable chronyd ; systemctl stop chronyd
Removed /etc/systemd/system/multi-user.target.wants/chronyd.service.
[root@testvm1 ~]#
```

Verify that it is both stopped and disabled:


```
[root@testvm1 ~]# systemctl status chronyd
● chronyd.service - NTP client/server
     Loaded: loaded (/usr/lib/systemd/system/chronyd.service; disabled; vendor preset: enabled)
     Active: inactive (dead)
       Docs: man:chronyd(8)
             man:chrony.conf(5)
[root@testvm1 ~]#
```

### Check the status before starting

The systemd timesync's status indicates whether systemd has initiated an NTP service. Because you have not yet started systemd NTP, the `timesync-status` command returns no data:


```
[root@testvm1 ~]# timedatectl timesync-status
Failed to query server: Could not activate remote peer.
```

But a straight `status` request provides some important information. For example, the `timedatectl` command without an argument or options implies the `status` subcommand as default:


```
[root@testvm1 ~]# timedatectl status
           Local time: Fri 2020-05-15 08:43:10 EDT  
           Universal time: Fri 2020-05-15 12:43:10 UTC  
                 RTC time: Fri 2020-05-15 08:43:08      
                Time zone: America/New_York (EDT, -0400)
System clock synchronized: no                          
              NTP service: inactive                    
          RTC in local TZ: yes                    

Warning: The system is configured to read the RTC time in the local time zone.
         This mode cannot be fully supported. It will create various problems
         with time zone changes and daylight saving time adjustments. The RTC
         time is never updated, it relies on external facilities to maintain it.
         If at all possible, use RTC in UTC by calling
         'timedatectl set-local-rtc 0'.
[root@testvm1 ~]#
```

This returns the local time for your host, the UTC time, and the RTC time. It shows that the system time is set to the `America/New_York` time zone (`TZ`), the RTC is set to the time in the local time zone, and the NTP service is not active. The RTC time has started to drift a bit from the system time. This is normal with systems whose clocks have not been synchronized. The amount of drift on a host depends upon the amount of time since the system was last synced and the speed of the drift per unit of time.

There is also a warning message about using local time for the RTC—this relates to time-zone changes and daylight saving time adjustments. If the computer is off when changes need to be made, the RTC time will not change. This is not an issue in servers or other hosts that are powered on 24/7. Also, any service that provides NTP time synchronization will ensure the host is set to the proper time early in the startup process, so it will be correct before it is fully up and running.

### Set the time zone

Usually, you set a computer's time zone during the installation procedure and never need to change it. However, there are times it is necessary to change the time zone, and there are a couple of tools to help. Linux uses time-zone files to define the local time zone in use by the host. These binary files are located in the `/usr/share/zoneinfo` directory. The default for my time zone is defined by the link `/etc/localtime -> ../usr/share/zoneinfo/America/New_York`. But you don't need to know that to change the time zone.

But you do need to know the official time-zone name for your location. Say you want to change the time zone to Los Angeles:


```
[root@testvm2 ~]# timedatectl list-timezones | column
&lt;SNIP&gt;
America/La_Paz                  Europe/Budapest
America/Lima                    Europe/Chisinau
America/Los_Angeles             Europe/Copenhagen
America/Maceio                  Europe/Dublin
America/Managua                 Europe/Gibraltar
America/Manaus                  Europe/Helsinki
&lt;SNIP&gt;
```

Now you can set the time zone. I used the `date` command to verify the change, but you could also use `timedatectl`:


```
[root@testvm2 ~]# date
Tue 19 May 2020 04:47:49 PM EDT
[root@testvm2 ~]# timedatectl set-timezone America/Los_Angeles
[root@testvm2 ~]# date
Tue 19 May 2020 01:48:23 PM PDT
[root@testvm2 ~]#
```

You can now change your host's time zone back to your local one.

### systemd-timesyncd

The systemd timesync daemon provides an NTP implementation that is easy to manage within a systemd context. It is installed by default in Fedora and Ubuntu and started by default in Ubuntu but not in Fedora. I am unsure about other distros; you can check yours with:


```
`[root@testvm1 ~]# systemctl status systemd-timesyncd`
```

### Configure systemd-timesyncd

The configuration file for systemd-timesyncd is `/etc/systemd/timesyncd.conf`. It is a simple file with fewer options included than the older NTP service and chronyd. Here are the complete contents of the default version of this file on my Fedora VM:


```
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.
#
# Entries in this file show the compile time defaults.
# You can change settings by editing this file.
# Defaults can be restored by simply deleting this file.
#
# See timesyncd.conf(5) for details.

[Time]
#NTP=
#FallbackNTP=0.fedora.pool.ntp.org 1.fedora.pool.ntp.org 2.fedora.pool.ntp.org 3.fedora.pool.ntp.org
#RootDistanceMaxSec=5
#PollIntervalMinSec=32
#PollIntervalMaxSec=2048
```

The only section it contains besides comments is `[Time]`, and all the lines are commented out. These are the default values and do not need to be changed or uncommented (unless you have some reason to do so). If you do not have a specific NTP time server defined in the `NTP=` line, Fedora's default is to fall back on the Fedora pool of time servers. I like to add the time server on my network to this line:


```
`NTP=myntpserver`
```

### Start timesync

Starting and enabling systemd-timesyncd is just like any other service:


```
[root@testvm2 ~]# systemctl enable systemd-timesyncd.service
Created symlink /etc/systemd/system/dbus-org.freedesktop.timesync1.service → /usr/lib/systemd/system/systemd-timesyncd.service.
Created symlink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service → /usr/lib/systemd/system/systemd-timesyncd.service.
[root@testvm2 ~]# systemctl start systemd-timesyncd.service
[root@testvm2 ~]#
```

### Set the hardware clock

Here's what one of my systems looked like after starting timesyncd:


```
[root@testvm2 systemd]# timedatectl
               Local time: Sat 2020-05-16 14:34:54 EDT  
           Universal time: Sat 2020-05-16 18:34:54 UTC  
                 RTC time: Sat 2020-05-16 14:34:53      
                Time zone: America/New_York (EDT, -0400)
System clock synchronized: yes                          
              NTP service: active                      
          RTC in local TZ: no    
```

The RTC time is around a second off from local time (EDT), and the discrepancy grows by a couple more seconds over the next few days. Because RTC does not have the concept of time zones, the `timedatectl` command must do a comparison to determine which time zone is a match. If the RTC time does not match local time exactly, it is not considered to be in the local time zone.

In search of a bit more information, I checked the status of systemd-timesync.service and found:


```
[root@testvm2 systemd]# systemctl status systemd-timesyncd.service
● systemd-timesyncd.service - Network Time Synchronization
     Loaded: loaded (/usr/lib/systemd/system/systemd-timesyncd.service; enabled; vendor preset: disabled)
     Active: active (running) since Sat 2020-05-16 13:56:53 EDT; 18h ago
       Docs: man:systemd-timesyncd.service(8)
   Main PID: 822 (systemd-timesyn)
     Status: "Initial synchronization to time server 163.237.218.19:123 (2.fedora.pool.ntp.org)."
      Tasks: 2 (limit: 10365)
     Memory: 2.8M
        CPU: 476ms
     CGroup: /system.slice/systemd-timesyncd.service
             └─822 /usr/lib/systemd/systemd-timesyncd

May 16 09:57:24 testvm2.both.org systemd[1]: Starting Network Time Synchronization...
May 16 09:57:24 testvm2.both.org systemd-timesyncd[822]: System clock time unset or jumped backwards, restoring from recorded timestamp: Sat 2020-05-16 13:56:53 EDT
May 16 13:56:53 testvm2.both.org systemd[1]: Started Network Time Synchronization.
May 16 13:57:56 testvm2.both.org systemd-timesyncd[822]: Initial synchronization to time server 163.237.218.19:123 (2.fedora.pool.ntp.org).
[root@testvm2 systemd]#
```

Notice the log message that says the system clock time was unset or jumped backward. The timesync service sets the system time from a timestamp. Timestamps are maintained by the timesync daemon and are created at each successful time synchronization.

The `timedatectl` command does not have the ability to set the value of the hardware clock from the system clock; it can only set the time and date from a value entered on the command line. However, you can set the RTC to the same value as the system time by using the `hwclock` command:


```
[root@testvm2 ~]# /sbin/hwclock --systohc --localtime
[root@testvm2 ~]# timedatectl
               Local time: Mon 2020-05-18 13:56:46 EDT  
           Universal time: Mon 2020-05-18 17:56:46 UTC  
                 RTC time: Mon 2020-05-18 13:56:46      
                Time zone: America/New_York (EDT, -0400)
System clock synchronized: yes                          
              NTP service: active                      
          RTC in local TZ: yes
```

The `--localtime` option ensures that the hardware clock is set to local time, not UTC.

### Do you really need RTC?

Any NTP implementation will set the system clock during the startup sequence, so is RTC necessary? Not really, so long as you have a network connection to a time server. However, many systems do not have full-time access to a network connection, so the hardware clock is useful so that Linux can read it and set the system time. This is a better solution than having to set the time by hand, even if it might drift away from the actual time.

### Summary

This article explored the use of some systemd tools for managing date, time, and time zones. The systemd-timesyncd tool provides a decent NTP client that can keep time on a local host synchronized with an NTP server. However, systemd-timesyncd does not provide a server service, so if you need an NTP server on your network, you must use something else, such as Chrony, to act as a server.

I prefer to have a single implementation for any service in my network, so I use Chrony. If you do not need a local NTP server, or if you do not mind dealing with Chrony for the server and systemd-timesyncd for the client and you do not need Chrony's additional capabilities, then systemd-timesyncd is a serviceable choice for an NTP client.

There is another point I want to make: You do not have to use systemd tools for NTP implementation. You can use the old ntpd or Chrony or some other NTP implementation. systemd is composed of a large number of services; many of them are optional, so they can be disabled and something else used in its place. It is not the huge, monolithic monster that some make it out to be. It is OK to not like systemd or parts of it, but you should make an informed decision.

I don't dislike systemd's implementation of NTP, but I much prefer Chrony because it meets my needs better. And that is what Linux is all about.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide to systemd][8]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][9] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][10]'s [description of systemd][11].
  * [Linux.com][12]'s "More systemd fun" offers more advanced systemd [information and tips][13].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][14]
  * [systemd for Administrators, Part I][15]
  * [systemd for Administrators, Part II][16]
  * [systemd for Administrators, Part III][17]
  * [systemd for Administrators, Part IV][18]
  * [systemd for Administrators, Part V][19]
  * [systemd for Administrators, Part VI][20]
  * [systemd for Administrators, Part VII][21]
  * [systemd for Administrators, Part VIII][22]
  * [systemd for Administrators, Part IX][23]
  * [systemd for Administrators, Part X][24]
  * [systemd for Administrators, Part XI][25]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/time-date-systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://en.wikipedia.org/wiki/National_Institute_of_Standards_and_Technology
[3]: https://en.wikipedia.org/wiki/WWVB
[4]: https://en.wikipedia.org/wiki/Network_Time_Protocol
[5]: https://linux.die.net/man/4/rtc
[6]: https://chrony.tuxfamily.org/
[7]: https://opensource.com/article/18/12/manage-ntp-chrony
[8]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[9]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[10]: http://Freedesktop.org
[11]: http://www.freedesktop.org/wiki/Software/systemd
[12]: http://Linux.com
[13]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[14]: http://0pointer.de/blog/projects/systemd.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[18]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[19]: http://0pointer.de/blog/projects/three-levels-of-off.html
[20]: http://0pointer.de/blog/projects/changing-roots
[21]: http://0pointer.de/blog/projects/blame-game.html
[22]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[23]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[24]: http://0pointer.de/blog/projects/instances.html
[25]: http://0pointer.de/blog/projects/inetd.html
