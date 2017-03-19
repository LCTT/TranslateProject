8 reasons to use LXDE
============================================================

### Learn reasons to consider using the lightweight LXDE desktop environment as your Linux desktop.

![8 reasons to use LXDE](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003499_01_linux31x_cc.png?itok=1HXbvw2E "8 reasons to use LXDE") 
>Image by : opensource.com

Late last year, an upgrade to Fedora 25 brought issues with the new version of [KDE][7] Plasma that were so bad it was difficult to get any work done. I decided to try other Linux desktop environments for two reasons. First, I needed to get my work done. Second, having used KDE exclusively for many years, I thought it was time to try some different desktops.

The first alternate desktop I tried for several weeks was [Cinnamon][8], which I wrote about in January. This time I have been using LXDE (Lightweight X11 Desktop Environment) for about six weeks, and I have found many things about it that I like. Here is my list of eight reasons to use LXDE.

More Linux resources

*   [What is Linux?][1]
*   [What are Linux containers?][2]
*   [Managing devices in Linux][3]
*   [Download Now: Linux commands cheat sheet][4]
*   [Our latest Linux articles][5]

**1\. LXDE supports multiple panels. **As with KDE and Cinnamon, LXDE sports panels that contain the system menu, application launchers, and a taskbar that displays buttons for the running applications. The first time I logged in to LXDE the panel configuration looked surprisingly familiar. LXDE appears to have picked up the KDE configuration for my favored top and bottom panels, including system tray settings. The application launchers on the top panel appear to have been from the Cinnamon configuration. The contents of the panels make it easy to launch and manage programs. By default, there is only one panel at the bottom of the desktop.

 ![The LXDE desktop with the Openbox Configuration Manager open.](https://opensource.com/sites/default/files/lxde-openboxconfigurationmanager.png "The LXDE desktop with the Openbox Configuration Manager open.") 

The LXDE desktop with the Openbox Configuration Manager open. This desktop has not been modified, so it uses the default color and icon schemes.

**2\. The Openbox configuration manager provides a single, simple tool for managing the look and feel of the desktop.** It provides options for themes, window decorations, window behavior with multiple monitors, moving and resizing windows, mouse control, multiple desktops, and more. Although that seems like a lot, it is far less complex than configuring the KDE desktop, yet Openbox provides a surprisingly great amount of control.

**3\. LXDE has a powerful menu tool.** There is an interesting option that you can access on the Advanced tab of the Desktop Preferences menu. The long name for this option is, “Show menus provided by window managers when desktop is clicked.” When this checkbox is selected, the Openbox desktop menu is displayed instead of the standard LXDE desktop menu, when you right-click the desktop.

The Openbox desktop menu contains nearly every menu selection you would ever want, with all easily accessible from the desktop. It includes all of the application menus, system administration, and preferences. It even has a menu containing a list of all the terminal emulator applications installed so that sysadmins can easily launch their favorite.

**4\. By design, the LXDE desktop is clean and simple.** It has nothing to get in the way of getting your work done. Although you can add some clutter to the desktop in the form of files, directory folders, and links to applications, there are no widgets that can be added to the desktop. I do like some widgets on my KDE and Cinnamon desktops, but they are easy to cover and then I need to move or minimize windows, or just use the “Show desktop” button to clear off the entire desktop. LXDE does have a “Iconify all windows” button, but I seldom need to use it unless I want to look at my wallpaper.

**5\. LXDE comes with a strong file manager.** The default file manager for LXDE is PCManFM, so that became my file manager for the duration of my time with LXDE. PCManFM is very flexible and can be configured to make it work well for most people and situations. It seems to be somewhat less configurable than Krusader, which is usually my go-to file manager, but I really like the sidebar on PCManFM that Krusader does not have.

PCManFM allows multiple tabs, which can be opened with a right-click on any item in the sidebar or by a left-click on the new tab icon in the icon bar. The Places pane at the left of the PCManFM window shows the applications menu, and you can launch applications from PCManFM. The upper part of the Places pane also shows a devices icon, which can be used to view your physical storage devices, a list of removable devices along with buttons to allow you to mount or unmount them, and the Home, Desktop, and trashcan folders to make them easy to access. The bottom part of the Places panel contains shortcuts to some default directories, Documents, Music, Pictures, Videos, and Downloads. You can also drag additional directories to the shortcut part of the Places pane. The Places pane can be swapped for a regular directory tree.

**6\. The title bar of ****a new window flashes**** if it is opened behind existing windows.** This is a nice way to make locating new windows in with a large number of existing ones.

**7\. Most modern desktop environments allow for multiple desktops and LXDE is no exception to that.** I like to use one desktop for my development, testing, and writing activities, and another for mundane tasks like email and web browsing. LXDE provides two desktops by default, but you can configure just one or more. Right-click on the Desktop Pager to configure it.

Through some disruptive but not destructive testing, I was able to determine that the maximum number of desktops allowed is 100\. I also discovered that when I reduced the number of desktops to fewer than the three I actually had in use, the windows on the defunct desktops are moved to desktop 1\. What fun I have had with this!

**8\. The Xfce power manager is a powerful little application that allows you to configure how power management works.** It provides a tab for General configuration as well as tabs for System, Display, and Devices. The Devices tab displays a table of attached devices on my system, such as battery-powered mice, keyboards, and even my UPS. It displays information about each, including the vendor and serial number, if available, and the state of the battery charge. As I write this, my UPS is 100% charged and my Logitech mouse is 75% charged. The Xfce power manager also displays an icon in the system tray so you can get a quick read on your devices' battery status from there.

There are more things to like about the LXDE desktop, but these are the ones that either grabbed my attention or are so important to my way of working in a modern GUI interface that they are indispensable to me.

One quirk I noticed with LXDE is that I never did figure out what the “Reconfigure” option does on the desktop (Openbox) menu. I clicked on that several times and never noticed any activity of any kind to indicate that that selection actually did anything.

I have found LXDE to be an easy-to-use, yet powerful, desktop. I have enjoyed my weeks using it for this article. LXDE has enabled me to work effectively mostly by allowing me access to the applications and files that I want, while remaining unobtrusive the rest of the time. I also never encountered anything that prevented me from doing my work. Well, except perhaps for the time I spent exploring this fine desktop. I can highly recommend the LXDE desktop.

I am now using GNOME 3 and the GNOME Shell and will report on that in my next installment.

--------------------------------------------------------------------------------

作者简介：

David Both - David Both is a Linux and Open Source advocate who resides in Raleigh, North Carolina. He has been in the IT industry for over forty years and taught OS/2 for IBM where he worked for over 20 years. While at IBM, he wrote the first training course for the original IBM PC in 1981. He has taught RHCE classes for Red Hat and has worked at MCI Worldcom, Cisco, and the State of North Carolina. He has been working with Linux and Open Source Software for almost 20 years. 

--------------------------------------

via: https://opensource.com/article/17/3/8-reasons-use-lxde

作者：[David Both ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://opensource.com/article/16/11/managing-devices-linux?src=linux_resource_menu
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/3/8-reasons-use-lxde?rate=QigvkBy_9zLvktdsL-QaIWedjIqjtlwwJIVFQDQzsSY
[7]:https://opensource.com/life/15/4/9-reasons-to-use-kde
[8]:https://opensource.com/article/17/1/cinnamon-desktop-environment
[9]:https://opensource.com/user/14106/feed
[10]:https://opensource.com/article/17/3/8-reasons-use-lxde#comments
[11]:https://opensource.com/users/dboth
