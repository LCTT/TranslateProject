[#]: subject: "BitTorrent Client ‘Fragments 2.0’ for Linux is Here, Rebuilt Using Rust with a New UI"
[#]: via: "https://news.itsfoss.com/fragments-2-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

BitTorrent Client ‘Fragments 2.0’ for Linux is Here, Rebuilt Using Rust with a New UI
======

Fragments is [one of the best torrent clients for Linux][1].

The latest Fragments 2.0 is a significant upgrade, completely rewritten from scratch using Rust, GTK 4, and Libadwaita.

In addition to the technical improvements, you will also find some new features and an improved user interface.

Let me highlight the changes below.

### Fragments 2.0: What’s New?

![][2]

Recently, the Gnome app ecosystem has been undergoing some massive changes. At the forefront of this change is the transition to Gtk4 and [Libadwaita][3]. Unfortunately, this change is not a small one, and many apps need to be rebuilt from the ground up to support these new standards.

Alongside many other app developers, Fragment’s developer [Felix Häcker][4] decided to rebuild Fragments from the ground up, now releasing it as Fragments 2.0. As a result, we now get an improved BitTorrent client for Linux.

Some of the improvements include:

  * A beautiful new UI based on Libadwaita
  * New modular architecture
  * The ability to be used as remote control for remote Fragments / Transmission sessions
  * New preferences dialog with more options
  * The ability to view statistics about the network



#### A New UI

![][5]

Fragments 2.0 now has a new UI based on Libadwaita. Libadwaita is an extension of GTK4 for Gnome apps for those of you who don’t know. It has a few advantages, the most notable being a consistent look across all Gnome apps.

It is much more flat and rounded than the old theme and, in my opinion, looks very stylish.

You get a clean-looking BitTorrent app that’s easy to navigate, and you can also quickly access some essential options.

#### New Modular Architecture

While not immediately apparent, Fragments 2.0 features a brand-new modular architecture. Under-the-hood, all the different parts of the app are modular. While this may not seem that impactful at first, I can see it having a profound impact on users and developers alike.

Firstly, it should mean easier maintenance, hopefully allowing the developers to spend more time on new features and bug fixes. Secondly, it should also mean greater stability for the application. This is because if one part of Fragments crashes, the rest of the app should remain working, hopefully without any significant impact on the user.

These are just two of the benefits of this new architecture I could think of, and I’m sure there can be more.

#### New Preferences Dialog

![][6]

Finally, Fragments 2.0 introduces several frequently requested settings options. Among these, I think the most important is the ability to change the default folder for torrents that have not been completely downloaded yet.

![][6]

While still not as customizable as some of its alternatives, these additions help you tweak the settings to fit your requirements.

Some of the options include:

  * Automatically start torrents after adding them
  * Enable/Disable download queue
  * Customizable peer limits
  * Network port setting
  * Automatic port forwarding toggle



#### Control Remote Fragments / Transmission Sessions

The ability to remote control your downloads can have a considerable impact. With Fragments 2.0, the app finally gets a similar feature, allowing users to remote control other installations of Fragments and Transmission torrent clients.

This is extremely useful for people using a separate download server, as they often don’t have access to it directly.

While this has always been possible with other apps, the fact that this is integrated directly into Fragments makes it a helpful BitTorrent client for power users!

#### Other Improvements

![][7]

In addition to all these massive changes, there are several bug fixes and a few new abilities.

Some key highlights include:

  * Magnet link of added torrents can be copied to clipboard
  * Statistics about the current session can be viewed (speed, total download data, etc.)



You can explore more about Fragments 2.0 on its [GitLab page][8].

### Download Fragments 2.0

Fragments is available as a Flatpak app. If your Linux distribution does not have the support baked in, you can go through our [Flatpak guide][9] to set up Flatpak.

[Fragments (Flathub)][10]

You can try searching for it in your software center (with Flatpak integration enabled) or type in the following command in the terminal:

```

    flatpak install flathub de.haeckerfelix.Fragments

```

Fragments 2.0.1 (with some minor fixes) is also available on its GitLab page but not yet reflected on Flathub.

If you have issues with Fragments 2.0, you might want to wait for the newer version to hit Flathub.

What’s your favorite BitTorrent Linux client? Is Fragments 2.0 impressive? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fragments-2-0-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-torrent-ubuntu/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU1MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://adrienplazas.com/blog/2021/03/31/introducing-libadwaita.html
[4]: https://twitter.com/haeckerfelix
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcwOCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcyNCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU5NSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://gitlab.gnome.org/World/Fragments
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://flathub.org/apps/details/de.haeckerfelix.Fragments
