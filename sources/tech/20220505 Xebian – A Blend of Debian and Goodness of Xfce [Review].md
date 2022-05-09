[#]: subject: "Xebian – A Blend of Debian and Goodness of Xfce [Review]"
[#]: via: "https://www.debugpoint.com/2022/05/xebian-review-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Xebian – A Blend of Debian and Goodness of Xfce [Review]
======
Here’s a quick review of the nice and sleek Xebian Linux Distribution.

Xebian is an Xfce desktop environment based Linux distribution based on Debian Unstable (sid) branch. This Linux Distribution brings a basic Xfce desktop with Debian without configuration changes and additional packages. Hence, you get a vanilla experience out of the box without worrying much about installing Debian and Xfce.

With that said, here’s a quick review of Xebian if you want to try it out.

### Xebian Review

#### Installation

Debian Installation can be tricky considering a variety of ISO available (mini, free, non-free and all that). After all, it is a truly “Universal Operating System”. But with Xebian, it’s effortless because it comes with only one 64-bit ISO file, which gives you Debian sid and Xfce. Xebian uses Debian’s native installer and is fairly straightforward to install this distribution in your physical system or a virtual machine.

During my test, the installation went fine, and no issues were reported. Installation took around 4 minutes.

#### Look and Feel

After installing, you get a nice login screen with Xebian default wallpaper when you first boot the system. The login screen is the standard default Xfce desktop login screen.

![Xebian Logn Screen][1]

First and foremost, the desktop is very lightweight and has a clean look with Xfce. Xebian gives exactly the stock version of Xfce with Debian. So, the only difference is the default wallpaper which looks nice and the default Numix theme (dark). The Adwaita and Gerybird themes are also present for those who like a more legacy look.

Second, the top panel has the Whisker Menu on the right and the standard system tray with volume controls, battery indication, network/Wi-Fi and date/time.

#### Applications

Xebian packages all the Xfce native applications and does not add anything extra. When you install it, you should already have a stable working desktop with the following applications pre-loaded.

* Thunar File Manager
* Ristretto Image Viewer
* Mousepad Text Editor
* Catfish File Search
* XFCE Terminal
* Firefox
* Synaptic Package Manager
* GParted for partitioning
* System Settings

Other than that, if you need any additional applications, you can easily install them using the Synaptic Package Manager. And tweaking the software source is easy with the built-in “Software and Sources” application.

The [Xfce 4.16][2] is the official version which the stable at the moment alongside its native applications. At its core, it is based on Debian Unstable “sid” which features Debian 12 “bookworm” release path as of writing this. And it is based on the latest [Linux Kernel 5.17][3] being a rolling release. The Xfce 4.18 is still far away from getting a final release.

Moreover, if you need a moderate image editor, graphics software and Office suite (such as LibreOffice) – you need to install them manually. They are not part of the ISO file.

Now, let’s take a look at the performance.

#### Performance of Xebian

Xebian is lightweight and perfect for older hardware, thanks to Debian. I tested the performance in two phases. The ideal phase where I kept the system idle for some time consumes about 710 MB of memory, and the CPU is at, on average 2%. Most of the idle state resources are consumed by the Xfce4-desktop and Xfce Window manager.

Second, I tested it in the heavy usage phase. I tried Xebian with one instance of File Manager, Text editor, terminal, and Firefox web browser in this workload.

With this workload, Xebian consumes 1.2 GB of memory, 2% to 3% CPU on average, depending on the respective application activity.

Moreover, most of the memory and CPU consumed by Firefox obviously, followed by an almost 50% jump in memory consumption of Xfce Window Manager.

Overall, I think it is stable and should work fine in mid-range hardware with a minimum of 4 GB ram.

### Closing Notes

There are very few [Linux distributions][4] that are based on Debian Unstable branch. If you are looking for a specific combination of Xfce and Debian sid, then Xebian is perfect because you get a super solid rolling release from Debian and with Xfce built-in.

Although it says “unstable”, in my experience, Debian “unstable” works well if you keep your system up to date weekly.

Finally, head over to the official website and [download the ISO file][5] if you want to try this distribution.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/xebian-review-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/05/Xebian-Logn-Screen-1024x578.jpg
[2]: https://www.debugpoint.com/2021/02/xfce-4-16-review/
[3]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[4]: https://www.debugpoint.com/category/distributions
[5]: https://xebian.org/download/
