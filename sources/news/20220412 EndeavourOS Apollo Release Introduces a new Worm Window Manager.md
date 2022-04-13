[#]: subject: "EndeavourOS Apollo Release Introduces a new Worm Window Manager"
[#]: via: "https://news.itsfoss.com/endeavouros-apollo-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EndeavourOS Apollo Release Introduces a new Worm Window Manager
======

EndeavourOS is an Arch-based distro that focuses on a terminal-centric user experience along with all the other goodies.

With its latest Apollo release, the EndeavourOS team has made efforts to improve the community editions, resolve some existing issues, and add a new window manager.

### EndeavourOS Apollo: What’s New?

The most significant changes include a brand-new Window Manager “Worm” and having FirewallD installed (and enabled) by default.

Let us take a brief look at the changes along with other improvements.

#### New Worm Window Manager

![][1]

Worm is a lightweight window manager developed by one of the community editions team members (Codic12). It is written in [Nim][2].

Presently, it is based on X11 and does not support Wayland.

The window manager focuses on performance while being able to work with floating/tiling modes with essential window decorations that include minimize, maximize, and close buttons.

The layout can even operate nicely on a semi-embedded device like Pi Zero.

#### Linux Kernel 5.17

[Linux Kernel 5.17][3] is all about supporting next-gen hardware. If you are looking to try an Arch-based distro on the latest hardware configuration, EndeavourOS should be a nice option to start with.

#### FirewallD Installed and Enabled

![][4]

While not everyone appreciates having a firewall enabled by default, with the latest Apollo release, EndeavourOS will have it baked in and active after installation.

#### New Quickstart App

![][5]

A GUI app to launch after the first boot (quickstart) was added to help you choose/install common and helpful apps.

It provides the selection of applications using the Arch repo and not the [AUR][6].

#### A New Nvidia Driver Installer

The existing nvidia-installer-dkms app was rewritten as an improved command-line tool to make the process easier and more efficient.

The tool is still in its beta phase, but it is a good addition for users with Nvidia graphics.

#### Improvements to the Installer

Various improvements to the installation process were made, like the addition of an internet check before installation, a fix for DE selection, and more technical work to improve the experience.

#### Other Improvements

![][7]

Along with the key highlights, there are plenty of important fixes and changes that include:

  * Disable Bluetooth by default, but active in the Live environment.
  * Applying compression on installed files for btrfs.
  * Community editions with dedicated display manager, including Light DM, Slick greeter, Lxdm, ly, and GDM.
  * Automatically choosing the closest EndeavourOS mirror.



You can learn more about the latest release in their [official announcement][8].

### Download EndeavourOS Apollo

The latest ISO is available on their official website. You can head to the [downloa][9][d][9] [page][9] and get the ISO from one of the mirrors available.

[EndeavourOS][9]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/endeavouros-apollo-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU3NiIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[2]: https://en.wikipedia.org/wiki/Nim_(programming_language)
[3]: https://news.itsfoss.com/linux-kernel-5-17-release/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY3OSIgd2lkdGg9IjkwMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4MyIgd2lkdGg9Ijk2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://itsfoss.com/aur-arch-linux/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUyNCIgd2lkdGg9Ijg1NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://endeavouros.com/news/the-apollo-release-has-landed/
[9]: https://endeavouros.com/latest-release/
