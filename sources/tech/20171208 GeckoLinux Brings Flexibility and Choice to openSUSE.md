GeckoLinux Brings Flexibility and Choice to openSUSE
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gecko-linux.jpg?itok=bjKVnW1q)

GeckoLinux is a unique distro that offers a few options that openSUSE does not. Jack Wallen takes a look.

Creative Commons Zero

I've been a fan of SUSE and openSUSE for a long time. I've always wanted to call myself an openSUSE user, but things seemed to get in the way--mostly [Elementary OS][1]. But every time an openSUSE spin is released, I take notice. Most recently, I was made aware of [GeckoLinux][2]--a unique take (offering both Static and Rolling releases) that offers a few options that openSUSE does not. Consider this list of features:

  * Live DVD / USB image

  * Editions for the following desktops: Cinnamon, XFCE, GNOME, Plasma, Mate, Budgie, LXQt, Barebones

  * Plenty of pre-installed open source desktop programs and proprietary media codecs

  * Beautiful font rendering configured out of the box

  * Advanced Power Management ([TLP][3]) pre-installed

  * Large amount of software available in the preconfigured repositories (preferring packages from the Packman repo--when available)

  * Based on openSUSE (with no repackaging or modification of packages)

  * Desktop programs can be uninstalled, along with all of their dependencies (whereas openSUSE's patterns often cause uninstalled packages to be re-installed automatically)

  * Does not force the installation of additional recommended packages, after initial installation (whereas openSUSE pre-installs patterns that automatically installs recommended package dependencies the first time the package manager is used)




The choice of desktops alone makes for an intriguing proposition. Keeping a cleaner, lighter system is also something that would appeal to many users--especially in light of laptops running smaller, more efficient solid state drives.

Let's dig into GeckoLinux and see if it might be your next Linux distribution.

### Installation

I don't want to say too much about the installation--as installing Linux has become such a no-brainer these days. I will say that GeckoLinux has streamlined the process to an impressive level. The installation of GeckoLinux took about three minutes total (granted I am running it as a virtual machine on a beast of a host--so resources were not an issue). The difference between installing GeckoLinux and openSUSE Tumbleweed was significant. Whereas GeckoLinux installed in single digits, openSUSE took more 10 minutes to install. Relatively speaking, that's still not long. But we're picking at nits here, so that amount of time should be noted.

The only hiccup to the installation was the live distro asking for a password for the live user. The live username is linux and the password is, as you probably already guessed, linux. That same password is also the same used for admin tasks (such as running the installer).

You will also note, there are two icons on the desktop--one to install the OS and another to install language packs. Run the OS installer. Once the installation is complete--and you've booted into your desktop--you can then run the Language installer (if you need the Language packs--Figure 1).


![GeckoLinux ][5]

Figure 1: Clearly, I chose the GNOME desktop for testing purposes.

[Used with permission][6]

After the Language installer finished, you can then remove the installer icon from the desktop by right-clicking it and selecting Move to Trash.

### Those fonts

The developer claims beautiful font rendering out of the box. In fact, the developer makes this very statement:

GeckoLinux comes preconfigured with what many would consider to be good font rendering, whereas many users find openSUSE's default font configuration to be less than desirable.

Take a glance at Figure 2. Here you see a side by side comparison of openSUSE (on the left) and GeckLinux (on the right). The difference is very subtle, but GeckoLinux does, in fact, best openSUSE out of the box. It's cleaner and easier to read. The developer claims are dead on. Although openSUSE does a very good job of rendering fonts out of the box, GeckoLinux improves on that enough to make a difference. In fact, I'd say it's some of the cleanest (out of the box) looking fonts I've seen on a Linux distribution.


![openSUSE][8]

Figure 2: openSUSE on the left, GeckoLinux on the right.

[Used with permission][6]

I've worked with distributions that don't render fonts well. After hours of writing, those fonts tend to put a strain on my eyes. For anyone that spends a good amount of time staring at words, well-rendered fonts can make the difference between having eye strain or not. The openSUSE font rendering is just slightly blurrier than that of GeckoLinux. That matters.

### Installed applications

GeckoLinux does exactly what it claims--installs just what you need. After a complete installation (no post-install upgrading), GeckoLinux comes in at 1.5GB installed. On the other hand, openSUSE's post-install footprint is 4.3GB.  In defense of openSUSE, it does install things like GNOME Games, Evolution, GIMP, and more--so much of that space is taken up with added software and dependencies. But if you're looking for a lighter weight take on openSUSE, GeckoLinux is your OS.

GeckoLinux does come pre-installed with a couple of nice additions--namely the [Clementine][9] Audio player (a favorite of mine), [Thunderbird][10] (instead of Evolution), PulseAudio Volume Control (a must for audio power users), Qt Configuration, GParted, [Pidgen][11], and [VLC][12].

If you're a developer, you won't find much in the way of development tools on GeckoLinux. But that's no different than openSUSE (even the make command is missing on both). Naturally, all the developer tools you need (to work on Linux) are available to install (either from the command line or from with YaST2).

### Performance

Between openSUSE and GeckoLinux, there is very little noticeable difference in performance. Opening Firefox on both resulted in maybe a second or two variation (in favor of GeckoLinux). It should be noted, however, that the installed Firefox on both was quite out of date (52 on GeckoLinux and 53 on openSUSE). Even after a full upgrade on both platforms, Firefox was still listed at release 52 on GeckoLinux, whereas openSUSE did pick up Firefox 57. After downloading the [Firefox Quantum][13] package on GeckoLinux, the application opened immediately--completely blowing away both out of the box experiences on openSUSE and GeckLinux. So the first thing you will want to do is get Firefox upgraded to 57.

If you're hoping for a significant performance increase over openSUSE, look elsewhere. If you're accustomed to the performance of openSUSE (it not being the sprightliest of platforms), you'll feel right at home with GeckoLinux.

### The conclusion

If you're looking for an excuse to venture back into the realm of openSUSE, GeckoLinux might be a good reason. It's slightly better looking, lighter weight, and with similar performance. It's not perfect and, chances are, it won't steal you away from your distribution of choice, but GeckoLinux is a solid entry in the realm of Linux desktops.

Learn more about Linux through the free ["Introduction to Linux" ][14]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/geckolinux-brings-flexibility-and-choice-opensuse

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://elementary.io/
[2]:https://geckolinux.github.io/
[3]:https://github.com/linrunner/TLP
[4]:/files/images/gecko1jpg
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gecko_1.jpg?itok=qTvEsSQ1 (GeckoLinux)
[6]:/licenses/category/used-permission
[7]:/files/images/gecko2jpg
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gecko_2.jpg?itok=AKv0x7_J (openSUSE)
[9]:https://www.clementine-player.org/
[10]:https://www.mozilla.org/en-US/thunderbird/
[11]:https://www.pidgin.im/
[12]:https://www.videolan.org/vlc/index.html
[13]:https://www.mozilla.org/en-US/firefox/
[14]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
