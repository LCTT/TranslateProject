First impressions of Semplice Linux 5
================================================================================
[Semplice][1] Linux is a distribution based on the Debian GNU/Linux project. Specifically, Semplice is built using software from Debian's Unstable branch. The Semplice developers use the software packages in the Unstable repository and combine them with a custom graphical installer. The [project's website][2] also mentions that the distribution comes with support for encrypted LVM volumes and that Semplice is focused on being fast, light on resources, "rock solid" and elegant. This is accomplished by combining the Unstable Debian base with the Openbox window manager. The distribution is available in both 32-bit and 64-bit builds and the ISO provided on the website weighs in at approximately 620 MB.

Booting from the distribution's live media brings up a graphical interface with a single window. This window contains three tabs which invite us to select our keyboard's layout, our preferred language and our time zone. Once we confirm these settings are correct the window disappears and we are shown an Openbox interface. The background is bright blue. At the bottom of the display we find a task switcher and system tray. Right-clicking on the background brings up the distribution's application menu. One of the top-level items in the menu is an entry for the distribution's system installer.

![](http://distrowatch.com/images/screenshots/semplice-5-web.png)

Semplice Linux 5 - visiting the project's website
(full image size: 398kB, screen resolution 1280x960 pixels)

Semplice's system installer is a graphical application. The program presents a friendly interface and walks us through the usual steps. We are asked to confirm our preferred language, our keyboard's layout and the local time zone. We are asked if we would like to check for updates to the system installer in the distribution's repositories. I did perform this check and the installer did find an updated version of itself on-line. I downloaded this update and the installer restarted itself to perform the upgrade. We are asked to create a user account for ourselves and, optionally, we can enable the root account. By default Semplice sets up the first user account with sudo administrative access and disables the root account. However, we have the option of enabling the root account and setting a password to protect it. When we get to the disk partitioning screens we have the option of a guided path where the installer will try to divide our hard disk for us. Alternatively we can manually partition the local disk.

I found manual partitioning was a little awkward, mostly due to the screen's layout. I also found that when I tried to create LVM volumes the installer wouldn't allow it. There is a dialogue which asks us to name our new volume and that screen's "OK" button was disabled, preventing me from proceeding. There are traditional file system options available too, including ext2/3/4 and ReiserFS. Once the disk has been partitioned we are asked if we would like to install the GRUB boot loader. With this done the final step we are presented with is enabling/disabling certain features and services. Semplice's installer allows us to decide at install time whether we need Bluetooth support, printing software, productivity software, visual desktop effects, web apps and proprietary packages. Once we check off which items we do (or do not) want the installer copies its files to the local disk. This only takes a few minutes and, when the process has completed, we are prompted to reboot the computer.

The Semplice Linux distribution comes with a good deal of useful software. Right out of the box we are given the Chromium web browser, the Claws Mail e-mail client, the XChat IRC software and the Pidgin instant messaging software. The gFTP file transfer client is installed for us along with the uGet download manager, a document viewer and the GNU Paint drawing program. The AbiWord word processor and the Gnumeric spreadsheet applications are available in the menu too. I found MPlayer on the system as well as the xfburn disc burner and the Exaile audio player. There was a copy of Tetris in the Games sub-menu and I found a text editor, calculator, image viewer, file manager and archive manager present.

There were a handful of configuration utilities in the application menu allowing us to easily work with network settings, system services and user accounts. There were also apps for managing the appearance of the Openbox window manager. Among the applications were web app entries which opened a minimal web browser to the Twitter and Facebook websites. There is also a link to the Semplice project website. Digging deeper I found Semplice comes with a full range of multimedia codecs and Adobe's Flash plugin. With the default installation the system runs a secure shell service. I also found the GNU Compiler Collection was available. In the background the Linux kernel, version 3.10, kept things running.

![](http://distrowatch.com/images/screenshots/semplice-5-apps.png)

Semplice Linux 5 - running various desktop applications
(full image size: 241kB, screen resolution 1280x960 pixels)

I ran into a few minor issues while I was working with Semplice. For example, when running the "top" process monitor in a virtual terminal the system statistics were missing from the top of the screen. With a little exploring I found the virtual terminal's colours were set up in a way which made the text invisible. Changing to a different colour scheme worked for a short time, but the next time I opened a terminal the colours had reverted back to their defaults. My settings were always lost when the terminal was closed. Another instance where settings were not respected showed up post-install. While I was setting up Semplice the installer asked which services I wanted to enable. These included Bluetooth, printing support, web apps and a few other items.

I told the installer to skip Bluetooth support and not to install printing software. However, once Semplice had been installed I went into the services manager application and found both Bluetooth and printing services were installed and enabled. A third curious problem came up when I tried to connect to the distribution's secure shell service. Any attempt to connect via secure shell resulted in the connection being reset and dropped. I soon found this problem came from the distribution not generating host keys for OpenSSH to use. Once these keys were manually generated I was able to make use of the secure shell server.

Software packages are handled by the Synaptic graphical package manager. Synaptic fills in as the distribution's software updating application and general purpose package manager. The venerable application may not have the eye candy offered by more modern package managers, but Synaptic is quite capable. It allows us to create batches of actions to perform and the program works quickly, offering us detailed information while it is working. The distribution pulls packages from a few different software repositories. Semplice, by default, pulls software from Debian's Unstable repositories as well as some custom Semplice repositories. When I first installed the distribution there were 137 updates waiting for me, weighing in at approximately 135MB in size. By the end of the week I had installed over 200 updates totaling around 200MB in size. Semplice, being based on Debian's Unstable branch, is effectively a rolling release distribution and will typically receive a rapid stream of cutting-edge packages.

![](http://distrowatch.com/images/screenshots/semplice-5-admin.png)

Semplice Linux 5 - managing packages and services
(full image size: 299kB, screen resolution 1280x960 pixels)

I tried running Semplice Linux on my desktop machine (dual-core 2.8 GHz CPU, 6 GB of RAM, Radeon video card, Realtek network card) and in a virtual machine powered by VirtualBox. Despite several attempts using different kernel parameters I was unable to get Semplice to boot on my physical computer. On the other hand, Semplice ran well in the virtual environment. While running in VirtualBox I found the distribution booted quickly, was responsive and was (for the duration of my trial) stable. The distribution was fairly light on memory, using approximately 130 MB of RAM.

My time with Semplice was, in a word, okay. I realize that's not a ringing endorsement, nor is it meant to be dismissive. Semplice, overall, performed well, it comes with a lot of good software and I think its system installer is nicer than Debian's, at least for desktop systems. The administrative tools Semplice comes with are helpful and, with access to Debian's repositories, the distribution gives us a huge pool of software packages from which to draw. The project stays fairly close to the cutting edge and users will need to be mindful of that if they wish to avoid downtime following package upgrades, but at the same time it gives us a chance to experiment. On the flip side, there were a few problems I ran into. The installer didn't appear to respect my choice of system services and I wasn't able to make use of encrypted LVM volumes.

There were other little problems like the virtual terminal not remembering my settings. Plus, I couldn't help shake the feeling that Semplice, with its fairly user-friendly style, might have been better off using LXDE instead of plain Openbox for the graphical interface. Not that I have anything against Openbox, but LXDE provides a nice, familiar interface for new users and would probably make more people feel at home while carrying approximately the same resource footprint. Another issue was Semplice didn't run on my physical hardware. I try not to hold this against distributions as what works for me may not work for others and, for that matter, what works for other people doesn't always run for me. Still, other Debian-derived projects, such as Ubuntu and Linux Mint Debian Edition, typically run smoothly on this hardware so I was surprised to find Semplice did not. One final issue was the way the OpenSSH service was running, but no host key was provided, causing secure shell connections to drop. It was a minor thing to create new host keys, but it would have been nice to have secure shell working right from the start.

In short, my first impression of Semplice is the distribution looks nice, makes a few improvements over plain Debian (at least for desktop/laptop users) and comes with a good selection of default software. However, it does have some rough edges. Perhaps nothing serious, nothing that would scare away an intermediate Linux user, but there were a few problems which I hope will get smoothed out in future releases.

--------------------------------------------------------------------------------

via: http://distrowatch.com/weekly.php?issue=20131007

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://distrowatch.com/semplice
[2]:http://semplice-linux.org/
