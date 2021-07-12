[#]: subject: (helloSystem – FreeBSD Based OS Brings another Promising Release 0.5.0)
[#]: via: (https://www.debugpoint.com/2021/06/hellosystem-0-5-0-release/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

helloSystem – FreeBSD Based OS Brings another Promising Release 0.5.0
======
The helloSystem team brings another promising release with its latest
version 0.5.0. And gives hope to users as a free alternative to macOS.
![helloSystem 0.5.0][1]

The helloSystem is a FreeBSD-based lightweight operating system designed from the ground up. The operating system with FreeBSD at its core provides a real “open” alternative to the macOS and its users.

The ideas and principles mainly give FreeBSD users an alternative to the no-lock-down environment, unlike macOS. That means you get any application software you want in helloSystem, that too includes all Linux applications. Because FreeBSD already has a built-in layer to run Linux applications. And it is worth mentioning that you can keep using your older hardware with this operating system without fear of non-upgradable status.

An impressive operating system, indeed. However, the operating system is fairly new, hence things are still being worked on.

Let’s take a look at what’s new in the new helloSystem 0.5.0 release.

### helloSystem 0.5.0 – What’s New

This release is based on the stable FreeBSD 12.2 version. This release provides updates to wireless networking and much new specific hardware support. The primary window manager is Openbox 3.4 which is a bit older version right now.

The main top panel Global system menu is now updated automatically when the system is modified with applications or directories.

From the changelog, it is evident that the file manager Filer sees most of the updates in this release of updates in this point release. Here are the updates in Filer 0.10.0:

  * Initial spatial mode option for Filer (each folder opens in its own window)
  * “Go to…” menu in Filer, Command+Shift+G
  * Go up to the parent folder in Filer using Command+Up
  * Get Info in Filer using Command+I
  * Filer brings already-open windows to the front rather than opening multiple windows for the same folder
  * Context menu in Filer for opening text files and folders as root
  * Filer now shows volumes on the desktop
  * Filer now shows the correct names for volumes (“volume labels”)
  * Adjusted icon grid size in Filer
  * Filer now shows volumes first in the sidebar
  * Menus are now available if only the desktop is showing and no Filer windows are open Filer now shows alternating row colors in detail view



Other updates include:

  * New app QHexEdit and Android File Transfer Utility is introduced.
  * Updated initgfx, more GPUs such as the AMD Radeon HD 6630M/6650M/6750M/7670M/7690M (Whistler/Turks) family GPUs found in 2011 Macs might now be supported
  * Double click on the title bar of any application to hide the main window and shows only the title bar.
  * It is now possible to save (persist across reboots) custom keyboard preferences
Placeholder .app bundles (and thereby menu entries) are automatically created for applications installed with pkg
  * Audio Volume can now be set from the global menu bar



![Utilities][2]

Most of the important application shortcut is added, but they are not installed by default with the .iso file. So you need to download and install what you need. This is good in the way that, the .iso size is reduced without all those apps. You just install later what you need. Most of the important ones are available in the menu as shortcuts such as LibreOffice, GIMP, etc.

### Download

The project is hosted on GitHub at the moment. You can download the 64-bit .iso file from the below link.

[helloSystem 0.5.0][3]

Once downloaded, you can either install it in a physical system or try it on a [virtual machine][4].

If you are planning to try it out in a physical system as a multi-boot, I would recommend you to be a little extra careful, there might be issues with UEFI.

### Closing Notes

This is one of the interesting FreeBSD OS that I am following very closely. A promising project indeed with a stable alternative to Linux and macOS. Request you to contribute to the project in any capacity in GitHub.

Cheers.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/hellosystem-0-5-0-release/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/helloSystem-0.5.0-1024x578.jpg
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Utilities.jpg
[3]: https://github.com/helloSystem/ISO/releases/download/r0.5.0/hello-0.5.0_0E223-FreeBSD-12.2-amd64.iso
[4]: https://www.debugpoint.com/2020/05/install-use-gnome-boxes/
