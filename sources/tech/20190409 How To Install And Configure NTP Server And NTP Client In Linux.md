[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Configure NTP Server And NTP Client In Linux?)
[#]: via: (https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Install And Configure NTP Server And NTP Client In Linux?
======

You might heard this word many times and also you might had worked on this.

However, i will tell you clearly in this article about NTP Server setup and NTP Client setup

We will see about **[Chrony NTP Client setup][1]** later.

### What Is NTP Server?

NTP stands for Network Time Protocol.

It is a networking protocol that synchronize the clock between computer systems over the network.

In other hand I can say. It will keep the same time (It keep an accurate time) to all the systems which are connected to NTP server through NTP or Chrony client.

NTP can usually maintain time to within tens of milliseconds over the public Internet, and can achieve better than one millisecond accuracy in local area networks under ideal conditions.

It uses User Datagram Protocol (UDP) on port number 123 for send and receive timestamps. It’s a client/server application.

It send and receive timestamps using the User Datagram Protocol (UDP) on port number 123.

### What Is NTP Client?

NTP client will synchronize its clock to the network time server.

### What Is Chrony Client?

Chrony is replacement of NTP client. It can synchronize the system clock faster with better time accuracy and it can be particularly useful for the systems which are not online all the time.

### Why We Need NTP Server?

To keep all the servers in your organization in-sync with an accurate time to perform time based jobs.

To clarify this, I will tell you a scenario. Say for example, we have two servers (Server1 and Server2). The server1 usually complete the batch jobs at 10:55 then the server2 needs to run another job at 11:00 based on the server1 job completion report.

If both the system is using in a different time (if one system is ahead of the others, the others are behind that particular one) then we can’t perform this. To achieve this, we should setup NTP. Hope it cleared your doubts about NTP.

In this article, we are going to use the following setup to test this.

  * **`NTP Server:`** HostName: CentOS7.2daygeek.com, IP:192.168.1.8, OS:CentOS 7
  * **`NTP Client:`** HostName: Ubuntu18.2daygeek.com, IP:192.168.1.5, OS:Ubuntu 18.04



### NTP SERVER SIDE: How To Install NTP Server In Linux?

There is no different packages for NTP server and NTP client since it’s a client/server model. The NTP package is available in distribution official repository so, use the distribution package manger to install it.

For **`Fedora`** system, use **[DNF Command][2]** to install ntp.

```
$ sudo dnf install ntp
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install ntp.

```
$ sudo apt install ntp
```

For **`Arch Linux`** based systems, use **[Pacman Command][5]** to install ntp.

```
$ sudo pacman -S ntp
```

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install ntp.

```
$ sudo yum install ntp
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install ntp.

```
$ sudo zypper install ntp
```

### How To Configure The NTP Server In Linux?

Once you have installed the NTP package, make sure you have to uncomment the following configuration in the `/etc/ntp.conf` file on server side.

By default the NTP server configuration relies on `X.distribution_name.pool.ntp.org`. If you want you can use the default configuration or you can change it as per your location (country specific) by visiting <https://www.ntppool.org/zone/@> site.

Say for example. If you are in India then your NTP server will be `0.in.pool.ntp.org` and it will work for most of the countries.

```
# vi /etc/ntp.conf

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
server 0.asia.pool.ntp.org
server 1.asia.pool.ntp.org
server 2.asia.pool.ntp.org
server 3.asia.pool.ntp.org
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
driftfile /var/lib/ntp/drift
keys /etc/ntp/keys
```

We have allowed only `192.168.1.0/24` subnet clients to access the NTP server.

Since firewall is enabled by default on RHEL 7 based distributions so, allow the ntp server/service.

```
# firewall-cmd --add-service=ntp --permanent
# firewall-cmd --reload
```

Bounce the service once you update the configuration.

For sysvinit systems. For Debian based system we need to run `ntp` instead of ntpd.

```
# service ntpd restart

# chkconfig ntpd on
```

For systemctl systems. For Debian based system we need to run `ntp` instead of ntpd.

```
# systemctl restart ntpd

# systemctl enable ntpd
```

### NTP CLIENT SIDE: How To Install NTP Client On Linux?

As I mentioned earlier in this article. There is no specific package for NTP server and client. So, install the same package on client also.

For **`Fedora`** system, use **[DNF Command][2]** to install ntp.

```
$ sudo dnf install ntp
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install ntp.

```
$ sudo apt install ntp
```

For **`Arch Linux`** based systems, use **[Pacman Command][5]** to install ntp.

```
$ sudo pacman -S ntp
```

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install ntp.

```
$ sudo yum install ntp
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install ntp.

```
$ sudo zypper install ntp
```

I have installed and configured the NTP server on `CentOS7.2daygeek.com` so, append the same into all the client machines.

```
# vi /etc/ntp.conf

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
server CentOS7.2daygeek.com prefer iburst
driftfile /var/lib/ntp/drift
keys /etc/ntp/keys
```

Bounce the service once you update the configuration.

For sysvinit systems. For Debian based system we need to run `ntp` instead of ntpd.

```
# service ntpd restart

# chkconfig ntpd on
```

For systemctl systems. For Debian based system we need to run `ntp` instead of ntpd.

```
# systemctl restart ntpd

# systemctl enable ntpd
```

Wait for few minutes post restart of the NTP service to get synchronize time from the NTP server.

Run the following commands to verify the NTP server synchronization status on Linux.

```
# ntpq –p
Or
# ntpq -pn

     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*CentOS7.2daygee 133.243.238.163  2 u   14   64   37    0.686    0.151  16.432
```

Run the following command to get the current status of ntpd.

```
# ntpstat
synchronised to NTP server (192.168.1.8) at stratum 3
   time correct to within 508 ms
   polling server every 64 s
```

Finally run the `date` command.

```
# date
Tue Mar 26 23:17:05 CDT 2019
```

If you are observing a significant offset in the NTP output. Run the following command to sync clock manually from the NTP server. Make sure that your NTP client should be inactive state when you perform the command.

```
# ntpdate –uv CentOS7.2daygeek.com
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
