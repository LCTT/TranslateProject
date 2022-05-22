[#]: subject: (Keep tabs on your Linux computer specs with this desktop application)
[#]: via: (https://opensource.com/article/21/5/linux-kinfocenter)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Keep tabs on your Linux computer specs with this desktop application
======
Get to know KDE Plasma's Info Center, a lifesaver when you need to know
your Linux machine's specs quickly.
![Puzzle pieces coming together to form a computer screen][1]

Whether I'm using a laptop my employer assigned to me or a workstation I built from vendor parts, I seem to have an endless capacity to forget my computer's specifications. One of the great things about Linux is its `/proc` filesystem, a dynamically populated virtual expression of the system's hardware. It's convenient when you want to see the specifics of your CPU (`cat /proc/cpuinfo`), uptime (`cat /proc/uptime`), a list of mounted filesystems (`ls -R /proc/fs/`), and so on.

Sometimes, though, it's nice to have everything you need (and what you don't know you need) all in one place for your perusal. The KDE Plasma desktop provides an application called Info Center (sometimes also called [KInfoCenter][2]), a place to help you know what, where, and how much you're running.

### Installing KInfoCenter

If you're already running the [KDE Plasma desktop][3], then KInfoCenter is probably already installed. Otherwise, you can find the application in your distribution's software repository.

For example, on Fedora or CentOS Stream:


```
`$ sudo dnf install kinfocenter`
```

### System information

When Info Center is launched, the default screen is the **About System** pane. This displays the versions of your Plasma desktop, KDE Frameworks, and Qt: all the technologies that work together to provide the desktop. It also displays the Linux kernel version and architecture and gives you a quick hardware overview, listing both your CPU and RAM.

![KInfoCenter's main display][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

### Memory and resources

Maybe seeing the total RAM installed on your system isn't specific enough for you. In that case, you can open the **Memory** pane to see a detailed report about how your RAM is being used. This updates dynamically, so you can use it to monitor the effects an application or activity has on your system.

![KInfoCenter's Memory pane][6]

(Seth Kenlon, [CC BY-SA 4.0][5])

If you're on a laptop, **Energy Information** displays your power-saving settings. If you have file indexing active, you can view the status of the indexer in the **File Indexer Monitor** panel.

### Devices

The **Device Information** folder contains several panes you can access for details about the physical peripherals inside or connected to your computer. This covers _everything_, including USB devices, hard drives, processors, PCI slots, and more.

![KInfoCenter's Device Information pane][7]

(Seth Kenlon, [CC BY-SA 4.0][5])

This isn't just a broad overview, either. KInfoCenter gives you nearly everything there is to know about the components you're running. For hard drives, it provides a list of partitions, the SATA port the drive is connected to, the drive label or name you've given it, UUID, size, partition, the filesystem, whether it's mounted and where, and more. For the CPU, it provides the product name, vendor, number of cores (starting at 0), maximum clock speed, interrupt information, and supported instruction sets. The list goes on and on for every type of device you can think of.

### Network and IP address

Maybe you're tired of parsing the verbose output of `ip address show`. Maybe you're too lazy to create an alias for `ip address show | grep --only-matching "inet 10.*" | cut -f2 -d" "`. Whatever the reason, sometimes you want an easy way to get a machine's IP address. KInfoCenter is the answer because the **Network Information** panel contains its host's IP address. In fact, it lists both the active hardware-based IP addresses as well as active bridges for virtual machines.

It seems basic, but this simple KInfoCenter feature has saved me minutes of frustration when trying to obtain an IP address quickly over a support call so I could SSH into the machine in question and fix a problem. The network panel also provides information about [Samba shares][8], the open source file sharing service you can run locally to swap files between computers on your network easily.

### Graphics

As if that's not enough, KInfoCenter also features a **Graphical Information** panel so you can get details about your graphics server, whether you're running Wayland or X11. You can get data on your display's dimensions, resolution (you may remember when 72 DPI was standard, but this panel assures you that you're running a more modern 92 DPI), bit depth, and more. It also provides information on OpenGL or Vulkan, including what card is being used to render graphics, what extensions are in use, what kernel module is installed, and so on.

### KInfoCenter? More like KLifeSaver

I regularly pin KInfoCenter to the KDE Kicker or create a shortcut to it on the desktop so that users I support can get there easily whenever they need to know their architecture, RAM, or IP address. It's the most friendly aggregation of system information I've seen on any operating system, much less on any Linux desktop. Install KInfoCenter today. You might not use it right away, but you'll need it someday, and when you do, you'll be glad you have it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/linux-kinfocenter

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://userbase.kde.org/KInfoCenter
[3]: https://opensource.com/article/19/12/linux-kde-plasma
[4]: https://opensource.com/sites/default/files/uploads/kinfocenter-main.png (KInfoCenter's main display)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/kinfocenter-memory.png (KInfoCenter's Memory pane)
[7]: https://opensource.com/sites/default/files/uploads/kinfocenter-peripherals.png (KInfoCenter's Device Information pane)
[8]: https://opensource.com/article/21/4/share-files-linux-windows
