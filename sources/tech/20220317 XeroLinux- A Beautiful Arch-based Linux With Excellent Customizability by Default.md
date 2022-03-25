[#]: subject: "XeroLinux: A Beautiful Arch-based Linux With Excellent Customizability by Default"
[#]: via: "https://itsfoss.com/xerolinux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

XeroLinux: A Beautiful Arch-based Linux With Excellent Customizability by Default
======

Arch Linux is a popular option for Linux users who want more control over their operating system.

While many experienced users customize the Arch Linux experience to provide some of the best user experiences (in terms of its UI), it could be challenging for new Linux users.

If you are not aware of the specifics about Arch Linux, you might want to read out [Ubuntu vs Arch Linux comparison][1] article.

However, some [Arch-based distros][2] aim to offer a more accessible experience without taking the control away.

**XeroLinux** is one of the options that we recently came across.

### XeroLinux: Yet Another Arch-Based Distribution

![][3]

[XeroLinux][4] is a personal project by Steve, a.k.a. [TechXero][5] to offer an “eye-candy” version of Arch Linux.

Note that this is a passion project and not a mainstream distro backed by a big team of contributors (yet). You should try it on a VM or a test machine before replacing it on your primary system.

Here, we feature XeroLinux with a quick review for its pleasant out-of-the-box experience and a few more exciting things.

### **Ease of Installation**

XeroLinux uses [Calamares installer][6] to let you easily install the Linux distribution without needing to rely on the terminal or the [guided Arch installer][7].

While the installation experience is similar to popular Linux distros, you get the ability to select graphics drivers, specific Linux kernels, and tools as you proceed.

![][8]

You get to install System76’s power management driver and enable support for Nvidia Optimus Manager to switch graphics for your Laptop. Interesting!

You also get to choose password managers, themes, browsers, and a wide range of different packages at the time of installation, which should make things convenient.

Considering you get all the essential options in the form of a selection, you do not have a lot to worry about post-installation.

![][9]

Once you select what’s required, simply restart and start using the desktop.

### **User Experience**

The out-of-the-box experience with XeroLinux is impressive. The overall look and feel of the desktop include many new functional additions like the widgets to show CPU usage, network speed, and more.

It also supports the global menu, making the application window look cleaner and offering a comfortable experience for macOS users to switch to Linux.

![][10]

With all the pre-installed applications, you can easily install new software, uninstall existing tools and perform various operations.

It features both pamac and [Synaptic package manager][11] (available to select during installation). So, you get access to loads of software utilities that you can easily install through either of them.

Other offerings include two file managers (Dolphin and Thunar), Yakuake terminal, Spectacle screenshot, KWrite, Konsole, and other KDE tools in its primary KDE edition.

If you do not prefer the Yakuake terminal emulator, refer to our [list of terminal emulators][12] to find alternatives to it.

![][13]

Not to forget, you get a customized lock screen (or login screen) that looks pretty good!

![][14]

When you boot into the system, you will also notice a **XeroLinux configuration tool**. It lets you perform some essential tasks quickly, like checking for NVIDIA card, installing KVM/QEMU, disabling autostart, installing KDE window tiling, and some other configurations, as shown below.

![][15]

### **Customizability**

XeroLinux features the KDE desktop environment in its main edition. So, naturally, you get endless customization options.

It would be best to refer to our [KDE customization guide][16] to get help with it.

In addition to that, you get to see the [Latte Dock][17], which you can customize and tweak as you like.

![][18]

There are several options to customize the dock; make sure you carefully tweak the settings before things look weird.

![][19]

Moreover, you get the [Kvantum Manager][20] that can help you install external themes.

If that wasn’t enough, the developer also makes a few Rice/Themes and Grub themes available that you can find listed on the [official site][4] or the [GitHub repo][21].

In other words, there are some scripts made available by the developer that can help you get a makeover but do note that it is better to customize things yourself so that nothing else breaks.

### **Desktop Environment Options**

The primary edition features KDE, but you also have another XFCE variant if you want to give it a try.

The XFCE edition is tailored for older systems (or if you need to save up system resources).

It did offer a GNOME edition initially, but it dropped support for it due to issues with extensions breaking, with every update. You might want to go through our [KDE Plasma vs GNOME][22] article to know the differences if you’re curious about the desktop environments.

### **Performance**

Considering it features the latest available [Linux Kernel 5.16][23], it should work fine with a variety of hardware configurations.

However, I haven’t tested it on bare metal. As per my experience with it as a virtual machine, it worked well without any peculiar issues.

Here’s what the resource usage looks like on its KDE edition:

![][24]

You may notice lower resource usage when using its XFCE variant.

### Should You Try XeroLinux?

I enjoyed the look and feel that I got with XeroLinux.

Not just limited to that, you also get several package choices and the ability to choose the best of Linux right at the time of installation.

[Try XeroLinux][4]

If you know what you need at the time of installation, it should be an attractive Arch-based Linux distribution for you.

Have you tried XeroLinux yet? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/xerolinux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-vs-arch/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-home.jpg?resize=800%2C450&ssl=1
[4]: https://xerolinux.xyz/
[5]: https://twitter.com/TechXero
[6]: https://calamares.io/
[7]: https://itsfoss.com/install-arch-linux-virtualbox/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-install-1.png?resize=800%2C555&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-install.png?resize=800%2C555&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-ui.jpg?resize=800%2C398&ssl=1
[11]: https://itsfoss.com/synaptic-package-manager/
[12]: https://itsfoss.com/linux-terminal-emulators/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-utilities.jpg?resize=800%2C652&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-lockscreen.jpg?resize=800%2C546&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-configuration-tool.jpg?resize=800%2C480&ssl=1
[16]: https://itsfoss.com/kde-customization/
[17]: https://github.com/KDE/latte-dock
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-latte-dock.png?resize=800%2C134&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-latte-dock-options.jpg?resize=800%2C570&ssl=1
[20]: https://store.kde.org/p/1005410/
[21]: https://github.com/xerolinux/xero-layan-git
[22]: https://itsfoss.com/kde-vs-gnome/
[23]: https://news.itsfoss.com/linux-kernel-5-16/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-resource.png?resize=800%2C468&ssl=1
