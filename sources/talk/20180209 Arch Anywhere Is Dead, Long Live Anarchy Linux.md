Arch Anywhere Is Dead, Long Live Anarchy Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_main.jpg?itok=fyBpTjQW)

Arch Anywhere was a distribution aimed at bringing Arch Linux to the masses. Due to a trademark infringement, Arch Anywhere has been completely rebranded to [Anarchy Linux][1]. And I’m here to say, if you’re looking for a distribution that will enable you to enjoy Arch Linux, a little Anarchy will go a very long way. This distribution is seriously impressive in what it sets out to do and what it achieves. In fact, anyone who previously feared Arch Linux can set those fears aside… because Anarchy Linux makes Arch Linux easy.

Let’s face it; Arch Linux isn’t for the faint of heart. The installation alone will turn off many a new user (and even some seasoned users). That’s where distributions like Anarchy make for an easy bridge to Arch. With a live ISO that can be tested and then installed, Arch becomes as user-friendly as any other distribution.

Anarchy Linux goes a little bit further than that, however. Let’s fire it up and see what it does.

### The installation

The installation of Anarchy Linux isn’t terribly challenging, but it’s also not quite as simple as for, say, [Ubuntu][2], [Linux Mint][3], or [Elementary OS][4]. Although you can run the installer from within the default graphical desktop environment (Xfce4), it’s still much in the same vein as Arch Linux. In other words, you’re going to have to do a bit of work—all within a text-based installer.

To start, the very first step of the installer (Figure 1) requires you to update the mirror list, which will likely trip up new users.

![Updating the mirror][6]

Figure 1: Updating the mirror list is a necessity for the Anarchy Linux installation.

[Used with permission][7]

From the options, select Download & Rank New Mirrors. Tab down to OK and hit Enter on your keyboard. You can then select the nearest mirror (to your location) and be done with it. The next few installation screens are simple (keyboard layout, language, timezone, etc.). The next screen should surprise many an Arch fan. Anarchy Linux includes an auto partition tool. Select Auto Partition Drive (Figure 2), tab down to Ok, and hit Enter on your keyboard.

![partitioning][9]

Figure 2: Anarchy makes partitioning easy.

[Used with permission][7]

You will then have to select the drive to be used (if you only have one drive this is only a matter of hitting Enter). Once you’ve selected the drive, choose the filesystem type to be used (ext2/3/4, btrfs, jfs, reiserfs, xfs), tab down to OK, and hit Enter. Next you must choose whether you want to create SWAP space. If you select Yes, you’ll then have to define how much SWAP to use. The next window will stop many new users in their tracks. It asks if you want to use GPT (GUID Partition Table). This is different than the traditional MBR (Master Boot Record) partitioning. GPT is a newer standard and works better with UEFI. If you’ll be working with UEFI, go with GPT, otherwise, stick with the old standby, MBR. Finally select to write the changes to the disk, and your installation can continue.

The next screen that could give new users pause, requires the selection of the desired installation. There are five options:

  * Anarchy-Desktop

  * Anarchy-Desktop-LTS

  * Anarchy-Server

  * Anarchy-Server-LTS

  * Anarchy-Advanced




If you want long term support, select Anarchy-Desktop-LTS, otherwise click Anarchy-Desktop (the default), and tab down to Ok. Click Enter on your keyboard. After you select the type of installation, you will get to select your desktop. You can select from five options: Budgie, Cinnamon, GNOME, Openbox, and Xfce4.
Once you’ve selected your desktop, give the machine a hostname, set the root password, create a user, and enable sudo for the new user (if applicable). The next section that will raise the eyebrows of new users is the software selection window (Figure 3). You must go through the various sections and select which software packages to install. Don’t worry, if you miss something, you can always installed it later.


![software][11]

Figure 3: Selecting the software you want on your system.

[Used with permission][7]

Once you’ve made your software selections, tab to Install (Figure 4), and hit Enter on your keyboard.

![ready to install][13]

Figure 4: Everything is ready to install.

[Used with permission][7]

Once the installation completes, reboot and enjoy Anarchy.

### Post install

I installed two versions of Anarchy—one with Budgie and one with GNOME. Both performed quite well, however you might be surprised to see that the version of GNOME installed is decked out with a dock. In fact, comparing the desktops side-by-side and they do a good job of resembling one another (Figure 5).

![GNOME and Budgie][15]

Figure 5: GNOME is on the right, Budgie is on the left.

[Used with permission][7]

My guess is that you’ll find all desktop options for Anarchy configured in such a way to offer a similar look and feel. Of course, the second you click on the bottom left “buttons”, you’ll see those similarities immediately disappear (Figure 6).

![GNOME and Budgie][17]

Figure 6: The GNOME Dash and the Budgie menu are nothing alike.

[Used with permission][7]

Regardless of which desktop you select, you’ll find everything you need to install new applications. Open up your desktop menu of choice and select Packages to search for and install whatever is necessary for you to get your work done.

### Why use Arch Linux without the “Arch”?

This is a valid question. The answer is simple, but revealing. Some users may opt for a distribution like [Arch Linux][18] because they want the feeling of “elitism” that comes with using, say, [Gentoo][19], without having to go through that much hassle. With regards to complexity, Arch rests below Gentoo, which means it’s accessible to more users. However, along with that complexity in the platform, comes a certain level of dependability that may not be found in others. So if you’re looking for a Linux distribution with high stability, that’s not quite as challenging as Gentoo or Arch to install, Anarchy might be exactly what you want. In the end, you’ll wind up with an outstanding desktop platform that’s easy to work with (and maintain), based on a very highly regarded distribution of Linux.

That’s why you might opt for Arch Linux without the Arch.

Anarchy Linux is one of the finest “user-friendly” takes on Arch Linux I’ve ever had the privilege of using. Without a doubt, if you’re looking for a friendlier version of a rather challenging desktop operating system, you cannot go wrong with Anarchy.

Learn more about Linux through the free ["Introduction to Linux" ][20]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/arch-anywhere-dead-long-live-anarchy-linux

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://anarchy-linux.org/
[2]:https://www.ubuntu.com/
[3]:https://linuxmint.com/
[4]:https://elementary.io/
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_1.jpg?itok=WgHRqFTf (Updating the mirror)
[7]:https://www.linux.com/licenses/category/used-permission
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_2.jpg?itok=D7HkR97t (partitioning)
[10]:/files/images/anarchyinstall3jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_3.jpg?itok=5-9E2u0S (software)
[12]:/files/images/anarchyinstall4jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_4.jpg?itok=fuSZqtZS (ready to install)
[14]:/files/images/anarchyinstall5jpg
[15]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_5.jpg?itok=4y9kiC8I (GNOME and Budgie)
[16]:/files/images/anarchyinstall6jpg
[17]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anarchy_install_6.jpg?itok=fJ7Lmdci (GNOME and Budgie)
[18]:https://www.archlinux.org/
[19]:https://www.gentoo.org/
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
