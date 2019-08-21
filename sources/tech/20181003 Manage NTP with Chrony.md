[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage NTP with Chrony)
[#]: via: (https://opensource.com/article/18/12/manage-ntp-chrony)
[#]: author: (David Both https://opensource.com/users/dboth)

Manage NTP with Chrony
======
Chronyd is a better choice for most networks than ntpd for keeping computers synchronized with the Network Time Protocol.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk)

> "Does anybody really know what time it is? Does anybody really care?"
>  – [Chicago][1], 1969

Perhaps that rock group didn't care what time it was, but our computers do need to know the exact time. Timekeeping is very important to computer networks. In banking, stock markets, and other financial businesses, transactions must be maintained in the proper order, and exact time sequences are critical for that. For sysadmins and DevOps professionals, it's easier to follow the trail of email through a series of servers or to determine the exact sequence of events using log files on geographically dispersed hosts when exact times are kept on the computers in question.

I used to work at an organization that received over 20 million emails per day and had four servers just to accept and do a basic filter on the incoming flood of email. From there, emails were sent to one of four other servers to perform more complex anti-spam assessments, then they were delivered to one of several additional servers where the emails were placed in the correct inboxes. At each layer, the emails would be sent to one of the next-level servers, selected only by the randomness of round-robin DNS. Sometimes we had to trace a new message through the system until we could determine where it "got lost," according to the pointy-haired bosses. We had to do this with frightening regularity.

Most of that email turned out to be spam. Some people actually complained that their [joke, cat pic, recipe, inspirational saying, or other-strange-email]-of-the-day was missing and asked us to find it. We did reject those opportunities.

Our email and other transactional searches were aided by log entries with timestamps that—today—can resolve down to the nanosecond in even the slowest of modern Linux computers. In very high-volume transaction environments, even a few microseconds of difference in the system clocks can mean sorting thousands of transactions to find the correct one(s).

### The NTP server hierarchy

Computers worldwide use the [Network Time Protocol][2] (NTP) to synchronize their times with internet standard reference clocks via a hierarchy of NTP servers. The primary servers are at stratum 1, and they are connected directly to various national time services at stratum 0 via satellite, radio, or even modems over phone lines. The time service at stratum 0 may be an atomic clock, a radio receiver tuned to the signals broadcast by an atomic clock, or a GPS receiver using the highly accurate clock signals broadcast by GPS satellites.

To prevent time requests from time servers lower in the hierarchy (i.e., with a higher stratum number) from overwhelming the primary reference servers, there are several thousand public NTP stratum 2 servers that are open and available for anyone to use. Many organizations with large numbers of hosts that need an NTP server will set up their own time servers so that only one local host accesses the stratum 2 time servers, then they configure the remaining network hosts to use the local time server which, in my case, is a stratum 3 server.

### NTP choices

The original NTP daemon, **ntpd** , has been joined by a newer one, **chronyd**. Both keep the local host's time synchronized with the time server. Both services are available, and I have seen nothing to indicate that this will change anytime soon.

Chrony has features that make it the better choice for most environments for the following reasons:

  * Chrony can synchronize to the time server much faster than NTP. This is good for laptops or desktops that don't run constantly.

  * It can compensate for fluctuating clock frequencies, such as when a host hibernates or enters sleep mode, or when the clock speed varies due to frequency stepping that slows clock speeds when loads are low.

  * It handles intermittent network connections and bandwidth saturation.

  * It adjusts for network delays and latency.

  * After the initial time sync, Chrony never steps the clock. This ensures stable and consistent time intervals for system services and applications.

  * Chrony can work even without a network connection. In this case, the local host or server can be updated manually.




The NTP and Chrony RPM packages are available from standard Fedora repositories. You can install both and switch between them, but modern Fedora, CentOS, and RHEL releases have moved from NTP to Chrony as their default time-keeping implementation. I have found that Chrony works well, provides a better interface for the sysadmin, presents much more information, and increases control.

Just to make it clear, NTP is a protocol that is implemented with either NTP or Chrony. If you'd like to know more, read this [comparison between NTP and Chrony][3] as implementations of the NTP protocol.

This article explains how to configure Chrony clients and servers on a Fedora host, but the configuration for CentOS and RHEL current releases works the same.

### Chrony structure

The Chrony daemon, **chronyd** , runs in the background and monitors the time and status of the time server specified in the **chrony.conf** file. If the local time needs to be adjusted, **chronyd** does it smoothly without the programmatic trauma that would occur if the clock were instantly reset to a new time.

Chrony's **chronyc** tool allows someone to monitor the current status of Chrony and make changes if necessary. The **chronyc** utility can be used as a command that accepts subcommands, or it can be used as an interactive text-mode program. This article will explain both uses.

### Client configuration

The NTP client configuration is simple and requires little or no intervention. The NTP server can be defined during the Linux installation or provided by the DHCP server at boot time. The default **/etc/chrony.conf** file (shown below in its entirety) requires no intervention to work properly as a client. For Fedora, Chrony uses the Fedora NTP pool, and CentOS and RHEL have their own NTP server pools. Like many Red Hat-based distributions, the configuration file is well commented.

```
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
pool 2.fedora.pool.ntp.org iburst

# Record the rate at which the system clock gains/losses time.
driftfile /var/lib/chrony/drift

# Allow the system clock to be stepped in the first three updates
# if its offset is larger than 1 second.
makestep 1.0 3

# Enable kernel synchronization of the real-time clock (RTC).


# Enable hardware timestamping on all interfaces that support it.
#hwtimestamp *

# Increase the minimum number of selectable sources required to adjust
# the system clock.
#minsources 2

# Allow NTP client access from local network.
#allow 192.168.0.0/16

# Serve time even if not synchronized to a time source.
#local stratum 10

# Specify file containing keys for NTP authentication.
keyfile /etc/chrony.keys

# Get TAI-UTC offset and leap seconds from the system tz database.
leapsectz right/UTC

# Specify directory for log files.
logdir /var/log/chrony

# Select which information is logged.
#log measurements statistics tracking
```

Let's look at the current status of NTP on a virtual machine I use for testing. The **chronyc** command, when used with the **tracking** subcommand, provides statistics that report how far off the local system is from the reference server.

```
[root@studentvm1 ~]# chronyc tracking
Reference ID    : 23ABED4D (ec2-35-171-237-77.compute-1.amazonaws.com)
Stratum         : 3
Ref time (UTC)  : Fri Nov 16 16:21:30 2018
System time     : 0.000645622 seconds slow of NTP time
Last offset     : -0.000308577 seconds
RMS offset      : 0.000786140 seconds
Frequency       : 0.147 ppm slow
Residual freq   : -0.073 ppm
Skew            : 0.062 ppm
Root delay      : 0.041452706 seconds
Root dispersion : 0.022665167 seconds
Update interval : 1044.2 seconds
Leap status     : Normal
[root@studentvm1 ~]#
```

The Reference ID in the first line of the result is the server the host is synchronized to—in this case, a stratum 3 reference server that was last contacted by the host at 16:21:30 2018. The other lines are described in the [chronyc(1) man page][4].

The **sources** subcommand is also useful because it provides information about the time source configured in **chrony.conf**.

```
[root@studentvm1 ~]# chronyc sources
210 Number of sources = 5
MS Name/IP address         Stratum Poll Reach LastRx Last sample              
===============================================================================
^+ 192.168.0.51                  3   6   377     0  -2613us[-2613us] +/-   63ms
^+ dev.smatwebdesign.com         3  10   377   28m  -2961us[-3534us] +/-  113ms
^+ propjet.latt.net              2  10   377   465  -1097us[-1085us] +/-   77ms
^* ec2-35-171-237-77.comput>     2  10   377    83  +2388us[+2395us] +/-   95ms
^+ PBX.cytranet.net              3  10   377   507  -1602us[-1589us] +/-   96ms
[root@studentvm1 ~]#
```

The first source in the list is the time server I set up for my personal network. The others were provided by the pool. Even though my NTP server doesn't appear in the Chrony configuration file above, my DHCP server provides its IP address for the NTP server. The "S" column—Source State—indicates with an asterisk ( ***** ) the server our host is synced to. This is consistent with the data from the **tracking** subcommand.

The **-v** option provides a nice description of the fields in this output.

```
[root@studentvm1 ~]# chronyc sources -v
210 Number of sources = 5

  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.
 / .- Source state '*' = current synced, '+' = combined , '-' = not combined,
| /   '?' = unreachable, 'x' = time may be in error, '~' = time too variable.
||                                                 .- xxxx [ yyyy ] +/- zzzz
||      Reachability register (octal) -.           |  xxxx = adjusted offset,
||      Log2(Polling interval) --.      |          |  yyyy = measured offset,
||                                \     |          |  zzzz = estimated error.
||                                 |    |           \
MS Name/IP address         Stratum Poll Reach LastRx Last sample              
===============================================================================
^+ 192.168.0.51                  3   7   377    28  -2156us[-2156us] +/-   63ms
^+ triton.ellipse.net            2  10   377    24  +5716us[+5716us] +/-   62ms
^+ lithium.constant.com          2  10   377   351   -820us[ -820us] +/-   64ms
^* t2.time.bf1.yahoo.com         2  10   377   453   -992us[ -965us] +/-   46ms
^- ntp.idealab.com               2  10   377   799  +3653us[+3674us] +/-   87ms
[root@studentvm1 ~]#
```

If I wanted my server to be the preferred reference time source for this host, I would add the line below to the **/etc/chrony.conf** file.

```
server 192.168.0.51 iburst prefer
```

I usually place this line just above the first pool server statement near the top of the file. There is no special reason for this, except I like to keep the server statements together. It would work just as well at the bottom of the file, and I have done that on several hosts. This configuration file is not sequence-sensitive.

The **prefer** option marks this as the preferred reference source. As such, this host will always be synchronized with this reference source (as long as it is available). We can also use the fully qualified hostname for a remote reference server or the hostname only (without the domain name) for a local reference time source as long as the search statement is set in the **/etc/resolv.conf** file. I prefer the IP address to ensure that the time source is accessible even if DNS is not working. In most environments, the server name is probably the better option, because NTP will continue to work even if the server's IP address changes.

If you don't have a specific reference source you want to synchronize to, it is fine to use the defaults.

### Configuring an NTP server with Chrony

The nice thing about the Chrony configuration file is that this single file configures the host as both a client and a server. To add a server function to our host—it will always be a client, obtaining its time from a reference server—we just need to make a couple of changes to the Chrony configuration, then configure the host's firewall to accept NTP requests.

Open the **/etc/ ** **chrony****.conf** file in your favorite text editor and uncomment the **local stratum 10** line. This enables the Chrony NTP server to continue to act as if it were connected to a remote reference server if the internet connection fails; this enables the host to continue to be an NTP server to other hosts on the local network.

Let's restart **chronyd** and track how the service is working for a few minutes. Before we enable our host as an NTP server, we want to test a bit.

```
[root@studentvm1 ~]# systemctl restart chronyd ; watch chronyc tracking
```

The results should look like this. The **watch** command runs the **chronyc tracking** command every two seconds so we can watch changes occur over time.

```
Every 2.0s: chronyc tracking                                           studentvm1: Fri Nov 16 20:59:31 2018

Reference ID    : C0A80033 (192.168.0.51)
Stratum         : 4
Ref time (UTC)  : Sat Nov 17 01:58:51 2018
System time     : 0.001598277 seconds fast of NTP time
Last offset     : +0.001791533 seconds
RMS offset      : 0.001791533 seconds
Frequency       : 0.546 ppm slow
Residual freq   : -0.175 ppm
Skew            : 0.168 ppm
Root delay      : 0.094823152 seconds
Root dispersion : 0.021242738 seconds
Update interval : 65.0 seconds
Leap status     : Normal
```

Notice that my NTP server, the **studentvm1** host, synchronizes to the host at 192.168.0.51, which is my internal network NTP server, at stratum 4. Synchronizing directly to the Fedora pool machines would result in synchronization at stratum 3. Notice also that the amount of error decreases over time. Eventually, it should stabilize with a tiny variation around a fairly small range of error. The size of the error depends upon the stratum and other network factors. After a few minutes, use Ctrl+C to break out of the watch loop.

To turn our host into an NTP server, we need to allow it to listen on the local network. Uncomment the following line to allow hosts on the local network to access our NTP server.

```
# Allow NTP client access from local network.
allow 192.168.0.0/16
```

Note that the server can listen for requests on any local network it's attached to. The IP address in the "allow" line is just intended for illustrative purposes. Be sure to change the IP network and subnet mask in that line to match your local network's.

Restart **chronyd**.

```
[root@studentvm1 ~]# systemctl restart chronyd
```

To allow other hosts on your network to access this server, configure the firewall to allow inbound UDP packets on port 123. Check your firewall's documentation to find out how to do that.

### Testing

Your host is now an NTP server. You can test it with another host or a VM that has access to the network on which the NTP server is listening. Configure the client to use the new NTP server as the preferred server in the **/etc/chrony.conf** file, then monitor that client using the **chronyc** tools we used above.

### Chronyc as an interactive tool

As I mentioned earlier, **chronyc** can be used as an interactive command tool. Simply run the command without a subcommand and you get a **chronyc** command prompt.

```
[root@studentvm1 ~]# chronyc
chrony version 3.4
Copyright (C) 1997-2003, 2007, 2009-2018 Richard P. Curnow and others
chrony comes with ABSOLUTELY NO WARRANTY.  This is free software, and
you are welcome to redistribute it under certain conditions.  See the
GNU General Public License version 2 for details.

chronyc>
```

You can enter just the subcommands at this prompt. Try using the **tracking** , **ntpdata** , and **sources** commands. The **chronyc** command line allows command recall and editing for **chronyc** subcommands. You can use the **help** subcommand to get a list of possible commands and their syntax.

### Conclusion

Chrony is a powerful tool for synchronizing the times of client hosts, whether they are all on the local network or scattered around the globe. It's easy to configure because, despite the large number of options available, only a few configurations are required for most circumstances.

After my client computers have synchronized with the NTP server, I like to set the system hardware clock from the system (OS) time by using the following command:

```
/sbin/hwclock --systohc
```

This command can be added as a cron job or a script in **cron.daily** to keep the hardware clock synced with the system time.

Chrony and NTP (the service) both use the same configuration, and the files' contents are interchangeable. The man pages for [chronyd][5], [chronyc][4], and [chrony.conf][6] contain an amazing amount of information that can help you get started or learn about esoteric configuration options.

Do you run your own NTP server? Let us know in the comments and be sure to tell us which implementation you are using, NTP or Chrony.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/manage-ntp-chrony

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Does_Anybody_Really_Know_What_Time_It_Is%3F
[2]: https://en.wikipedia.org/wiki/Network_Time_Protocol
[3]: https://chrony.tuxfamily.org/comparison.html
[4]: https://linux.die.net/man/1/chronyc
[5]: https://linux.die.net/man/8/chronyd
[6]: https://linux.die.net/man/5/chrony.conf
