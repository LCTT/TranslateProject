[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Track Your Screen Time in Linux with ActivityWatch)
[#]: via: (https://itsfoss.com/activitywatch/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Track Your Screen Time in Linux with ActivityWatch
======

_**Brief: ActivityWatch is an open-source privacy-friendly app that tracks how you spend your time on a desktop computer or on a mobile device.**_

### ActivityWatch: An open-source app to track how much time you spend on which application

![ActivityWatch lets you check the time spent on various applications][1]

[ActivityWatch][2] is a cross-platform open-source app that helps you track time to gauge your productivity. It lets you track the time you spent on applications, browsers, and if you were AFK (away from keyboard) or the system was hibernating.

Not just limited to tracking time, but it offers a bunch of useful features with visualizations that help you easily analyze how you spent time to potentially improve your productivity.

![][3]

It’s a great alternative to proprietary options like [RescueTime][4] and [ManicTime][5].

ActivityWatch is available for Linux, Windows, macOS and [Android][6]. It also offers browser extensions for both Chrome and Firefox. As of now, there’s no app available for iOS on the App Store.

![][7]

It’s fairly new to the scene and is being actively developed to address any existing issues and introduce new features like the ability to sync your activity data across multiple devices.

_**For privacy-focused users, I should mention that the data collected is stored locally on your device. That’s a good thing as you can track your spent time without being tracked by someone else.**_

### Features of ActivityWatch

![][8]

Basically, ActivityWatch lets you monitor your activity to analyze bad screen time or improve the time management for what you do on your device.

To break it down, it offers several useful options that I’d like to highlight here:

  * Summary of your daily activity with apps/programs sorted as per the time spent using it.
  * Track the time of your browser activity using the extension to get the exact data on time spent on every active tab.
  * Tracks AFK and not-AFK time. (AFK — abbreviation for “Away From Keyboard” i.e. you’re not in front of your computer)
  * Offers different visualizations of timelines to monitor your activity
  * Ability to track the time you spend writing code on an editor using [watchers][9].
  * History of your activity to analyze your productivity
  * Categorize the time spent to help you analyze in detail
  * Lets you add more categories and tweak the duration of timeline.
  * Ability to export/import your data as [JSON][10] file.
  * Experimental stopwatch feature
  * Stores data locally to respect user privacy.



### Installing ActivityWatch on Linux

_**Note:** If your Linux distribution does not support system tray icons, you will have to follow the [documentation][11] for a workaround._

Unfortunately, you won’t find an AppImage, Flatpak or Snap for it.

However, you do get an [AUR][12] package to install for Manjaro or Arch Linux.

For all other Linux distributions, you get a ZIP file which includes an **aw-qt** application to run.

To do that, you have to [extract the zip archive file][13] and then run the binary to install it by double-clicking on the aw-qt application.

![Aw Qt][14]

You can also use the terminal as follows:

```
cd activitywatch-v0.9.2-linux-x86_64
sudo ./aw-qt
```

The location and filename of the extracted folder might differ – so make sure you navigate to the correct directory and then use the commands above. Once done, you can access ActivityWatch from the system tray icon or simply head to [localhost:5600][15] to access it.

You can also check out their [GitHub page][16] or the [official website][2] to explore more about it.

[Download ActivityWatch][2]

Just for your information, if you plan on using ActivityWatch regularly, you should move the downloaded files to the /opt directory and create a link to aw-qt executable in /usr/share/bin directory. This way, the application will be available as a regular command for all the users on the system. A similar method has been demonstrated in the [PopcornTime installation tutorial][17].

### My Thoughts On ActivityWatch

![][18]

The time tracking works perfectly fine on [Pop!_OS 20.04][19] with the system tray icon support. You might encounter a bug that doesn’t let you access ActivityWatch from your system tray icon (which is also a [known issue on GitHub][20]). In that case, you need to access it through [localhost:5600][15].

Personally, I’m quite satisfied with the features offered considering that I use it on my desktop and have no plans to use it on my smartphone.

I’d definitely recommend you try this nice open-source project and support them along the way. If you like the project, feel free to show your appreciation by adding a star or sponsoring [their GitHub repository][21].

Feel free to let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/activitywatch/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch.png?fit=800%2C607&ssl=1
[2]: https://activitywatch.net/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-afk.jpg?ssl=1
[4]: https://itsfoss.com/recommends/rescuetime/
[5]: https://www.manictime.com/
[6]: https://play.google.com/store/apps/details?id=net.activitywatch.android
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-timeline.jpg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-settings.jpg?ssl=1
[9]: https://docs.activitywatch.net/en/latest/watchers.html
[10]: https://en.wikipedia.org/wiki/JSON
[11]: https://docs.activitywatch.net/en/latest/getting-started.html
[12]: https://aur.archlinux.org/packages/activitywatch-bin/
[13]: https://itsfoss.com/unzip-linux/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/aw-qt.jpg?ssl=1
[15]: https://itsfoss.com/activitywatch/5600
[16]: https://github.com/ActivityWatch
[17]: https://itsfoss.com/popcorn-time-ubuntu-linux/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-screenshot.jpg?ssl=1
[19]: https://itsfoss.com/pop-os-20-04-review/
[20]: https://github.com/ActivityWatch/activitywatch/issues/208
[21]: https://github.com/ActivityWatch/activitywatch
