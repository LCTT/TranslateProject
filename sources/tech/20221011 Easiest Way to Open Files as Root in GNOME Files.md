[#]: subject: "Easiest Way to Open Files as Root in GNOME Files"
[#]: via: "https://www.debugpoint.com/gnome-files-root-access/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Easiest Way to Open Files as Root in GNOME Files
======
Here’s the simplest way to access a file or directory as root in GNOME Files.

![][1]

In Windows, you generally get an option to open a file or folder as “Open As Administrator” in the right-click context menu.

That feature is part of the File manager, i.e. for Windows; it’s part of Windows Explorer. However, it is executed by the operating system and its permission control modules.

In Linux distributions and file managers, the situation is a little different. The different desktop has their way of handling this.

Since modifying the files and folders as admin (or root) is risky and may cause a broken system, the feature is not easily available to users via the GUI of file managers.

For example, KDE Plasma’s default file manager Dolphin recently [added this feature][2] so that when a root privilege is required, it will ask for you with a PolicyKit KDE Agent (polkit) window – as shown below. Not the other way around. You want to open/execute something via root from the file manager.

It’s worth mentioning that you can not use “sudo dolphin” to run the file manager itself with root privilege.

![Dolphin root access after KIO with Polkit implementation][3]

In a way, it saves many unforeseen situations. But advanced users can always use sudo via the terminal to do their job.

### GNOME Files (Nautilus) and root access to files, directories 

That being said, [GNOME Files][4] (aka Nautilus) has a way to open files and folders via root.

Here’s how.

* Open GNOME Files or Nautilus.
* Then click on other locations at the left pane.
* Press CTRL+L to bring up the address bar.
* In the address bar, type in below and hit enter.

```
admin:///
```

* It would ask for the admin password; once you authenticate yourself successfully, you get the system open for you as admin.
* Now, here onwards, whatever you do, it’s as admin or root.

![Enter the location address as admin][5]

![Give admin password][6]

![Opening GNOME Files as root][7]

But, as always, be careful what you do as an admin. It’s often easy to forget after you authenticate yourself as root.

There’s always a reason why these options are not easily visible to prevent you and many new Linux users from breaking their system.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-files-root-access/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/nauroot-1024x576.jpg
[2]: https://www.debugpoint.com/dolphin-root-access/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/02/Dolphin-root-access-after-KIO-with-Polkit-implementation.jpg
[4]: https://wiki.gnome.org/Apps/Files
[5]: https://www.debugpoint.com/wp-content/uploads/2022/10/Enter-the-location-address-as-admin.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/10/Give-admin-password.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/10/Opening-GNOME-Files-as-root.jpg
