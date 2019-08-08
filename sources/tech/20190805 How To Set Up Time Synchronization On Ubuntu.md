[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Set Up Time Synchronization On Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-set-up-time-synchronization-on-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Set Up Time Synchronization On Ubuntu
======

![Set Up Time Synchronization On Ubuntu][1]

You might have set up [**cron jobs**][2] that runs at a specific time to backup important files or perform any system related tasks. Or, you might have configured a [**log server to rotate the logs**][3] out of your system at regular interval time. If your clock is out-of-sync, these jobs will not execute at the desired time. This is why setting up a correct time zone on the Linux systems and keep the clock synchronized with Internet is important. This guide describes how to set up time synchronization on Ubuntu Linux. The steps given below have been tested on Ubuntu 18.04, however they are same for other Ubuntu-based systems that uses systemd’s **timesyncd** service.

### Set Up Time Synchronization On Ubuntu

Usually, we set time zone during installation. You can however change it or set different time zone if you want to.

First, let us see the current time zone in our Ubuntu system using “date” command:

```
$ date
```

Sample output:

```
Tue Jul 30 11:47:39 UTC 2019
```

As you see in the above output, the “date” command shows the actual date as well as the current time. Here, my current time zone is **UTC** which stands for **Coordinated Universal Time**.

Alternatively, you can look up the **/etc/timezone** file to find the current time zone.

```
$ cat /etc/timezone
UTC
```

Now, let us see if the clock is synchronized with Internet. To do so, simply run:

```
$ timedatectl
```

Sample output:

```
Local time: Tue 2019-07-30 11:53:58 UTC
Universal time: Tue 2019-07-30 11:53:58 UTC
RTC time: Tue 2019-07-30 11:53:59
Time zone: Etc/UTC (UTC, +0000)
System clock synchronized: yes
systemd-timesyncd.service active: yes
RTC in local TZ: no
```

As you can see, the “timedatectl” command displays the local time, universal time, time zone and whether the system clock is synchronized with Internet servers and if the **systemd-timesyncd.service** is active or inactive. In my case, the system clock is synchronizing with Internet time servers.

If the clock is out-of-sync, you would see **“System clock synchronized: no”** as shown in the below screenshot.

![][4]

Time synchronization is disabled.

Note: The above screenshot is old one. That’s why you see the different date.

If you see **“System clock synchronized:** value set as **no** , the timesyncd service might be inactive. So, simply restart the service and see if it helps.

```
$ sudo systemctl restart systemd-timesyncd.service
```

Now check the timesyncd service status:

```
$ sudo systemctl status systemd-timesyncd.service
● systemd-timesyncd.service - Network Time Synchronization
Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service; enabled; vendor preset: enabled)
Active: active (running) since Tue 2019-07-30 10:50:18 UTC; 1h 11min ago
Docs: man:systemd-timesyncd.service(8)
Main PID: 498 (systemd-timesyn)
Status: "Synchronized to time server [2001:67c:1560:8003::c7]:123 (ntp.ubuntu.com)."
Tasks: 2 (limit: 2319)
CGroup: /system.slice/systemd-timesyncd.service
└─498 /lib/systemd/systemd-timesyncd

Jul 30 10:50:30 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:31 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:31 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:32 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:32 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:35 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:35 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:35 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:50:35 ubuntuserver systemd-timesyncd[498]: Network configuration changed, trying to estab
Jul 30 10:51:06 ubuntuserver systemd-timesyncd[498]: Synchronized to time server [2001:67c:1560:800
```

If this service is enabled and active, your system clock should sync with Internet time servers.

You can verify if the time synchronization is enabled or not using command:

```
$ timedatectl
```

If it still not works, run the following command to enable the time synchronization:

```
$ sudo timedatectl set-ntp true
```

Now your system clock will synchronize with Internet time servers.

##### Change time zone using Timedatectl command

What if I want to use different time zone other than UTC? It is easy!

First, list of available time zones using command:

```
$ timedatectl list-timezones
```

You will see an output similar to below image.

![][5]

List time zones using timedatectl command

You can set the desired time zone(E.g. Asia/Kolkata) using command:

```
$ sudo timedatectl set-timezone Asia/Kolkata
```

Check again if the time zone has been really changed using “date” command:

**$ date**
Tue Jul 30 17:52:33 **IST** 2019

Or, use timedatectl command if you want the detailed output:

```
$ timedatectl
Local time: Tue 2019-07-30 17:52:35 IST
Universal time: Tue 2019-07-30 12:22:35 UTC
RTC time: Tue 2019-07-30 12:22:36
Time zone: Asia/Kolkata (IST, +0530)
System clock synchronized: yes
systemd-timesyncd.service active: yes
RTC in local TZ: no
```

As you noticed, I have changed the time zone from UTC to IST (Indian standard time).

To switch back to UTC time zone, simply run:

```
$ sudo timedatectl set-timezone UTC
```

##### Change time zone using Tzdata

In older Ubuntu versions, the Timedatectl command is not available. In such cases, you can use **Tzdata** (Time zone data) to set up time synchronization.

```
$ sudo dpkg-reconfigure tzdata
```

Choose the geographic area in which you live. In my case, I chose **Asia**. Select OK and hit ENTER key.

![][6]

Next, select the city or region corresponding to your time zone. Here I’ve chosen **Kolkata**.

![][7]

Finally, you will see an output something like below in the Terminal.

```
Current default time zone: 'Asia/Kolkata'
Local time is now: Tue Jul 30 19:29:25 IST 2019.
Universal Time is now: Tue Jul 30 13:59:25 UTC 2019.
```

##### Configure time zone in graphical mode

Some users may not be comfortable with CLI way. If you’re one of them, you can easily change do all this from system settings panel in graphical mode.

Hit the **Super key** (Windows key), type **settings** in the Ubuntu dash and click on **Settings** icon.

![][8]

Launch System’s settings from Ubuntu dash

Alternatively, click on the down arrow located at the top right corner of your Ubuntu desktop and click the Settings icon in the left corner.

![][9]

Launch System’s settings from top panel

In the next window, choose **Details** and then Click **Date & Time** option. Turn on both **Automatic Date & Time** and **Automatic Time Zone** options.

![][10]

Set automatic time zone in Ubuntu

Close the Settings window an you’re done! Your system clock should now sync with Internet time servers.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-set-up-time-synchronization-on-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Set-Up-Time-Synchronization-On-Ubuntu-720x340.png
[2]: https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/
[3]: https://www.ostechnix.com/manage-log-files-using-logrotate-linux/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/timedatectl-command-output-ubuntu.jpeg
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/List-timezones-using-timedatectl-command.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/configure-time-zone-using-tzdata-1.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/07/configure-time-zone-using-tzdata-2.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/07/System-settings-Ubuntu-dash.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/07/Ubuntu-system-settings.png
[10]: https://www.ostechnix.com/wp-content/uploads/2019/07/Set-automatic-timezone-in-ubuntu.png
