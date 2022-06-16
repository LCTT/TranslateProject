[#]: subject: "How I gave my old laptop new life with the Linux Xfce desktop"
[#]: via: "https://opensource.com/article/22/6/linux-xfce-old-laptop"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "lightchaserhy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I gave my old laptop new life with the Linux Xfce desktop
======
While I installed Linux to use my laptop for a few demos at a conference, I found Linux and the Xfce desktop made this old laptop feel quite snappy.

![Person drinking a hat drink at the computer][1]

Image by: [Jonas Leupe][2] on [Unsplash][3]

A few weeks ago, I needed to give a conference presentation that included a brief demonstration of a small app I'd written for Linux. I needed a Linux laptop to bring to the conference, so I dug out an old laptop and installed Linux on it. I used the [Fedora 36 Xfce spin][4], which worked great.

The laptop I used was purchased in 2012. The 1.70 GHz CPU, 4 GB memory, and 128 GB drive may seem small compared to my current desktop machine, but Linux and the Xfce desktop gave this old machine new life.

### Xfce desktop for Linux

The [Xfce desktop][5] is a lightweight desktop that provides a sleek, modern look. The interface is familiar, with a taskbar or “panel” across the top to launch applications, change between virtual desktops, or access notifications in the system tray. The quick access dock at the bottom of the screen lets you launch frequently used applications like the terminal, file manager, and web browser.

![Image of Xfce desktop][6]

To start a new application, click the Applications button in the upper-left corner. This opens a menu of application launchers, with the most frequently used applications like the terminal and file manager at the top. Other applications are organized into groups, so you can navigate to the one you want.

![Image of desktop applications][7]

### Managing files

Xfce's file manager is called Thunar, and it does a great job of organizing my files. I like that Thunar can also make connections to remote systems. At home, I use a Raspberry Pi using SSH as a [personal file server][8]. Thunar lets me open an SSH file transfer window so I can copy files between my laptop and the Raspberry Pi.

![Image of Thunar remote][9]

Another way to access files and folders is via the quick access dock at the bottom of the screen. Click the folder icon to bring up a menu of common actions such as opening a folder in a terminal window, creating a new folder, or navigating into a specific folder.

![Image of desktop with open folders][10]

### Other applications

I loved exploring the other applications provided in Xfce. The Mousepad text editor looks like a simple text editor, but it contains useful features for editing more than just plain text. Mousepad recognizes many file types that programmers and other power users may appreciate. Check out this partial list of programming languages available in the Document menu.

![Image of Mousepad file types][11]

If you prefer a different look and feel, you can adjust the interface options such as font, color scheme, and line numbers using the View menu.

![Image of Mousepad in color scheme solarized][12]

The disk utility lets you manage storage devices. While I didn't need to modify my system disk, the disk tool is a great way to initialize or reformat a USB flash drive. I found the interface very easy to use.

![Image of disk utility][13]

I was also impressed with the Geany integrated development environment. I was a bit surprised that a full IDE ran so well on an older system. Geany advertises itself as a “powerful, stable and lightweight programmer's text editor that provides tons of useful features without bogging down your workflow.” And that's exactly what Geany provided.

I started a simple “hello world” program to test out Geany, and was pleased to see that the IDE popped up syntax help as I typed each function name. The pop-up message is unobtrusive and provides just enough syntax information where I need it. While the `printf` function is easy for me to remember, I always forget the order of options to other functions like `fputs` and `realloc`. This is where I need the pop-up syntax help.

![Image of Geany workspace][14]

Explore the menus in Xfce to find other applications to make your work easier. You'll find apps to play music, access the terminal, or browse the web.

While I installed Linux to use my laptop for a few demos at a conference, I found Linux and the Xfce desktop made this old laptop feel quite snappy. The system performed so well that when the conference was over, I decided to keep the laptop around as a second machine.

I just love working in Xfce and using the apps. Despite the low overhead and minimal approach, I don't feel underpowered. I can do everything I need to do using Xfce and the included apps. If you have an older machine that needs new life, try installing Linux to bring new life to old hardware.

Image by: (Jim Hall, CC BY-SA 40)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-xfce-old-laptop

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://spins.fedoraproject.org/xfce/download/index.html
[5]: https://opensource.com/article/19/12/xfce-linux-desktop
[6]: https://opensource.com/sites/default/files/2022-06/Linuxlaptop1.png
[7]: https://opensource.com/sites/default/files/2022-06/linuxlaptopDesktopApps.png
[8]: https://opensource.com/article/20/3/personal-file-server-ssh
[9]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopThunarremote.png
[10]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopDesk.png
[11]: https://opensource.com/sites/default/files/2022-06/LinuxlaptopMousepadfiletype.png
[12]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopmousepadsolarized.png
[13]: https://opensource.com/sites/default/files/2022-06/linuxlaptopdisks.png
[14]: https://opensource.com/sites/default/files/2022-06/Linuxlaptopgeany.png
