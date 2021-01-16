[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install Privacy-friendly WhatsApp Alternative Signal on Linux Desktop)
[#]: via: (https://itsfoss.com/install-signal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Install Privacy-friendly WhatsApp Alternative Signal on Linux Desktop
======

It’s been more than a year [since we covered Signal as an ideal choice for instant messaging][1]. While privacy-aware and tech-savvy people were already aware of the existence of this awesome application, [Signal][2] got the much deserved fame after the latest WhatsApp privacy policy updates.

Whatever maybe the reason if you are new to Signal and you are wondering if you can use Signal on desktop, the answer is yes. You can install Signal on Linux, Windows and macOS systems along with your smartphone.

![Signal Messenger on Pop OS Linux distribution][3]

I am not going to highlight the features Signal offers because you might already be aware of them. I am going to show you different methods of installing Signal application Linux desktop:

  * Install Signal on Linux using Snap (snap applications take longer to load but get automatic update and hassle-free installation)
  * Install Signal on Debian and Ubuntu-based distributions using apt (additional efforts in adding the repository but installed apps get automatic updates)
  * Install Signal on Arch and Manjaro Linux using AUR
  * Install Signal on Fedora and other Linux using Flatpak package



You can choose one of the methods based on your distribution and preference:

### Method 1: Installing Signal on Ubuntu and other Linux using Snap

If you are using Ubuntu, you can find Signal desktop app in Snap package format in the Software Center.

![][4]

Alternatively, you can [use the Snap command][5] to install Signal on any [Linux distribution that has Snap support][6] enabled.

```
sudo snap install signal-desktop
```

You can remove it using `snap remove` or from the Software Center.

Some people do not like Snap packages because they take too long to start. The good news is that you can use apt command to install Signal. The next section discusses that.

### Method 2: Install Signal on Debian and Ubuntu-based distributions via APT (using official Signal repository)

Here are the steps you have to follow to install Signal from its official repository on Debian, Debian, Linux Mint, elementary OS and other distributions based on Debian/Ubuntu. You can [copy the commands and paste it in the terminal][7].

First thing is to get the GPG key for the official Signal repository and add it to the trusted keys of your APT package manager.

```
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
```

With the key added, you can safely add the repository to your system. _**Don’t get alarmed with the use of xenial in the repository name**_. It will work with Ubuntu 18.04, 20.04 and newer version as well as Debian, Mint etc.

```
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
```

Thanks to the [tee command in Linux][8], you’ll have a new file `signal-xenial.list` in the sources.list directory `/etc/apt/sources.list.d`. This new file will have the Signal repository information i.e. `deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main`.

Now that you have added the repository, update the cache and install Signal desktop application:

```
sudo apt update && sudo apt install signal-desktop
```

Once installed, look for Signal in application menu and start it.

![][9]

Since you have added the repository, your installed Signal application will be automatically updated with the regular system updates.

Enjoy encrypted messaging with Signal on your Linux desktop.

#### Removing Signal

The tutorial won’t be complete if I don’t share the removal steps with you. Let’s go through it.

First, remove the application:

```
sudo apt remove signal-desktop
```

You may leave it as it is, or you may remove the Signal repository from your system. It’s optional and up to you. With the repository still in the system, you can install Signal again, easily. If you remove the repository, you’ll have to add it again following the steps in the previous section.

If you want to remove the Signal repository as well, you can opt for the graphical method by going to Software and Updated tool and deleting it from there.

![][10]

Alternatively, you can remove the file with rm command:

```
rm -i /etc/apt/sources.list.d/signal-xenial.list
```

### Method 3: Installing Signal on Arch and Manjaro from AUR

Signal is available to install on [Arch-based Linux distributions][11] via [AUR][12]. If you are using Pamac on Manjaro and have enabled AUR, you should find Signal in the package manager.

Otherwise, you can always [use an AUR helper][13].

```
sudo yay -Ss <package-name>
```

I believe you can delete Signal in the similar function.

### Method 4: Installing Signal on Fedora and other Linux using Flatpak

There is no .rpm file for Signal. However, a [Flatpak package is available][14], and you may use that to get Signal on Fedora.

```
flatpak install flathub org.signal.Signal
```

Once installed, you can run it from the menu or use the following command in the terminal:

```
flatpak run org.signal.Signal
```

Signal and Telegram are two mainstream and viable options to ditch WhatsApp. Both provide native Linux desktop applications. If you use Telegram, you can [join the official It’s FOSS channel][15]. I use Signal in individual capacity because it doesn’t have the ‘channel’ feature yet.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-signal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/signal-messaging-app/
[2]: https://signal.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot.jpg?resize=800%2C565&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/signal-desktop-ubuntu.png?resize=800%2C425&ssl=1
[5]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[6]: https://itsfoss.com/install-snap-linux/
[7]: https://itsfoss.com/copy-paste-linux-terminal/
[8]: https://linuxhandbook.com/tee-command/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/signal-app-in-ubuntu.jpg?resize=795%2C230&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-signal-repository.png?resize=800%2C401&ssl=1
[11]: https://itsfoss.com/arch-based-linux-distros/
[12]: https://itsfoss.com/aur-arch-linux/
[13]: https://itsfoss.com/best-aur-helpers/
[14]: https://flathub.org/apps/details/org.signal.Signal
[15]: https://t.me/joinchat/AAAAAEPRGUJrEE1itjpH6A
