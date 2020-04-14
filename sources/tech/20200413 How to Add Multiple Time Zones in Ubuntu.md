[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Multiple Time Zones in Ubuntu)
[#]: via: (https://itsfoss.com/add-multiple-time-zones-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Add Multiple Time Zones in Ubuntu
======

_**This quick tutorial shows the steps for adding additional clocks for multiple time zones in Ubuntu and other distributions using GNOME desktop environment.**_

If you have family members or colleagues in another country or if you live in a country with multiple time zones, keeping a track of the time difference becomes important. After all, you don’t want to disturb someone by calling at 4’o clock in the morning.

Some Linux users also keep a tab on the [UTC time][1] because an overwhelming majority of servers use UTC.

Situations like these can be managed better if you have multiple clocks. You can set one clock to your local time and sync other clock(s) to other time zone(s). It makes keep an eye on the different times easier.

In this quick tutorial, I’ll show you how to add additional clocks in Ubuntu and other Linux distributions that use GNOME desktop environment.

### Adding multiple time zone clocks in Ubuntu (and other Linux using GNOME)

Please [check which desktop environment you are using][2]. This tutorial is suitable for GNOME desktop only.

To add additional clocks, you can use a nifty little app unsurprisingly called [GNOME Clocks][3].

GNOME Clocks is a simple application that shows the time and date in multiple locations. You can also use it to set alarms or timers. Stopwatch feature is also included.

GNOME Clocks is available in the universe repository in Ubuntu. So please make sure to [enable universe repository][4] first.

You can search for GNOME Clocks in Software Center and install it from there.

![Gnome Clocks Ubuntu Software Center][5]

Alternatively, you can open a terminal and use the following command to install GNOME Clocks:

```
sudo apt install gnome-clocks
```

If you are using some other Linux distribution, please use your distribution’s software center or package manager to install this application.

Once you have installed it, search for it by pressing the super key (Windows key) and typing clocks:

![Gnome Clocks App Search Ubuntu][6]

Start the application and you should see an interface that provides you a few options like adding world clock, setting alarms, use stopwatch and timer.

Click on the + sign in the top left corner it will give you an option to search for a geographical location. Search it, select it and add it.

![Adding additional clocks][7]

Once you have added the required time zone(s) via its geographical location, you can see that this new clock is now added in the message try. It also shows the time difference between your local time and other time zones.

![Multiple clocks for multiple time zones][8]

You can use Super + M keys to quickly open the message tray. There are some more [useful Ubuntu shortcuts][9] you may master and save your time.

If you want to remove the additional clocks, you can do that from the GNOME Clocks application interface:

![Remove Additional Clocks][10]

You cannot delete your current time zone and set it to something else. There are other ways [to change your current time zone in Linux][11].

I hope you liked this quick tip. Questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-multiple-time-zones-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Coordinated_Universal_Time
[2]: https://itsfoss.com/find-desktop-environment/
[3]: https://wiki.gnome.org/Apps/Clocks
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-clocks-ubuntu-software-center.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-clocks-app-search-ubuntu.jpg?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/add-multiple-time-zones-gnome.jpg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/multiple-clocks-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/remove-additional-clocks-ubuntu.jpg?ssl=1
[11]: https://itsfoss.com/change-timezone-ubuntu/
