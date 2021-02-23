[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Discord Application in Ubuntu and Other Linux Distributions [3 Methods])
[#]: via: (https://itsfoss.com/install-discord-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Discord Application in Ubuntu and Other Linux Distributions [3 Methods]
======

[Discord][1] is a popular messaging application. It was originally intended for gamers but these days, it is considered a [Slack alternative][2] even for team and community communication. You can use it for text, voice and video messaging.

Several open source project use it for communicating with project members and users.

Discord is available on various platforms including desktop Linux. In this tutorial, I’ll show you various ways of installing Discord on Ubuntu, Debian and other Linux distributions.

  * [Installing Discord via DEB file][3] (applicable to Debian, Ubuntu, Linux Mint and other Debian/Ubuntu based distributions)
  * [Installing Discord via Snap or Flatpak][4] (applicable for distributions with Snap or Flatpak support)
  * [Installing Discord in traditional way][5] (applicable for all distributions but need good knowledge of Linux commands)



Non-FOSS alert!

Discord application is not open source. But since they provide a Linux client and many Linux users rely on it, it’s been covered here.

### Method 1: Installing Discord in Ubuntu and Debian-based Linux Distributions

Go to the [download page of Discord][6] and download the deb file. Keep in mind that, Discord is only available for 64-bit systems.

![Download Discord for Linux][7]

[Installing deb file is easy][8]. Just double click on it to open it in the software manager and install it from there. You may also install and [use Gdebi tool][9] for this purpose.

It will take a few seconds for installing and you should see a log in screen like this:

![][10]

The problem with this approach is that though you’ll have the latest Discord version, it won’t be updated to a newer version automatically in the future.

You can either uninstall it from the software center or use this command in the terminal:

```
sudo apt remove discord
```

### Method 2: Installing Discord on Ubuntu and other Linux distributions using Snap package

You can easily install Discord using Snap package in Ubuntu and various other Linux distributions with snap package support.

The advantage is that you’ll always have the latest version of Discord and your installed version gets automatically updated. The downside is that Snap packages take longer to start.

Ubuntu user can find [Discord snap package][11] in the Software Center and install from there:

![Discord snap package is available in Ubuntu Software Center][12]

If you have enabled Snap support on your Linux distribution, you can use the following command to install it:

```
sudo snap install discord
```

If you want to remove it, you can use the snap command to uninstall it:

```
sudo snap remove discord
```

Please note that [Discord is also available in Flatpak package format][13]. You can [use Flatpak][14] to install it in Fedora and other Linux distributions.

### Method 3: Installing Discord in other Linux Distributions (intermediate to advanced level)

Discord also provides a generic isntaller for using Discord on Linux. It comes in the traditional tar gz file.

If you go for this way of installing Discord on Linux, then you should have at least a moderate [understanding of Linux directory structure][15] and Linux commands. You must also be comfortable using the terminal because this method involves using the terminal all the way.

#### Step 1: Download Discord for Linux

First [download the tar.gz file from Discord’s website][6].

I am using Discord version 0.0.10 in the tutorial. Your file name may or may not be different. Pay attention to it.

#### Step 2: Extract the downloaded file to opt directory

Go to directory where you have downloaded the file. Use the tar command to extract the .tar.gz file in the /opt directory.

```
sudo tar -xvzf discord-0.0.10.tar.gz -C /opt
```

Traditionally, the /opt directory is used for installing/keeping files of optional or additional Linux software. Since you opted for the traditional way, it only makes sense to use the traditional convention.

#### Step 3: Create Discord command in bin directory

Now you should have /opt/Discord directory with files related to Discord. You should have two important files to tackle here. A binary file named Discord and a desktop file named discord.desktop.

Now, you should [create a symbolic link][16] to this binary file in /usr/bin directory.

```
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord
```

The /usr/bin directory contains the binary executables for commands in your system. This way, any user can run the commands from anywhere in the system.

#### Step 4: Create desktop icon and menu entry

You have Discord available as a command for all users on the system. But you cannot find it in the system menu to launch it graphically.

For that, you’ll have to use the discord.desktop file located in the extracted folder in the opt directory.

You should pay attention to two lines here: Exec and Icon.

The exec is for executable file and you can set it to /usr/bin/Discord . The Icon is for the image of Discord that will be displayed when you search for Discord in the menu. You can set it to the /opt/Discord/discord.png. This image is present in the extracted folder.

You can [use nano editor][17] with sudo for editing this file or whichever [terminal-based text editor][18] you prefer. Your discord.desktop may look something like this:

![][19]

Your discord.desktop file is still in the /opt/Discord directory. You need to move it to /usr/share/applications directory so that your system can access this desktop entry.

```
sudo cp -r /opt/Discord/discord.desktop /usr/share/applications
```

Normally, you should see Discord added in the list of available applications in the menu immediately. If not, log out and log in again.

#### Step 5: Run Discord

You are done. Now if you search for Discord, you will find it in the menu and when you run it for the first time, it will do some configuration.

![Running Discord for the first time][20]

After that, it will bring you to the login screen. It automatically tried to log you in from your default browser.

![][10]

Enjoy Discord on Linux. If there is a new version of Discord in the future, you’ll have to remove the already installed version and then repeat the procedure with the new version.

#### Removing Discord installed in the traditional way

It would be unfair to just discuss how to install Discord. Let me give you some pointers about removing it as well.

When you install Discord on Linux, it saves config file in .config/discord folder in your home directory. Delete these files:

```
rm -r ~/.config/discord
```

Next, remove the Discord directory from the /opt directory:

```
sudo rm -rf /usr/bin/Discord
```

Also delete the symbolic link you had created:

```
sudo rm /usr/bin/Discord
```

As the last step, remove the desktop file:

```
sudo rm /usr/share/applications/discord.desktop
```

**Did you manage to install Discord on Linux? Which method did you use?**

I gave you various ways of installing Discord application on Linux. The traditional Linux way is somewhat complicated but at least this way you can install it on any Linux distribution.

Did you manage to install it? Which method did you use and prefer?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-discord-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://discord.com/
[2]: https://itsfoss.com/open-source-slack-alternative/
[3]: tmp.ehA52f5sBZ#via-deb
[4]: tmp.ehA52f5sBZ#via-snap
[5]: tmp.ehA52f5sBZ#traditional-method
[6]: https://discord.com/new/download
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/download-discord-linux.png?ssl=1
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/discord-login-screen.jpg?ssl=1
[11]: https://snapcraft.io/discord
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/install-discord-snap.jpg?ssl=1
[13]: https://flathub.org/apps/details/com.discordapp.Discord
[14]: https://itsfoss.com/flatpak-guide/
[15]: https://linuxhandbook.com/linux-directory-structure/
[16]: https://linuxhandbook.com/symbolic-link-linux/
[17]: https://itsfoss.com/nano-editor-guide/
[18]: https://itsfoss.com/command-line-text-editors-linux/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/installing-discord-in-linux-traditional-way.png?ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/discord-install.jpg?ssl=1
