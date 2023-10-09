[#]: subject: "Install Brave on Arch Linux"
[#]: via: "https://itsfoss.com/install-brave-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Brave on Arch Linux
======

Firefox and Brave are my daily drivers for web browsing.

When I installed Arch Linux with GNOME, it had GNOME Web browser. It's a decent browser but not something I can live with it as I need my saved passwords, browsing history and plugins.

So, I started out to install my favorite web browsers and hence this tutorial on getting Brave in Arch Linux.

If you have Yay (or any other AUR helper) installed, installing Brave is as simple as using this command:

```

    yay -S brave-bin

```

Yeah! That simple. Let's see it in detail.

💡

Manjaro comes with AUR support baked in. You can install Brave in Manjaro using Pamac software center or pamac/pacman commands.

### Installing Brave browser on Arch Linux

Brave is not available in the official Arch repositories. However, it is available in the AUR (Arch User Repository) and can be easily installed using an AUR helper like Yay.

If you don't have Yay or any other AUR helper, use these commands one by one to [install Yay][1]:

```

    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

```

Once you have got Yay, use it to install Brave:

```

    yay -S brave-bin

```

Don't worry. It will ask for your password eventually.

If this is your first time installing a browser, you kay be asled to choose a font provider. Go with the default choice or choose any of the other.

![][2]

Next, it will ask you about clean build. Yay asks you if it should redownload the packages (and dependencies) and build it again or use the cache from an earlier build (if there is any).

You can go on with it by pressing enter, which should mean No to clean build.

![][3]

In fact, you can just keep on pressing enter when you are presented with choices to with the default one.

Just before the actual installation, you'll be asked to enter your account password. Enter your password and go on with the process. It will download files of around 350 MB in size:

![][4]

Once installed, look for [Brave browser][5] in the system menu and run it from there.

![][6]

### Keeping Brave updated

You can keep the Brave browser updated by updating the AUR packages installed with yay using this command:

```

    yay -Sua

```

### Removing Brave from Arch

Don't like Brave? No worries. You can easily remove it.

Like any other software, remove Brave from Arch using pacman command:

```

    sudo pacman -Rs brave-bin

```

### Conclusion

AUR comes to the rescue, once again! Installing Brave becomes an easy task with it.

By the way, I noticed that somehow Brave became the default application for opening images. Which means, double clicking on images were opening them in a new Brave window.

I had to make Image Viewer default again by right clicking an image, and going to "open with" option.

![Somehow Brave becomes the default image viewer. You should change it][7]

I'll be sharing more of my Arch experience in the coming days. Stay tuned!

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-brave-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-yay-arch-linux/
[2]: https://itsfoss.com/content/images/2023/10/yay-install-brave-font-install.png
[3]: https://itsfoss.com/content/images/2023/10/clean-build-yay.png
[4]: https://itsfoss.com/content/images/2023/10/installing-brave-arch-linux.png
[5]: https://brave.com/
[6]: https://itsfoss.com/content/images/2023/10/run-brave-arch-linux.png
[7]: https://itsfoss.com/content/images/2023/10/open-images-in-viewer-not-brave.png
