[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 commands to reboot Linux (plus 4 more ways to do it safely))
[#]: via: (https://opensource.com/article/19/7/reboot-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/sethhttps://opensource.com/users/greg-phttps://opensource.com/users/greg-phttps://opensource.com/users/sethhttps://opensource.com/users/cldxsolutions)

3 commands to reboot Linux (plus 4 more ways to do it safely)
======
Learn how to reboot Linux through many different methods, from the GUI
to deep within the command line.
![Tux with binary code background][1]

Linux is fully capable of running not weeks, but years, without a reboot. In some industries, that’s exactly what Linux does, thanks to advances like **kpatch** and **kgraph**.

For laptop and desktop users, though, that metric is a little extreme. While it may not be a day-to-day reality, it’s at least a weekly reality that sometimes you have a good reason to reboot your machine. And for a system that doesn’t need rebooting often, Linux offers plenty of choices for when it’s time to start over.

### Understand your options

Before continuing though, a note on rebooting. Rebooting is a unique process on each operating system. Even within [POSIX][2] systems, the commands to power down and reboot may behave differently due to different initialization systems or command designs.

Despite this factor, two concepts are vital. First, rebooting is rarely requisite on a POSIX system. Your Linux machine can operate for weeks or months at a time without a reboot if that’s what you need. There’s no need to "freshen up" your computer with a reboot unless specifically advised to do so by a software installer or updater. Then again, it doesn’t hurt to reboot, either, so it’s up to you.

Second, rebooting is meant to be a friendly process, allowing time for programs to exit, files to be saved, temporary files to be removed, filesystem journals updated, and so on. Whenever possible, reboot using the intended interfaces, whether in a GUI or a terminal. If you force your computer to shut down or reboot, you risk losing unsaved and even recently-saved data, and even corrupting important system information; you should only ever force your computer off when there’s no other option**.**

### Click the button

The first way to reboot or shut down Linux is the most common one, and the most intuitive for most desktop users regardless of their OS: It’s the power button in the GUI. Since powering down and rebooting are common tasks on a workstation, you can usually find the power button (typically with reboot and shut down options) in a few different places. On the GNOME desktop, it's in the system tray: 

![The GNOME power button.][3]

It’s also in the GNOME **Activities** menu:

![The GNOME Activities menu power button.][4]

On the KDE desktop, the power buttons can be found in the **Applications** menu:

![The KDE power buttons via the Applications menu.][5]

You can also access the KDE power controls by right-clicking on the desktop and selecting the **Leave** option, which opens the window you see here:

![The KDE power buttons via the Leave option.][6]

Other desktops provide variations on these themes, but the general idea is the same: use your mouse to locate the power button, and then click it. You may have to select between rebooting and powering down, but in the end, the result is nearly identical: Processes are stopped, nicely, so that data is saved and temporary files are removed, then data is synchronized to drives, and then the system is powered down.

### Push the physical button

Most computers have a physical power button. If you press that button, your Linux desktop may display a power menu with options to shut down or reboot. This feature is provided by the [Advanced Configuration and Power Interface (ACPI)][7] subsystem, which communicates with your motherboard’s firmware to control your computer’s state.

ACPI is important but it’s limited in scope, so there’s not much to configure from the user’s perspective. Usually, ACPI options are generically called **Power** and are set to a sane default. If you want to change this setup, you can do so in your system settings.

On GNOME, open the system tray menu and select **Activities**, and then **Settings.** Next, select the **Power** category in the left column, which opens the following menu:

![GNOME’s power button settings.][8]

In the **Suspend &amp; Power Button** section, select what you want the physical power button to do.

The process is similar across desktops. For instance, on KDE, the **Power Management** panel in **System Settings** contains an option for **Button Event Handling.**

* * *

* * *

* * *

**![KDE Power Management][9]**

* * *

* * *

* * *

**opensource.com**

After you configure how the button event is handled, pressing your computer’s physical power button follows whatever option you chose. Depending on your computer vendor (or parts vendors, if you build your own), a button press might be a light tap, or it may require a slightly longer push, so you might have to do some tests before you get the hang of it.

Beware of an over-long press, though, since it may shut your computer down without warning.

### Run the systemctl command

If you operate more in a terminal than in a GUI desktop, you might prefer to reboot with a command. Broadly speaking, rebooting and powering down are processes of the _init_ system—the sequence of programs that bring a computer up or down after a power signal (either on or off, respectively) is received.

On most modern Linux distributions, **systemd** is the init system, so both rebooting and powering down can be performed through the **systemd** user interface, **systemctl**. The **systemctl** command accepts, among many other options, **halt** (halts disk activity but does not cut power) **reboot** (halts disk activity and sends a reset signal to the motherboard) and **poweroff** (halts disk acitivity, and then cut power). These commands are mostly equivalent to starting the target file of the same name.

For instance, to trigger a reboot:


```
`$ sudo systemctl start reboot.target`
```

### Run the shutdown command

Traditional UNIX, before the days of **systemd** (and for some Linux distributions, like [Slackware][10], that’s _now_), there were commands specific to stopping a system. The **shutdown** command, for instance, can power down your machine, but it has several options to control exactly what that means.

This command requires a time argument, in minutes, so that **shutdown** knows when to execute. To reboot immediately, append the **-r** flag:


```
`$ sudo shutdown -r now`
```

To power down immediately:


```
`$ sudo shutdown -P now`
```

Or you can use the **poweroff** command:


```
`$ poweroff`
```

To reboot after 10 minutes:


```
`$ sudo shutdown -r 10`
```

The **shutdown** command is a safe way to power off or reboot your computer, allowing disks to sync and processes to end. This command prevents new logins within the final 5 minutes of shutdown commencing, which is particularly useful on multi-user systems.

On many systems today, the **shutdown** command is actually just a call to **systemctl** with the appropriate reboot or power off option.

### Run the reboot command

The **reboot** command, on its own, is basically a shortcut to **shutdown -r now**. From a terminal, this is the easiest and quickest reboot command:


```
`$ sudo reboot`
```

If your system is being blocked from shutting down (perhaps due to a runaway process), you can use the **\--force** flag to make the system shut down anyway. However, this option skips the actual shutting down process, which can be abrupt for running processes, so it should only be used when the **shutdown** command is blocking you from powering down.

On many systems, **reboot** is actually a call to **systemctl** with the appropriate reboot or power off option.

### Init

On Linux distributions without **systemd**, there are up to 7 runlevels your computer understands. Different distributions can assign each mode uniquely, but generally, 0 initiates a halt state, and 6 initiates a reboot (the numbers in between denote states such as single-user mode, multi-user mode, a GUI prompt, and a text prompt).

These modes are defined in **/etc/inittab** on systems without **systemd**. On distributions using **systemd** as the init system, the **/etc/inittab** file is either missing, or it’s just a placeholder.

The **telinit** command is the front-end to your init system. If you’re using **systemd**, then this command is a link to **systemctl** with the appropriate options.

To power off your computer by sending it into runlevel 0:


```
`$ sudo telinit 0`
```

To reboot using the same method:


```
`$ sudo telinit 6`
```

How unsafe this command is for your data depends entirely on your init configuration. Most distributions try to protect you from pulling the plug (or the digital equivalent of that) by mapping runlevels to friendly commands.

You can see for yourself what happens at each runlevel by reading the init scripts found in **/etc/rc.d** or **/etc/init.d**, or by reading the **systemd** targets in **/lib/systemd/system/**.

### Apply brute force

So far I’ve covered all the _right_ ways to reboot or shut down your Linux computer. To be thorough, I include here additional methods of bringing down a Linux computer, but by no means are these methods recommended. They aren’t designed as a daily reboot or shut down command (**reboot** and **shutdown** exist for that), but they’re valid means to accomplish the task.

If you try these methods, try them in a virtual machine. Otherwise, use them only in emergencies.

#### Proc

A step lower than the init system is the **/proc** filesystem, which is a virtual representation of nearly everything happening on your computer. For instance, you can view your CPUs as though they were text files (with **cat /proc/cpuinfo**), view how much power is left in your laptop’s battery, or, after a fashion, reboot your system.

There’s a provision in the Linux kernel for system requests (**Sysrq** on most keyboards). You can communicate directly with this subsystem using key combinations, ideally regardless of what state your computer is in; it gets complex on some keyboards because the **Sysrq** key can be a special function key that requires a different key to access (such as **Fn** on many laptops).

An option less likely to fail is using **echo** to insert information into **/proc**, manually. First, make sure that the Sysrq system is enabled:


```
`$ sudo echo 1 > /proc/sys/kernel/sysrq`
```

To reboot, you can use either **Alt**+**Sysrq**+**B** or type:


```
`$ sudo echo b > /proc/sysrq-trigger`
```

This method is not a reasonable way to reboot your machine on a regular basis, but it gets the job done in a pinch.

#### Sysctl

Kernel parameters can be managed during runtime with **sysctl**. There are lots of kernel parameters, and you can see them all with **sysctl --all**. Most probably don’t mean much to you until you know what to look for, and in this case, you’re looking for **kernel.panic**.

You can query kernel parameters using the **-–value** option:


```
`$ sudo sysctl --value kernel.panic`
```

If you get a 0 back, then the kernel you’re running has no special setting, at least by default, to reboot upon a kernel panic. That situation is fairly typical since rebooting immediately on a catastrophic system crash makes it difficult to diagnose the cause of the crash. Then again, systems that need to stay on no matter what might benefit from an automatic restart after a kernel failure, so it’s an option that does get switched on in some cases.

You can activate this feature as an experiment (if you’re following along, try this in a virtual machine rather than on your actual computer):


```
`$ sudo sysctl kernel.reboot=1`
```

Now, should your computer experience a kernel panic, it is set to reboot instead of waiting patiently for you to diagnose the problem. You can test this by simulating a catastrophic crash with **sysrq**. First, make sure that Sysrq is enabled:


```
`$ sudo echo 1 > /proc/sys/kernel/sysrq`
```

And then simulate a kernel panic:


```
`$ sudo echo c > /proc/sysrq-trigger`
```

Your computer reboots immediately.

### Reboot responsibly

Knowing all of these options doesn't mean that you should use them all. Give careful thought to what you're trying to accomplish, and what the command you've selected will do. You don't want to damage your system by being reckless. That's what virtual machines are for. However, having so many options means that you're ready for most situations.

Have I left out your favorite method of rebooting or powering down a system? List what I’ve missed in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/reboot-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/sethhttps://opensource.com/users/greg-phttps://opensource.com/users/greg-phttps://opensource.com/users/sethhttps://opensource.com/users/cldxsolutions
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY (Tux with binary code background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/sites/default/files/uploads/gnome-menu-power.jpg (The GNOME power button.)
[4]: https://opensource.com/sites/default/files/uploads/gnome-screen-power.jpg (The GNOME Activities menu power button.)
[5]: https://opensource.com/sites/default/files/uploads/kde-menu-power.jpg (The KDE power buttons via the Applications menu.)
[6]: https://opensource.com/sites/default/files/uploads/kde-screen-power.jpg (The KDE power buttons via the Leave option.)
[7]: https://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface
[8]: https://opensource.com/sites/default/files/uploads/gnome-settings-power.jpg (GNOME’s power button settings.)
[9]: https://opensource.com/sites/default/files/images/kde-power-management.jpg
[10]: http://slackware.com
