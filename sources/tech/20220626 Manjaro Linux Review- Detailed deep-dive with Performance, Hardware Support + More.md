[#]: subject: "Manjaro Linux Review: Detailed deep-dive with Performance, Hardware Support + More"
[#]: via: "https://www.debugpoint.com/manjaro-linux-review-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manjaro Linux Review: Detailed deep-dive with Performance, Hardware Support + More
======

We review the [Manjaro Linux][1] with decade-old hardware and new hardware to test how it performs. Here are the results.

![Manjaro Linux 21.3 GNOME Desktop][2]

A few days back, we received several comments on why we have not included “Manjaro Linux” in the article we published – “[best Linux Distributions of 2022][3]“. So, I decided to review Manjaro’s current state and performance in various aspects of a desktop Linux operating system.

I will be honest. I was slightly biased on Manjaro while drafting the above article, primarily due to several media coverages ([source 1][4], [source 2][5], [source 3][6]). However, when I saw the latest feedback of Manjaro in several forums, I thought, let’s find out about the actual state of this fantastic distro.

Hence this review.

### Manjaro Review and Experience

#### Test Machine

Those who spend longer time in the Linux world know how complicated a situation can be with the above hardware from two famous (🥵) companies. I decided to test Majnaro in two ways. Firstly, on older hardware (10+ years old) with a complex NVIDIA GeForce card and Broadcom chip.

Second, in a standard virtual machine.

#### ISO Download and Installation

Firstly, the download from the official website of Manjaro via torrent went fine. The mirrors are super fast. I choose the Manjaro Linux GNOME Edition for this review which is around 3.2 GB download size. The primary reason for choosing GNOME is that it’s easier to compare with other non-Arch distros.

Secondly, the installation launcher is easy to find on the Manjaro LIVE desktop. The OS installer icon is at the GNOME default dock.

The installation was flawless of Manjaro Linux. It uses the Calamares installer. In both test and virtual machines, it preserved the GRUB. The physical system is a triple boot machine, and Manjaro did not mess up the GRUB. It detected all the operating systems.

Additionally, here’s one tiny observation related to boot. Manjaro Linux boot screen gives you two options – a) boot with an open-source driver and b) boot with a proprietary driver. When I tried to boot with the proprietory driver, Majnaro did not boot. It is stuck on the boot screen with “Starting GNOME Display Manager”. It looks like the NVIDIA card support problem (although it is out of support which I found later). Eventually, I installed it via the open-source driver option.

#### First Look

This review is based on Manjaro 21.3, the latest version as of writing this. The GNOME 42 desktop with Manjaro’s green-ish theme looks stunning. GNOME 42 brings the latest GTK4 applications in its core Shell. Overall the desktop seems nice and clean.

The Manjaro Hello – the official welcome screen- is a much-needed app that gives you quick access to various tasks. It is an essential app for new users mostly.

A set of nice Manjaro wallpapers give the desktop a professional feel.

#### Friendliness with Manjaro tools for a new Arch User

In addition to the above, Manjaro also brings two crucial native applications.

The first one is Manjaro Settings Manager, which gives you easy access to perform several system tasks without running commands in the terminal. This app provides the following features:

* Install and remove additional and experimental Kernels
* User account management
* Keyboard layout changes
* Language changes
* Hardware detection and installation of drivers

The second app is the Graphical Software Manager pamac. Pamac allows you to manage the software sources and search, install and uninstall software in the most convenient way possible. It also gives you access to many software, especially in Manjaro’s repo, in addition to usual Arch Linux repos.

![Pamac][7]

In addition, the GNOME flavour of Manjaro has the Extensions app pre-installed with several unique GNOME native apps installed. Thanks to the Manjaro devs, Flatpak support is present out of the box!

All of these small but impactful changes make it a great distro.

#### Connectivity and Drivers

Most of the connectivity worked fine in this hardware. However, there were some roadblocks.

Firstly, the Broadcom wireless card (BCM4313) worked out of the box, thanks to the Manjaro developers. Because, a few months back, when I ran the bare-metal Arch Linux with Xfce, the vanilla Arch Linux Kernel did not detect it. By default, Manjaro uses the open-source broadcom-r8168 driver.

I am glad it worked and connecting to the 4G Wi-Fi access point also went smoothly.

![Network Driver][8]

