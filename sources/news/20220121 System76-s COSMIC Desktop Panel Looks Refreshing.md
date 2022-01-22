[#]: subject: "System76’s COSMIC Desktop Panel Looks Refreshing!"
[#]: via: "https://news.itsfoss.com/system76-cosmic-panel/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

System76’s COSMIC Desktop Panel Looks Refreshing!
======

The development work for System76’s exciting new Rust-based COSMIC desktop is now underway.

While [we already tried it out][1] using the early code available, we get to see more of it now. Thanks to some prototypes available in its [GitHub repository][2] and a [Figma document][3], we get to see more of it!

Notably, we get to see the top panel and the system tray as you would expect in the COSMIC desktop.

It is still a work in progress and is subject to change.

### Top Panel in COSMIC Desktop

Pop!_OS relies on GNOME extensions to offer more functionalities through the top panel or the system tray icons.

With the upcoming Rust-based COSMIC desktop, it looks like they’re creating new applets that blend in with the current look and offer more functionality out of the box.

Eduardo Flores, a developer, [breaks it down][4] to learn the key differences and how System76 aims to make it work.

And, this is what makes it more interesting:

> Looks like System76 is moving away from the traditional “extensions” and plans to design an API for third party applets, this is similar to what KDE, XFCE and others are doing.
>
> This is exciting news, this will make COSMIC a much more powerful desktop environment, making it extendable and customizable.

Also, it seems that these applets can also be placed in the dock along with the top panel. We’ll have to see more of it in action in one of its future beta releases.

Here, let me highlight the fundamental changes observed from the mockups available:

#### 1\. Sound Applet

![Rust-based COSMIC Desktop \(Sound Applet\)][5]

Compared to what we have now, COSMIC aims to add granular controls like selecting Input/Output devices, option to toggle media controls on the top panel, control playing media, and access the sound settings.

While the mockup doesn’t show album art, it will include it down the road before release.

For reference, here’s what the Pop!_OS top panel options look like now:

![Pop!_OS 21.10 \(COSMIC, GNOME-based\)][6]

#### 2\. Power Applet

![][7]

It is good to see a dedicated power button to quickly access system settings, lock screen, and log out.

Also, the buttons for suspending, restart, and shut down should improve usability, eliminating any extra clicks to shut down the computer.

#### 3\. Network Applet

While you can easily turn on/off the Wired/Wireless networks, a separate window pops up to select Wi-Fi network and enter the password taking up the entire screen.

![][8]

But, it looks like we can finally type in the password, connect to available wireless networks, and retry the failed connection without getting distracted from the active window. All that happens from the network applet on the system tray, as shown in the screenshot above.

Similarly, you get to see more information about your wired connection, including the IP address and speed.

#### 4\. Date, Time, and Calendar Applet

![][9]

The most important calendar applet looks much more functional and informative. The notification area no longer resides here (considering it has a separate applet now), making it a cleaner experience to focus on what you want here.

Several subtle visual enhancements like accent color to highlight a row in the calendar should make it easy to understand.

#### 5\. Notifications Center

![][10]

As I mentioned earlier, notifications now have a separate space. The notification applet will stack up all notifications and allow you to expand them if needed or clear them all.

We still have the Do Not Disturb toggle and quick access to notification settings.

#### 6\. Graphics Mode Applet

![][11]

This should be incredibly useful for laptop users, making it seamless to switch between graphics and keep an eye on what’s active.

In addition to all these, a Bluetooth applet, a battery power mode applet, and a few more things like the ability to change input language or input source.

![][12]

![][13]

Given this is the first look for the top-panel of Rust-based COSMIC desktop, it looks like we have a lot to go through!

### Closing Thoughts

Overall, System76 is gearing up to give us a highly customizable yet simplified version of the COSMIC desktop.

And all of that should contribute to a unique desktop experience. Of course, you will have to say goodbye to GNOME next year.

What do you think? Let me know your thoughts in the comments below!

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/system76-cosmic-panel/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/system76-rust-cosmic-desktop/
[2]: https://github.com/pop-os/cosmic-panel/issues
[3]: https://www.figma.com/proto/ZeGTqzAM7dVZgjEW3uhxcd/Top-panel?node-id=559%3A11100&scaling=scale-down&page-id=559%3A11099&starting-point-node-id=559%3A11100&show-proto-sidebar=1
[4]: https://blog.edfloreshz.dev/articles/linux/system76/cosmic-panel/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcwMiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ3MCIgd2lkdGg9IjU5OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijk3NiIgd2lkdGg9Ijc2OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[10]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijg1NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYzMiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[12]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgyMCIgd2lkdGg9IjU5OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[13]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY1MiIgd2lkdGg9IjY3OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
