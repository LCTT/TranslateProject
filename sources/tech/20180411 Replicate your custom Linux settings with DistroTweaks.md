Replicate your custom Linux settings with DistroTweaks
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb)

Currently, there are more than 300 different Linux operating system distributions available. Each distro serves a slightly different purpose with slightly different bundles of programs for different communities of users.

Even though there are hundreds of different versions of Linux, it hasn't been very easy for individual customizers to share them with the community. [DistroTweaks][1], a process that allows users to customize and share Linux, is a better option than what's come before.

A DistroTweak is a process that allows anyone to quickly and easily add dozens of customizations and programs to an existing Linux distro with just the click of a button. It replaces the tedious process of making changes and manually (and individually) adding dozens of programs. The term "tweak" is a nod to what computer enthusiasts call a slight modification of an operating system or application. A tweak generally doesn't change the core of the operating system or program; it merely adds to it.

### Why DistroTweaks?

In the past, there were two options for widely sharing a custom distribution. The first was to clone the distribution with a cloning tool after customizing your settings and programs, but cloning is a complex process. Often, folks didn't find out their clone didn't work until they tried to install it and got the black screen of death.

The other option was to make your own distribution. You would fork an existing distribution, delete programs you didn't like, and add the programs you wanted. You also had to create new graphics to replace the ones in the parent distribution, as well as build a website to host the download page and a community forum for answering questions. This is very time-consuming.

DistroTweaks offers a third option for sharing Linux that is more reliable than cloning and less work than starting your own distribution. It leverages the [Aptik][2] tool that simplifies re-installing software after a Linux distro re-installation.

### How DistroTweaks solves problems

I teach courses in writing books and creating complex, interactive websites, and I want my students to have access to the same custom computer system and programs I use. This is an issue because I have made several dozen minor modifications to the Linux Mint operating system, added a couple of dozen programs to the default Mint programs, and made more than 50 modifications to LibreOffice (one of Mint's default programs).

Previously, my students had to follow dozens of steps in my books and websites to get a computer that looked exactly like mine. While this is a good learning exercise that teaches students why I made these modifications, this "learning by doing" process is a long ordeal that may be too intimidating or time-consuming for a lot of students.

To make this faster and easier, I developed a simple process that exactly copies all my custom settings and programs into a special DistroTweaks file. My students can install Linux Mint in the normal way, add the DistroTweaks file, and, in a matter of minutes, have an exact copy of my computer with all my customized Mint settings and programs (including the LibreOffice customizations). Because it doesn't alter Linux Mint itself, the result is highly stable. The DistroTweaks process even works inside a virtual machine, so it can be tested before installing it on a computer. In addition, the process is so easy that anyone can create their own custom DistroTweak and share it with any group.

### How to create a DistroTweak

  1. To avoid accidentally sharing your personal settings, start with a completely clean computer.
  2. Download and install your favorite Linux distribution (we have only tested DistroTweaks with Ubuntu-based Linux, but Debian-based distros may also work).
  3. Create a list of all the tweaks you will make to your distro settings, the programs you will add, and the customizations you will make. For example, we customized LibreOffice Writer menu and added several extensions to it.
  4. Complete all the steps on your list of tweaks on your clean computer. Practice installing everything, just to make sure everything works and you are aware of all dependencies ahead of time. Be as organized as possible.
  5. Next, use a personal package archive ([PPA][3]) software repository to install the Aptik tool. To install Aptik, open a terminal and enter the following commands:


```
sudo apt-add-repository -y ppa:teejee2008/ppa

sudo apt-get update

sudo apt-get install aptik

```

  1. Start Aptik from the Linux menu and enter your password.
  2. Create a backup folder in your computer's **Filesystem** folder: First, right-click on the screen and select **Open as root**. Then, right-click again and select **Add a new folder**. Name the folder **Backup**.
  3. In Aptik, click **Select** , which opens in the **Filesystem** folder, and click on your new **Backup** folder.
  4. Click on **One-click settings** to review your default settings (which you can change if you want). Click OK to close this window.
  5. Click on the **Backup** icon to the right of **Installed software**. This will bring up a (long) list of programs that will be backed up by clicking on **Downloaded packages**. You can uncheck any programs you don't want copied to your new installation.
  6. It's finally time to use Aptik to copy all your programs and system settings into your new **Backup** folder. Click on the **One-click backup** button. It will take about 10 minutes to copy all your programs, software sources, and settings to your **Backup** folder; when it's finished, you'll see the notification **Backup completed**. Click **Close**.
  7. Copy everything in the **Backup** folder to an external USB drive or a cloud storage.
  8. Change the name of your backup archive to whatever you want to call your special DistroTweak.



### How to add a DistroTweak to your computer

  1. Back up your documents and other files by coping them to an external USB.
  2. Use a [live USB][4] containing your favorite Linux distro to reformat your computer and install the operating system. Just plug in the USB live stick, restart your computer, and go through the normal installation process.
  3. Remove the live USB stick and install Aptik on your computer by entering the following commands in your terminal:


```
sudo apt-add-repository -y ppa:teejee2008/ppa

sudo apt-get update

sudo apt-get install aptik

```

  1. Copy and paste your DistroTweaks folder from your USB or cloud storage to the filesystem folder on your computer with the new distro installed.
  2. Point Aptik to your DistroTweaks folder.
  3. Enter your admin password, then click on **One-click restore**. Watch as dozens of programs are installed in minutes.
  4. Recopy your documents and other files from your USB drive to your computer.



### DistroTweaks limitations

  * DistroTweaks has only been tested on Ubuntu-based distributions.
  * After installing dozens of programs through DistroTweaks, several may not work correctly (even if they're listed in the menu). If this happens, you will have to uninstall and reinstall them.
  * For DistroTweaks to work, the target computer must use the same desktop environment used to create the DistroTweak. For example, a Mint Cinnamon DistroTweak should only be used on a Mint Cinnamon installation.



While DistroTweaks is a new option for existing distributions, it offers even more benefits to people who have wanted to create and share their own custom set of programs but were impeded by the difficulties of starting and maintaining their own distributions. Whether you are a teacher (like me) or a corporate executive of a Fortune 500 company, DistroTweaks makes creating and sharing your own version of Linux a lot easier.

David will be speaking at LinuxFest NW this year. See [program highlights or register][5] to attend.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/distrotweaks

作者：[David Spring][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/davidspring
[1]:https://distrotweaks.org/
[2]:https://github.com/teejee2008/aptik
[3]:https://en.wikipedia.org/wiki/Ubuntu_(operating_system)#Package_Archives
[4]:https://en.wikipedia.org/wiki/Live_USB
[5]:https://www.linuxfestnorthwest.org/conferences/lfnw18
