[#]: subject: "It’s Time More Linux Distros and DEs Become ‘Linus-Proof’"
[#]: via: "https://news.itsfoss.com/more-linux-distros-become-linus-proof/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

It’s Time More Linux Distros and DEs Become ‘Linus-Proof’
======

The past few weeks have rattled the desktop Linux community.

Popular tech YouTuber Linus, not Torvalds but Sebastian, decided to use Linux on desktop for a month. Linus Sebastian wanted to see if Linux has gotten to the point where it is user friendly enough that any tech nerd can pick it up and run? His focus was also on [gaming on Linux][1] because PC gaming is an area Sebastian covers a lot.

That’s an interesting concept and many in the Linux community got excited because it was free publicity for desktop Linux to a wider tech audience.

Only, it went [horribly wrong in the very first part of the Linux Daily Driver Challenge][2].

### Linus Sebastian’s (in)famous Pop!OS moment

Linus Sebastian decided to [install Pop!_OS][3] because it is often considered a good mainstream distribution for gaming. He then tried to install Steam from the software center but the software center failed to install it.

![Sebastian encountered an issue with Steam installation][4]

When it did not work graphically, he went on to do what any other Linux user would have done. He turned to the terminal and ran the magical sudo apt-get install command.

![Sebastian switches to command line to install Steam][5]

In both graphical and terminal method, Pop!_OS showed a warning that the user was on the verge of removing some essential packages.

The command line method clearly warned, “_**You are about to do something potentially harmful. To continue type in the phrase ‘Yes, do as I say**_‘”.

![Ignores the warning about removing crucial packages][6]

For many Linux users, this could have been the point to pause and reflect. The output clearly shows that it is going to delete gdm3, pop-desktop and many other desktop environment elements.

But people often do not care about warnings. Linus Sebastian went ahead with it and ended up with a broken system that cannot be logged in graphically.

![Linus Sebastian \(not Torvalds\) after realizing his Pop!_OS install is messed up][7]

### Lesson for the desktop Linux developers

There are two lessons to learn here for the developers:

  * Installing Steam or any other regular software should never have resulted in removal of critical graphical elements.
  * A user should not be able to remove the critical piece of software from a regular, mainstream distribution.



Pop!_OS quickly fixed the bug with Steam and also added a defensive mechanism to disable removal of critical desktop elements.

> For some reason, an i386 version of a package was never published on Launchpad. Steam being an i386 package, when trying to install it, it had to downgrade that package to the Ubuntu version to resolve dependencies, which removed Pop!_OS packages.
>
> — Jeremy Soller (@jeremy_soller) [October 26, 2021][8]

To prevent such incidents in the future, Pop!_OS patched the APT package manager. Now, POP!_OS won’t be able to enter “Yes, do as I Say”. Instead, they will have to add a special a file to enable it (if someone really wants to remove the packages).

That’s a good move by Pop!_OS. But this is not just a lesson for Pop!_OS. Most Linux distributions could encounter similar situation and end up deleting the desktop environment and display server itself.

KDE took a note and adds a feature to [disable the removal of Plasma desktop in the upcoming Plasma 5.24 release][9].

![KDE Plasma won’t allow you to remove Plasma Desktop][10]

Many people blamed Linus Sebastian for going ahead with the disaster despite clear warning. But here’s the thing, many users won’t care for “warnings”, no matter how technically advanced they are. People just assume that pressing Y or other similar stuff is just part of the procedure without thinking twice. Some other Linux users have encountered it in the past and many will encounter it in the future.

This is why adding failsafe is the wise step here. This is something all mainstream distributions should do.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/more-linux-distros-become-linus-proof/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://www.youtube.com/watch?v=0506yDSgU7M&t=788s
[3]: https://itsfoss.com/install-pop-os/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM0NyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM4NSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM3OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM2MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://twitter.com/jeremy_soller/status/1453008808314351628?ref_src=twsrc%5Etfw
[9]: https://news.itsfoss.com/kde-plasma-5-24-dev/
[10]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM4OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
