[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (13 Things To Do After Installing Linux Mint 20)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-linux-mint-20/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

13 Things To Do After Installing Linux Mint 20
======

Linux Mint is easily one of the [best Linux distributions][1] out there and especially considering the features of [Linux Mint 20][2], I’m sure you will agree with that.

In case you missed our coverage, [Linux Mint 20 is finally available to download][3].

Of course, if you’ve been using Linux Mint for a while, you probably know what’s best for you. But, for new users, there are a few things that you need to do after installing Linux Mint 20 to make your experience better than ever.

### Recommended things to do after installing Linux Mint 20

In this article, I’m going to list some of them for to help you improve your Linux Mint 20 experience.

#### 1\. Perform a System Update

![][4]

The first thing you should check right after installation is — system updates using the update manager as shown in the image above.

Why? Because you need to build the local cache of available software. It is also a good idea to update all the software updates.

If you prefer to use the terminal, simply type the following command to perform a system update:

```
sudo apt update && sudo apt upgrade -y
```

#### 2\. Use Timeshift to Create System Snapshots

![][5]

It’s always useful have system snapshots if you want to quickly restore your system state after an accidental change or maybe after a bad update.

Hence, it’s super important to configure and create system snapshots using Timeshift if you want the ability to have a backup of your system state from time to time.

You can follow our detailed guide on [using Timeshift][6], if you didn’t know already.

#### 3\. Install Useful Software

Even though you have a bunch of useful pre-installed applications on Linux Mint 20, you probably need to install some essential apps that do not come baked in.

You can simply utilize the software manager or the synaptic package manager to find and install software that you need.

For starters, you can follow our list of [essential Linux apps][7] if you want to explore a variety of tools.

Here’s a list of my favorite software that I’d want you to try:

  * [VLC media player][8] for video
  * [FreeFileSync][9] to sync files
  * [Flameshot][10] for screenshots
  * [Stacer][11] to optimize and monitor system
  * [ActivityWatch][12] to track your screen time and stay productive



#### 4\. Customize the Themes and Icons

![][13]

Of course, this isn’t something technically essential unless you want to change the look and feel of Linux Mint 20.

But, it’s very [easy to change the theme and icons in Linux Mint][14] 20 without installing anything extra.

You get the option to customize the look in the welcome screen itself. In either case, you just need to head on to “**Themes**” and start customizing.

![][15]

To do that, you can search for it or find it inside the System Settings as shown in the screenshot above.

Depending on what desktop environment you are on, you can also take a look at some of the [best icon themes][16] available.

#### 5\. Enable Redshift to protect your eyes

![][17]

You can search for “[Redshift][18]” on Linux Mint and launch it to start protecting your eyes at night. As you can see in the screenshot above, it will automatically adjust the color temperature of the screen depending on the time.

You may want to enable the autostart option so that it launches automatically when you restart the computer. It may not be the same as the night light feature on [Ubuntu 20.04 LTS][19] but it’s good enough if you don’t need custom schedules or the ability to the tweak the color temperature.

#### 6\. Enable snap (if needed)

Even though Ubuntu is pushing to use Snap more than ever, the Linux Mint team is against it. Hence, it forbids APT to use snapd.

So, you won’t have the support for snap out-of-the-box. However, sooner or later, you’ll realize that some software is packaged only in Snap format. In such cases, you’ll have to enable snap support on Mint.

```
sudo apt install snapd
```

Once you do that, you can follow our guide to know more about [installing and using snaps on Linux][20].

#### 7\. Learn to use Flatpak

By default, Linux Mint comes with the support for Flatpak. So, no matter whether you hate using snap or simply prefer to use Flatpak, it’s good to have it baked in.

Now, all you have to do is follow our guide on [using Flatpak on Linux][21] to get started!

#### 8\. Clean or Optimize Your System

It’s always good to optimize or clean up your system to get rid of unnecessary junk files occupying storage space.

You can quickly remove unwanted packages from your system by typing this in your terminal:

```
sudo apt autoremove
```

In addition to this, you can also follow some of our [tips to free up space on Linux Mint][22].

#### 9\. Using Warpinator to send/receive files across the network

Warpinator is a new addition to Linux Mint 20 to give you the ability to share files across multiple computers connected to a network. Here’s how it looks:

![][23]

You can just search for it in the menu and get started!

#### 10\. Using the driver manager

![Driver Manager][24]

The driver manager is an important place to look for if you’re using Wi-Fi devices that needs a driver, NVIDIA graphics, or AMD graphics, and drivers for other devices if applicable.

You just need look for the driver manager and launch it. It should detect any proprietary drivers in use or you can also utilize a DVD to install the driver using the driver manager.

#### 11\. Set up a Firewall

![][25]

For the most part, you might have already secured your home connection. But, if you want to have some specific firewall settings on Linux Mint, you can do that by searching for “Firewall” in the menu.

As you can observe the screenshot above, you get the ability to have different profiles for home, business, and public. You just need to add the rules and define what is allowed and what’s not allowed to access the Internet.

You may read our detailed guide on [using UFW for configuring a firewall][26].

#### 12\. Learn to Manage Startup Apps

If you’re an experienced user, you probably know this already. But, new users often forget to manage their startup applications and eventually, the system boot time gets affected.

You just need to search for “**Startup Applications**” from the menu and you can launch it find something like this:

![][27]

You can simply toggle the ones that you want to disable, add a delay timer, or remove it completely from the list of startup applications.

#### 13\. Install Essential Apps For Gaming

Of course, if you’re into gaming, you might want to read our article for [Gaming on Linux][28] to explore all the options.

But, for starters, you can try installing [GameHub][29], [Steam][30], and [Lutris][31] to play some games.

**Wrapping Up**

That’s it folks! For the most part, you should be good to go if you follow the points above after installing Linux Mint 20 to make the best out of it.

I’m sure there are more things you can do. I’d like to know what you prefer to do right after installing Linux Mint 20. Let me know your thoughts in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-linux-mint-20/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-distributions/
[2]: https://itsfoss.com/linux-mint-20/
[3]: https://itsfoss.com/linux-mint-20-download/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-system-update.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/snapshot-linux-mint-timeshift.jpeg?ssl=1
[6]: https://itsfoss.com/backup-restore-linux-timeshift/
[7]: https://itsfoss.com/essential-linux-applications/
[8]: https://www.videolan.org/vlc/
[9]: https://itsfoss.com/freefilesync/
[10]: https://itsfoss.com/flameshot/
[11]: https://itsfoss.com/optimize-ubuntu-stacer/
[12]: https://itsfoss.com/activitywatch/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-theme.png?ssl=1
[14]: https://itsfoss.com/install-icon-linux-mint/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-system-settings.png?ssl=1
[16]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-redshift-1.png?ssl=1
[18]: https://itsfoss.com/install-redshift-linux-mint/
[19]: https://itsfoss.com/ubuntu-20-04-release-features/
[20]: https://itsfoss.com/install-snap-linux/
[21]: https://itsfoss.com/flatpak-guide/
[22]: https://itsfoss.com/free-up-space-ubuntu-linux/
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/mint-20-warpinator-1.png?ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2013/12/Additional-Driver-Linux-Mint-16.png?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-firewall.png?ssl=1
[26]: https://itsfoss.com/set-up-firewall-gufw/
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/linux-mint-20-startup-applications.png?ssl=1
[28]: https://itsfoss.com/linux-gaming-guide/
[29]: https://itsfoss.com/gamehub/
[30]: https://store.steampowered.com
[31]: https://lutris.net
