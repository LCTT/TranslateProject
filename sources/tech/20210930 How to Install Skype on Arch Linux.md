[#]: subject: "How to Install Skype on Arch Linux"
[#]: via: "https://itsfoss.com/install-skype-arch-linux/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Skype on Arch Linux
======

There was a time when [Skype][1] used to be the default application for video calls. Microsoft bought Skype, change its P2P architecture, tried to monetize it, tried to push it as business tool but Skype kept on seeing a gradual decline.

There are tons of video calling apps on mobile. On desktop, Zoom is preferred for video conferencing. Even Microsoft has a new communication tool in the form of Microsoft Teams.

Despite everything, Skype is still being developed and there are few people still using it. If you are one of those people who want to use Skype on their Arch Linux system, this tutorial will help you.

There are two ways you can get Skype on Arch Linux:

  * Using Snap
  * Using Arch Linux



Let’s see both methods one by one.

### Method 1: Install Skype on Arch Linux using Snap

The easiest way to install Skype is via the Snap Store. The biggest advantages of using the Skype snap is that it is maintained by the Skype developer, and it updates automatically in the background.

And it is really easy to install as well. Open a terminal and use the following command:

```
sudo snap install skype
```

If you get `snap: command not found` in reply, you’ll need to install Snapd first.

![Check is Snap support is installed or not][2]

#### Installing Snap support on Arch Linux

To download Snap, run the following commands:

```
git clone https://aur.archlinux.org/snapd.git
```

![Clone snapd][3]

Before you build and install Snap, you need to change the permission for the folder by using this command:

```
sudo chmod a+w snapd
```

Now, enter the folder and install Snap:

```
cd snapd && makepkg -si
```

![Installing Snap][4]

Once Snap is installed, you need to activate the snap socket that handles communication with systemd. To do that, use this command:

```
sudo systemctl enable --now snapd.socket
```

Next, you need to create a symbolic link between /var/lib/snapd/snap and /snap using this command:

```
sudo ln -s /var/lib/snapd/snap /snap
```

After that, you should either reboot your system or log out and log back in for these changes to take place.

![][5]

Now, we can check to make sure that Snap is installed correctly by running it in the terminal.

Finally, you can install the Skype snap by typing:

```
sudo snap install skype
```

![][6]

You might get an error that says `error: too early for operation, device not yet seeded or device not acknowledged`. This means that snapd had a couple of processes that need to be run first. You can either wait a few minutes and retry, or logout and log back in.

Once the installation is complete, you can launch Skype either by selecting it from the system menu or by typing `skype` in the terminal.

![Skype snap running in Arch Linux][7]

### Method 2: Install Skype from Arch User Repository

Since Skype is a proprietary piece of software, Arch devs don’t make it available through their repos. Thankfully, it is available in the [Arch User Repository (AUR)][8].

If you already have an AUR helper like yay installed, you can use:

```
yay -S skypeforlinux-stable-bin
```

Alternatively, if you do not want to use an AUR helper, you can still get the package from the AUR and install it without AUR helper. It takes a bit more effort, though.

First, you should check for updates by running the following command:

```
sudo pacman -Syy
```

Next, you need to clone the package’s git repo to your system by using the following command:

```
sudo git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git
```

![][9]

In order to install Skype you need to change file permissions, you can that by running:

```
sudo chmod a+w skypeforlinux-stable-bin
```

![][10]

Now, you can enter the folder by typing:

```
cd skypeforlinux-stable-bin
```

To finally install Skype, enter this command into the terminal:

```
makepkg -si
```

![][11]

Once the installation process is complete, you can run Skype either by selecting it from the system menu or by typing `skypeforlinux` in the terminal.

![AUR version of Skype][12]

You can choose either of the methods based on your preference and enjoy Skype on Arch Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-skype-arch-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://www.skype.com/en/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/snap-check-1.png?resize=770%2C252&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/clone-snapd.webp?resize=800%2C347&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/snap-install.webp?resize=799%2C460&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/snap-socket-enable-800x255.webp?resize=800%2C255&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/snap-install-skype.webp?resize=782%2C260&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/snap-skype.png?resize=800%2C600&ssl=1
[8]: https://wiki.archlinux.org/title/Arch_User_Repository
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/sky-aur-clone.webp?resize=800%2C341&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/skype-aur-permission.webp?resize=792%2C280&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/sky-aur-install.webp?resize=800%2C591&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/aur-skype.png?resize=800%2C600&ssl=1
