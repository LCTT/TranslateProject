[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Font Manager: A Simple Open-Source App for GTK+ Desktop)
[#]: via: (https://itsfoss.com/font-manager/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Font Manager: A Simple Open-Source App for GTK+ Desktop
======

_**Brief: A dead simple font manager app that lets you focus on tweaking the fonts on your Linux system.**_

If you are an experienced Linux user, you might be utilizing the terminal or the [tweak tool][1] to manage fonts on your Linux system.

Honestly, no matter how useful the GNOME tweak tool is — it could be a little too overwhelming just to manage fonts. So, a separate application would be perfectly fine to help you manage fonts.

### Font Manager: An Open-Source App To Help Manage Fonts

![][2]

Font Manager (that’s literally the name of the app) is a dedicated application to help you manage the fonts.

You get the details of the font family, variations available, and the ability to filter and tweak based on their height, width, spacing, and more. Considering it is a simple app, you do not find a bunch of features but I’ll briefly highlight a few things below.

### Features of Font Manager

![][3]

  * Ability to add fonts
  * Ability to remove fonts
  * Easily filter fonts based on family, vendor, spacing, height, etc
  * Tweak the scaling factor of fonts
  * Adjust the anti-aliasing (softness/sharpness) of the font
  * Add font sources to preview them before installing it
  * Offers keyboard shortcuts to quickly manage things
  * Google fonts integration available out-of-the-box
  * Get detailed information on characters available in the family font, license, size of the font, vendor, file type, spacing, width, and style



![][4]

Overall, you can easily install or remove fonts. But, you get quite a few perks while managing the fonts as shown in the screenshot above.

### Installing Font Manager on Linux

You get a variety of options (depending on the Linux distro you use) for installation.

If you have an Ubuntu-based distro, you can easily add the PPA through the commands below to install font manager:

```
sudo add-apt-repository ppa:font-manager/staging
sudo apt update
sudo apt install font-manager
```

In case you’re not a fan of [PPAs][5] (which is how I prefer to install this), you can also install a [Flatpak package available][6] on any Linux distribution.

You just need to enable Flatpak on your Linux system and then search for it on your software center (if it supports Flatpak integration) or just type in the following command to install it:

```
flatpak install flathub org.gnome.FontManager
```

In case you’re an Arch user, you can find the [package][7] in the [AUR][8].

For further installation instructions, you might want to refer its [official website][9] and the [GitHub page][10].

[Download Font Manager][9]

### Wrapping Up

Font Manager is a simple solution for any GTK+ based desktop environment. Primarily for GNOME but you can also utilize it for other desktop environments as well.

You get a lot of useful information while being able to add or remove fonts and it is clearly a no-nonsense font manager, I think.

What do you think about Font Manager? Let me know your thoughts in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/font-manager/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/gnome-tweak-tool/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager.png?resize=800%2C565&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager-settings.jpg?resize=800%2C569&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/font-manager-showcase.png?resize=800%2C571&ssl=1
[5]: https://itsfoss.com/ppa-guide/
[6]: https://flathub.org/apps/details/org.gnome.FontManager
[7]: https://aur.archlinux.org/packages/font-manager/
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://fontmanager.github.io/
[10]: https://github.com/FontManager/font-manager
