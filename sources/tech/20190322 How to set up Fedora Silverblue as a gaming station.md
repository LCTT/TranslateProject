[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up Fedora Silverblue as a gaming station)
[#]: via: (https://fedoramagazine.org/set-up-fedora-silverblue-gaming-station/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

How to set up Fedora Silverblue as a gaming station
======

![][1]

This article gives you a step by step guide to turn your Fedora Silverblue into an awesome gaming station with the help of Flatpak and Steam.

Note: Do you need the NVIDIA proprietary driver on Fedora 29 Silverblue for a complete experience? Check out [this blog post][2] for pointers.

### Add the Flathub repository

This process starts with a clean Fedora 29 Silverblue installation with a user already created for you.

First, go to <https://flathub.org/home> and enable the Flathub repository on your system. To do this, click the _Quick setup_ button on the main page.

![Quick setup button on flathub.org/home][3]

This redirects you to <https://flatpak.org/setup/> where you should click on the Fedora icon.

![Fedora icon on flatpak.org/setup][4]

Now you just need to click on _Flathub repository file._ Open the downloaded file with the _Software Install_ application.

![Flathub repository file button on flatpak.org/setup/Fedora][5]

The GNOME Software application opens. Next, click on the _Install_ button. This action needs _sudo_ permissions, because it installs the Flathub repository for use by the whole system.

![Install button in GNOME Software][6]

### Install the Steam flatpak

You can now search for the S _team_ flatpak in _GNOME Software_. If you can’t find it, try rebooting — or logout and login — in case _GNOME Software_ didn’t read the metadata. That happens automatically when you next login.

![Searching for Steam][7]

Click on the _Steam_ row and the _Steam_ page opens in _GNOME Software._ Next, click on _Install_.

![Steam page in GNOME Software][8]

And now you have installed _Steam_ flatpak on your system.

### Enable Steam Play in Steam

Now that you have _Steam_ installed, launch it and log in. To play Windows games too, you need to enable _Steam Play_ in _Steam._ To enable it, choose _Steam > Settings_ from the menu in the main window.

![Settings button in Steam][9]

Navigate to the _Steam Play_ section. You should see the option _Enable Steam Play for supported titles_ is already ticked, but it’s recommended you also tick the _Enable Steam Play_ option for all other titles. There are plenty of games that are actually playable, but not whitelisted yet on _Steam._ To see which games are playable, visit [ProtonDB][10] and search for your favorite game. Or just look for the games with the most platinum reports.

![Steam Play settings menu on Steam][11]

If you want to know more about Steam Play, you can read the [article][12] about it here on Fedora Magazine:

> [Play Windows games on Fedora with Steam Play and Proton][12]

### Appendix

You’re now ready to play plenty of games on Linux. Please remember to share your experience with others using the _Contribute_ button on [ProtonDB][10] and report bugs you find on [GitHub][13], because sharing is nice. 🙂

* * *

_Photo by _[ _Hardik Sharma_][14]_ on _[_Unsplash_][15]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/set-up-fedora-silverblue-gaming-station/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/silverblue-gaming-816x345.jpg
[2]: https://blogs.gnome.org/alexl/2019/03/06/nvidia-drivers-in-fedora-silverblue/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-12-29-00.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-12-36-35-1024x713.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-12-45-12.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-12-57-37.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-13-08-21.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-13-13-59-1024x769.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-13-30-20.png
[10]: https://www.protondb.com/
[11]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-from-2019-03-15-13-41-53.png
[12]: https://fedoramagazine.org/play-windows-games-steam-play-proton/
[13]: https://github.com/ValveSoftware/Proton
[14]: https://unsplash.com/photos/I7rXyzBNVQM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[15]: https://unsplash.com/search/photos/video-game-laptop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
