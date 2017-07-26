 Vic020

Install Linux Kernel 4.12 (Stable) on Linux Mint
============================================================

![Install Linux Kernel 4.12 (Stable) on Linux Mint](https://mintguide.org/uploads/tux_system.jpg)

**Linus Torvalds** introduced the **[Linux][5] [kernel][6] 4.12**. You can download the relevant **deb**packages from **[HERE][7]** and install them. Or just follow the instructions given below that will help you to install a new kernel.

 _**Warning. The [Linux][1] [kernel][2] is a critical element of the system. To do the upgrade costs when one of your hardware devices is not working properly, and the new kernel may fix this problem. But at the same time installing a new kernel unnecessarily can lead to undesirable regressions, such as: no network connection, no sound or even the inability to boot the system, so install a new kernel on your own risk.**_ 

The easiest way to install any kernel - program [UKUU][8]Install UKUU on **[Linux Mint][9].**

```
TerminalShekin@mylinuxmintpc~$sudo apt-add-repository -y ppa:teejee2008/ppa 
sudo apt-get update
sudo apt-get install ukuu
```

**Reminder  _to users of computers with [Nvidia][3]/AMD. Before installing the kernel, it is advisable to switch to the free driver._** 

**If you decide to delete the kernel 4.12,**

1. When the computer boots, the [GRUB][12] menu, select your old kernel. After booting the system, remove the new kernel by command below
2. Use program [UKUU][13] or command:
```
TerminalShekin@mylinuxmintpc~$sudo apt purge linux-image-4.12-*
```
3. And update **GRUB** or **[BURG][10]**
```
TerminalShekin@mylinuxmintpc~$sudo update-grub
```
To return to the previous kernel when booting **Grub** select **Previous Linux versions**
Good Luck!!!
[kernel.org][14]

--------------------------------------------------------------------------------

via: https://mintguide.org/system/798-install-linux-kernel-4-12-stable-on-linux-mint.html

作者：[Shekin ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://mintguide.org/user/Shekin/
[1]:https://mintguide.org/
[2]:https://mintguide.org/tags/kernel/
[3]:https://mintguide.org/tags/nvidia/
[4]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35rZXJuZWwtcHBhL21haW5saW5lL3Y0LjEyLw%3D%3D
[5]:https://mintguide.org/
[6]:https://mintguide.org/tags/kernel/
[7]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35rZXJuZWwtcHBhL21haW5saW5lL3Y0LjEyLw%3D%3D
[8]:https://mintguide.org/tools/691-ukuu-ubuntu-kernel-upgrade-utility.html
[9]:https://mintguide.org/
[10]:https://mintguide.org/effects/716-burg-graphical-bootloader-install-to-linux-mint.html
[11]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly93d3cua2VybmVsLm9yZy8%3D
[12]:https://mintguide.org/tools/37-restore-grub-boot-loader-in-linux-mint-after-installation-reinstallation-windows.html
[13]:https://mintguide.org/tools/691-ukuu-ubuntu-kernel-upgrade-utility.html
[14]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly93d3cua2VybmVsLm9yZy8%3D
[15]:https://mintguide.org/system/
