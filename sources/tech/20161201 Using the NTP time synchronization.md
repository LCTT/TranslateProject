GHLandy Translating

使用 NTP 进行时间同步
============================================================

NTP 是通过网络来同步时间的一种 TCP/IP 协议。通常客户端向服务器请求当前的时间，并根据结果来设置其时钟。

Behind this simple description, there is a lot of complexity - there are tiers of NTP servers, with the tier one NTP servers connected to atomic clocks, and tier two and three servers spreading the load of actually handling requests across the Internet. Also the client software is a lot more complex than you might think - it has to factor out communication delays, and adjust the time in a way that does not upset all the other processes that run on the server. But luckily all that complexity is hidden from you!

Ubuntu uses ntpdate and ntpd.

*   [timedatectl][4]
*   [timesyncd][5]
*   [ntpdate][6]
*   [timeservers][7]
*   [ntpd][8]
*   [安装][9]
*   [配置][10]
*   [View status][11]
*   [PPS Support][12]
*   [参考资料][13]

### timedatectl

In recent Ubuntu releases timedatectl replaces ntpdate. By default timedatectl syncs the time once on boot and later on uses socket activation to recheck once network connections become active.

If ntpdate / ntp is installed timedatectl steps back to let you keep your old setup. That shall ensure that no two time syncing services are fighting and also to retain any kind of old behaviour/config that you had through an upgrade. But it also implies that on an upgrade from a former release ntp/ntpdate might still be installed and therefore renders the new systemd based services disabled.

### timesyncd

In recent Ubuntu releases timesyncd replaces the client portion of ntpd. By default timesyncd regularly checks and keeps the time in sync. It also stores time updates locally, so that after reboots monotonically advances if applicable.

The current status of time and time configuration via timedatectl and timesyncd can be checked with timedatectl status.

```
timedatectl status
      Local time: Fri 2016-04-29 06:32:57 UTC
  Universal time: Fri 2016-04-29 06:32:57 UTC
        RTC time: Fri 2016-04-29 07:44:02
       Time zone: Etc/UTC (UTC, +0000)
 Network time on: yes
NTP synchronized: no
 RTC in local TZ: no
```

If NTP is installed and replaces the activity of timedatectl the line "NTP synchronized" is set to yes.

The nameserver to fetch time for timedatectl and timesyncd from can be specified in /etc/systemd/timesyncd.conf and with flexible additional config files in /etc/systemd/timesyncd.conf.d/.

### ntpdate

ntpdate is considered deprecated in favour of timedatectl and thereby no more installed by default. If installed it will run once at boot time to set up your time according to Ubuntu's NTP server. Later on anytime a new interface comes up it retries to update the time - while doing so it will try to slowly drift time as long as the delta it has to cover isn't too big. That behaviour can be controlled with the -B/-b switches.

```
ntpdate ntp.ubuntu.com
```

### timeservers

By default the systemd based tools request time information at ntp.ubuntu.com. In classic ntpd based service uses the pool of [0-3].ubuntu.pool.ntp.org Of the pool number 2.ubuntu.pool.ntp.org as well as ntp.ubuntu.com also support ipv6 if needed. If one needs to force ipv6 there also is ipv6.ntp.ubuntu.com which is not configured by default.

### ntpd

The ntp daemon ntpd calculates the drift of your system clock and continuously adjusts it, so there are no large corrections that could lead to inconsistent logs for instance. The cost is a little processing power and memory, but for a modern server this is negligible.

### 安装

To install ntpd, from a terminal prompt enter:

```
sudo apt install ntp
```

### 配置

Edit /etc/ntp.conf to add/remove server lines. By default these servers are configured:

```
# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.ubuntu.pool.ntp.org
server 1.ubuntu.pool.ntp.org
server 2.ubuntu.pool.ntp.org
server 3.ubuntu.pool.ntp.org
```

After changing the config file you have to reload the ntpd:

```
sudo systemctl reload ntp.service
```

### View status

Use ntpq to see more info:

```
# sudo ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
+stratum2-2.NTP. 129.70.130.70    2 u    5   64  377   68.461  -44.274 110.334
+ntp2.m-online.n 212.18.1.106     2 u    5   64  377   54.629  -27.318  78.882
*145.253.66.170  .DCFa.           1 u   10   64  377   83.607  -30.159  68.343
+stratum2-3.NTP. 129.70.130.70    2 u    5   64  357   68.795  -68.168 104.612
+europium.canoni 193.79.237.14    2 u   63   64  337   81.534  -67.968  92.792
```

### PPS Support

Since 16.04 ntp supports PPS discipline which can be used to augment ntp with local timesources for better accuracy. For more details on configuration see the external pps ressource listed below.

### 参考资料

*   See the [Ubuntu Time][1] wiki page for more information.

*   [ntp.org, home of the Network Time Protocol project][2]

*   [ntp.org faq on configuring PPS][3]

--------------------------------------------------------------------------------

via: https://help.ubuntu.com/lts/serverguide/NTP.html

作者：[Ubuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://help.ubuntu.com/lts/serverguide/NTP.html
[1]:https://help.ubuntu.com/community/UbuntuTime
[2]:http://www.ntp.org/
[3]:http://www.ntp.org/ntpfaq/NTP-s-config-adv.htm#S-CONFIG-ADV-PPS
[4]:https://help.ubuntu.com/lts/serverguide/NTP.html#timedatectl
[5]:https://help.ubuntu.com/lts/serverguide/NTP.html#timesyncd
[6]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntpdate
[7]:https://help.ubuntu.com/lts/serverguide/NTP.html#timeservers
[8]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntpd
[9]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntp-installation
[10]:https://help.ubuntu.com/lts/serverguide/NTP.html#timeservers-conf
[11]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntp-status
[12]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntp-pps
[13]:https://help.ubuntu.com/lts/serverguide/NTP.html#ntp-references
