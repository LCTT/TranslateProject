[#]: subject: "Give Your Linux Mint and Xubuntu a Visual Uplift Using Twister UI"
[#]: via: "https://www.debugpoint.com/2022/02/twister-ui-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Give Your Linux Mint and Xubuntu a Visual Uplift Using Twister UI
======
TWISTER UI IS THE EASIEST WAY TO GIVE YOUR LINUX MINT AND XUBUNTU A
VISUAL UPLIFT USING PRE-LOADED THEMES. HERE’S HOW.
[Twister UI][1] is an add-on to your existing Linux Mint and Xubuntu installation. The Pi Labs created this UI, who made the [Twister OS][2] for Raspberry Pi and related hardware.

### Twister UI

The Twister UI is a collection of packages for [Linux Mint][3], and Xubuntu brings several popular OS-specific themes and configurations out of the box. You can apply them with just a click of a button. You do not need to download separate icons, themes or cursors.

The latest release gives out-of-box desktop theme, icons, sound, and other settings changes for the below OS types.

  * Native Twister OS Theme
  * Windows 98, Windows 7, Windows XP
  * Windows 11, Windows 10
  * iTwister and iTwister Sur (for macOS)



#### How does it work?

The team prepared automated scripts that download all popular OS-specific themes, sounds, etc., from GitHub. Then the script modifies them, download additional packages from the Ubuntu repository and installs this add-on as a whole. The installer takes care of installing everything by itself, and all you need to do is wait.

Before we explain to you how to install it, let’s look at some of the screenshots and features of this OS mod. These screenshots are from the Linux Mint Xfce edition with this OS mod applied.

#### How it looks (screenshots)

![Twister UI – macOS Theme][4]

![Twister UI – Windows XP Theme][5]

![native Twister OS theme][6]

#### Contents of the Twister UI Package

The package brings its own settings app called ThemeTwister. You can use this to switch themes quickly. You can change as many times you want between them. Nothing breaks.

The project also installs some good open-source packages by default. It installs Lutris, Steam gaming platforms to help you quickly play games. It also installs Discord, Wine emulator for the users.

As you can see, the team carefully thought of which packages to install, considering the user base of this add-on.

### How to Install

If you plan to install this, I recommend using this package in Linux Mint Xfce edition and Xubuntu. Do not try to install it in other Linux distributions _(I tried before reading the documentation, I messed up my Fedora install, so don’t try it in other distributions)_.

The requirement is a Linux Mint Xfce or Xubuntu installation (wither 32-bit 64-bit). It also requires around 5 GB of disk space.

First, download the package from the below link, which contains the Torrent link. It is not an ISO file. It consists of three files, one of which is the actual script.

[Download Twister UI][1]

Once downloaded, open the downloaded folder, and you should see a file with extension .run (as below).

![Give the execute permission to the run file][7]

Change the permission of the file to make it executable. Then run it via the terminal.

The script requires an admin password, so provide that once asked. Before you start the installation, make sure that you have a stable internet connection to download additional packages on the fly.

![Starting the installation script][8]

The download and installation take some time. Depending on your internet speed, it might take around 15 to 20 minutes.

[][9]

SEE ALSO:   Zorin OS 16 Lite Review - Perfect Combination of Beauty, Performance and Simplicity

You should know that the installer will replace the default Plymouth and .

Once installation completes, the script should prompt you to reboot.

After reboot, log in to your Linux Mint Xfce or Xubuntu system.

### How to Change Themes

If you are using the Linux Mint Xfce edition, you need to make the following additional changes for the best results before changing the theme:

  * Open Application Menu &gt; Settings &gt; Desktop, under the Icons tab, uncheck the Use custom font size.
  * Open Application Menu &gt; Settings &gt; Window Manager tweaks, under the Compositor tab, uncheck Show shadows under dock windows.



You should now see a “ThemeTwister” icon on the desktop and open the application. This application gives you options to change themes, as shown below.

![Changing theme using ThemeTwister tool][10]

Select a theme and click on the respective button. Each time you change or apply a piece, the script asks you to log off. So make sure you close all your programs before changing the theme.

### How to Uninstall

If you are done and want to uninstall, then open a terminal and run the following shell script.

```

    sh /usr/share/ThemeSwitcher/uninstall.sh

```

The above script only uninstalls Twister UI components and doesn’t uninstall Steam, Lutris etc. So if you want to uninstall, use the Software manager to uninstall them.

It would be best if you did a reboot after uninstallation.

### Review and Performance

As per the Pi Labs documentation, the customizations should not consume much additional memory. And it is true.

The customization is not impacting much on the desktop performance. When I ran one or two of the customization in Linux Mint Xfce edition in idle mode, it consumed around 740 MB of memory with CPU around 2% to 3%. This itself is impressive. The only cost of using this is the additional disk space.

![Resource Usage in Linux Mint with Twister UI][11]

The theme switcher is excellent and flawlessly changes the theme without surprises or errors.

In general, the entire process is error-free and went well as per its design.

### Closing Notes

After downloading individual themes icons and changing settings, you can manually configure your Linux distribution to look like Windows or macOS. That takes a lot of time and is sometimes difficult for new users. With that in mind, I think this new approach is a time saver and very easy for everyone. You can get all the required mods with just a click of a button.

There will always be an argument about why a Linux need to look like Windows or macOS. But older folks may not be familiar with computers much and remember the Windows colours and icons. They can adapt Linux using this simple modification without any hassles.

Overall, it’s an excellent project from the Pi Labs and helps many users worldwide.

So, what do you think about this project? Let me know in the comment box below.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][12], [Twitter][13], [YouTube][14], and [Facebook][15] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/twister-ui-2022/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://twisteros.com/twisterui.html
[2]: https://twisteros.com
[3]: https://www.debugpoint.com/2021/11/linux-mint-20-3-new-app/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/02/Twister-UI-macOS-Theme-1024x576.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/02/Twister-UI-Windows-XP-Theme-1024x574.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/native-Twister-OS-theme-1024x581.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Give-the-execute-permission-to-the-run-file-1024x521.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/02/Starting-the-installation-script.jpg
[9]: https://www.debugpoint.com/2021/12/zorin-os-16-lite-review-xfce/
[10]: https://www.debugpoint.com/wp-content/uploads/2022/02/Changing-theme-using-ThemeTwister-tool.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/02/Resource-Usage-in-Linux-Mint-with-Twister-UI-1024x579.jpg
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
