Part 13 - LFCS: How to Configure and Troubleshoot Grand Unified Bootloader (GRUB)
=====================================================================================

Because of the changes in the LFCS exam requirements effective Feb. 2, 2016, we are adding the necessary topics to the [LFCS series][1] published here. To prepare for this exam, your are highly encouraged to use the [LFCE series][2] as well.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Configure-Troubleshoot-Grub-Boot-Loader.png)
>LFCS: Configure and Troubleshoot Grub Boot Loader – Part 13

In this article we will introduce you to GRUB and explain why a boot loader is necessary, and how it adds versatility to the system.

The [Linux boot process][3] from the time you press the power button of your computer until you get a fully-functional system follows this high-level sequence:

* 1. A process known as **POST** (**Power-On Self Test**) performs an overall check on the hardware components of your computer.
* 2. When **POST** completes, it passes the control over to the boot loader, which in turn loads the Linux kernel in memory (along with **initramfs**) and executes it. The most used boot loader in Linux is the **GRand Unified Boot loader**, or **GRUB** for short.
* 3. The kernel checks and accesses the hardware, and then runs the initial process (mostly known by its generic name “**init**”) which in turn completes the system boot by starting services.

In Part 7 of this series (“[SysVinit, Upstart, and Systemd][4]”) we introduced the [service management systems and tools][5] used by modern Linux distributions. You may want to review that article before proceeding further.

### Introducing GRUB Boot Loader

Two major **GRUB** versions (**v1** sometimes called **GRUB Legacy** and **v2**) can be found in modern systems, although most distributions use **v2** by default in their latest versions. Only **Red Hat Enterprise Linux 6** and its derivatives still use **v1** today.

Thus, we will focus primarily on the features of **v2** in this guide.

Regardless of the **GRUB** version, a boot loader allows the user to:

* 1). modify the way the system behaves by specifying different kernels to use,
* 2). choose between alternate operating systems to boot, and
* 3). add or edit configuration stanzas to change boot options, among other things.

Today, **GRUB** is maintained by the **GNU** project and is well documented in their website. You are encouraged to use the [GNU official documentation][6] while going through this guide.

When the system boots you are presented with the following **GRUB** screen in the main console. Initially, you are prompted to choose between alternate kernels (by default, the system will boot using the latest kernel) and are allowed to enter a **GRUB** command line (with `c`) or edit the boot options (by pressing the `e` key).

