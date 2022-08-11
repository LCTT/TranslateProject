[#]: subject: "Heroic Games Launcher 2.4.0 Released With Epic Overlay, GOG Cloud Save Support, and Anti-cheat Runtime"
[#]: via: "https://news.itsfoss.com/heroic-games-launcher-2-4-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Heroic Games Launcher 2.4.0 Released With Epic Overlay, GOG Cloud Save Support, and Anti-cheat Runtime
======

As [gaming on Linux][1] continues to improve, so do the tools we use to play those games. Heroic Games Launcher is a great example of such a tool, as it gives users a native way to access and play Epic Games Store games on their Linux machines.

One of its older releases, [Heroic 2.0.0][2], brought major UI improvements, and this release further builds on those.

### Heroic Games Launcher 2.4.0: What’s New?

Heroic Games Launcher 2.4.0 brings numerous major upgrades, including:

  * GOG Cloud Save support
  * Epic overlay support
  * EAC and BattleEYE runtime
  * Anti-cheat information on the game page
  * Add game shortcut to Steam option



### GOG Cloud Save Support

![][3]

When moving between devices, cloud saves quickly become an essential feature. However, until recently, this has been noticeably missing from Heroic when playing GOG games. This changes with the 2.4.0 release.

Now, GOG cloud save works on all supported platforms. Note that the Linux-native games on GOG do not support cloud saves, so you can only expect it with Windows games running through Wine/Proton.

### Epic Overlay Support

The Epic Overlay, a feature similar to the Steam overlay, now has full support from within Heroic Launcher. This is possible thanks to the new DXVK version (Vulkan-based implementation of Direct 3D), which also fixed several bugs in games.

You can enable it by going to the Heroic settings and finding it among the tools. As initial feature support, it may not work flawlessly. You should test it out for yourself.

### Anti-Cheat Information Via Game Page

![][4]

Anti-cheat software has always been problematic when it comes to gaming on Linux. In fact, a lot of anti-cheat software only started supporting Linux when the Steam Deck was released. However, they remain a problem until now.

Fortunately, the community has built a plethora of resources to help share information on how well games work on Wine and Proton.

While you can rely on [ProtonDB][5], it may not be the most convenient option.

Now, you get the necessary information on anti-cheat on the game status page using data pulled from _areweanticheatyet.com_.

### Add To Steam Option

![][6]

We are all familiar with the pain of juggling between launchers to access our games. There are different pieces of software have tried to overcome this over the years, but Steam remains the most popular game launcher.

With that in mind, Heroic Games Launcher 2.4.0 now lets you directly add your games to your Steam library. While the Heroic Games Launcher still runs in the background, it gives a better experience for users comfortable with Steam.

Note that this support is still experimental and may not work with portable games.

### Other Improvements

![][7]

Alongside the ones previously mentioned, Heroic 2.4.0 brings in several refinements that include:

  * An easier way to add environmental variables or wrappers.
  * Find the current download/update(s) on the sidebar.
  * Added auto-complete feature to the search bar.
  * Added information boxes for things such as VKD3D and DXVK.
  * Officially signed setup files for Windows to prevent Malware warnings.
  * Ability to use HTTP instead of HTTPS when downloading games.
  * Ability to force a game update (a feature sorely missing from the official Epic Games Launcher).
  * Heroic will now use libraries from its downloaded version for Proton/Wine games instead of system libraries. You can change the setting if needed.
  * Updated Electron framework.



For a full list of changes, I encourage you to take a look at the [release notes][8].

### Wrapping Up

With all these exciting improvements, I can’t wait to see what the next upgrade will have in store for us. You can grab the AppImage file for this release and get started on any Linux distribution.

Alternatively, if you’re using a mainstream distro, there is probably a package available to download from their GitHub releases page.

[Download Heroic Game Launcher][9]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/heroic-games-launcher-2-4-0-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://news.itsfoss.com/heroic-games-launcher-2-release/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjczMSIgd2lkdGg9IjkyMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijg1OSIgd2lkdGg9IjE0MDQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[5]: https://www.protondb.com/
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUwOSIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY2NCIgd2lkdGg9IjEwMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[8]: https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/tag/v2.4.0
[9]: https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases
