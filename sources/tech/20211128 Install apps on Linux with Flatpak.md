[#]: subject: "Install apps on Linux with Flatpak"
[#]: via: "https://opensource.com/article/21/11/install-flatpak-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install apps on Linux with Flatpak
======
Flatpak simplifies the installation of applications on Linux.
![Flatpak][1]

Computer applications consist of many small files that are linked together to perform a set of tasks. Because they get presented as "apps," colorful icons in the menu or on a desktop, most of us think of applications as a single, almost tangible thing. And in a way, it's comforting to think of them that way because they feel manageable that way. If an application is actually the amalgamation of hundreds of little library and asset files scattered throughout your computer, where's the application? And existential crisis aside, what happens when one application needs one version of a library while another application demands a different version? 

In the world of cloud computing, [containers][2] are becoming more and more popular because they offer isolation and consolidation for applications. You can install all the files an application needs in a "container." That way, its libraries stay out of the way of other applications, and the memory it occupies doesn't leak data into the memory space of another. Everything ends up feeling very much like a single, almost tangible _thing_. On the Linux desktop, Flatpak, a cross-distribution, daemon-less, decentralized application delivery system, provides a similar technology.

### Install Flatpak on Linux

Your Linux system may already have Flatpak installed. If not, you can install it from your package manager:

On Fedora, Mageia, and similar distributions:


```
`$ sudo dnf install flatpak`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install flatpak`
```

On Slackware, Flatpak is available from [SlackBuilds.org][3].

### Select a Flatpak repo

You can install an application as a Flatpak by adding a Flatpak repository to your distribution's software center (such as **Software** on GNOME). Flatpak is a decentralized system, meaning anyone developing software can host their own repository. Still, in practice, [Flathub][4] is the biggest and most popular aggregation of applications in the Flatpak format. To add Flathub to **GNOME Software** or **KDE Discover**, navigate to flatpak.org/setup and find the instructions for your distribution and start with step #2, or just download the [Flatpakrepo][5] file. Depending on your network, it may take a few minutes for your software center to synchronize with Flathub or another Flatpak repository. Flathub has a lot of software, but there's no limit to how many Flatpak repositories you have on your system, so don't be afraid to add a new repository if you find one that has the software you want to try.

![Software Repositories][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

If you prefer to work in the terminal, you can add repositories directly with the `flatpak` command:


```


$ flatpak remote-add --if-not-exists flathub \
<https://flathub.org/repo/flathub.flatpakrepo>

```

### Install an application

As long as you've added a Flatpak repository to your software center, you can browse through applications as usual.

![GNOME Software][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

Click on an application that looks appealing, read up on it, and click the **Install** button when you're ready.

### Installing flatpaks in the terminal

If you prefer to work in the terminal, you can treat Flatpak as a dedicated package manager. You can search for an application using the `flatpak search` command:


```


$ flatpak search paint
Name        Description                         Application ID
CorePaint   A simple painting tool              org.cubocore.CorePaint
Pinta       Edit images and paint digitally     com.github.PintaProject.Pinta
Glimpse     Create images and edit photographs  org.glimpse_editor.Glimpse
Tux Paint   A drawing program for children      org.tuxpaint.Tuxpaint
Krita       Digital Painting, Creative Freedom  org.kde.krita

```

Install with `flatpak install`:


```
`$ flatpak install krita`
```

Once installed, applications appear in your application menu or Activities screen along with all the other applications on your system.

### Apps made easy

Flatpak makes installing applications easy for the user by eliminating version conflicts. They make distributing software easy for developers by targeting just one package format on either a self-hosted platform or a communal one like Flathub. I use Flatpaks on Fedora Silverblue, CentOS, and Slackware, and I can't quite imagine life without it now. Try Flatpak for your next app install!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/install-flatpak-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/flatpak-lead-image_0.png?itok=URbhdsDQ (Flatpak)
[2]: https://opensource.com/article/21/7/linux-podman
[3]: http://slackbuilds.org
[4]: http://flathub.org
[5]: https://flathub.org/repo/flathub.flatpakrepo
[6]: https://opensource.com/sites/default/files/uploads/repo.jpg (Software Repositories)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/software.jpg (GNOME Software)
