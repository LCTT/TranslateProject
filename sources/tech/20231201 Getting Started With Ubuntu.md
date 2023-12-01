[#]: subject: "Getting Started With Ubuntu"
[#]: via: "https://itsfoss.com/getting-started-with-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Getting Started With Ubuntu
======

So you are thinking of using Ubuntu? Or perhaps you have already started using Ubuntu?

After hearing so much about Linux, you decided to try it. You installed Ubuntu and things look good.

But now you wonder what to do next?

No worries. Most, if not all, Ubuntu beginners face the same question. What do I do next in this shiny and powerful new operating system? Let me help you with that.

After using Ubuntu as my main operating system for nearly 14 years, here are a few suggestions that will help a new Ubuntu user like you.

You’ll learn to do basic stuff in Ubuntu, learn how to customize, install software, use a few commands and do some common troubleshoots.

This page will help you using Ubuntu as your main workstation in a better and effective way.

📋

This guide is more appropriate for people who have installed Ubuntu on an actual computer. Many suggestions are valid even if you are using Ubuntu in a virtual machine. Not suitable if you are using Ubuntu in WSL.

### Before installing Ubuntu

You may have dozens of questions around Linux. What is kernel, what is distribution, why are there so many Linux, how are they different from each other? This non-technical analogy will answer your question.

![][1]

Even Ubuntu has many versions (called flavors). There are 11 official Ubuntu flavors. And then there are LTS and regular versions. Here’s how to choose the best Ubuntu version you should use.

![][1]

Once you have decided the version, the first step of using Ubuntu is to create a live USB. This tutorial shows you how to do that on Windows.

![][1]

### Installing Ubuntu

📋

I am assuming that you have a Windows system.

There are four main ways of installing Ubuntu.

#### Method 1: Use inside Windows with WSL

Install Ubuntu inside Windows using WSL (this guide is not suitable for such installation method)

![][1]

#### Method 2: Use Ubuntu in a VM in Windows

Install Ubuntu inside a virtual machine like any other Windows application. This is a good way to try your hands on Ubuntu desktop from the comfort of your Windows system. However, you must have at least 8 GB of RAM, 15 GB of disk space and good CPU to run it comfortably and smoothly.

![][1]

You can also [use VMWare to install Ubuntu in a VM][2].

#### Method 3: Remove Windows, install Ubuntu

Install Ubuntu as the only operating system on your computer. This method removes Windows completely from your computer.

![][1]

#### Method 4: Keep Windows and Ubuntu together

You can have both Windows and Ubuntu on the same computer. This is called dual boot. When your system powers on, you'll see the option to boot into both Linux and Windows.

![Dual boot lets you choose the operating system at the boot time][3]

Here's the complete tutorial for dual booting Windows and Ubuntu.

![][1]

Here are a few more dual booting scenarios that may be applicable to a few systems.

  * [Dual boot on an old Windows system with MBR partitioning and legacy BIOS][4]
  * [Dual booting on a system that has both SSD and HDD][5]
  * [Dual booting with BitLocker encryption][6]



Some assorted advice on [things to do after installing Ubuntu][7].

![][1]

### Getting software

There are multiple ways to install applications on Ubuntu.

  * Use the Software Center application
  * Some applications are available in .deb file format
  * PPAs are still popular for getting packages not officially available from Ubuntu



This detailed guide covers all the [application installation methods][8].

![][1]

In addition to that, I also advise [learning to use AppImage][9] as you'll often find applications in this format.

![][1]

Now that you know how to install software on Ubuntu, how about some application suggestions?

![][1]

✋

Please do not feel pressured to follow every suggestion here. Don't feel comfortable with something? Don't do it. These are suggestions, not compulsion, specially the customization and performance improvement parts.

### System maintenance

It is important to keep your [Ubuntu system updated][10]. It gives you newer versions of installed software along with kernel upgrades and security and maintenance updates.

![][1]

Having a Timeshift backup of your system settings helps you in recovering in case things get messed up.

![][1]

Keep a tab on the disk usage.

![][1]

And free up space if required.

![][1]

If you are coming from Windows, it is not uncommon to look for a task manager. Yes, you get that in Ubuntu.

![][1]

### Customize the look and feel

There are so many aspects of desktop customization on Linux that Windows users cannot even imagine.

And I am not talking about simple methods like [changing wallpapers][11]. You can change the icons and themes:

![][1]

The GNOME Tweaks tool helps in customization.

![][1]

But a lot of customization comes in the form of GNOME Extensions. You need to learn to use it first.

![][1]

Learn to use the dock and customize its looks.

![][1]

Explore even more customizations.

![][1]

### Enjoy movies, music and games

I highly recommend installing media codecs so that you can easily play MP3 music and a number of video file formats.

![][1]

You can [install Chrome][12] to enjoy Netflix on Ubuntu. If you want to stick with Firefox, activate the Widevine to play DRM content from Netflix, Spotify and many other streaming sites.

![][1]

You may also install the dedicated Spotify player.

![][1]

Gaming on Ubuntu can be enjoyed with Steam.

![][1]

### Stay connected with Windows (if needed)

If you are using Ubuntu as the sole operating system and for some reasons, you must use Windows, you may try running it in a virtual machine.

![][1]

Some Windows-only applications can be run with WINE. Though only opt for it when you are desperate.

![][1]

You may share folders on local network between Ubuntu and Windows with Samba share.

![][1]

### Know your system

It is always a good idea to know about your system. Which version is it? How long is it supported? Is it an LTS? These information helps when you are looking for specific packages or seeking help in a forum.

![][1]

System getting too hot? Keep a tab on the temperature.

![][1]

See what hardware is on your system.

![][1]

Not only is it fun, it also displays information about your system like which theme are you using, which desktop environment version it is and more.

![][1]

### Performance improvement tips

I am a huge fan of the keyboard shortcuts. Nothing makes you feel more smart and powerful than the command over the keyboard combinations.

![][1]

The file manager can be tweaked to utilize its full potential.

![][1]

Master the GNOME search.

![][1]

If your system often gets overheated, you may employ a few tactics to reduce it. Not a guarantee but helps at times.

![][1]

If you are getting ridiculously slow internet when compared to other devices on your network, here are a few tips you can try.

![][1]

And a few tips to make your system a bit more snappy (if not a lot).

![][1]

### Troubleshoot common issues

No operating system is perfect. Ubuntu is not an exception. You might encounter a few issues that are common to Ubuntu.

You'll often see this message. Don't panic. It's not a catastrophe.

![][1]

It is not uncommon to see error while updating your system. This specially happens when you try getting applications from external sources.

![][1]

No wifi? Here are a few troubleshooting tips.

![][1]

If you dual boot, you may experience wring time being displayed in both operating systems. Here's the fix.

![][1]

### Dive into the terminal

It is not necessary but knowing a bit of the command line knowledge helps, specially in troubleshooting. So [don't be afraid of the terminal][13].

![][1]

I have written a ten-chapter series to teach you the absolute basics of the Linux command line.

![][1]

### Advanced package management

✋

These are advanced concepts. You may use Ubuntu on your personal computer without them as well. However, if you are interested in to a deeper dive into the system, this section is for you.

Understanding the package management mechanism helps makes you an informed Ubuntu user.

![][1]

Learn to use the classic apt-get commands.

![][1]

Or the newer apt command.

![][1]

[Confused between apt and apt-get][14]? Don't be.

![][1]

Since it's Ubuntu, the newer Snap packaging is everywhere. Better know

![][1]

### Where to go from here?

You installed Ubuntu. You might have learned to find your way around it, managing software, changing desktop etc. What next? If you want to learn more about Linux, its file structure, command line, shell scripting etc, here are some Linux learning resources.

![][1]

There are many free Linux e-books available as well.

![][1]

And if you can spend some money, take a look at [my favorite Linux books][15].

![][1]

Of course, the learning never stops. **I highly recommend subscribing to our weekly newsletter.**

Each week, you'll get an assortment of relevant Linux news, tips and tweaks on using Linux on your system. This way, you get to discover new and evergreen tutorials without effort. And this gradually improves your Linux skills.

![][1]

--------------------------------------------------------------------------------

via: https://itsfoss.com/getting-started-with-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[2]: https://itsfoss.com/install-ubuntu-in-vmware/
[3]: https://itsfoss.com/content/images/wordpress/2021/02/dual-boot-grub-screen.jpg
[4]: https://itsfoss.com/install-ubuntu-dual-boot-mode-windows/
[5]: https://itsfoss.com/dual-boot-hdd-ssd/
[6]: https://itsfoss.com/dual-boot-ubuntu-windows-bitlocker/
[7]: https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/
[8]: https://itsfoss.com/remove-install-software-ubuntu/
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://itsfoss.com/update-ubuntu/
[11]: https://itsfoss.com/change-wallpaper-ubuntu/
[12]: https://itsfoss.com/install-chrome-ubuntu/
[13]: https://itsfoss.com/love-thy-terminal/
[14]: https://itsfoss.com/apt-vs-apt-get-difference/
[15]: https://itsfoss.com/best-linux-books/
