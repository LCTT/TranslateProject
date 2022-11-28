[#]: subject: "CPU-X an Alternative to CPU-Z for Linux"
[#]: via: "https://itsfoss.com/cpu-x-alternative-cpu-z-linux/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

CPU-X an Alternative to CPU-Z for Linux
======
The tech-savvy Windows users might have used CPU-Z. It is an excellent utility for gathering comprehensive system information that is not available through stock applications in Windows.

**CPU-Z is not available on Linux.**

Don’t get disheartened! There are multiple ways and tools you can use to get detailed hardware information in Linux.

In fact, if you want something similar to CPU-Z on Linux, you are in luck. A developer called [X0rg][1] on GitHub has created a CPU-Z clone called CPU-X for Linux.

The interface might not be an exact replica bit you will find it familiar.

![CPU-X default interface with Adwaita-dark theme][2]

### CPU-X: A GUI to know CPU, Motherboard and other hardware details

CPU-X is a system profiling (Information) and monitoring application (Resource usage). It can detect the Processor (CPU), Memory (RAM), Chipset (Motherboard).

CPU-X is a free and open source software designed for GNU/Linux and FreeBSD. It is available in [GUI, TUI and CLI][3] formats.

By default, CPU-X in the graphical mode uses GTK3 ([GTK4 port][4] will not happen as per Developer).

It can provide comprehensive information about the hardware which is accessible without examining the components physically which is not possible all the time. For example, CPU-X can provide information about the RAM modules installed as shown below.

![CPU-X showing information about RAM][5]

### Features of CPU-X

The name of this application can be misleading as this application can provide information about many aspects of the computer and is not limited to the CPU only.

Here is a list of things CPU-X can provide information about.

* Processor
* Motherboard
* Memory
* System
* Graphic card
* Performance

If you run CPU-X for the first time, you will be greeted with something like the screenshot below.

![CPU-X running without Daemon][6]

No one can ignore the button **Start Daemon** at the bottom left corner of the window.

If you start the daemon, it will allow CPU-X to access special devices, providing more information and avoiding empty labels (Package, Multiplier, Bus speed as shown in the screenshot).

The **CPU-X daemon requires root privileges**, and it uses Polkit for privileges escalation. If you are using a Desktop Environment, entering the password as prompted will start the daemon and will not need further input from the user.

Note that the memory information is available only when Daemon is active.

#### CPU-X in the terminal

You can also use CPU-X from the command line, as there are two options available for using CPU-X in the terminal, i.e., NCurses and Coredump.

Firstly, to access the NCurses interface use the following command.

```
cpu-x -N
```

The interface will be similar to the default (GTK3) but with Ncurses type interface as shown in the screenshot below. You can navigate using arrow keys here.

![CPU-X NCurses running on GNOME Terminal][7]

Secondly, to get a summary of data, enter the following command.

```
cpu-x -D
```

This command gives the user a dump of all the system information provided by CPU-X. It is a very long output so you have to scroll through it to get the required information as shown below.

![CPU-X coredump on GNOME Terminal][8]

### Installing CPU-X on Linux

You can just grab the [latest AppImage from the GitHub release page][9] of CPU-X.

Native packages for CPU-X are also available for almost all distributions in their official repositories. Here are the commands to get them installed.

For Debian 11 or later and Ubuntu 20.04 or later.

```
sudo apt install cpu-x
```

For Fedora 30 or later.

```
sudo dnf install cpu-x
```

For FreeBSD 11 or later.

```
sudo pkg install cpu-x
```

For OpenSUSE Leap 15.2 or later.

```
sudo zypper install cpu-x
```

For Solus any version.

```
sudo eopkg install cpu-x
```

For Arch Linux as the package is available in the AUR only.

```
yay -Syu cpu-x
```

You can check out CPU-X source code on [GitHub][10]. Head to its official site to know more about it.

[CPU-X Official site][11]

### Conclusion

When you switch to Linux, it is only natural to look for the applications you used in Windows.

Where is Ccleaner in Linux? Where is the task manager?

Sometimes the software is available in Linux and sometimes they are not. In the latter case, you often have to opt for an alternative.

And that’s the thing. There are often alternatives available for the Linux desktop.

The CPU-Z alternative CPU-X is such an example. It gives you the CPU and other hardware information in a familiar way to CPU-Z users.[][12]

I know that there are many other tools such as [inxi][13] and [hardinfo][14] that could be used for a similar purpose. **Do you like CPU-X or do you use prefer some other tool? Leave a comment below.**

--------------------------------------------------------------------------------

via: https://itsfoss.com/cpu-x-alternative-cpu-z-linux/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://github.com/X0rg
[2]: https://itsfoss.com/wp-content/uploads/2022/09/cpu-x-cpu-info.png
[3]: https://itsfoss.com/gui-cli-tui/
[4]: https://github.com/X0rg/CPU-X/wiki/future-of-project
[5]: https://itsfoss.com/wp-content/uploads/2022/09/cpu-x-memory.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/cpu-x-no-daemon.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/cpu-x-ncurses.png
[8]: https://itsfoss.com/wp-content/uploads/2022/09/cpu-x-coredump.png
[9]: https://github.com/X0rg/CPU-X/releases/latest
[10]: https://github.com/X0rg/CPU-X
[11]: https://x0rg.github.io/CPU-X/
[12]: https://github.com/X0rg/CPU-X/blob/master/README.md#from-github-releases
[13]: https://itsfoss.com/inxi-system-info-linux/
[14]: https://itsfoss.com/hardinfo/
