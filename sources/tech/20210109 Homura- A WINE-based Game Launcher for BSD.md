[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Homura: A WINE-based Game Launcher for BSD)
[#]: via: (https://itsfoss.com/homura-game-launcher-bsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Homura: A WINE-based Game Launcher for BSD
======

BSD isn’t just for servers. People use it for desktop as well and perform common tasks including casual gaming. To help make that possible, we are going to look at an app that allows you to run Windows games on FreeBSD.

### What is Homura?

![][1]

[Homura][2] is a tool that allows you to play Windows games on FreeBSD. It was inspired by [Lutris][3]. It allows you to install and manage several Windows game and game store launchers. It mainly uses Wine, but also comes with a number of fixes and workarounds to get the games working.

Homura’s creator, [Alexander Vereeken][4], said that he created the application because “when I started using FreeBSD, there was no useful utility to set up games or launcher in wine, so I created one myself.” At the time, Wine was the only option. The Linux version of Steam did not exist.

![Homura install list][5]

Here is a list of the things you can install with Homura:

  * Anarchy Online
  * Arc
  * Bethesda launcher
  * Blizzard launcher
  * Diablo II
  * Discord
  * Drakensang Online
  * GOG


  * Growtopia
  * League of Legends
  * Origin launcher
  * PokeMMO
  * Pokemon Uranium
  * RuneScape
  * Steam


  * Subway Surfers
  * Teamspeak
  * Tropix 2
  * UC Browser
  * Uplay
  * Wargaming Game Center
  * Itch.io



Homura is named after a character in an anime named [Madoka Magica][6]. It was originally hosted on GitHub before the creator moved to GitLab. It is currently hosted on Codeberg. Hopefully, it will stay there for now.

![Homura][7]

### Installing Homura Game Launcher on BSD

You can install Homura from the FreeBSD repo with this command:

```
pkg install games/homura
```

You can also build and install it from the ports collection using this command.

```
cd /usr/ports/games/homura/ && make install clean
```

Once it is installed, you can run Homura by selecting it from the menu or typing `Homura` in the command line. (The name must be capitalized in the terminal or it will not work.)

If you install Steam via Homura, you need to launch it from Homura. If you launch it from the operating system’s menu, it won’t display currently.

Steam’s library and store tabs are displayed by a built-in web browser. For some reason, that does not work on FreeBSD. But if you launch Steam from Homura’s menu, it will use a list mode that works without issue.

### Experience

I installed Homura on GhostBSD and used it to install Steam. Afterward, I installed a couple of games to test it out. Not all of the games I tried worked, mainly because they tried to use or install a Windows-specific piece of software that was unavailable. However, I was able to play one of my favorite games, Microsoft’s Rise of Nations, without any issue. (My test turned into a couple of hours of gameplay.)

![Homura Main Menu][8]

I also tried to install the GOG launcher. For some reason, it didn’t work for me. The loading screen would pop up and nothing would happen. I’m planning to file an issue. I didn’t test any of the installer/launchers because I don’t use them.

### Final Thoughts

Not everything worked smoothly with Homura, but I could play some of my favorite games.

![Rise of Nation on BSD][9]

This app is the classic case of a user who had a need and decided to fill it. In doing so, he makes life easier for others. Hopefully, this application will make it a little easier for people to start using FreeBSD as their operating system.

If you found this article interesting, please take a minute to share it on social media, Hacker News, or [Reddit][10].

--------------------------------------------------------------------------------

via: https://itsfoss.com/homura-game-launcher-bsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura.jpg?resize=800%2C450&ssl=1
[2]: https://codeberg.org/Alexander88207/Homura
[3]: https://lutris.net/
[4]: https://codeberg.org/Alexander88207
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-install.jpg?resize=800%2C421&ssl=1
[6]: https://madoka.fandom.com/wiki/Puella_Magi_Madoka_Magica
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-about.jpg?resize=800%2C411&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/homura-main-menu.jpg?resize=500%2C776&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/rise-of-nation-bsd.jpg?resize=800%2C450&ssl=1
[10]: https://%0Areddit.com/r/linuxusersgroup
