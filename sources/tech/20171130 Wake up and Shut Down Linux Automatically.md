
translating by HardworkFish

Wake up and Shut Down Linux Automatically
============================================================

### [banner.jpg][1]

![time keeper](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner.jpg?itok=zItspoSb)

Learn how to configure your Linux computers to watch the time for you, then wake up and shut down automatically.

[Creative Commons Attribution][6][The Observatory at Delhi][7]

Don't be a watt-waster. If your computers don't need to be on then shut them down. For convenience and nerd creds, you can configure your Linux computers to wake up and shut down automatically.

### Precious Uptimes

Some computers need to be on all the time, which is fine as long as it's not about satisfying an uptime compulsion. Some people are very proud of their lengthy uptimes, and now that we have kernel hot-patching that leaves only hardware failures requiring shutdowns. I think it's better to be practical. Save electricity as well as wear on your moving parts, and shut them down when they're not needed. For example, you can wake up a backup server at a scheduled time, run your backups, and then shut it down until it's time for the next backup. Or, you can configure your Internet gateway to be on only at certain times. Anything that doesn't need to be on all the time can be configured to turn on, do a job, and then shut down.

### Sleepies

For computers that don't need to be on all the time, good old cron will shut them down reliably. Use either root's cron, or /etc/crontab. This example creates a root cron job to shut down every night at 11:15 p.m.

```
# crontab -e -u root
# m h  dom mon dow   command
15 23 * * * /sbin/shutdown -h now
```

```
15 23 * * 1-5 /sbin/shutdown -h now
```

You may also use /etc/crontab, which is fast and easy, and everything is in one file. You have to specify the user:

```
15 23 * * 1-5 root shutdown -h now
```

Auto-wakeups are very cool; most of my SUSE colleagues are in Nuremberg, so I am crawling out of bed at 5 a.m. to have a few hours of overlap with their schedules. My work computer turns itself on at 5:30 a.m., and then all I have to do is drag my coffee and myself to my desk to start work. It might not seem like pressing a power button is a big deal, but at that time of day every little thing looms large.

Waking up your Linux PC can be less reliable than shutting it down, so you may want to try different methods. You can use wakeonlan, RTC wakeups, or your PC's BIOS to set scheduled wakeups. These all work because, when you power off your computer, it's not really all the way off; it is in an extremely low-power state and can receive and respond to signals. You need to use the power supply switch to turn it off completely.

### BIOS Wakeup

A BIOS wakeup is the most reliable. My system BIOS has an easy-to-use wakeup scheduler (Figure 1). Chances are yours does, too. Easy peasy.

### [fig-1.png][2]

![wake up](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-1_11.png?itok=8qAeqo1I)

Figure 1: My system BIOS has an easy-to-use wakeup scheduler.

[Used with permission][8]

### wakeonlan

wakeonlan is the next most reliable method. This requires sending a signal from a second computer to the computer you want to power on. You could use an Arduino or Raspberry Pi to send the wakeup signal, a Linux-based router, or any Linux PC. First, look in your system BIOS to see if wakeonlan is supported -- which it should be -- and then enable it, as it should be disabled by default.

Then, you'll need an Ethernet network adapter that supports wakeonlan; wireless adapters won't work. You'll need to verify that your Ethernet card supports wakeonlan:

```
# ethtool eth0 | grep -i wake-on
        Supports Wake-on: pumbg
        Wake-on: g
```

*   d -- all wake ups disabled

*   p -- wake up on physical activity

*   u -- wake up on unicast messages

*   m -- wake up on multicast messages

*   b -- wake up on broadcast messages

*   a -- wake up on ARP messages

*   g -- wake up on magic packet

*   s -- set the Secure On password for the magic packet

man ethtool is not clear on what the p switch does; it suggests that any signal will cause a wake up. In my testing, however, it doesn't do that. The one that must be enabled is g -- wake up on magic packet, and the Wake-on line shows that it is already enabled. If it is not enabled, you can use ethtool to enable it, using your own device name, of course:

```
# ethtool -s eth0 wol g
```

```
@reboot /usr/bin/ethtool -s eth0 wol g
```

### [fig-2.png][3]

![wakeonlan](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-2_7.png?itok=XQAwmHoQ)

Figure 2: Enable Wake on LAN.

[Used with permission][9]

Another option is recent Network Manager versions have a nice little checkbox to enable wakeonlan (Figure 2).

There is a field for setting a password, but if your network interface doesn't support the Secure On password, it won't work.

Now you need to configure a second PC to send the wakeup signal. You don't need root privileges, so create a cron job for your user. You need the MAC address of the network interface on the machine you're waking up:

```
30 08 * * * /usr/bin/wakeonlan D0:50:99:82:E7:2B 
```

Using the real-time clock for wakeups is the least reliable method. Check out [Wake Up Linux With an RTC Alarm Clock][4]; this is a bit outdated as most distros use systemd now. Come back next week to learn more about updated ways to use RTC wakeups.

Learn more about Linux through the free ["Introduction to Linux" ][5]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/wake-and-shut-down-linux-automatically

作者：[Carla Schroder]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.linux.com/files/images/bannerjpg
[2]:https://www.linux.com/files/images/fig-1png-11
[3]:https://www.linux.com/files/images/fig-2png-7
[4]:https://www.linux.com/learn/wake-linux-rtc-alarm-clock
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[6]:https://www.linux.com/licenses/category/creative-commons-attribution
[7]:http://www.columbia.edu/itc/mealac/pritchett/00routesdata/1700_1799/jaipur/delhijantarearly/delhijantarearly.html
[8]:https://www.linux.com/licenses/category/used-permission
[9]:https://www.linux.com/licenses/category/used-permission
