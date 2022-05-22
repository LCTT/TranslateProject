[#]: subject: "How To Boot Into Rescue Mode Or Emergency Mode In Ubuntu 22.04 / 20.04 / 18.04"
[#]: via: "https://ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Boot Into Rescue Mode Or Emergency Mode In Ubuntu 22.04 / 20.04 / 18.04
======
This tutorial explains how to boot into **rescue mode** or **emergency mode**in Ubuntu 22.04, 20.04 and 18.04 LTS editions.

As you might already know, **Runlevels** are replaced with **Systemd targets** in many Linux distributions such as RHEL 7 / RHEL 8 and Ubuntu 16.04 LTS and newer versions. For more details about runlevels and systemd target, refer to [this guide][1].

This guide is specifically written for Ubuntu, however the steps given below should work on most Linux distributions that use **Systemd** as the default service manager.

Before getting into the topic, let us have a brief understanding about what is rescue mode and emergency mode and what is the purpose of these both modes.

### What Is Rescue Mode?

The **rescue mode** is equivalent to **single user mode** in Linux distributions that use **SysV** as the default service manager. In rescue mode, all local filesystems will be mounted, only some important services will be started. However, no normal services (E.g network services) won't be started.

The rescue mode is helpful in situations where the system can't boot normally. Also, we can perform some important rescue operations, such as [reset root password][2], in rescue mode.

### What Is Emergency Mode?

In contrast to the rescue mode, nothing is started in the **emergency mode**. No services are started, no mount points are mounted, no sockets are established, nothing. All you will have is just a **raw shell**. Emergency mode is suitable for debugging purposes.

First, we will see how to boot into rescue mode and emergency mode in Ubuntu 22.04 and 20.04 LTS distributions. The procedure for entering rescue mode in Ubuntu 22.04 and 20.04 LTS is exactly the same!

### Boot Into Rescue Mode In Ubuntu 22.04 / 20.04 LTS

We can boot into rescue mode in two ways.

#### Method 1

Power on your Ubuntu system. Hit the ESC key right after the BIOS logo disappears to display the Grub menu.

In the GRUB menu, choose the first entry and press **"e"** to edit it.

![GRUB Menu In Ubuntu 22.04 / 20.04 LTS][3]

Hit the DOWN arrow and find the line that starts with the word **"linux"** and add the following line at the end of it. To reach the end, just press **CTRL+e** or use the **END** key or **LEFT/RIGHT** arrows in your keyboard.

```
systemd.unit=rescue.target
```

![Edit Grub Boot Menu Entries To Enter Into Rescue Mode In Ubuntu 22.04 / 20.04 LTS][4]

After adding the above line, hit **Ctrl+x** or**F10** to boot into rescue mode.

After a few seconds, you will be landed in the rescue mode (single user mode) as root user. You will be prompted to press ENTER to enter the maintenance mode.

Here is how rescue mode looks like in Ubuntu 22.04 / 20.04 LTS systems:

![Boot Into Rescue Mode In Ubuntu 22.04 / 20.04 LTS][5]

Now do whatever you want to do in the rescue mode. You may need to mount the root (**/**) file system in read/write mode before doing any operations in rescue mode.

```
mount -n -o remount,rw /
```

![Mount Root File System In Read Write Mode In Ubuntu 22.04 / 20.04 LTS][6]

Once done, press **"Ctrl+d"** to boot into normal mode. Alternatively, you can type any one of the following commands to boot into normal mode.

```
systemctl default
```

Or,

```
exit
```

If you want to reboot the system instead of booting into normal mode, enter:

```
systemctl reboot
```

#### Method 2

In this method, you don't need to edit the grub boot menu entries.

Power on the system and choose **"Advanced options for Ubuntu"** from the Grub boot menu.

![Choose Advanced Options For Ubuntu From Grub Boot Menu][7]

Next, you will see the list of available Ubuntu versions with Kernel versions. Choose the **"Recovery mode"** in the grub boot menu in Ubuntu.

![Choose Recovery Mode In Grub Boot Menu In Ubuntu 22.04 / 20.04 LTS][8]

After a few seconds, you will see the Ubuntu recovery menu. From the recovery menu, choose **"Drop to root shell prompt"** option and hit the ENTER key.

![Enter Into Root Shell Prompt In Ubuntu 22.04 / 20.04 LTS][9]

Now you will be landed in the rescue mode.

![Ubuntu Maintenance Mode][10]

Mount the root (**/**) file system in read/write mode by entering the following command:

```
mount -n -o remount,rw /
```

![Mount Root File System In Read Write Mode In Ubuntu][11]

Do whatever you want to do in the rescue mode.

Once done, type exit to return back to the recovery menu.

```
exit
```

Finally, choose **"Resume normal boot"** option and hit the ENTER key.

![Boot Into Normal Mode In Ubuntu][12]

Press ENTER key again to exit recovery mode and continue booting into normal mode.

![Exit The Recovery Mode In Ubuntu][13]

If you don't want to boot into normal mode, type **"reboot"** and press ENTER from the maintenance mode to restart your system.

### Boot Into Emergency Mode In Ubuntu 22.04 / 20.04 LTS

When the GRUB boot menu appears, press **"e"** to edit it.

![GRUB Menu In Ubuntu 22.04 / 20.04 LTS][14]

Find the line that starts with the word **"linux"** and add the following line at the end of it.

```
systemd.unit=emergency.target
```

![Edit Grub Boot Menu Entries To Enter Into Emergency Mode In Ubuntu 22.04 / 20.04 LTS][15]

After adding the above line, hit **Ctrl+x** or**F10** to boot into emergency mode.

After a few seconds, you will be landed in the emergency mode as `root` user. You will be prompted to press ENTER to enter the maintenance mode.

Here is how emergency mode looks like in Ubuntu 22.04 / 20.04 LTS system:

![Boot Into Emergency Mode In Ubuntu 22.04 / 20.04 LTS][16]

Now do whatever you want to do in the emergency mode. You may need to mount the root (**/**) file system in read/write mode before doing any operations in this mode.

```
mount -n -o remount,rw /
```

Once done, press **"Ctrl+d"** to boot into normal mode. Alternatively, you can type any one of the following commands to boot into normal mode.

```
systemctl default
```

Or,

```
exit
```

If you want to reboot the system instead of booting into normal mode, enter:

```
systemctl reboot
```

### Boot Into Rescue Mode In Ubuntu 18.04 LTS

Boot your Ubuntu system. When the Grub menu appears, choose the first entry and press **e** to edit. (To reach the end, just press **CTRL+e** or use the END key or LEFT/RIGHT arrows in your keyboard):

![Grub Menu][17]

If you don't see the Grub menu, just hit ESC key right after the BIOS logo disappears.

Find the line that starts with word **"linux"**and add the following line at the end of that line (To reach the end, just press **CTRL+e** or use the END key or LEFT/RIGHT arrows in your keyboard):

```
systemd.unit=rescue.target
```

![Edit Grub Menu][18]

Once you added the above line, just press **CTRL+x** or **F10** to continue to boot into rescue mode. After a few seconds, you will be landed in the rescue mode (single user mode) as root user.

Here is how rescue mode looks like in Ubuntu 18.04 LTS server:

![Ubuntu Rescue Mode][19]

Next, type the following command to mount root (**/**) file system into read/write mode.

```
mount -n -o remount,rw /
```

### Boot Into Emergency Mode

Booting your Ubuntu into emergency is as same as above method. All you have to do is replace **"systemd.unit=rescue.target"** with **"systemd.unit=emergency.target"** when editing grub menu.

![Edit Grub Menu][20]

Once you added "systemd.unit=emergency.target", press **Ctrl+x** or **F10** to continue booting into emergency mode.

![Ubuntu Emergency Mode][21]

Finally, you can mount root filesystem into read/write mode with command:

```
mount -n -o remount,rw /
```

### Switch Between Rescue And Emergency Modes

If you are in rescue mode, you don't have to edit the grub boot entry as I mentioned above. Instead, just type the following command to switch to emergency mode instantly:

```
systemctl emergency
```

Similarly, to switch from emergency to rescue mode, type:

```
systemctl rescue
```

### Conclusion

You know now what is rescue and emergency modes and how to boot into those modes in Ubuntu 22.04, 20.04 and 18.04 LTS systems. Like I already mentioned, the steps provided here will work on many recent Linux versions that uses Systemd.

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/check-runlevel-linux/
[2]: https://ostechnix.com/how-to-reset-or-recover-root-user-password-in-linux/
[3]: https://ostechnix.com/wp-content/uploads/2022/05/GRUB-Menu-In-Ubuntu-22.04-LTS.png
[4]: https://ostechnix.com/wp-content/uploads/2022/05/Edit-Grub-Boot-Menu-Entries-To-Enter-Into-Rescue-Mode-In-Ubuntu-22.04-LTS.png
[5]: https://ostechnix.com/wp-content/uploads/2022/05/Boot-Into-Rescue-Mode-In-Ubuntu-22.04.png
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Mount-Root-File-System-In-Read-Write-Mode-In-Ubuntu.png
[7]: https://ostechnix.com/wp-content/uploads/2022/05/Choose-Advanced-Options-For-Ubuntu-From-Grub-Boot-Menu.png
[8]: https://ostechnix.com/wp-content/uploads/2022/05/Choose-Recovery-Mode-In-Grub-Boot-Menu-In-Ubuntu.png
[9]: https://ostechnix.com/wp-content/uploads/2022/05/Enter-Into-Root-Shell-Prompt-In-Ubuntu.png
[10]: https://ostechnix.com/wp-content/uploads/2022/05/Ubuntu-Maintenance-Mode.png
[11]: https://ostechnix.com/wp-content/uploads/2022/05/Mount-Root-File-System-In-Read-Write-Mode-In-Ubuntu-1.png
[12]: https://ostechnix.com/wp-content/uploads/2022/05/Boot-Into-Normal-Mode-In-Ubuntu.png
[13]: https://ostechnix.com/wp-content/uploads/2022/05/Exit-The-Recovery-Mode-In-Ubuntu.png
[14]: https://ostechnix.com/wp-content/uploads/2022/05/GRUB-Menu-In-Ubuntu-22.04-LTS.png
[15]: https://ostechnix.com/wp-content/uploads/2022/05/Edit-Grub-Boot-Menu-Entries-To-Enter-Into-Emergency-Mode-In-Ubuntu.png
[16]: https://ostechnix.com/wp-content/uploads/2018/12/Boot-Into-Emergency-Mode-In-Ubuntu-20.04-LTS.png
[17]: https://ostechnix.com/wp-content/uploads/2018/12/Grub-menu.png
[18]: https://ostechnix.com/wp-content/uploads/2018/12/Edit-grub-menu.png
[19]: https://ostechnix.com/wp-content/uploads/2018/12/Ubuntu-rescue-mode.png
[20]: https://ostechnix.com/wp-content/uploads/2018/12/emergency-mode.png
[21]: https://ostechnix.com/wp-content/uploads/2018/12/emergency-mode-1.png
