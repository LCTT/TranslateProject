[#]: subject: "Mission Center: A Sleek System Monitoring App for Linux"
[#]: via: "https://news.itsfoss.com/mission-center/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Mission Center: A Sleek System Monitoring App for Linux
======
A user-friendly system monitoring app for Linux. Let's check it out!
What if, one day, you find that your system is sluggish, and the default system monitor app of your distro is not helpful?

I understand that it can be very annoying when you are trying to figure out what pesky process is causing your system to slow down, and the system monitor cannot help.

With this first look, I have just the thing for you. It is **a system monitor for Linux** called ' **Mission Center** ' that aims to provide some really useful functionality.

Allow me to take you through it, and show you what it can do, and what it can't.

🚧

The app is fairly new and is in active development. Expect things to change.

### Mission Center: Overview ⭐

![][1]

Written primarily in the **memory-safe Rust programming language** , [Mission Center][2] is a system monitor that lets you **monitor your CPU, Memory, Disk, Network, and GPU**.

Some of its key highlights include:

  * **Real-time monitoring of per-thread CPU usage.**
  * **Ability to monitor RAM and Swap usage.**
  * **Detailed apps and process usage information.**
  * **Monitoring of network utilization and transfer speeds.**



**Suggested Read** 📖

![][3]

### Initial Impressions 👨‍💻

I tested it out on an **[Ubuntu 22.04][4] LTS** system, and the installation process was pretty straightforward thanks to it being **offered as a Flatpak**.

And, I must say, **Mission Center looks very similar to the task manager found on** [Windows 11][5], and that's not necessarily a bad thing. This interface layout is good for presenting all the important information in a user-friendly manner.

The first tab I took a look at was the ' **Performance** ' section of the system monitor called ' **CPU** '. It showed me all the essential info regarding my processor, with a handy **graph showing CPU usage in real-time**.

I was also able to switch to the 'logical processors' view to **see CPU usage on a per-thread basis**. You can find it by right-clicking on the graph and going into the 'Change Graph To' menu.

![][6]

The next one was the ' **Memory** ' tab, which showed me **a real-time graph with the memory usage** , and useful info regarding the two RAM sticks being used.

![][7]

Thereafter, the ' **Disk** ' tab, even though I have several storage disks on my system, I only use 'Disk 4' for Ubuntu. I checked the usage on it, and it seemed to show disk usage data in real-time.

However, [according to the developer][8], the **disk usage percentage is in a work-in-progress state** right now, and the accuracy of it cannot be vouched for.

![][9]

And finally, we have the ' **Ethernet** ' tab. It shows you the **real-time network activity on your system with a handy graph** , with two information points for download and upload activities.

However, there is **no per-process network data usage for apps** yet. The developer is [currently working][10] on that.

![][11]

![][12]

I then moved on to the ' **Apps** ' section. This housed most (if not all) apps and processes running on the system. It shows all the useful information of an app/process, such as the PID, CPU, Memory, and Disk usage.

You can also either **stop an app/process** or **force stop an app/process** by right-clicking on one.

![][13]

I was also able to **tweak certain settings** of the Mission Center app, such as:

  * Adjusting the update interval for all the real-time graphs
  * Set the app to merge process statistics
  * Remember the sorting order I used in the 'Apps' section.



![][14]

One thing that I missed was the data related to my GPU, **Mission Center was unable to detect my Nvidia GPU**.

However, that checks out, seeing that **GPU support is experimental** , with only AMD and Nvidia GPUs being supported.

### 📥 Get Mission Center

Mission Center is available on the [Flathub store][15], as well as on [GitLab][16], if you want to build it from source.

[Mission Center (Flathub)][15]

👋

Before you leave this page, you might want to explore other new apps in our [First Looks][17] coverage. You should find them exciting!

_💬 Would you replace the default system monitor on your Linux system with Mission Center?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mission-center/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_1.png
[2]: https://missioncenter.io/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://news.itsfoss.com/ubuntu-22-04-release/
[5]: https://www.microsoft.com/en-us/windows?wa=wsignin1.0
[6]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_2.png
[7]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_3.png
[8]: https://gitlab.com/mission-center-devs/mission-center/-/issues/2
[9]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_4.png
[10]: https://gitlab.com/mission-center-devs/mission-center/-/issues/3
[11]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[12]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_5-1.png
[13]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_6.png
[14]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_7.png
[15]: https://flathub.org/apps/io.missioncenter.MissionCenter
[16]: https://gitlab.com/mission-center-devs/mission-center
[17]: https://news.itsfoss.com/tag/first-look/
