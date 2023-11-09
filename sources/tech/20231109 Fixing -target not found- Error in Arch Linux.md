[#]: subject: "Fixing 'target not found' Error in Arch Linux"
[#]: via: "https://itsfoss.com/target-not-found-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing 'target not found' Error in Arch Linux
======

The other day I was trying to install Hyprland on Arch Linux. When I used the [Pacman command to install][1] it, it threw a 'target not found' error.

```

    [abhishek@itsfoss ~]$ sudo pacman -S hyprland
    [sudo] password for abhishek:
    error: target not found: hyprland
    [abhishek@itsfoss ~]

```

That was a surprise because I knew that Hyprland was available.

**The fix in my case** was to update the system and in most cases, it fixes this problem.

```

    sudo pacman -Syu

```

Here, the local package database is out of sync. I needed to update the cache. Updating the system is also suggested here.

That's what fixes this error in most cases. However, there could be a few other reasons why you see this error. Let me discuss them in detail here.

### Fix: Update the system

Arch Linux is a [rolling release distribution][2] and it provides updates quite frequently. If you don't update the system every few days, your local package database will be out of sync with the remote mirrors and you'll have trouble installing packages.

The local package database only keeps the metadata of the package like version number, repository URL to get the package from etc.

When you search for a package, pacman provides the search result that says that the package is available. However, the package has an older version number in your local database. When pacman searches for the package in a remote repository (to get the actual packages), it doesn't find the older version URL anymore.

This is what causes the 'target not found' error.

The fix is to update the local database. That could work with `pacman -Sy`, however, it is recommended to [update the entire Arch Linux system][3] to avoid dependency conflicts, among other things.

```

    sudo pacman -Syu

```

📋

If you have not updated your system for some weeks, be prepared for updates over 1 GB. This could take some time, depending on your internet speed and the mirrors you are using.

In my case, Arch is installed on my secondary system. And since I could not use it for a week or so, the system was outdated. Once I updated it, I could install [Hyprland][4].

![][5]

💡

If that doesn't work, force the refresh of all package databases by adding the extra y: sudo pacman -Syyu

### Other suggestions to fix 'target not found' error

Here are a few tips on fixing this error if the above method did not fix it for you.

#### Double check the package name

It may seem elementary, my dear Watson, but often people just type the package name incorrectly.

Linux is case sensitive and packages are usually named in lowercases. So if you a popular tool is Flameshot, it's package name is likely to be flameshot.

Also, some software have different spelling than the common one. For example, it is hyprland and that made me make mistake of typing hyperland (with the usual 'hyper' spelling).

![][6]

In some rare cases, there could be confusion whether it is `l` or `I` or `1`.

Basically, ensure that the name you have entered the package name is correc.

#### See if the package is available in the repositories

Arch Linux has a vast number of packages in its repositories. But that does not mean it has every possible Linux packages.

Go to the official Arch Linux package website:

[Arch Linux Package Search][7]

Here, enter the package name and see if the package is available. If yes, which repository it is and on which device it is available.

![][8]

`x86_64` is for Intel architecture and any includes ARM architecture is for [Raspberry Pi like devices][9].

💡

If the package is found in some repo but pacman cannot find it even on an updated system, please check the pacman conf file and see if you have the said repository enabled.

#### Ensure that it's not an AUR package

[Arch User Repository (AUR)][10] is the additional community supported platform that provides newer packages.

Now, there are multiple ways to use AUR packages but pacman is not one of them.

Check if the package you are trying to install is an AUR package. Check the official Arch repository first, as explained above. If it's not there, then check the AUR page.

If it's an AUR package, you'll have to [use yay][11] or some [other AUR helper][12]. You cannot use pacman to install AUR packages.

### Were you able to fix the issue?

Updating the system is what fixes this issue in most cases. In some rare instances, there could be other reasons and I have mentioned some suggestions for them.

Now it's your turn. Let me know in the comment section if you were able to fix this issue or not.

--------------------------------------------------------------------------------

via: https://itsfoss.com/target-not-found-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/rolling-release/
[3]: https://itsfoss.com/update-arch-linux/
[4]: https://hyprland.org/
[5]: https://itsfoss.com/content/images/2023/11/installing-hyperland.png
[6]: https://itsfoss.com/content/images/2023/11/pacman-target-not-found-error-arch-linux.png
[7]: https://archlinux.org/packages/
[8]: https://itsfoss.com/content/images/2023/11/arch-linux-package-search.png
[9]: https://itsfoss.com/raspberry-pi-alternatives/
[10]: https://itsfoss.com/aur-arch-linux/
[11]: https://itsfoss.com/install-yay-arch-linux/
[12]: https://itsfoss.com/best-aur-helpers/
