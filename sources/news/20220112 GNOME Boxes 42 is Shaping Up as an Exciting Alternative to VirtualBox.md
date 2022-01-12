[#]: subject: "GNOME Boxes 42 is Shaping Up as an Exciting Alternative to VirtualBox"
[#]: via: "https://news.itsfoss.com/gnome-boxes-42-alpha/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME Boxes 42 is Shaping Up as an Exciting Alternative to VirtualBox
======

GNOME Boxes is an easy-to-use virtualization software that lets you download operating systems from within the program or use ISO files to create new virtual machines.

It is also the only program that lets you test upcoming GNOME versions, just like we tried [GNOME OS][1].

While it remains a simplified experience now, the upcoming version brings several UI updates to give you more control and customizations.

In a [tweet][2], **Felipe Borges** (maintainer) shared some early development progress with Boxes 42 alpha build.

I tried it out to give you some key highlights here.

### GNOME Boxes 42 (Alpha): What’s New?

![][3]

Boxes, as a virtualization application, works well. However, the lack of options makes me want to [install VirtualBox to create virtual machines][4].

However, I think it might become a viable alternative to VirtualBox with the recent development updates.

As per my experience with the alpha version, you get the usual welcome screen that highlights the essential aspects of the application. Everything else looks the same at first glance but is subject to change with further development.

When focusing on the new addition, the preferences tab replaces the “properties” that you see in the current version.

![][5]

You can easily tweak the resources, enable 3D acceleration, and access more options from a single screen.

It seems to be more convenient when compared to how it is with the GNOME Boxes 41.x.

~~There are some subtle visual changes, like a background icon in the menu bar, which you can notice to the left of action buttons in the window.~~

The background icon indicates that this is a development build.

![][6]

The option to create snapshots is easily accessible.

![][7]

You can notice the USB redirection option, which was already present in non-flatpak builds. However, the [Flatpak][8] version is still incapable of USB device sharing.

![][9]

Overall, the initial visual changes seem promising and should make GNOME Boxes 42 an exciting choice to create and manage virtual machines.

Boxes 42 should debut along with GNOME 42 release in the middle of march, as clarified by Felipe.

### How to Install GNOME Boxes 42 in Linux?

Note that the alpha version is meant for testing and may not work. So, if you are willing to test it out and help with the development, you can install it using GNOME’s nightly Flatpak repository.

First, make sure that you have [Flatpak enabled in your Linux distro][10]. Next, type in the commands below to install it:

```

    flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

    flatpak install gnome-nightly org.gnome.BoxesDevel

```

What do you think about [GNOME Boxes][11] 42 as an alternative to VirtualBox? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-boxes-42-alpha/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/gnome-os/
[2]: https://twitter.com/felipeborges/status/1480891936248586242
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ5NCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://itsfoss.com/install-virtualbox-ubuntu/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU5MSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIxNSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI3MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://itsfoss.com/what-is-flatpak/
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM5NyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://help.gnome.org/users/gnome-boxes/stable/