Secondly, the connection to a Bluetooth audio device also went well. Also, plug-and-play wireless USB devices worked fine.

Two important aspects did not go well in this hardware. Although, the Manjaro Hardware Configuration detected the NVIDIA GeForce 315M and assigned the video-linux driver. The display resolution is maxed at 1376×768, but probably this driver has limited support.

![Resolution in test system][9]

Similarly, when I tested the Linux Mint Cinnamon edition in this hardware, it was detected perfectly, and several high-resolution options were present.

Upon further digging in the Majnaro Forum, I found that the official driver for this card (nvidia-340) is officially removed as its an obsolete card. However, there are [some instructions][10] to compile the driver from GitHub – but that’s too much of an effort.

![Graphics Driver detected by Manjaro][11]

Secondly, the printer did not work at all. My printer is HP 2300 deskjet series. GNOME settings can detect the printer (see below), but the “Add Printer” function fails.

![Printer is shown in Settings][12]

![Add Printer did not work][13]

Because Linux has excellent printer support – thanks to CUPS. The same printer works well with all other recent Linux distributions, even with GNOME. I am not particularly sure why it didn’t work. Also, I think it might be something to do with GNOME Shell and its settings, not Manjaro Linux itself.

Besides these, Manjaro Linux brings Onlyoffice and Geary for office suite and email access, respectively.

#### Performance

One reason for trying out this distribution in a physical system is the performance metric. If it performs well in older hardware, it may run blazing fast in modern hardware.

In an idle state, Manjaro Linux GNOME Edition uses only 740 MB of RAM and 2% to 3% CPU in this hardware. The overall responsiveness of the desktop is fast; there is no lag whatsoever. It’s an impressive performance considering the physical system.

![Manjaro Linux Performance (Idle State with GNOME)][14]

Moreover, if you run it through a heavy workload, the performance would be slightly higher based on how many programs or applications you run.

But overall, Mankjaro Linux performs very well.

Finally, it uses ~10 GB of disk space for a default install (GNOME Edition).

### Closing Notes

Wrapping up the Manjaro Linux Review, I must say, it is indeed a time-tested distribution which brings Arch Linux to the masses. Also, I think Manjaro is the first distro which shows that Arch Linux can be a friendly distro with easy installation. Moreover, it shows the path to many similar “friendly Arch” distros which came up recently, such as EndeavourOS.

Because it is well designed to provide a wrapper to the “Arch Linux is difficult” myth. In addition, once you start using it, you wouldn’t feel it is an Arch Linux. It may feel like a Debian-based or a Fedora-based distro.

However, as always, it’s better to try modern Linux distributions in “not-so-old” hardware, which we used for this review. A five-year to 10-year-old hardware is fine. But beyond that, it’s necessary to upgrade the hardware because the modern operating systems (Linux or Windows) require more computing power due to security and other built-in functionalities (fingerprint, video conferencing, etc.), which are needed with the changing time.

Finally, you can easily choose Manjaro Linux for a daily driver or your workflow.

What is your opinion about Majnaro? Let me know in the comment box below (good or bad).

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/manjaro-linux-review-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://manjaro.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/06/Manjaro-Linux-21.3-GNOME-Desktop.jpg
[3]: https://www.debugpoint.com/best-linux-distributions-2022/
[4]: https://www.reddit.com/r/linux4noobs/comments/oxeeyu/please_please_stop_recommending_beginners_manjaro/
[5]: https://www.hadet.dev/Manjaro-Bad/
[6]: https://github.com/arindas/manjarno
[7]: https://www.debugpoint.com/wp-content/uploads/2022/06/Pamac.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/06/Network-Driver.png
[9]: https://www.debugpoint.com/wp-content/uploads/2022/06/Resolution-in-test-system.png
[10]: https://forum.manjaro.org/t/howto-get-legacy-340xx-nvidia-drivers-back/46969
[11]: https://www.debugpoint.com/wp-content/uploads/2022/06/Graphics-Driver-detected-by-Manjaro.png
[12]: https://www.debugpoint.com/wp-content/uploads/2022/06/Printer-is-shown-in-Settings.png
[13]: https://www.debugpoint.com/wp-content/uploads/2022/06/Add-Printer-did-not-work.png
[14]: https://www.debugpoint.com/wp-content/uploads/2022/06/Manjaro-Linux-Performance-Idle-State-with-GNOME.png
