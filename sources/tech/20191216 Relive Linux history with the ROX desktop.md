[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Relive Linux history with the ROX desktop)
[#]: via: (https://opensource.com/article/19/12/linux-rox-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Relive Linux history with the ROX desktop
======
This article is part of a special series of 24 days of Linux desktops.
If you're looking for a fun trip back in time, the ROX desktop is well
worth a go.
![Person typing on a 1980's computer][1]

The [ROX][2] desktop is no longer being actively developed, but its legacy resounds today, and even when it was active, it was a unique take on what a Linux desktop could be. While other desktops felt roughly similar to old Unix or Windows interfaces, ROX belongs solidly in the BeOS, AmigaOS, and [RISC OS][3] desktop camps.

It focuses on drag-and-drop actions (which makes its accessibility non-optimal for some users), point-and-click actions, pop-up contextual menus, and a unique system of app directories for running local applications with no installation required.

### Installing ROX

Today, ROX is mostly abandoned and left in fragments that the user is left to sort out. Luckily, the puzzle is relatively easy to solve, but don't get confused when you find bits and pieces of the ROX desktop in your distribution's repository—but not _every_ bit of the ROX desktop. The popular parts of ROX—the file manager ([ROX-Filer][4]) and the terminal ([ROXTerm][5])—seem to have endured in most of the popular distribution repositories, and you can install (and use) them as standalone applications. However, to run the ROX desktop, you must also install ROX-Session and the libraries it depends on.

I installed ROX on Slackware 14.2, but it should work on any Linux or BSD system.

First, you must install [ROX-lib2][6] from its repository. True to its philosophy of minimal installs, all you have to do to install ROX-lib2 is download the tarball, [unarchive it][7], and move the **ROX-Lib** directory to **/usr/local/lib**.

Next, you have to install [ROX-Session][8]. This probably needs to be compiled from source code, as it's not likely to be in your software repository. The compile process requires build tools, which ship by default on Slackware but are often omitted in other distributions to save space on the initial download. The names of the packages you must install to build from source code vary depending on your distro, so refer to the documentation for specifics. For example, on Debian-based distributions, you can learn about build requirements in [Debian's wiki][9], and on Fedora-based distributions, refer to [Fedora's docs][10]. Once you have the build tools installed, execute the custom ROX-Session build script:


```
`$ ./AppRun`
```

This manages its own build and installation and prompts you for root permissions to add itself as an option on your login screen.

If you have not installed ROX-Filer from your software repository, do that before continuing.

Together, these components create a complete ROX desktop. To log into your new desktop, log out of your current desktop session. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With SDDM:

![][11]

With GDM:

![][12]

### ROX desktop features

The ROX desktop is simple by default, with a single panel at the bottom of the screen and a shortcut icon to your home directory on the desktop. The panel contains shortcuts to common locations. That's all there is to the ROX desktop, at least as it's configured out of the box. If you want a clock or a calendar or a system tray, you need to find applications that provide them.

![Default ROX desktop][13]

There is no taskbar, as such, but when you minimize a window, it becomes a temporary icon on your desktop. You can click the icon to bring its window back to its former size and placement.

The panel can be modified some, as well. You can place different shortcuts into it and even create your own applets.

There's no application menu, either, nor are there shortcuts to applications in a contextual menu. Instead, you can navigate manually to **/usr/share/applications**, or you can add your application directory or directories to the ROX panel.

![ROX desktop][14]

The ROX desktop's workflow concentrates on being mouse-driven, reminiscent of Mac OS 7.5 and 8. With ROX-filer, you can manage permissions, file management, introspection, script launching, background setting, and nearly anything else you can think of, provided that you're patient enough for the point-and-click style of interaction. For power users, this seems slow, but ROX manages to make it relatively painless and very intuitive.

### App directories, AppRun, and AppImage

The ROX desktop has an elegant convention by which a directory containing a script named **AppRun** is executed as if it were an application. This means that in order to make a ROX app, all you have to do is compile code into a directory, place a script called **AppRun** at the root of that directory to execute the binary you've compiled, and then mark the directory executable. ROX-Filer displays a directory configured in the manner you set with a special icon and color. When you click on an app directory, ROX-Filer automatically runs the **AppRun** script inside. It looks and behaves exactly like an application that has been installed, but it's local to the user's home directory and requires no special permissions.

This is a convenience feature, but it's one of those small features that feels great when you use it because it's so easy to implement. It's by no means essential, and it's only a few steps ahead of building an application locally, hiding the directory somewhere out of the way, and drumming up a quick **.desktop** file to act as your launcher. However, the concept of an application directory has been [cited][15] as an inspiration for the [AppImage][16] packaging system.

### Why you should try ROX desktop

Getting ROX set up and usable is somewhat difficult, and it appears to truly be abandoned. However, its legacy lives on in many ways today, and it's a fascinating and fun bit of Linux history. It may not become your primary desktop, but if you're looking for a fun trip back in time, then ROX is well worth a go. Explore it, customize it, and see what clever ideas it contains. There may yet be hidden gems that the open source community can benefit from.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-rox-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: http://rox.sourceforge.net/desktop/
[3]: https://www.riscosopen.org/content/
[4]: http://rox.sourceforge.net/desktop/ROX-Filer
[5]: http://roxterm.sourceforge.net/
[6]: http://rox.sourceforge.net/desktop/ROX-Lib
[7]: https://opensource.com/article/17/7/how-unzip-targz-file
[8]: http://rox.sourceforge.net/desktop/ROX-Session.html
[9]: https://wiki.debian.org/BuildingTutorial
[10]: https://docs.pagure.org/docs-fedora/installing-software-from-source.html
[11]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[12]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[13]: https://opensource.com/sites/default/files/uploads/advent-rox.jpg (Default ROX desktop)
[14]: https://opensource.com/sites/default/files/uploads/advent-rox-custom.jpg (ROX desktop)
[15]: https://github.com/AppImage/AppImageKit/wiki/AppDir
[16]: https://appimage.org/
