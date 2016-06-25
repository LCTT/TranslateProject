name1e5s translating...
Getting started with ReactOS
==============================


ReactOS is a relatively new open source operating system that resembles the looks of Windows NT and aims to offer similar levels of functionality and application compatibility. Featuring a wine-based user mode, this system doesn't use any of the Unix architecture, but is a rewrite of the NT architecture from scratch, with its very own FAT32 implementation, and completely free of legal implications. That said, this is not yet another Linux distro, but a unique Windows-like system that is a part of the free software world. This quick guide aims at users who want an easy to use, open source replacement for their Windows system.


### System Installation

Before getting started with the installation process, I should point out that the minimum requirements of ReactOS are 500 MB of free disk space and only 96 MB of RAM. I will demonstrate the installation process on a 32-bit virtual machine.

Navigate with the arrow keys and select the desired language by pressing “Enter”.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_1.png)

Next, hit “Enter” again to continue with the installation, or “R” to repair an existing install.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_2.png)

On the third screen, you'll get a warning about the current limitation that applies to this early development version of the OS. Continue with “Enter” again and you'll get a summary of the settings before the final user approval. If all is good, hit “Enter” once again.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_3.png)

This will take you to the partitioning stage where you may delete the highlighted option by pressing “D”, and then add primary, extended, or logical partitions with “P”, “E”, and “L” respectively. If you choose to add a partition yourself, you will be given the option to set its size by entering a number of MBs and pressing “Enter” to confirm.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_4.png)

However, if you have already unused space available, hitting “Enter” once again during the partitioning stage will automatically install ReactOS in the selected partition.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_5.png)

The next step is the selection of the filesystem type which for now is limited to FAT32 only.


![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_6.png)

Next is the directory selection. I will leave this at the default “/ReactOS” and it should be fine.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_7.png)

...and we're off

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_8.png)

Finally, we're about the choose the location of the bootloader. The first option should be the safest if installing on a real disk.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_9.png)

In general, I could say that the installation of ReactOS is pretty straight forward. The interface may not look friendly or modern at all, but hitting “Enter” in every step will work just fine in most cases. That said, the development version of ReactOS it's fairly simple and easy to install.

### Setting Up ReactOS

Once we reboot and get into our new system, we're offered the help of the “Setup Wizard”. This wizard is basically allowing us to set up the language and keyboard layout settings.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_10.png)

I used this step to add a second keyboard layout.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_11.png)

I can even set a different key combination for changing the layout.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_12.png)

Then I add the username...

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_13.png)

...and an admin pass...

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_14.png)

After the time settings are also set, ReactOS finalizes its configuration.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_15.png)

### Inside ReactOS

When we finally enter ReactOS for the first time, new hardware is detected and we're offered to install the available drivers automatically.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_16.png)

These are the three devices that were automatically detected by ReactOS in my case:

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_17.png)

What you're looking at in the above screenshot is ReactOS's “applications manager” which is of course to the standards of Linux systems. You won't find anything Linux-related here, though. Only open source applications that are known to work well with the particular system are offered. That said, some categories are well populated, while others are completely empty.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_18.png)

I took the liberty to install Firefox through the software center, and Notepad++ by downloading the .exe file and installing it by simply double-clicking the executable. Both worked perfectly well, their desktop icons were created, menu entries added, and Notepad++ was added in the applications manager and in the right category as well.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_19.png)

I wouldn't try running any modern Windows games, but if you want to setup the Direct 3D settings you can go to “My Computer/Control Panel/WineD3D Options”. There you will find multiple options about the Direct3D which is presumably resembling dx version 8.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_20.png)

Another good thing with ReactOS is the fact that the Registry entries can be accessed and set as needed through “My Computer” again.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_21.png)

If you need something handier though, you may find a Registry Editor utility from the applications menu.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_22.png)

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_23.png)

Finally, if the looks of ReactOS look somewhat outdated to you, right click on the desktop and select “Properties”. Then choose the “Appearance” tab and set the theme and color that you prefer.

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_24.png)

### Conclusion

Honestly, I was impressed by the way ReactOS works. It's quite solid, coherent, speedy, and really user-friendly. Leaving aside the negatives that stem from the Windows design (deprecated applications menu, irrational directory structure), ReactOS is almost perfect on what it does. It may not be very rich in terms of application selection, and it may not be very powerful in terms of features yet, but I am sure it's going to flourish. The numbers show great popularity, and I'm sure the community that's going to build up around it will soon be large enough to lead the project to success. Right now, version 0.4.1 looks promising to say the least. If you care about running Windows applications and doing so in an open way, give it a try!


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/getting-started-with-reactos/

作者：[Bill Toulas][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/getting-started-with-reactos/

