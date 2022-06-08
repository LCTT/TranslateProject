[#]: subject: "How to Boot Ubuntu 22.04 into Rescue / Emergency Mode"
[#]: via: "https://www.linuxtechi.com/boot-ubuntu-22-04-rescue-emergency-mode/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Boot Ubuntu 22.04 into Rescue / Emergency Mode
======
Hello geeks, booting Ubuntu 22.04 (Jammy Jellyfish) into rescue and emergency mode helps to reset the forgotten user password, fix the file system errors and disabling or enabling systemd service during boot.

In this post, we will learn how to boot Ubuntu 22.04 LTS system into rescue and emergency mode. Rescue mode is similar to single user mode where are all troubleshooting steps are executed. Rescue mode loads the minimal environment and mount root file system.

Whereas in emergency mode, we get the single user shell without starting any system services. So emergency mode is required when we can’t boot the system into rescue mode.

### Boot Ubuntu 22.04 into Rescue or Single User Mode

Head to target system which you want to boot into rescue or single user mode. At the boot press ‘SHIFT & ESC’ key to enter into grub bootloader screen.

![Default-Grub-Screen-Ubuntu-22-04][1]

Choose the first option Ubuntu and press ‘e’ to enter edit mode.

Go the end of line which starts with linux and delete the string ‘$vt_handoff’ and add the string ‘systemd.unit=rescue.target’

![rescue-target-ubuntu-22-04][2]

After making the changes, either press Ctrl+x or F10 to boot in rescue mode,

![Troubleshooting-Commands-in-Rescue-Mode][3]

Once you enter into rescue mode, run all troubleshooting commands and to reboot the system run ‘systemctl reboot’ command

### Alternate Way to Boot System into Rescue Mode

Reboot the system and press ‘ESC & Shift’ Key to go to grub boot screen.

Choose the 2nd option ‘Advanced Options for Ubuntu’ –> Choose recovery mode option and hit enter –> Choose Root (Drop to root shell prompt).

Example is show below

![Boot-Ubuntu-22-04-Rescue-Mode][4]

Once you have root shell, run commands to recover and fix the system issues and finally use ‘systemctl reboot’ to reboot the system.

### Boot Ubuntu 22.04 into Emergency Mode

To boot the system into emergency mode, first go to grub screen.

![Default-Grub-Screen-Ubuntu-22-04][5]

Select the first option as ‘Ubuntu’ and press ‘e’ to edit. Look for the line which starts with linux word, go to the end of that line, remove the string $vt_handoff and add the string ‘systemd.unit=emergency.target’

![Emergency-Mode-Ubuntu-22-04][6]

Press Ctrl+x or F10 to boot the system into emergency mode,

![Command-in-Emergency-Mode-Ubuntu-22-04][7]

Similarly in rescue mode, you can perform all the troubleshooting in this mode and once done reboot the system with command ‘systemctl reboot’.

That’s all from this post. I found it informative and don’t hesitate to share this among your technical friends. Kindly post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/boot-ubuntu-22-04-rescue-emergency-mode/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Default-Grub-Screen-Ubuntu-22-04.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/06/rescue-target-ubuntu-22-04.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Troubleshooting-Commands-in-Rescue-Mode.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Boot-Ubuntu-22-04-Rescue-Mode.gif
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Default-Grub-Screen-Ubuntu-22-04.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Emergency-Mode-Ubuntu-22-04.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Command-in-Emergency-Mode-Ubuntu-22-04.png
