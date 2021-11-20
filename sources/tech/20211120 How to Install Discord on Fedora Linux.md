[#]: subject: "How to Install Discord on Fedora Linux"
[#]: via: "https://itsfoss.com/install-discord-fedora/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Discord on Fedora Linux
======

[Discord][1] is a popular messaging application, which can be used for text and voice messaging.

It is a boon to several communities, which helps them to expand their projects, reach out to more people, and maintain a community of fans and followers. It’s surprising considering that Discord was originally meant for gamers.

Discord is available for various platforms, including Linux. In this tutorial, I’ll walk you through the steps for installing Discord in Fedora.

  * Installing Discord using DNF and RPM Fusion Repository
  * Installing Discord via Flatpak



The Flatpak packages are sandboxed and hence take more disk space and time to start. However, they get updated for newer version releases fairly quickly.

The choice is really yours if you want to use Flatpak or DNF. I’ll show both methods to you.

Non-FOSS alert!

Discord application is not open source. But since they provide a Linux client and many Linux users rely on it, it’s been covered here.

### Method 1: Installing Discord via RPM Fusion Repository

Discord can be installed by adding the nonfree RPM Fusion repository, which is the preferred method of most Fedora users, since updating is easy and the application starts up faster than the Flatpak version.

Open a terminal and use the following command to add the RPM-fusion non-free repository:

```

    sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```

Once you’re done with it, update the repository list (should not be needed but just for the sake of it):

```

    sudo dnf update

```

Then install Discord via DNF command like this:

```

    sudo dnf install discord

```

![Installing Discord using DNF][2]

If asked for importing a GPG key, just authorize it by pressing ‘Y’

![Authorize GPG key][3]

That is it! Now you can launch Discord from the app menu. Your login screen will look like this:

![Launch Discord application][4]

#### Remove Discord via DNF

If you don’t want to use Discord anymore, you can remove it from your system. To do that, run the following command in the terminal:

```

    sudo dnf remove discord

```

It’s really simple, isn’t it? There is another simple way of installing Discord and that is to use Flatpak packages.

### Method 1: Installing Discord via Flatpak

Discord can be installed easily using Flatpak since it is available by default in Fedora.

First, you need to enable Flatpak repository in Fedora:

```

    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

Next, install Discord via this command:

```

    flatpak install discord

```

![Install Discord via Flatpak][5]

If you want to remove Discord, then just run:

```

    flatpak remove discord

```

That’s super easy. Let me know if you need any more help for installing Discord on Fedora Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-discord-fedora/

作者：[Pranav Krishna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lujun9972
[1]: https://discord.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-discord-dnf.png?resize=800%2C525&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/authorize-gpg-key-1.png?resize=800%2C573&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/Discord-2.png?resize=800%2C432&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-discord-flatpak.png?resize=800%2C545&ssl=1
