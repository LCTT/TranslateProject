[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Set or Change Timezone in Ubuntu Linux [Beginner’s Tip])
[#]: via: (https://itsfoss.com/change-timezone-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Set or Change Timezone in Ubuntu Linux [Beginner’s Tip]
======

[When you install Ubuntu][1], it asks you to set timezone. If you chose a wrong timezone or if you have moved to some other part of the world, you can easily change it later.

### How to change Timezone in Ubuntu and other Linux distributions

There are two ways to change the timezone in Ubuntu. You can use the graphical settings or use the timedatectl command in the terminal. You may also change the /etc/timezone file directly but I won’t advise that.

I’ll show you both graphical and terminal way in this beginner’s tutorial:

  * [Change timezone in Ubuntu via GUI][2] (suitable for desktop users)
  * [Change timezone in Ubuntu via command line][3] (works for both desktop and servers)



![][4]

#### Method 1: Change Ubuntu timezone via terminal

[Ubuntu][5] or any other distributions using systemd can use the timedatectl command to set timezone in Linux terminal.

You can check the current date and timezone setting using timedatectl command without any option:

```
[email protected]:~$ timedatectl
                      Local time: Sat 2020-01-18 17:39:52 IST
                  Universal time: Sat 2020-01-18 12:09:52 UTC
                        RTC time: Sat 2020-01-18 12:09:52
                       Time zone: Asia/Kolkata (IST, +0530)
       System clock synchronized: yes
systemd-timesyncd.service active: yes
                 RTC in local TZ: no
```

As you can see in the output above, my system uses Asia/Kolkata. It also tells me that it is 5:30 hours ahead of GMT.

To set a timezone in Linux, you need to know the exact timezone. You must use the correct format of the timezone (which is Continent/City).

To get the timezone list, use the _list-timezones_ option of _timedatectl_ command:

```
timedatectl list-timezones
```

It will show you a huge list of the available time zones.

![Timezones List][6]

You can use the up and down arrow or PgUp and PgDown key to move between the pages.

You may also grep the output and search for your timezone. For example, if you are looking for time zones in Europe, you may use:

```
timedatectl list-timezones | grep -i europe
```

Let’s say you want to set the timezone to Paris. The timezone value to be used here is Europe/Paris:

```
timedatectl set-timezone Europe/Paris
```

It won’t show any success message but the timezone is changed instantly. You don’t need to restart or log out.

Keep in mind that though you don’t need to become root user and use sudo with the command but your account still need to have admin rights in order to change the timezone.

You can verify the changed time and timezone by using the [date command][7]:

```
[email protected]:~$ date
Sat Jan 18 13:56:26 CET 2020
```

#### Method 2: Change Ubuntu timezone via GUI

Press the super key (Windows key) and search for Settings:

![Applications Menu Settings][8]

Scroll down a little and look for Details in the left sidebar:

![Go to Settings -> Details][9]

In Details, you’ll fine Date &amp; Time in the left sidebar. Here, you should turn off Automatic Time Zone option (if it is enabled) and then click on the Time Zone:

![In Details -> Date & Time, turn off the Automatic Time Zone][10]

When you click the Time Zone, it will open an interactive map and you can click on the geographical location of your choice and close the window.

![Select a timezone][11]

You don’t have to do anything other than closing this map after selecting the new timezone. No need to logout or [shutdown Ubuntu][12].

I hope this quick tutorial helped you to change timezone in Ubuntu and other Linux distributions. If you have questions or suggestions, please let me know.

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-timezone-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: tmp.bHvVztzy6d#change-timezone-gui
[3]: tmp.bHvVztzy6d#change-timezone-command-line
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/Ubuntu_Change-_Time_Zone.png?ssl=1
[5]: https://ubuntu.com/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/timezones_in_ubuntu.jpg?ssl=1
[7]: https://linuxhandbook.com/date-command/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/settings_detail_ubuntu.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/change_timezone_in_ubuntu.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/change_timezone_in_ubuntu_2.jpg?ssl=1
[12]: https://itsfoss.com/schedule-shutdown-ubuntu/
