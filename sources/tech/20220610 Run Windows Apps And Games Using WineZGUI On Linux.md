[#]: subject: "Run Windows Apps And Games Using WineZGUI On Linux"
[#]: via: "https://ostechnix.com/winezgui-run-windows-apps-and-games-on-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Run Windows Apps And Games Using WineZGUI On Linux
======
WineZGUI - A Wine GUI Frontend Using Zenity

A while ago we wrote about **[Bottles][1]**, an opensource graphical application easily to run Windows software and Games on Linux operating systems. Today, we will discuss about a similar interesting project. Say hello to **WineZGUI**, a Wine GUI frontend to **[run windows apps and games with wine on Linux][2]**.

#### Contents

1. What Is WineZGUI?
2. Bottles Vs WineZGUI
3. How To Install WineZGUI In Linux
4. Run Windows Apps And Games With WineZGUI In Linux
5. Conclusion

### What Is WineZGUI?

WineZGUI is a collection of Bash scripts that allows you to easily manage wine prefixes and provides easier wine gaming experience on Linux using **Zenity**.

Using WineZGUI, we can directly launch the Windows exe files or games from File manager without installing them.

WineZGUI creates shortcut for each application or game for easier access and also creates separate prefixes for each exe binary file.

When you launch a Windows exe file with WineZGUI, it will prompt you whether to use the default wine prefix or create a new one. The default prefix is `~/.local/share/winezgui/default`.

If you choose to create a new prefix for the windows binary or exe, WineZGUI will try to extract the product name and icon from the exe file and it creates a desktop shortcut.

When you launch the same exe or binary file later, it will recommend you to run it with the associated prefix earlier.

To put this layman terms, WineZGUI is simply a Wine and winetricks simple GUI for official vanilla wine. Wine prefix setup is automatic when we launch an exe to play a game.

You simply open an exe and it creates a prefix and a desktop shortcut with name and icon extracted from that exe.

It uses **exiftool** and **icotool** utilities to extract the name and icon respectively. Either you can open an exe to launch that game from existing prefix, or use desktop shortcut.

WineZGUI is a shell script that is freely hosted in GitHub. You can grab the source code, improve it, fix bugs and add features.

### Bottles Vs WineZGUI

You might wonder how does WineZGUI compare with Bottles. There is a subtle difference between these applications though.

**Bottles is prefix oriented** and **runner oriented**. Meaning - Bottles first creates a prefix then use different exe files with it. Bottles does not remember exe's prefix. Bottles uses different runners.

**WineZGUI is exe oriented**. It uses exe to create one prefix for that exe only. Next time we open an exe, it will ask whether to launch with existing exe prefix.

WineZGUI does not offer advanced features like **bottles** or **[lutris][3]** do, like runners, online installers, etc.

### How To Install WineZGUI In Linux

Make sure you have installed the necessary prerequisites for WineZGUI.

**Debian/Ubuntu:**

```
$ sudo dpkg --add-architecture i386
$ sudo apt install zenity wine winetricks libimage-exiftool-perl icoutils gnome-terminal
```

**Fedora:**

```
$ sudo dnf install zenity wine winetricks perl-Image-ExifTool icoutils gnome-terminal
```

The officially recommended way to install WineZGUI is by using **[Flatpak][4]**.

After installing Flatpak, run the following commands one by one to install WineZGUI in Linux.

```
$ flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

```
$ flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-21.08
```

```
$ wget https://github.com/fastrizwaan/WineZGUI-Releases/releases/download/WineZGUI-0.4_20220608/io.github.WineZGUI_0_4_20220608.flatpak
```

```
$ flatpak --user -y install io.github.WineZGUI_0_4_20220608.flatpak
```

### Run Windows Apps And Games With WineZGUI In Linux

Launch WineZGUI from Dash or Menu.

![Launch WineZGUI][5]

This is how the default interface of WineZGUI looks like.

![WineZGUI Interface][6]

As you can see in the above screenshot, WineZGUI interface is very simple and easy to understand. From the main window, you can,

* Open an EXE file,
* Open Winetricks GUI and CLI,
* Launch Wine configuration,
* Launch explorer,
* Open BASH shell,
* Kill all apps/games including WineZGUI interface,
* Delete wine prefix,
* View installed WineZGUI version.

For the purpose of the demonstration, I am going to open an .exe file.

In the next window, choose the EXE file to run. In my case, it is WinRAR.

![Choose The EXE File To Run][7]

Next, whether you want to run the EXE file with default prefix or create a new prefix. I choose default prefix.

![Run WinRAR With Default Prefix][8]

A few seconds later, the WinRAR setup wizard will appear. Click Install to continue.

![Install WinRAR In Linux][9]

Click OK to complete the WinRAR installation.

![Complete WinRAR Installation][10]

Click "Run WinRAR" to launch it.

![Run WinRAR][11]

Here is WinRAR running in my Fedora 36 desktop!

![WinRAR Is Running In Fedora Using Wine][12]

### Conclusion

WineZGUI is a newcomer to the club. If you're looking for an easier way to run Windows apps and games using Wine on a Linux desktop, WineZGUI might be a good choice.

With the help of WineZGUI, the users have an option to create a wine prefix right at same folder as the `.exe` and creating a relatively-linked `.desktop` entry to automatically do so.

The reason being that it's easier to back up and delete a game along with the wine prefix, and having it generate a `.desktop` would make it resilient to being moved and transferred.

A cool use-case would be to setup using the app, then share the wine prefix to your friend and others who just want a working wine prefix with all the dependencies, saves, etc.

Give it a try and let us know what do you think about this project in the comment section below.

**Resource:**

* [WineZGUI GitHub Repository][13]

--------------------------------------------------------------------------------

via: https://ostechnix.com/winezgui-run-windows-apps-and-games-on-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/run-windows-software-on-linux-with-bottles/
[2]: https://ostechnix.com/run-windows-games-softwares-ubuntu-16-04/
[3]: https://ostechnix.com/manage-games-using-lutris-linux/
[4]: https://ostechnix.com/how-to-install-and-use-flatpak-in-linux/
[5]: https://ostechnix.com/wp-content/uploads/2022/06/Launch-WineZGUI.png
[6]: https://ostechnix.com/wp-content/uploads/2022/06/WineZGUI-Interface.png
[7]: https://ostechnix.com/wp-content/uploads/2022/06/Choose-The-EXE-File-To-Run.png
[8]: https://ostechnix.com/wp-content/uploads/2022/06/Run-WinRAR-With-Default-Prefix.png
[9]: https://ostechnix.com/wp-content/uploads/2022/06/Install-WinRAR-In-Linux.png
[10]: https://ostechnix.com/wp-content/uploads/2022/06/Complete-WinRAR-Installation.png
[11]: https://ostechnix.com/wp-content/uploads/2022/06/Run-WinRAR.png
[12]: https://ostechnix.com/wp-content/uploads/2022/06/WinRAR-Is-Running-In-Fedora-Using-Wine.png
[13]: https://github.com/fastrizwaan/WineZGUI