![](http://www.tecmint.com/wp-content/uploads/2016/03/GRUB-Boot-Screen.png)
>GRUB Boot Screen

One of the reasons why you would consider booting with an older kernel is a hardware device that used to work properly and has started “acting up” after an upgrade (refer to [this link][7] in the AskUbuntu forums for an example).

The **GRUB v2** configuration is read on boot from `/boot/grub/grub.cfg` or `/boot/grub2/grub.cfg`, whereas `/boot/grub/grub.conf` or `/boot/grub/menu.lst` are used in **v1**. These files are NOT to be edited by hand, but are modified based on the contents of `/etc/default/grub` and the files found inside `/etc/grub.d`.

In a **CentOS 7**, here’s the configuration file that is created when the system is first installed:

```
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
```

In addition to the online documentation, you can also find the GNU GRUB manual using info as follows:

```
# info grub
```

If you’re interested specifically in the options available for /etc/default/grub, you can invoke the configuration section directly:

```
# info -f grub -n 'Simple configuration'
```

Using the command above you will find out that `GRUB_TIMEOUT` sets the time between the moment when the initial screen appears and the system automatic booting begins unless interrupted by the user. When this variable is set to `-1`, boot will not be started until the user makes a selection.

When multiple operating systems or kernels are installed in the same machine, `GRUB_DEFAULT` requires an integer value that indicates which OS or kernel entry in the GRUB initial screen should be selected to boot by default. The list of entries can be viewed not only in the splash screen shown above, but also using the following command:

### In CentOS and openSUSE:

```
# awk -F\' '$1=="menuentry " {print $2}' /boot/grub2/grub.cfg
```

### In Ubuntu:

```
# awk -F\' '$1=="menuentry " {print $2}' /boot/grub/grub.cfg
```

In the example shown in the below image, if we wish to boot with the kernel version **3.10.0-123.el7.x86_64** (4th entry), we need to set `GRUB_DEFAULT` to `3` (entries are internally numbered beginning with zero) as follows:

```
GRUB_DEFAULT=3
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Boot-System-with-Old-Kernel-Version.png)
>Boot System with Old Kernel Version

One final GRUB configuration variable that is of special interest is `GRUB_CMDLINE_LINUX`, which is used to pass options to the kernel. The options that can be passed through GRUB to the kernel are well documented in the [Kernel Parameters file][8] and in [man 7 bootparam][9].

Current options in my **CentOS 7** server are:

```
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet"
```

Why would you want to modify the default kernel parameters or pass extra options? In simple terms, there may be times when you need to tell the kernel certain hardware parameters that it may not be able to determine on its own, or to override the values that it would detect.

This happened to me not too long ago when I tried **Vector Linux**, a derivative of **Slackware**, on my 10-year old laptop. After installation it did not detect the right settings for my video card so I had to modify the kernel options passed through GRUB in order to make it work.

Another example is when you need to bring the system to single-user mode to perform maintenance tasks. You can do this by appending the word single to `GRUB_CMDLINE_LINUX` and rebooting:

```
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet single"
```

After editing `/etc/defalt/grub`, you will need to run `update-grub` (Ubuntu) or `grub2-mkconfig -o /boot/grub2/grub.cfg` (**CentOS** and **openSUSE**) afterwards to update `grub.cfg` (otherwise, changes will be lost upon boot).

This command will process the boot configuration files mentioned earlier to update `grub.cfg`. This method ensures changes are permanent, while options passed through GRUB at boot time will only last during the current session.

### Fixing Linux GRUB Issues

If you install a second operating system or if your GRUB configuration file gets corrupted due to human error, there are ways you can get your system back on its feet and be able to boot again.

In the initial screen, press `c` to get a GRUB command line (remember that you can also press `e` to edit the default boot options), and use help to bring the available commands in the GRUB prompt:

![](http://www.tecmint.com/wp-content/uploads/2016/03/Fix-Grub-Issues-in-Linux.png)
>Fix Grub Configuration Issues in Linux

We will focus on **ls**, which will list the installed devices and filesystems, and we will examine what it finds. In the image below we can see that there are 4 hard drives (`hd0` through `hd3`).

Only `hd0` seems to have been partitioned (as evidenced by msdos1 and msdos2, where 1 and 2 are the partition numbers and msdos is the partitioning scheme).

Let’s now examine the first partition on `hd0` (**msdos1**) to see if we can find GRUB there. This approach will allow us to boot Linux and there use other high level tools to repair the configuration file or reinstall GRUB altogether if it is needed:

```
# ls (hd0,msdos1)/
```

As we can see in the highlighted area, we found the `grub2` directory in this partition:

![](http://www.tecmint.com/wp-content/uploads/2016/03/Find-Grub-Configuration.png)
>Find Grub Configuration

Once we are sure that GRUB resides in (**hd0,msdos1**), let’s tell GRUB where to find its configuration file and then instruct it to attempt to launch its menu:

```
set prefix=(hd0,msdos1)/grub2
set root=(hd0,msdos1)
insmod normal
normal
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Find-and-Launch-Grub-Menu.png)
>Find and Launch Grub Menu

Then in the GRUB menu, choose an entry and press **Enter** to boot using it. Once the system has booted you can issue the `grub2-install /dev/sdX` command (change `sdX` with the device you want to install GRUB on). The boot information will then be updated and all related files be restored.

```
# grub2-install /dev/sdX
```

Other more complex scenarios are documented, along with their suggested fixes, in the [Ubuntu GRUB2 Troubleshooting guide][10]. The concepts explained there are valid for other distributions as well.

### Summary

In this article we have introduced you to GRUB, indicated where you can find documentation both online and offline, and explained how to approach an scenario where a system has stopped booting properly due to a bootloader-related issue.

Fortunately, GRUB is one of the tools that is best documented and you can easily find help either in the installed docs or online using the resources we have shared in this article.

Do you have questions or comments? Don’t hesitate to let us know using the comment form below. We look forward to hearing from you!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-basic-shell-scripting-and-linux-filesystem-troubleshooting/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: http://www.tecmint.com/linux-boot-process/
[4]: http://www.tecmint.com/linux-boot-process-and-manage-services/
[5]: http://www.tecmint.com/best-linux-log-monitoring-and-management-tools/
[6]: http://www.gnu.org/software/grub/manual/
[7]: http://askubuntu.com/questions/82140/how-can-i-boot-with-an-older-kernel-version
[8]: https://www.kernel.org/doc/Documentation/kernel-parameters.txt
[9]: http://man7.org/linux/man-pages/man7/bootparam.7.html
[10]: https://help.ubuntu.com/community/Grub2/Troubleshooting
