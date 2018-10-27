Chrony – An Alternative NTP Client And Server For Unix-like Systems
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/chrony-1-720x340.jpeg)

In this tutorial, we will be discussing how to install and configure **Chrony** , an alternative NTP client and server for Unix-like systems. Chrony can synchronise the system clock faster with better time accuracy and it can be particularly useful for the systems which are not online all the time. Chrony is free, open source and supports GNU/Linux and BSD variants such as FreeBSD, NetBSD, macOS, and Solaris.

### Installing Chrony

Chrony is available in the default repositories of most Linux distributions. If you’re on Arch Linux, run the following command to install it:

```
$ sudo pacman -S chrony
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt-get install chrony
```

On Fedora:

```
$ sudo dnf install chrony
```

Once installed, start **chronyd.service** daemon if it is not started already:

```
$ sudo systemctl start chronyd.service
```

Make it to start automatically on every reboot using command:

```
$ sudo systemctl enable chronyd.service
```

To verify if the Chronyd.service has been started, run:

```
$ sudo systemctl status chronyd.service
```

If everything is OK, you will see an output something like below.

```
● chrony.service - chrony, an NTP client/server
Loaded: loaded (/lib/systemd/system/chrony.service; enabled; vendor preset: ena
Active: active (running) since Wed 2018-10-17 10:34:53 UTC; 3min 15s ago
Docs: man:chronyd(8)
man:chronyc(1)
man:chrony.conf(5)
Main PID: 2482 (chronyd)
Tasks: 1 (limit: 2320)
CGroup: /system.slice/chrony.service
└─2482 /usr/sbin/chronyd

Oct 17 10:34:53 ubuntuserver systemd[1]: Starting chrony, an NTP client/server...
Oct 17 10:34:53 ubuntuserver chronyd[2482]: chronyd version 3.2 starting (+CMDMON
Oct 17 10:34:53 ubuntuserver chronyd[2482]: Initial frequency -268.088 ppm
Oct 17 10:34:53 ubuntuserver systemd[1]: Started chrony, an NTP client/server.
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Selected source 85.25.84.166
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Source 85.25.84.166 replaced with 2403
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Selected source 91.189.89.199
Oct 17 10:35:06 ubuntuserver chronyd[2482]: Selected source 106.10.186.200
```

As you can see, Chrony service is started and working!

### Configure Chrony

The NTP clients needs to know which NTP servers it should contact to get the current time. We can specify the NTP servers in the **server** or **pool** directive in the NTP configuration file. Usually, the default configuration file is **/etc/chrony/chrony.conf** or **/etc/chrony.conf** depending upon the Linux distribution version. For better reliability, it is recommended to specify at least three servers.

The following lines are just an example taken from my Ubuntu 18.04 LTS server.

```
[...]
# About using servers from the NTP Pool Project in general see (LP: #104525).
# Approved by Ubuntu Technical Board on 2011-02-08.
# See http://www.pool.ntp.org/join.html for more information.
pool ntp.ubuntu.com iburst maxsources 4
pool 0.ubuntu.pool.ntp.org iburst maxsources 1
pool 1.ubuntu.pool.ntp.org iburst maxsources 1
pool 2.ubuntu.pool.ntp.org iburst maxsources 2
[...]
```

As you see in the above output, [**NTP Pool Project**][1] has been set as the default time server. For those wondering, NTP pool project is the cluster of time servers that provides NTP service for tens of millions clients across the world. It is the default time server for Ubuntu and most of the other major Linux distributions.

Here,

  * the **iburst** option is used to speed up the initial synchronisation.
  * the **maxsources** refers the maximum number of NTP sources.



Please make sure that the NTP servers you have chosen are well synchronised, stable and close to your location to improve the accuracy of the time with NTP sources.

### Manage Chronyd from command line

Chrony has a command line utility named **chronyc** to control and monitor the **chrony** daemon (chronyd).

