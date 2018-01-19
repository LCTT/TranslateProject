How To Boot Into Linux Command Line
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-boot-into-linux-command-line_orig.jpg)

There may be times where you need or want to boot up a [Linux][1] system without using a GUI, that is with no X, but rather opt for the command line. Whatever the reason, fortunately, booting straight into the Linux **command-line** is very simple. It requires a simple change to the boot parameter after the other kernel options. This change specifies the runlevel to boot the system into.

### ​Why Do This?

If your system does not run Xorg because the configuration is invalid, or if the display manager is broken, or whatever may prevent the GUI from starting properly, booting into the command-line will allow you to troubleshoot by logging into a terminal (assuming you know what you’re doing to start with) and do whatever you need to do. Booting into the command-line is also a great way to become more familiar with the terminal, otherwise, you can do it just for fun.

### ​Accessing GRUB Menu

On startup, you will need access to the GRUB boot menu. You may need to hold the SHIFT key down before the system boots if the menu isn’t set to display every time the computer is started. In the menu, the [Linux distribution][2] entry must be selected. Once highlighted, press ‘e’ to edit the boot parameters.

 [![zorin os grub menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnu-grub_orig.png)][3] 
 
 Older GRUB versions follow a similar mechanism. The boot manager should provide instructions on how to edit the boot parameters. 

### ​​Specify the Runlevel

​An editor will appear and you will see the options that GRUB parses to the kernel. Navigate to the line that starts with ‘linux’ (older GRUB versions may be ‘kernel’; select that and follow the instructions). This specifies parameters to parse into the kernel. At the end of that line (may appear to span multiple lines, depending on resolution), you simply specify the runlevel to boot into, which is 3 (multi-user mode, text-only).

 [![customize grub menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_orig.png)][4] 

Pressing Ctrl-X or F10 will boot the system using those parameters. Boot-up will continue as normal. The only thing that has changed is the runlevel to boot into.

​

This is what was started up:

 [![boot linux in command line](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_1_orig.png)][5] 

### Runlevels

You can specify different runlevels to boot into with runlevel 5 being the default one. 1 boots into “single-user” mode, which boots into a root shell. 3 provides a multi-user, command-line only system.

### Switch From Command-Line

At some point, you may want to run the display manager again to use a GUI, and the quickest way to do that is running this:
```
$ sudo init 5
```

And it is as simple as that. Personally, I find the command-line much more exciting and hands-on than using GUI tools; however, that’s just my preference.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/how-to-boot-into-linux-command-line

作者：[LinuxAndUbuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/linux
[2]:http://www.linuxandubuntu.com/home/category/distros
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnu-grub_orig.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_orig.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/runlevel_1_orig.png
