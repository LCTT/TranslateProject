[#]: subject: "Archinstall’s New Menu System Makes it Even Easier to Install Arch Linux"
[#]: via: "https://news.itsfoss.com/archinstall-menu/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Archinstall’s New Menu System Makes it Even Easier to Install Arch Linux
======

Last year, this time around, Arch Linux [introduced a guided installer][1] to make the installation process easier.

All you had to do was type in “**archinstall**” to get started with the step-by-step installation without needing to customize all by yourself.

Not just for new users, it should also save you some time to install Arch Linux in general. You get all the essential options starting from creating username/root user, selecting the desktop, picking software packages, choosing the audio server, and more.

If you are curious, you can take a look at archinstall in action in our [installation guide for Arch Linux on VirtualBox][2].

Now, with archinstall v2.4.1, we have a new menu system and numerous technical changes.

Let us take a look at it and how it works.

### Archinstall’s New Menu System &amp; Accessibility Improvements

![][3]

The new menu system looks much more organized.

It is built using [simple-term-menu][4] as its base, which is a package to create interactive menus on the command line. To avoid external dependencies, it has been bundled with the source, all thanks to Ingo Meyer.

Other developers include [Werner Llácer][5] and [Daniel][6] to make this work with 1200+ lines of code.

The menu system is also accessibility friendly. You can switch it to the tracking selection mode using the “numpad *”, which should make espeakup work, as one would expect.

In future archinstall versions, it will honor default tracking mode as well.

As you can notice in the screenshot above, you get to set the language, keyboard layout, kernels, audio server, user, network, and more essential options.

Once you select the hard drive, the menu will add another option to let you choose a “disk layout” where you can select the type of file system.

![][7]

Similarly, as you proceed with each option, you will get access to more things to tweak like the profiles to set your desktop environment:

![][8]

By default, you have a swap enabled. But, you can tweak that as you require. Overall, it should be a seamless experience, with all installation prerequisites presented in a menu form.

Thanks to _Sreenath_ on our team for testing this through to give you some screenshots:

![][9]

In addition to these changes, you can also expect the following improvements:

  * BTRFS compression option added as an option if you select btrfs as filesystem.
  * Archinstall now supports multiple NIC configurations at the same time for manual configuration
  * The installer keeps track of which packages have been installed through archinstall.Installer()



To explore all the technical changes and bug fixes, you can refer to the [release notes on GitHub][10].

**You can wait for the latest ISO (scheduled for May 1) to try it out, or download it from GitHub and try it yourself.**

_Have you tried the original guided installer on Arch Linux? Or do you prefer to configure everything without the installer? Feel free to let me know your thoughts below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/archinstall-menu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/arch-linux-easy-install/
[2]: https://itsfoss.com/install-arch-linux-virtualbox/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4MyIgd2lkdGg9Ijc5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://github.com/IngoMeyer441/simple-term-menu
[5]: https://github.com/wllacer
[6]: https://github.com/svartkanin
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMwMiIgd2lkdGg9IjEwMDEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIyNiIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwMCIgd2lkdGg9IjgwMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[10]: https://github.com/archlinux/archinstall/releases/tag/v2.4.1
