[#]: subject: "An Interesting Bluetooth App for Linux Just Appeared!"
[#]: via: "https://news.itsfoss.com/bluetooth-app-linux-overskride/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An Interesting Bluetooth App for Linux Just Appeared!
======
All things Bluetooth with this brand new app!
A new app for Linux has shown up that could be a one-stop app for all your Bluetooth needs.

Called ' **Overskride** ', it is **an open-source app** making an appearance with its first release. Even though it is in a work-in-progress state, it offers some decent functionality.

Allow me to take you through it.

### Overskride: What to Expect?

![][1]

Overskride will appeal to the Rust-heads out there, as it is **primarily written in the Rust programming language** with **a GTK4/libadwaita flavor** to it.

According to the developer, it is meant to be **a straightforward Bluetooth and Obex client** _(planned for future)_ that works irrespective of the desktop environment or window manager being used.

![][2]

Some key features include:

  * **Trust/Block devices.**
  * **Ability to send/receive files.**
  * **Set connection timeout periods.**
  * **Support for configuring the adapter.**



Looking at the screenshot above, you have got about every essential option to customize the Bluetooth device, and the connection, including the adapter name.

Of course, considering this is the first release of the app ever, one should not set high expectations. So, there would be room for improvements.

For now, here's **a little sneak peek of Overskride** to check what it offers.

I set it up using the provided Flatpak package on Ubuntu 22.04 LTS with GNOME 42.9. It didn't seem to have any issues with running on this setup.

Overskride was able to detect my smartphone, with various options to configure it.

![][3]

You can add the device to the trusted list or block list, rename it, and send a file as well.

I gave the **file transfer feature** a try, but before I could do that, I had to allow access to user files using [Flatseal][4] so that it could read the files on my system.

![][5]

The transfer began after I accepted the file transfer on my phone. The speeds were okay, and the file did get there in one piece, without any issues.

![][6]

I must say, for its first-ever release, the developer has presented us with a useful utility. I am excited to see what kind of improvements its future releases will offer.

The developer [was asked][7] by a Reddit user if there are any plans to **support for showing the battery percentage of wireless headphones.** In response to that, the dev mentioned that it is tricky to do so, as every device follows a different specification, which makes such a goal harder to achieve.

**Suggested Read** 📖

![][8]

### 📥 Get Overskride

For now, Overskride is only available via its [GitHub repo][9] as a Flatpak package. Or, you can compile it from source.

[Overskride (GitHub)][10]

I hope the developer publishes it on [Flathub][11] once it gets to a stable release to make it accessible for users.

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bluetooth-app-linux-overskride/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/10/Overskride_1.png
[2]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[3]: https://news.itsfoss.com/content/images/2023/10/Overskride_2.png
[4]: https://itsfoss.com/flatseal/
[5]: https://news.itsfoss.com/content/images/2023/10/Overskride_3.png
[6]: https://news.itsfoss.com/content/images/2023/10/Overskride_4.png
[7]: https://www.reddit.com/r/gnome/comments/17a5m99/full_release_of_my_bluetooth_app_d/k5b3ybg/
[8]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[9]: https://github.com/kaii-lb/overskride
[10]: https://github.com/kaii-lb/overskride/releases/
[11]: https://flathub.org/en
