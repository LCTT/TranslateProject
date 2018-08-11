4MLinux Revives Your Older Computer [Review]
======
**Brief:** 4MLinux is a lightweight Linux distribution that can turn your old computer into a functional one with multimedia support, maintenance tools and classic games.

As more and more [Linux distributions drop the support for 32-bit systems][1], you may wonder what would you do with that old computer of yours. Thankfully, there are plenty of [lightweight Linux distributions][2] that could put those old computers for some regular computing tasks such as playing small games, watching movies, listening to music and surfing web.

[4MLinux][3] is one such Linux distribution that requires fewer system resources and can even run on 128 MB of RAM. The desktop edition comes only for 32-bit architecture while the server edition is of 64-bit.

4MLinux can also be used as a rescue CD along with serving as a full-fledged working system or as a mini-server.

![4MLinux Review][4]

It is named 4MLinux because it focuses mainly on four points, called the “4 M”:

  * Maintenance – You can use 4MLinux as a rescue Live CD.
  * Multimedia – There is inbuilt support for almost every multimedia format, be it for Image, Audio and Video.
  * Miniserver – A 64-bit server is included running LAMP suite, which can be enabled from the Application Menu.
  * Mystery – Includes a collection of classic Linux games.



Most of the Linux distributions are either based on Debian with DEB packages or Fedora with RPM. 4MLinux, on the other hand, does not rely on these package management systems, is pretty damn fast and works quite well on older systems.

### 4MLinux

The 4MLinux Desktop comes with a variety of [lightweight applications][5] so that it could work on older hardware. [JWM][6] – Joe’s Windows Manager, which is a lightweight stacking windows manager for [X Window System][7]. For managing the desktop wallpapers, a lightweight and powerful [feh][8] is used. It uses [PCMan File Manager][9] which is a standard file manager for [LXDE][10] too.

#### Installing 4MLinux is quick

I grabbed the ISO from 4MLinux website and used [MultiBootUSB][11] to create a bootable drive and live booted with it.

4MLinux do not use the grub or grub2 bootloader but uses **LI** nux **LO** ader ([LILO][12]) bootloader. The main advantage of LILO is that it allows fast boot-ups for a Linux system.

Now to install the 4MLinux, you will have to manually create a partition. Go to **Maintenance - > Partitions -> GParted**. Click on **Device - > Create Partition Table**. Once done, click on **New** , leave the settings to default and click on **Add**. Click on **Apply** to save the settings and close it.

Next step is to go to 4MLinux -> Installer and it will launch a text-based installer.

![][13]

Identify the partition you have created for the default partition to install 4MLinux and follow the instructions to complete the installation.

Surprisingly, the installation took less than a minute. Restart your system and remove the live USB and you will be greeted with this desktop.

![][14]

#### Experiencing 4MLinux

The default desktop screen has a dock at the top with most common applications pinned. There is a taskbar, a [Conky theme][15] with option to turn it on/off in the dock and a clock at the bottom right corner. Left click on the desktop opens the application menu.

The CPU usage was too minimal with less than 2% and RAM was less than 100 MB.

4MLinux comes with a number of applications tabbed under different sections. There is Transmission for torrent downloads, Tor is included by default and Bluetooth support is there.

Under Maintenance, there are options to backup the system and recover using TestDisk and GNUddrescue, CD burning tools are available along with partitioning tools. There are a number of Monitoring tools and Clam Antivirus.

Multimedia section includes various video and music players and mixers, image viewers and editors and tools for digital cameras.

Mystery section is interesting. It includes a number of [console games][16] like Snake, Tetris, Mines, Casino etc.

Under Settings, you can select your preferences for display and others, networking, Desktop and choose default applications. The default desktop resolution was 1024×768 at the highest, so that might disappoint you.

Some of the applications are not installed by default. Launching it gives you an option to install it. But that’s about it. Since there is no package manager here, you are limited to the available applications. If you want more software that are not available in the system, you’ll have to [install it from source code][17].

This is by design because 4MLinux is focused on providing only essential desktop experience. A small handful selection of lightweight applications fit in its ecosystem.

#### Download 4M Linux

The Download section features the 32-bit stable 4MLinux and its beta version, 64bit 4MServer and a 4MRescueKit. Although the ISO size is over 1GB, 4mlinux is very light in its design.

[Download 4MLinux][18]

There is a [separate page to downloaded additional drivers][19]. For any other missing drivers, while you launch an application, 4MLinux asks you to download and install it.

#### Final thoughts on 4MLinux

4MLinux has look and feel of an old-school Linux system but the desktop is super fast. I was able to run it on an Intel Dual Core processor desktop with ease and most of the things worked. WiFi was connecting fine; the application section included most of the software I use on daily basis and the retro games section was pretty cool.

The one negative point was the limitation of available application. If you can manage with the handful of applications, 4MLinux can be seen as one of the best Linux distribution for older systems and for the people who don’t prefer going in the technicality even for once.

Fast boot makes it an ideal rescue disc!

Let us know in the comment section. What do you think of 4MLinux? Are you willing to give it a try? Let us know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/4mlinux-review/

作者：[Ambarish Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://itsfoss.com/32-bit-os-list/
[2]:https://itsfoss.com/lightweight-linux-beginners/
[3]:http://4mlinux.com/
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/4minux-review-feature-800x450.jpeg
[5]:https://itsfoss.com/lightweight-alternative-applications-ubuntu/
[6]:https://joewing.net/projects/jwm/
[7]:https://en.wikipedia.org/wiki/X_Window_System
[8]:https://feh.finalrewind.org/
[9]:https://wiki.lxde.org/en/PCManFM
[10]:https://lxde.org/
[11]:https://itsfoss.com/multiple-linux-one-usb/
[12]:https://en.wikipedia.org/wiki/LILO_(boot_loader)
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/4MLinux-installer.png
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/2-800x600.jpg
[15]:https://itsfoss.com/conky-gui-ubuntu-1304/
[16]:https://itsfoss.com/best-command-line-games-linux/
[17]:https://itsfoss.com/install-software-from-source-code/
[18]:http://4mlinux.com/index.php?page=download
[19]:http://sourceforge.net/projects/linux4m/files/24.0/drivers/
