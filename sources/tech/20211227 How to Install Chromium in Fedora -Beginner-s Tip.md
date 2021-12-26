[#]: subject: "How to Install Chromium in Fedora [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/install-chromium-fedora/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Chromium in Fedora [Beginner’s Tip]
======

[Chromium][1], the open-source mother of the [best browsers][2] in the market, including Google Chrome, Microsoft Edge, Brave and so many others, is a great browser power packed with features.

Like many other distributions, Fedora also comes with Firefox as its default browser. But you can easily install Chromium on Fedora.

The simplest option is to open the software center application and search for Chromium. You’ll find the option to install Chromium there.

![Chromium can be installed from the Fedora software center][3]

Additionally, there are two command line methods to install Chromium in Fedora Linux, which I will be walking you through:

  * [DNF][4] (Fedora’s package manager and **recommended**)
  * [Flatpak][5] (sandboxed packaging, might be slow to start, poor system integration and take more disk space)



### Alternate method 1: Installing Chromium via DNF command

Previously, Chromium was only found in COPR repository (Fedora’s equivalent of Arch User Repository aka AUR), but now it’s actually available in the official repositories. Installing it now is a very easy task, you don’t have to add anything extra.

For that, start the terminal, and type:

```

    sudo dnf install chromium

```

![Installing Chromium via DNF][6]

When asked, press Y key to confirm the installation. Chromium will be installed within a few minutes, and it will look like the image below:

![Chromium browser in Fedora][7]

#### Remove Chromium via DNF

Let me also tell you about the step for removing Chromium. You can either look for it in the software center and remove it from there or use the following command:

```

    sudo dnf remove chromium

```

That is fairly easy, isn’t it? Let me show the Flatpak method as well.

### Alternate method 2: Installing Chromium via Flatpak

Sandboxed [Flatpak][8] packaging is baked in Fedora. Sandboxing is a great technology and a good security measure. But it’s sad that apps lose integration with the operating system.

But if those things don’t bother you, install Flatpak version of Chromium on Fedora. In a terminal, use this command:

```

    flatpak install app/org.chromium.Chromium

```

![Installing Chromium via Flatpak][9]

That will do the necessary to get Chromium ready for you.

Due to sandboxed nature of Flatpaks, the theme looks entirely different from the overall system dark theme. You can [force the Flatpak package to adhere to the system theme][10] with a little effort, though.

![Chromium browser – Flatpak version][11]

#### Removing Chromium Flatpak app

And to remove Chromium browser installed via Flatpak, just type this in the terminal:

```

    flatpak remove chromium

```

Choosing _All the Above_ from the options will completely remove chromium.

![Removing chromium – Flatpak][12]

### Final thoughts

I’m not a fan of Sandboxed applications for daily usage; I just prefer RPMs over Flatpak or Snap even if it includes complex steps which was not the case here, thankfully.

I hope this tutorial helps you. Let me know your thoughts in the comments section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-chromium-fedora/

作者：[Pranav Krishna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lujun9972
[1]: https://chromium.org/Home
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/chromium-in-fedora-software-center.png?resize=800%2C344&ssl=1
[4]: tmp.LkoNS5yzRn#dnf
[5]: tmp.LkoNS5yzRn#flatpak
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/Screenshot-from-2021-12-23-17-49-14.png?resize=800%2C423&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/chromium-1.png?resize=800%2C447&ssl=1
[8]: https://itsfoss.com/what-is-flatpak/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/Screenshot-from-2021-12-23-17-55-55.png?resize=800%2C423&ssl=1
[10]: https://itsfoss.com/flatpak-app-apply-theme/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/chromium-flatpak-1-1.png?resize=800%2C447&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/flatpak-remove-chromium-1.png?resize=800%2C423&ssl=1
