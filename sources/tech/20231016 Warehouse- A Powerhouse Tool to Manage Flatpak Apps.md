[#]: subject: "Warehouse: A Powerhouse Tool to Manage Flatpak Apps"
[#]: via: "https://news.itsfoss.com/warehouse/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Warehouse: A Powerhouse Tool to Manage Flatpak Apps
======
Do you rely on Flatpak applications? Warehouse should help you make
things easier.
Wouldn't it be nice to have an app that could provide you with all the important information regarding a Flatpak app, as well as tools to manage it?

Well, you're in luck this time!

For this first look, we have an interesting app called ' **Warehouse** ' that **can help you manage Flatpak apps**.

We have covered a similar app in the past, '[ **Flatseal**][1]', but that is geared towards managing the permissions of a Flatpak.

Let's see what kind of functionality Warehouse has to offer.

### Warehouse: Overview ⭐

![][2]

Dubbed as “ **a versatile toolbox** ” by its developers, Warehouse can be used to **manage Flatpak user data** , **view a Flatpak's info** , and even **batch manage the installed Flatpaks on a system**.

It has been written primarily in the **Python programming language** , and has the following key features:

  * **Easily manage user data**
  * **Batch actions functionality**
  * **Leftover data clean up**



![][3]

#### Initial Impressions 👨‍💻

I began testing Warehouse on my Ubuntu setup. It was straightforward to get it installed **from Flathub**.

After I opened it, a list was shown with all the **installed Flatpak apps**. These were all **arranged neatly in an ordered list**.

In my opinion, it would look even better if they added an option for switching to a grid layout.

![][4]

📋

Are you curious about the app listed above, Firefox? We recently covered that, it is a system monitoring app called '[Mission Center][5]'.

Next, I moved on to **check the properties of a Flatpak app** , I clicked on the 'Info' logo besides an app to open up the app properties window.

It served up all kinds of information pertaining to the app, starting from the **Name** , **Description** , **App ID,** all the way to the **active commit** and the **installed size**.

![][6]

Similarly, I could click on the 'Trash' icon to either **completely uninstall the Flatpak app** , or **keep user data** for future reinstallation, and recover the settings/content.

![][7]

Warehouse also has a **search functionality** that allows you to search for specific apps. This can come in handy when you have loads of Flatpak apps installed.

Simply click on the magnifying glass at the top-left of the app to get started.

![][8]

You can also **set filters** to **sort through apps or even the runtimes** that are required by your system to accomplish various tasks.

Click on the 'funnel' logo at the top-left to start filtering.

![][9]

I then took a look at the **batch actions feature**. I started by clicking on the 'tick-mark' logo at the top-right of the app.

It then allowed me to select multiple apps, with the ability to perform actions such as **copying info** , **deleting app data** , and **uninstalling them**.

The three little buttons at the bottom-right of the app facilitated the above-mentioned actions.

![][10]

Post that, I moved on to the hamburger menu that featured some important options.

![][11]

The first one ' **Install from file'** which allowed me to **install a Flatpak app by using the '.flatpakref' file**.

![][12]

During the installation, it asked me whether I wanted to install it for a specific user, or everyone who uses the system. I chose the latter.

![][13]

Subsequently, I took a look at the ' **Manage Leftover Data** ' option. It showed me how much data an old Flatpak app had left behind.

I had the option to reinstall the app and recover the data via the 'Install' option, or I could use the 'Trash' option to completely remove any trace of it from my system. Sometimes leftover data takes up a lot of space.

![][14]

If you are someone who keeps installing/removing apps regularly, you may end up with a lot of leftover data.

If you want to manage Flatpak repos, you can head to the ' **Manage Remotes** ' option that allows you to add or remove them.

![][15]

While you can do this from the software center on Fedora and some other distributions, it would feel like a seamless experience, getting all the essentials under a single app.

And finally, you have plenty of ' **Keyboard Shortcuts** ' available to storm through all the functionalities of the app using the keyboard.

![][16]

### 📥 Download Warehouse

You can head over to the [Flathub store][17] to grab the latest release.

[Warehouse (Flathub)][17]

You can also visit its [GitHub repo][18] to take a look at its source code.

_💬 What do you think about the Warehouse app? Share your thoughts in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/warehouse/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/flatseal/
[2]: https://news.itsfoss.com/content/images/2023/10/Warehouse_1.png
[3]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[4]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2a.png
[5]: https://news.itsfoss.com/mission-center/
[6]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2b.png
[7]: https://news.itsfoss.com/content/images/2023/10/Warehouse_2c.png
[8]: https://news.itsfoss.com/content/images/2023/10/Warehouse_3.png
[9]: https://news.itsfoss.com/content/images/2023/10/Warehouse_4.png
[10]: https://news.itsfoss.com/content/images/2023/10/Warehouse_5.png
[11]: https://news.itsfoss.com/content/images/2023/10/Warehouse_6.png
[12]: https://news.itsfoss.com/content/images/2023/10/Warehouse_7a.png
[13]: https://news.itsfoss.com/content/images/2023/10/Warehouse_7b.png
[14]: https://news.itsfoss.com/content/images/2023/10/Warehouse_8.png
[15]: https://news.itsfoss.com/content/images/2023/10/Warehouse_9.png
[16]: https://news.itsfoss.com/content/images/2023/10/Warehouse_10.png
[17]: https://flathub.org/apps/io.github.flattool.Warehouse
[18]: https://github.com/flattool/warehouse
