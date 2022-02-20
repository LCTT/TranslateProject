[#]: subject: "Use different time zones on your Linux KDE desktop"
[#]: via: "https://opensource.com/article/22/2/use-different-time-zones-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use different time zones on your Linux KDE desktop
======
Scroll through timezones or add an extra clock to your KDE Plamsa
Desktop.
![Globe up in the clouds][1]

I used to marvel at people who required more than one clock, each set to an exotic timezone, on the wall. I saw it mostly in movies, so when I met someone in real life with lots of clocks, it made them seem particularly important, like the leader of a global spy network or a big banking syndicate. And yet lately, I find myself needing to be aware of at least three different timezones on a regular basis. It's not that I've become more important, it's just that the world has gotten smaller, thanks to technology and remote work.

Technology conveniently also makes it easy to have clocks set to different timezones, but the trick, I've found, is to have those clocks where you need them when you need the time. The KDE Plasma Desktop has a few simple solutions for this problem.

### Linux KDE date and time

By default, the clock on Plasma is located in the bottom right of the desktop, to the right of the system tray. Personally, I keep my kicker (that's what the panel's called) at the top of the screen, so my clock ends up at the top right of my screen. This being KDE, of course, you can move the clock to whatever location is most convenient for you.

To set the date and time, you can right-click on the clock and select **Digital Clock Settings**.

![KDE digital clock settings][2]

(Opensource.com [CC BY-SA 4.0][3])

In the **Digital Clock Settings** window that appears, select the **Time Zones** tab on the left. This displays a very long list of timezones, and you can have more than one selected. My home timezone is Auckland, but I also have UTC and New York selected as alternates.

![Time zones in KDE Settings][4]

(Opensource.com [CC BY-SA 4.0][3])

Significantly, there's an option at the bottom of this window labeled **Switch time zone with mouse wheel**. Click to enable it.

Click the **OK** button to save your changes.

### Switching time zones

Your desktop clock widget is now loaded with every timezone you've selected. Hover your mouse over the clock and use your scroll wheel to cycle through each timezone.

![Scroll with your mouse hovered over the clock to view a different timezone][5]

(Opensource.com [CC BY-SA 4.0][3])

### Adding a clock

Another way to keep track of multiple time zones is to add a new clock. The clock is just a Plasma widget, so you can add a second or third clock the same as you add any other widget to your kicker panel.

First, click on the "hamburger" menu on the right edge of the kicker.

![Modifying the KDE kicker][6]

(Opensource.com [CC BY-SA 4.0][3])

Click the **Add Widgets** button.

Scroll through the widget panel that appears on the left side of your desktop and find the **Digital Clock** widget. Drag and drop this widget to your kicker.

![Two clocks in KDE][7]

(Opensource.com [CC BY-SA 4.0][3])

Now you have all the times you need right where you can see them.

### Coordinating time with Linux KDE

Timezones are difficult to track, even when you have them a scroll wheel away. It's for that reason that many open source projects default to Universal Time Coordinated (UTC) when planning events and meetings with a global team. Speaking in UTC ensures that all participants, no matter where they are around the world, are tracking a common clock. If you're trying to get comfortable with UTC time, there's no better way to keep it at the front of your mind than adding it as one of your clocks in KDE, and referring to it as often as you refer to your local time. Take the time to set your clock correctly, and you'll thank yourself in the future if you're UTC-, and in the past, if you're UTC+. Enjoy!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/use-different-time-zones-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://opensource.com/sites/default/files/kde-digital-clock-settings.jpg (KDE digital clock settings)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/kde-time-zones.jpg (Time zones in KDE Settings)
[5]: https://opensource.com/sites/default/files/kde-clock-change.jpg (Scroll with your mouse hovered over the clock to view a different timezone)
[6]: https://opensource.com/sites/default/files/kde-kicker-modify.jpg (Modifying the KDE kicker)
[7]: https://opensource.com/sites/default/files/kde-two-clocks.jpg (Two clocks in KDE)
