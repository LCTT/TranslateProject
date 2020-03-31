[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Find Which Graphics Card do You Have in Linux?)
[#]: via: (https://itsfoss.com/check-graphics-card-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Find Which Graphics Card do You Have in Linux?
======

Be it [Nvidia][1] or [Radeon][2] or Intel, they all may have some issues with Linux. When you are on your way to troubleshoot the graphics problem, the first thing you want to know is which graphics card do you have in your system.

Linux has several commands to check hardware information. You can use them to check what graphics card (also refer to as video card) do you have. Let me show you a couple of commands to get GPU information in Linux.

### Check graphics card details in Linux command line

![][3]

#### Use lspci command to find graphics card

The lspci command displays the information about devices connected through [PCI][4] (peripheral Component Interconnect) buses. Basically, this command gives you the detail about all the peripheral devices to your system from keyboard and mouse to sound, network and graphics cards.

By default, you’ll have a huge list of such peripheral devices. This is why you need to filter the output for graphics card with grep command in this manner:

```
lspci | grep VGA
```

This should show a one line information about your graphics card:

```
[email protected]:~$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 620 (rev 02)
```

As you can see, my system has Intel HD 620 video card.

#### Get detailed graphics card information with lshw command in Linux

The lspci command is good enough to see what graphics card you have but it doesn’t tell you a lot. You can use lshw command to get more information on it.

This command requires you to have root access. You need to specify that you are looking for video card (graphics card) information in this fashion:

```
sudo lshw -C video
```

And as you can see in the output below, this command gives more information on the graphics card such as clock rate, width, driver etc.

```
[email protected]:~$ sudo lshw -C video
[sudo] password for abhishek:
  *-display
       description: VGA compatible controller
       product: HD Graphics 620
       vendor: Intel Corporation
       physical id: 2
       bus info: [email protected]:00:02.0
       version: 02
       width: 64 bits
       clock: 33MHz
       capabilities: pciexpress msi pm vga_controller bus_master cap_list rom
       configuration: driver=i915 latency=0
       resources: irq:139 memory:db000000-dbffffff memory:90000000-9fffffff ioport:f000(size=64) memory:c0000-dffff
```

#### Bonus Tip: Check graphics card details graphically

It’s not that you must use the command line to find graphics card details in Linux. Most Linux distributions (or should I say desktop environments) provide essential details in the settings application.

For example, if you are using [GNOME desktop environment][5], you can check the details by going to About section of Settings. Here’s what it looks like in [Ubuntu 20.04][6]:

![Graphics card information check graphically][7]

I hope you find this quick tip helpful. You can also use the same commands to [find your network adapter][8] and [CPU information in Linux][9].

If you have questions or suggestions, don’t hesitate to write a comment.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-graphics-card-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.nvidia.com/en-us/
[2]: https://www.amd.com/en/graphics/radeon-rx-graphics
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/check-gpu-info-linux.jpg?ssl=1
[4]: https://en.wikipedia.org/wiki/Conventional_PCI
[5]: https://www.gnome.org/
[6]: https://itsfoss.com/ubuntu-20-04-release-features/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/ubuntu-gpu-check.jpg?ssl=1
[8]: https://itsfoss.com/find-network-adapter-ubuntu-linux/
[9]: https://linuxhandbook.com/check-cpu-info-linux/
