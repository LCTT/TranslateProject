Redcore Linux Makes Gentoo Easy
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/redcore.jpg?itok=SfsuPD0w)
Raise your hand if you’ve always wanted to try [Gentoo Linux][1] but never did because you didn’t have either the time or the skills to invest in such a challenging installation. I’m sure there are plenty of Linux users out there not willing to admit this, but it’s okay, really; installing Gentoo is a challenge, and it can be very time consuming. In the end, however, installing Gentoo will result in a very personalized Linux desktop that offers the fulfillment of saying, “I did it!”

So, what’s a curious Linux user to do, when they want to experience this elite distribution? One option is to turn to the likes of [Redcore Linux][2]. Redcore does what many have tried (and few have succeeded in doing) in bringing Gentoo to the masses. In fact, [Sabayon][3] Linux is the only other distro I can think of that’s truly succeeded in bringing a level of simplicity to Gentoo Linux that many users can enjoy. And while Sabayon is still very much in active development, it’s good to know there are others attempting what might have once been deemed impossible:

### Making Gentoo Linux easy

Instead of building your desktop piece by piece, system by system, Redcore (like Sabayon) brings a much more standard installation to the process. Unlike Sabayon (which gives you the options of a GNOME, KDE, Xfce, Mate, or Fluxbox editions), Redcore offers a version that ships with two possible desktop options: The [LXQt][4] desktop and [Openbox][5]. The LXQt is a lightweight desktop that offers plenty of configuration options and performs quite well on older hardware, whereas Openbox is a very minimalist take on the desktop. In fact, once you log into the Openbox desktop, you’ll be left wondering if something had gone wrong (until you right-click on the desktop to see the solitary menu).

If you’re looking for a more modern take on the desktop, neither LXQt or Openbox will be what you’re looking for. However, there is no doubt the combination of a rolling-release Gentoo-lite system that uses the LXQt and Openbox desktops will perform quite well.

The official description of the distribution is:

Redcore Linux is a distribution based on Gentoo Linux (stable + some unstable) and a continuation of, now defunct, Kogaion Linux. Kogaion Linux itself was a distribution based initially on Sabayon Linux, and later on Gentoo Linux and it was developed by RogentOS Development Group since 2011. Ghiunhan Mamut (aka V3n3RiX) himself joined RogentOS Development Group in January 2014.

If you know much about how Gentoo is structured, Redcore Linux is built from Gentoo Linux stage3. Stage3 a tarball containing a populated directory structure from a basic Gentoo system that contains no kernel, only binaries and libraries essential for bootstrapping. On top of stage3, the Redcore developers add a kernel, a bootloader and a few other items (such as dbus and Dracut), as well as configure the init system (OpenRC).

With all of that out of the way, let’s see what the installation of Redcore is like and how well it can serve as your desktop distribution.

### Installation

As you’ve probably expected, the installation of Redcore is incredibly simple. Download the live ISO image, burn it to a CD/DVD or USB, insert the installation media, boot the device, log into the desktop (live username/password is redcore/redcore) and click the installer icon on the desktop. The installer used by Redcore is [Calamares][6], which means the installation is incredibly easy and, in an instant, familiar (Figure 1).

Everything with Calamares is automatic. In other words, you won’t have to manually partition your drive or select individual packages for installation. You should be able to start and finish a Redcore installation in five or ten minutes. Once the installation completes, reboot and log in with the username/password you created during installation.

### Usage

Upon login, you can select between LXQt and Openbox. I highly recommend against using Openbox. Why? Because nothing will open from the menu. I was actually quite surprised to find the Openbox desktop fairly unusable upon installation. With that in mind, select the LXQt option and be done with it.

Upon logging in, you’ll be greeted by a fairly straight-forward desktop. Click on the menu button (bottom right of screen) and search through the menu hierarchy to launch an application. The list of installed applications is fairly straightforward, with the exception of finding [Steam][7] and [Wine][8] pre-installed. You might be surprised, considering Redcore is a rolling distribution, that many of the user-crucial applications are out of date. Take, for instance, LibreOffice. Redcore ships with 5.4.5.1. The Still release of LibreOffice is currently at 5.4.6. Opening the Sisyphus GUI (front end for the Sisyphus package manager) and you’ll see that LibreOffice is up to date (according to the package manager) at 5.4.5.1 (Figure 2).


![ Sisyphus][10]

Figure 2: The Sisyphus GUI package manager.

[Used with permission][11]

If you do see packages available for upgrade (which you might), click the upgrade button and allow the upgrade to complete. Considering this is a rolling release, you should be up to date. However, you can search through Sisyphus, locate new packages to install, and install them with ease. Installation with the Sisyphus front end is quite user-friendly.

### That default browser

You won’t find a copy of Firefox or Chrome installed on Redcore. Instead, QupZilla serves as the default browser. When you do open the default browser (or if you click on the Ask for help icon on the desktop) you will find the preconfigured home page to be the [recorelinux freenode.net page][12]. Instead of being greeted by a hand-crafted application, geared toward helping new users, one must choose a nickname and venture into the world of IRC. Although one might be inclined to think that does new users a disservice, one must consider the type of “new” user Redcore will be serving: These aren’t going to be new-to-Linux users. Instead, Redcore knows its users and knows many of them are already familiar with IRC. That means users don’t have to turn to Google to search for answers. Instead, they can chat with other users and even developers to solve their problems. This, of course, does depend on those users (who might be capable of answering questions) actually be logged into the redcorelinux channel on freenode.

### That default theme

I’m going to make a confession here. I’ve never understood the whole “dark theme” preference. I do understand that taste is a subjective issue, but my taste tends to lean toward the lighter themes. That’s not a problem. To change the theme for the LXQt desktop, open the menu, type desktop in the search field, and then select Customize Look and Feel. In the resulting window (Figure 3), you can select from the short list of theme options.


![desktop][14]

Figure 3: Changing the desktop theme in Redcore.

[Used with permission][11]

### That target audience

So who is Redcore’s best target audience? If you’re looking to gain the benefit of Gentoo Linux, without having to go through the exhausting “get up to speed” and installation process required to compile one of the most challenging operating systems on the planet, Redcore might be what you’re looking for. It’s a very simplified means of enjoying a Gentoo-less take on Gentoo Linux. Of course, if you’re looking to enjoy Gentoo with a more modern desktop, I would highly recommend [Sabayon][3]. However, the LXQt lightweight desktop will certainly give life to old hardware. And Recore does this with a bit of Gentoo style.

Learn more about Linux through the free ["Introduction to Linux" ][15] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/4/redcore-linux-makes-gentoo-easy

作者：[JACK WALLEN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.gentoo.org/
[2]:https://redcorelinux.org/
[3]:http://www.sabayon.org/
[4]:https://lxqt.org/
[5]:http://openbox.org/wiki/Main_Page
[6]:https://calamares.io/about/
[7]:http://store.steampowered.com/
[8]:https://www.winehq.org/
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/redcore_2.jpg?itok=ubNC-htJ ( Sisyphus)
[11]:https://www.linux.com/licenses/category/used-permission
[12]:http://webchat.freenode.net/?channels=redcorelinux
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/redcore_3.jpg?itok=FKg67lrS (desktop)
[15]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
