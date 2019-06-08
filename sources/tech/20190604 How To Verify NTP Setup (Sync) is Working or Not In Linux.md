[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Verify NTP Setup (Sync) is Working or Not In Linux?)
[#]: via: (https://www.2daygeek.com/check-verify-ntp-sync-is-working-or-not-in-linux-using-ntpq-ntpstat-timedatectl/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Verify NTP Setup (Sync) is Working or Not In Linux?
======

NTP stand for Network Time Protocol, which synchronize the clock between computer systems over the network.

NTP server keep all the servers in your organization in-sync with an accurate time to perform time based jobs.

NTP client will synchronize its clock to the network time server.

We had already wrote an article about NTP Server and Client installation and configuration.

If you would like to check these article, navigate to the following links.

  * **[How To Install And Configure NTP Server And NTP Client In Linux?][1]**
  * **[How To Install And Configure Chrony As NTP Client?][2]**



I assume that we have already setup NTP server and NTP client using the above links.

Now, how to verify whether the NTP setup is working correctly or not?

There are three commands available in Linux to validate the NTP sync. The details are below. In this article, we will tell you, how to verify NTP sync using all these commands.

  * **`ntpq:`** ntpq is standard NTP query program.
  * **`ntpstat:`** It shows network time synchronization status.
  * **`timedatectl:`** It controls the system time and date in systemd system.



### Method-1: How To Check NTP Status Using ntpq Command?

The ntpq utility program is used to monitor NTP daemon ntpd operations and determine performance.

The program can be run either in interactive mode or controlled using command line arguments.

It prints a list of peers that connected by sending multiple queries to the server.

If NTP is working properly, you will be getting the output similar to below.

```
# ntpq -p

     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*CentOS7.2daygee 133.243.238.163  2 u   14   64   37    0.686    0.151  16.432
```

**Details:**

  * **-p:** Print a list of the peers known to the server as well as a summary of their state.



### Method-2: How To Check NTP Status Using ntpstat Command?

ntpstat will report the synchronisation state of the NTP daemon (ntpd) running on the local machine.

If the local system is found to be synchronised to a reference time source, ntpstat will report the approximate time accuracy.

The ntpstat command returns three kind of status code based on the NTP sync. The details are below.

  * **`0:`**` ` It returns 0 if clock is synchronised.
  * **`1:`**` ` It returns 1 if clock is not synchronised.
  * **`2:`**` ` It returns 2 if clock state is indeterminant, for example if ntpd is not contactable.



```
# ntpstat

synchronised to NTP server (192.168.1.8) at stratum 3
   time correct to within 508 ms
   polling server every 64 s
```

### Method-3: How To Check NTP Status Using timedatectl Command?

**[timedatectl Command][3]** is used to query and change the system clock and its settings in systmed system.

```
# timedatectl
or
# timedatectl status

      Local time: Thu 2019-05-30 05:01:05 CDT
  Universal time: Thu 2019-05-30 10:01:05 UTC
        RTC time: Thu 2019-05-30 10:01:05
       Time zone: America/Chicago (CDT, -0500)
     NTP enabled: yes
NTP synchronized: yes
 RTC in local TZ: no
      DST active: yes
 Last DST change: DST began at
                  Sun 2019-03-10 01:59:59 CST
                  Sun 2019-03-10 03:00:00 CDT
 Next DST change: DST ends (the clock jumps one hour backwards) at
                  Sun 2019-11-03 01:59:59 CDT
                  Sun 2019-11-03 01:00:00 CST
```

### Bonus Tips:

Chrony is replacement of NTP client.

It can synchronize the system clock faster with better time accuracy and it can be particularly useful for the systems which are not online all the time.

chronyd is smaller, it uses less memory and it wakes up the CPU only when necessary, which is better for power saving.

It can perform well even when the network is congested for longer periods of time.

You can use any of the below commands to check Chrony status.

To check chrony tracking status.

```
# chronyc tracking

Reference ID    : C0A80105 (CentOS7.2daygeek.com)
Stratum         : 3
Ref time (UTC)  : Thu Mar 28 05:57:27 2019
System time     : 0.000002545 seconds slow of NTP time
Last offset     : +0.001194361 seconds
RMS offset      : 0.001194361 seconds
Frequency       : 1.650 ppm fast
Residual freq   : +184.101 ppm
Skew            : 2.962 ppm
Root delay      : 0.107966967 seconds
Root dispersion : 1.060455322 seconds
Update interval : 2.0 seconds
Leap status     : Normal
```

Run the sources command to displays information about the current time sources.

```
# chronyc sources

210 Number of sources = 1
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* CentOS7.2daygeek.com          2   6    17    62    +36us[+1230us] +/- 1111ms
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-verify-ntp-sync-is-working-or-not-in-linux-using-ntpq-ntpstat-timedatectl/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/
[2]: https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/
[3]: https://www.2daygeek.com/change-set-time-date-and-timezone-on-linux/
