[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Configure Chrony As NTP Client?)
[#]: via: (https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Install And Configure Chrony As NTP Client?
======

The NTP server and NTP client allow us to sync the clock across the network.

We had written an article about **[NTP server and NTP client installation and configuration][1]** in the past.

If you would like to check these, navigate to the above URL.

### What Is Chrony Client?

Chrony is replacement of NTP client.

It can synchronize the system clock faster with better time accuracy and it can be particularly useful for the systems which are not online all the time.

chronyd is smaller, it uses less memory and it wakes up the CPU only when necessary, which is better for power saving.

It can perform well even when the network is congested for longer periods of time.

It supports hardware timestamping on Linux, which allows extremely accurate synchronization on local networks.

It offers following two services.

  * **`chronyc:`** Command line interface for chrony.
  * **`chronyd:`** Chrony daemon service.



### How To Install And Configure Chrony In Linux?

Since the package is available in most of the distributions official repository. So, use the package manager to install it.

For **`Fedora`** system, use **[DNF Command][2]** to install chrony.

```
$ sudo dnf install chrony
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install chrony.

```
$ sudo apt install chrony
```

For **`Arch Linux`** based systems, use **[Pacman Command][5]** to install chrony.

```
$ sudo pacman -S chrony
```

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install chrony.

```
$ sudo yum install chrony
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install chrony.

```
$ sudo zypper install chrony
```

In this article, we are going to use the following setup to test this.

  * **`NTP Server:`** HostName: CentOS7.2daygeek.com, IP:192.168.1.5, OS:CentOS 7
  * **`Chrony Client:`** HostName: Ubuntu18.2daygeek.com, IP:192.168.1.3, OS:Ubuntu 18.04



Navigate to the following URL for **[NTP server installation and configuration in Linux][1]**.

I have installed and configured the NTP server on `CentOS7.2daygeek.com` so, append the same into all the client machines. Also, include the other required information on it.

The `chrony.conf` file will be placed in the different locations based on your distribution.

For RHEL based systems, it’s located at `/etc/chrony.conf`.

For Debian based systems, it’s located at `/etc/chrony/chrony.conf`.

```
# vi /etc/chrony/chrony.conf

server CentOS7.2daygeek.com prefer iburst
keyfile /etc/chrony/chrony.keys
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
maxupdateskew 100.0
makestep 1 3
cmdallow 192.168.1.0/24
```

Bounce the Chrony service once you update the configuration.

For sysvinit systems. For RHEL based system we need to run `chronyd` instead of chrony.

```
# service chrony restart

# chkconfig chrony on
```

For systemctl systems. For RHEL based system we need to run `chronyd` instead of chrony.

```
# systemctl restart chrony

# systemctl enable chrony
```

Use the following commands like tacking, sources and sourcestats to check chrony synchronization details.

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

The sourcestats command displays information about the drift rate and offset estimation process for each of the sources currently being examined by chronyd.

```
# chronyc sourcestats
210 Number of sources = 1
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
==============================================================================
CentOS7.2daygeek.com        5   3    71    -97.314     78.754   -469us   441us
```

When chronyd is configured as an NTP client or peer, you can have the transmit and receive timestamping modes and the interleaved mode reported for each NTP source by the chronyc ntpdata command.

```
# chronyc ntpdata

Remote address  : 192.168.1.5 (C0A80105)
Remote port     : 123
Local address   : 192.168.1.3 (C0A80103)
Leap status     : Normal
Version         : 4
Mode            : Server
Stratum         : 2
Poll interval   : 6 (64 seconds)
Precision       : -23 (0.000000119 seconds)
Root delay      : 0.108994 seconds
Root dispersion : 0.076523 seconds
Reference ID    : 85F3EEF4 ()
Reference time  : Thu Mar 28 06:43:35 2019
Offset          : +0.000160221 seconds
Peer delay      : 0.000664478 seconds
Peer dispersion : 0.000000178 seconds
Response time   : 0.000243252 seconds
Jitter asymmetry: +0.00
NTP tests       : 111 111 1111
Interleaved     : No
Authenticated   : No
TX timestamping : Kernel
RX timestamping : Kernel
Total TX        : 46
Total RX        : 46
Total valid RX  : 46
```

Finally run the `date` command.

```
# date
Thu Mar 28 03:08:11 CDT 2019
```

To step the system clock immediately, bypassing any adjustments in progress by slewing, issue the following command as root (To adjust the system clock manually).

```
# chronyc makestep
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
