8 reasons to use the Xfce Linux desktop environment
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

For several reasons (including curiosity), a few weeks ago I started using [Xfce][1] as my Linux desktop. One reason was trouble with background daemons eating up all the CPU and I/O bandwidth on my very powerful main workstation. Of course, some of the instability may be due to my removal of some of the RPM packages that provide those background daemons. However, even before I removed the RPMs, the fact is KDE was unstable and causing performance and stability issues. I needed to use a different desktop to avoid these problems.

I realized in looking back over my series of articles on Linux desktops that I had neglected Xfce. This article is intended to rectify that oversight. I like Xfce a lot and am enjoying the speed and lightness of it more than I thought I would.

As part of my research, I googled to try to learn what Xfce means. There is a historical reference to XForms Common Environment, but Xfce no longer uses the XForms tools. Some years ago, I found a reference to "Xtra fine computing environment," and I like that a lot. I will use that (despite not being able to find the page reference again).

### Eight reasons for recommending Xfce

#### 1\. Lightweight construction

Xfce has a very small memory footprint and CPU usage compared to some other desktops, such as KDE and GNOME. On my system, the programs that make up the Xfce desktop take a tiny amount of memory for such a powerful desktop. Very low CPU usage is also a hallmark of the Xfce desktop. With such a small memory footprint, I am not especially surprised that Xfce is also very sparing of CPU cycles.

#### 2\. Simplicity

The Xfce desktop is simple and uncluttered with fluff. The basic desktop has two panels and a vertical line of icons on the left side. Panel 0 is at the bottom and consists of some basic application launchers, as well as the Applications icon, which provides access to all the applications on the system. Panel 1 is at the top and has an Applications launcher as well as a Workspace Switcher that allows the user to switch between multiple workspaces. The panels can be modified with additional items, such as new launchers, or by altering their height and width.

The icons down the left side of the desktop consist of the Home directory and Trash icons. It can also display icons for the complete filesystem directory tree and any connected pluggable USB storage devices. These icons can be used to mount and unmount the device, as well as to open the default file manager. They can also be hidden if you prefer, and the Filesystem, Trash, and Home directory icons are separately controllable. The removable drives can be hidden or displayed as a group.

#### 3\. File management

Thunar, Xfce's default file manager, is simple, easy to use and configure, and very easy to learn. While not as fancy as file managers like Konqueror or Dolphin, it is quite capable and very fast. Thunar can't create multiple panes in its window, but it does provide tabs so multiple directories can be open at the same time. Thunar also has a very nice sidebar that, like the desktop, shows the same icons for the complete filesystem directory tree and any connected USB storage devices. Devices can be mounted and unmounted, and removable media such as CDs can be ejected. Thunar can also use helper applications such as Ark to open archive files when they are clicked. Archives, such as ZIP, TAR, and RPM files, can be viewed, and individual files can be copied out of them.


![Xfce desktop][3]

The Xfce desktop with Thunar and the Xfce terminal emulator.

Having used many different applications for my [series on file managers][4], I must say that I like Thunar for its simplicity and ease of use. It is easy to navigate the filesystem using the sidebar.

#### 4\. Stability

The Xfce desktop is very stable. New releases seem to be on a three-year cycle, although updates are provided as necessary. The current version is 4.12, which was released in February 2015. The rock-solid nature of the Xfce desktop is very reassuring after having issues with KDE. The Xfce desktop has never crashed for me, and it has never spawned daemons that gobbled up system resources. It just sits there and works—which is what I want.

#### 5\. Elegance

Xfce is simply elegant. In my new book, The Linux Philosophy for SysAdmins, which will be available this fall, I talk about the many advantages of simplicity, including the fact that simplicity is one of the hallmarks of elegance. Clearly, the programmers who write and maintain Xfce and its component applications are great fans of simplicity. This simplicity is very likely the reason that Xfce is so stable, but it also results in a clean look, a responsive interface, an easily navigable structure that feels natural, and an overall elegance that makes it a pleasure to use.

#### 6\. Terminal emulation

The Xfce4 terminal emulator is a powerful emulator that uses tabs to allow multiple terminals in a single window, like many other terminal emulators. This terminal emulator is simple compared to emulators like Tilix, Terminator, and Konsole, but it gets the job done. The tab names can be changed, and the tabs can be rearranged by drag and drop, using the arrow icons on the toolbar, or selecting the options on the menu bar. One thing I especially like about the tabs on the Xfce terminal emulator is that they display the name of the host to which they are connected regardless of how many other hosts are connected through to make that connection, e.g., `host1==>host2==>host3==>host4` properly shows `host4` in the tab. Other emulators show `host2` at best.

Other aspects of its function and appearance can be easily configured to suit your needs. Like other Xfce components, this terminal emulator uses very little in the way of system resources.

#### 7\. Configurability

Within its limits, Xfce is very configurable. While not offering as much configurability as a desktop like KDE, it is far more configurable (and more easily so) than GNOME, for example. I found that the Settings Manager is the doorway to everything needed to configure Xfce. The individual configuration apps are separately available, but the Settings Manager collects them all into one window for ease of access. All the important aspects of the desktop can be configured to meet my needs and preferences.

#### 8\. Modularity

Xfce has a number of individual projects that make up the whole, and not all parts of Xfce are necessarily installed by your distro. [Xfce's projects][5] page lists the main projects, so you can find additional parts you might want to install. The items that weren't installed on my Fedora 28 workstation when I installed the Xfce group were mostly the applications at the bottom of that page.

There is also a [documentation page][6], and a wiki called [Xfce Goodies Project][7] lists other Xfce-related projects that provide applications, artwork, and plugins for Thunar and the Xfce panels.

### Conclusions

The Xfce desktop is thin and fast with an overall elegance that makes it easy to figure out how to do things. Its lightweight construction conserves both memory and CPU cycles. This makes it ideal for older hosts with few resources to spare for a desktop. However, Xfce is flexible and powerful enough to satisfy my needs as a power user.

I've learned that changing to a new Linux desktop can take some work to configure it as I want—with all of my favorite application launchers on the panel, my preferred wallpaper, and much more. I have changed to new desktops or updates of old ones many times over the years. It takes some time and a bit of patience.

I think of it like when I've moved cubicles or offices at work. Someone carries my stuff from the old office to the new one, and I connect my computer, unpack the boxes, and place their contents in appropriate locations in my new office. Moving into the Xfce desktop was the easiest move I have ever made.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/xfce-desktop

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://xfce.org/
[2]:/file/401856
[3]:https://opensource.com/sites/default/files/uploads/xfce-desktop-01.png (Xfce desktop)
[4]:https://opensource.com/sitewide-search?search_api_views_fulltext=David%20Both%20File%20managers
[5]:https://xfce.org/projects
[6]:https://docs.xfce.org/
[7]:https://goodies.xfce.org/