To check if **chrony** is synchronized, we can use the **tracking** command as shown below.

```
$ chronyc tracking
Reference ID : 6A0ABAC8 (t1.time.sg3.yahoo.com)
Stratum : 3
Ref time (UTC) : Wed Oct 17 11:48:51 2018
System time : 0.000984587 seconds slow of NTP time
Last offset : -0.000912981 seconds
RMS offset : 0.007983995 seconds
Frequency : 23.704 ppm slow
Residual freq : +0.006 ppm
Skew : 1.734 ppm
Root delay : 0.089718960 seconds
Root dispersion : 0.008760406 seconds
Update interval : 515.1 seconds
Leap status : Normal
```

We can verify the current time sources that chrony uses with command:

```
$ chronyc sources
210 Number of sources = 8
MS Name/IP address Stratum Poll Reach LastRx Last sample
===============================================================================
^- chilipepper.canonical.com 2 10 377 296 +102ms[ +104ms] +/- 279ms
^- golem.canonical.com 2 10 377 302 +105ms[ +107ms] +/- 290ms
^+ pugot.canonical.com 2 10 377 297 +36ms[ +38ms] +/- 238ms
^- alphyn.canonical.com 2 10 377 279 -43ms[ -42ms] +/- 238ms
^- dadns.cdnetworks.co.kr 2 10 377 1070 +40ms[ +42ms] +/- 314ms
^* t1.time.sg3.yahoo.com 2 10 377 169 -13ms[ -11ms] +/- 80ms
^+ sin1.m-d.net 2 10 275 567 -9633us[-7826us] +/- 115ms
^- ns2.pulsation.fr 2 10 377 311 -75ms[ -73ms] +/- 250ms
```

Chronyc utility can find the statistics of each sources, such as drift rate and offset estimation process, using **sourcestats** command.

```
$ chronyc sourcestats
210 Number of sources = 8
Name/IP Address NP NR Span Frequency Freq Skew Offset Std Dev
==============================================================================
chilipepper.canonical.com 32 16 89m +6.293 14.345 +30ms 24ms
golem.canonical.com 32 17 89m +0.312 18.887 +20ms 33ms
pugot.canonical.com 32 18 89m +0.281 11.237 +3307us 23ms
alphyn.canonical.com 31 20 88m -4.087 8.910 -58ms 17ms
dadns.cdnetworks.co.kr 29 16 76m -1.094 9.895 -83ms 14ms
t1.time.sg3.yahoo.com 32 16 91m +0.153 1.952 +2835us 4044us
sin1.m-d.net 29 13 83m +0.049 6.060 -8466us 9940us
ns2.pulsation.fr 32 17 88m +0.784 9.834 -62ms 22ms
```

If your system is not connected to Internet, you need to notify Chrony that the system is not connected to the Internet. To do so, run:

```
$ sudo chronyc offline
[sudo] password for sk:
200 OK
```

To verify the status of your NTP sources, simply run:

```
$ chronyc activity
200 OK
0 sources online
8 sources offline
0 sources doing burst (return to online)
0 sources doing burst (return to offline)
0 sources with unknown address
```

As you see, all my NTP sources are down at the moment.

Once you’re connected to the Internet, just notify Chrony that your system is back online using command:

```
$ sudo chronyc online
200 OK
```

To view the status of NTP source(s), run:

```
$ chronyc activity
200 OK
8 sources online
0 sources offline
0 sources doing burst (return to online)
0 sources doing burst (return to offline)
0 sources with unknown address
```

For more detailed explanation of all options and parameters, refer the man pages.

```
$ man chronyc

$ man chronyd
```

And, that’s all for now. Hope this was useful. In the subsequent tutorials, we will see how to setup a local NTP server using Chrony and configure the clients to use it to synchronise time.

Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/chrony-an-alternative-ntp-client-and-server-for-unix-like-systems/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ntppool.org/en/
