[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run your favorite Windows applications on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-wine)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Run your favorite Windows applications on Linux
======
WINE is an open source project that helps many Windows applications run
on Linux as if they were native programs.
![Computer screen with files or windows open][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Here's how switching from Windows to Linux can be made seamless with WINE.

Do you have an application that only runs on Windows? Is that one application the one and only thing holding you back from switching to Linux? If so, you'll be happy to know about WINE, an open source project that has all but reinvented key Windows libraries so that applications compiled for Windows can run on Linux.

WINE stands for "Wine Is Not an Emulator," which references the code driving this technology. Open source developers have worked since 1993 to translate any incoming Windows API calls an application makes to [POSIX][2] calls.

This is an astonishing feat of programming, especially given that the project operated independently, with no help from Microsoft (to say the least), but there are limits. The farther an application strays from the "core" of the Windows API, the less likely it is that WINE could have anticipated its requests. There are vendors that may make up for this, notably [Codeweavers][3] and [Valve Software][4]. There's no coordination between the producers of the applications requiring translation and the people and companies doing the translation, so there can be some lag time between, for instance, an updated software title and when it earns a "gold" status from [WINE headquarters][5].

However, if you're looking to run a well-known Windows application on Linux, the chances are good that WINE is ready for it.

### Installing WINE

You can install WINE from your Linux distribution's software repository. On Fedora, CentOS Stream, or RHEL:


```
`$ sudo dnf install wine`
```

On Debian, Linux Mint, Elementary, and similar:


```
`$ sudo apt install wine`
```

WINE isn't an application that you launch on its own. It's a backend that gets invoked when a Windows application is launched. Your first interaction with WINE will most likely occur when you launch the installer of a Windows application.

### Installing an application

[TinyCAD][6] is a nice open source application for designing circuits, but it's only available for Windows. While it is a small application, it does incorporate some .NET components, so that ought to stress test WINE a little.

First, download the installer for TinyCAD. As is often the case for Windows installers, it's a `.exe` file. Once downloaded, double-click the file to launch it.

![WINE TinyCAD installation wizard][7]

WINE installation wizard for TinyCAD

Step through the installer as you would on Windows. It's usually best to accept the defaults, especially where WINE is concerned. The WINE environment is largely self-contained, hidden away on your hard drive in a **drive_c** directory that gets used by a Windows application as the fake root directory of the file system.

![WINE TinyCAD installation and destination drive][8]

WINE TinyCAD destination drive

Once it's installed, the application usually offers to launch for you. If you're ready to test it out, launch the application.

### Launching a Windows application

Aside from the first launch immediately after installation, you normally launch a WINE application the same way as you launch a native Linux application. Whether you use an applications menu or an Activities screen or just type the application's name into a runner, desktop Windows applications running in WINE are treated essentially as native applications on Linux.

![TinyCAD running with WINE][9]

TinyCAD running with WINE support

### When WINE fails

Most applications I run in WINE, TinyCAD included, run as expected. There are exceptions, however. In those cases, you can either wait a few months to see whether WINE developers (or, if it's a game, Valve Software) manage to catch up, or you can contact a vendor like Codeweavers to find out whether they sell support for the application you require.

### WINE is cheating, but in a good way

Some Linux users feel that if you use WINE, you're "cheating" on Linux. It might feel that way, but WINE is an open source project that's enabling users to switch to Linux and still run required applications for their work or hobbies. If WINE solves your problem and lets you use Linux, then use it, and embrace the flexibility of Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-wine

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://www.codeweavers.com/crossover
[4]: https://github.com/ValveSoftware/Proton
[5]: http://winehq.org
[6]: https://sourceforge.net/projects/tinycad/
[7]: https://opensource.com/sites/default/files/wine-tinycad-install.jpg
[8]: https://opensource.com/sites/default/files/wine-tinycad-drive_0.jpg
[9]: https://opensource.com/sites/default/files/wine-tinycad-running.jpg
