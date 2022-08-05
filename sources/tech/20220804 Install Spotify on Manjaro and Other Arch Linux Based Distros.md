[#]: subject: "Install Spotify on Manjaro and Other Arch Linux Based Distros"
[#]: via: "https://itsfoss.com/install-spotify-arch/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Spotify on Manjaro and Other Arch Linux Based Distros
======
Spotify needs no introduction. It is the most popular music streaming service.

You can [play Spotify in a web browser][1], but using the desktop application would be a better option if you use it extensively.

Why? Because you can control the playback with the media key, get notifications for the songs, and don’t need to worry about accidentally closing the browser tab or window. The desktop client gives a wholesome experience.

Spotify [provides a repository][2] for Ubuntu and Debian. But what about installing Spotify on Arch Linux?

Actually, it is even simpler to get the Spotify desktop application on Arch Linux. Just use this command:

```
sudo pacman -Syu spotify-launcher
```

That’s one of the many ways of installing Spotify on Arch-based Linux distros like Manjaro, [Endeavour OS][3], [Garuda Linux][4], etc.

In this tutorial, I’ll discuss the following methods of installing Spotify:

* Using [pacman][5] (you already saw it above but we’ll dig deeper)
* Installing using [Pamac][6] (the package manager from Manjaro)
* Installing using [Flatpak][7] (the universal packaging format)
* Using Snap (official package by the Spotify team)

### Method 1: Install Spotify using pacman

Spotify is [available][8] from the Community repository of Arch Linux. It’s actually a Rust implementation of the APT repository provided by Spotify.

Open your terminal and [use the pacman command][9] in the following manner:

```
sudo pacman -Syu spotify-launcher
```

Once installed, launch it from the Application Menu and log in to start listening.

![Spotify on Arch Linux][10]

Enter the following command to remove it along with its dependencies and config files.

```
sudo pacman -Rns spotify-launcher
```

### Method 2: Install Spotify using Pamac

If you are using Manjaro or [have installed Pamac in your system][11], you can use it to install Spotify graphically.

Open Add/Remove Software from Applications menu. Click on the search icon on the top left and search for Spotify. Then, select the package named `spotify-launcher` and click Apply to install as shown below.

![Using Pamac to install Spotify][12]

You can also deselect the package when installed and click Apply to remove it.

#### Using Pamac CLI

yes, Pamac also has a command line interface and you can use it in the following manner to get Spotify.

```
pamac install spotify-launcher
```

And to remove later, use:

```
pamac remove spotify-launcher
```

### Method 3: Install Spotify using Flatpak

Many users prefer to install proprietary applications using Flatpak for the sandbox it provides.

Enter the following command in the terminal to update your system and install Flatpak (if you don’t have it already).

```
sudo pacman -Syu flatpak
```

Then, enable [Flathub repository][13] using the following command.

```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Now, install Spotify by entering the command below.

```
flatpak install spotify
```

To remove the Flatpak for Spotify you can use the command below.

```
flatpak remove spotify
```

### Method 4: Install Spotify using Snap

I understand that many people have a strong dislike for the Snap packaging format for its ‘closed’ nature. However, Spotify provides a Snap package officially. You are getting it from the Spotify developers themselves.

If you have Snap package support on your system, use the following command:

```
sudo snap install spotify
```

If you want to remove it later, use this command:

```
sudo snap remove spotify
```

#### Conclusion

The Arch package discussed in the first method is developed and maintained by [kpcyrd][14]. You can check out the source code for the same [here][15].

Please consider donating to the project if you like Arch Linux and want to support it. All the work is done by the community members, who are unpaid volunteers.

Let me know if you have any issues installing Spotify on Arch.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-spotify-arch/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://open.spotify.com/
[2]: https://www.spotify.com/us/download/linux/
[3]: https://endeavouros.com/
[4]: https://garudalinux.org/
[5]: https://wiki.archlinux.org/title/Pacman
[6]: https://wiki.manjaro.org/index.php/Pamac
[7]: https://itsfoss.com/what-is-flatpak/
[8]: https://archlinux.org/packages/community/x86_64/spotify-launcher/
[9]: https://itsfoss.com/pacman-command/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/spotify-e1658764973807.png
[11]: https://itsfoss.com/install-pamac-arch-linux/
[12]: https://itsfoss.com/wp-content/uploads/2022/07/pamac-spotify-e1658764946532.png
[13]: https://flathub.org
[14]: https://github.com/kpcyrd
[15]: https://github.com/kpcyrd/spotify-launcher
