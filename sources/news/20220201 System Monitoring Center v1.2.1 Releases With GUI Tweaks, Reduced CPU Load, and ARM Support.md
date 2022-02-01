[#]: subject: "System Monitoring Center v1.2.1 Releases With GUI Tweaks, Reduced CPU Load, and ARM Support"
[#]: via: "https://news.itsfoss.com/system-monitoring-center-stable/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

System Monitoring Center v1.2.1 Releases With GUI Tweaks, Reduced CPU Load, and ARM Support
======

Last year, we featured [System Monitoring Center][1] as one of our app highlights.

It is an all-in-one open-source app that helps you monitor essential system resources at a glance. You would also get plenty of details that you miss with the default system monitoring app in your Linux distribution.

At the time of covering it, the app was in the beta phase. However, it is finally out of data with its newest v1.2.1 release!

Let me highlight the new features along with some screenshots.

### System Monitoring Center v1.2.1: What’s New?

![][2]

The visual tweaks can be easily noticed but don’t affect the overall experience. It aims to provide a simple user interface, making it easy to navigate for anyone.

A few options were moved to the left sidebar to focus on the primary functions to monitor performance, processes, users, startup programs, services, and the system.

A range of minor improvements contributes to its latest release. Some highlights include:

### Disk Details Under Disk Tab

![][3]

You can now find the details for your disks under the “Disk” tab from the left sidebar. By default, you see the summary / basic information, and you can click on the “Show” button to expand the details as shown in the screenshot above.

### Tab Switch Appearance

The tabs present to group all the options like processes, and users received a change in its UI. The older design included more options and wasn’t as clean, and you can already notice how clean it is in the screenshots above.

Here’s an older screenshot for reference:

![][4]

### Added Support for ARM Devices

The support for ARM devices would enable you to use the system monitoring app for various use-cases.

It is good to see more applications and services adding ARM support.

### More Information

![][5]

Overall, the latest stable update provides you with additional information. For instance, the support for voltage and current sensors was added to the app, making the data much more valuable to advanced users monitoring their systems.

The information for exhaust fans is still something to be added, considering the developer does not have a desktop PC to test it.

I tested it out but did not find any data for the fans. And, even when using [GNOME’s Vitals shell extension][6], I get no fan data. So, I’m not sure what it takes to read the fan data on Linux.

In any case, the data for CPU temperature and SSD should also help.

You also get details about the architecture, python version, and more.

### Other Improvements

The latest update also brings in performance improvements and reduced CPU load during monitoring.

The minor improvements to simplify the GUI are nice to have. The developer also notes that the FPS counter should give an idea about the GPU load and may not be accurate for all use-cases, such as game performance reviews/others.

### Download System Monitoring Center v1.2.1

Thanks to [hakandundar34coding][7] for providing us with the necessary insights to spot the improvements. You can grab the DEB and RPM packages from its [GitHub releases section][8].

[System Monitoring Center][8]

System Monitoring Center is a simple and effective task management app that helps you monitor your resources while making them easy to understand.

_Have you tried it yet? What do you use to monitor your system resources? Let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/system-monitoring-center-stable/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/system-monitoring-center/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYzNiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY1MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU5NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY1MSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://extensions.gnome.org/extension/1460/vitals/
[7]: https://github.com/hakandundar34coding
[8]: https://github.com/hakandundar34coding/system-monitoring-center/releases/tag/v1.2.1
