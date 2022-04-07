[#]: subject: "Maui Shell’s First Alpha Release Looks Promising"
[#]: via: "https://news.itsfoss.com/maui-shell-alpha-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Maui Shell’s First Alpha Release Looks Promising
======

Even before its release, [Maui shell][1] has been praised as the future of the Linux desktop user interface.

And, for all the right reasons:

It attempts to bring convergence to the mainstream, just like Canonical tried with Unity. Regarding looks, you get modern aesthetics inspired by various existing desktop experiences.

Overall, it could provide a good desktop experience thanks to various KDE technologies being used under the hood.

If you didn’t know already, the team behind [Nitrux OS][2] is developing the Maui shell.

Recently, they announced the first alpha release of the shell. Let me mention the key highlights of the release.

### Maui Shell Alpha: What’s New?

![][3]

With the first alpha release, they focus on introducing missing features and fixing some of the biggest issues found with the initial testing.

You can check out Jacob’s [first impressions on using Maui shell on a Linux phone][4] if you are curious.

While it is still the “alpha” release, numerous problems experienced by early testers and developers may have been fixed.

Some of the most significant changes include:

#### Improving Cask

**Cask** is the shell container with elements like cards, popups, panels, dock, and more.

The first alpha release focused more on improving Cask.

![][5]

The panel now includes the ability to handle sound, Bluetooth, dark mode, brightness, dark mode, and media controls.

Media control has a new look and can be expanded to get more options.

The dock and launcher also received some visual tweaks, with subtle shadows/bold text. You will notice the most used apps on the first page of the launcher, along with the categories and quick access.

They mention that it will be configurable for the users.

There’s also an option to enable an adaptive color scheme, where the shell takes colors from wallpaper and change it to light/dark mode.

While you can also toggle light/dark mode manually, it only works with the adaptive color feature disabled.

![][6]

In addition to all this, you will also find improvements to the panel cards, session cards, and notification cards.

![][7]

#### Functionality Upgrades

A new session startup program called “**starcask-wayland**” is in place to set up all the necessary parts before launching the shell, including autostart services, setting environment variables, etc.

You will also find a new [PolKit][8] agent added to handle authentication.

The release note also mentions the backend stack being used for all the new functionalities introduced:

  * BlueDevil, to handle Bluetooth connections
  * Plasma-nm for Network connections
  * KSolid
  * KIO for file manager functions
  * PulseAudio
  * MauiKit
  * Kirigami



#### Other Improvements

This alpha release involves setting up the most basic functionalities needed in a modern desktop experience.

Things like calendar integration are still in progress, and the overall completion of Cask (or the Shell container) is expected to be complete with its beta release in the future.

The beta release is expected in **June**, with the final stable release scheduled for **September**.

You can learn more about the technical changes, known issues, how you can contribute, and more details in its [official announcement post][9].

### How to Test Maui Shell Alpha Release?

You will have to wait for the next Nitrux release or build it from the source if you want to get your hands on the first alpha release of Maui shell.

Note that you should not try it on your production system, considering the shell is in heavy development.

You can refer to the [announcement][9] for testing instructions or explore the [GitHub page][10].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/maui-shell-alpha-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/maui-shell-unveiled/
[2]: https://news.itsfoss.com/reasons-to-try-nitrux-os/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUwNyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://news.itsfoss.com/tested-maui-shell/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ1NCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://i0.wp.com/i.ytimg.com/vi/8WVkcMONYd0/hqdefault.jpg?w=780&ssl=1
[7]: https://i0.wp.com/i.ytimg.com/vi/xmJjsR8_-pQ/hqdefault.jpg?w=780&ssl=1
[8]: https://wiki.archlinux.org/title/Polkit
[9]: https://nxos.org/maui/maui-shell-alpha-release/
[10]: https://github.com/Nitrux/maui-shell/
