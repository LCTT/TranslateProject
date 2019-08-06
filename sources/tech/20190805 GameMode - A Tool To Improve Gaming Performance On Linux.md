[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GameMode – A Tool To Improve Gaming Performance On Linux)
[#]: via: (https://www.ostechnix.com/gamemode-a-tool-to-improve-gaming-performance-on-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

GameMode – A Tool To Improve Gaming Performance On Linux
======

![Gamemmode improve gaming performance on Linux][1]

Ask some Linux users why they still sticks with Windows dual boot, probably the answer would be – “Games!”. It was true! Luckily, open source gaming platforms like [**Lutris**][2] and Proprietary gaming platform **Steam** have brought many games to Linux platforms and improved the Linux gaming experience significantly over the years. Today, I stumbled upon yet another Linux gaming-related, open source tool named **GameMode** , which allows the users to improve gaming performance on Linux.

GameMode is basically a daemon/lib combo that lets the games optimise Linux system performance on demand. I thought GameMode is a kind of tool that would kill some resource-hungry tools running in the background. But it is different. What it does actually is just instruct the CPU to **automatically run in Performance mode when playing games** and helps the Linux users to get best possible performance out of their games.

GameMode improves the gaming performance significantly by requesting a set of optimisations be temporarily applied to the host OS while playing the games. Currently, It includes support for optimisations including the following:

  * CPU governor,
  * I/O priority,
  * Process niceness,
  * Kernel scheduler (SCHED_ISO),
  * Screensaver inhibiting,
  * GPU performance mode (NVIDIA and AMD), GPU overclocking (NVIDIA),
  * Custom scripts.



GameMode is free and open source system tool developed by [**Feral Interactive**][3], a world-leading publisher of games.

### Install GameMode

GameMode is available for many Linux distributions.

On Arch Linux and its variants, you can install it from [**AUR**][4] using any AUR helper programs, for example [**Yay**][5].

```
$ yay -S gamemode
```

On Debian, Ubuntu, Linux Mint and other Deb-based systems:

```
$ sudo apt install gamemode
```

If GameMode is not available for your system, you can manually compile and install it from source as described in its Github page under Development section.

### Activate GameMode support to improve Gaming Performance on Linux

Here are the list of games with GameMode integration, so we need not to do any additional configuration to activate GameMode support.

  * Rise of the Tomb Raider
  * Total War Saga: Thrones of Britannia
  * Total War: WARHAMMER II
  * DiRT 4
  * Total War: Three Kingdoms



Simply run these games and GameMode support will be enabled automatically.

There is also an [**extension**][6] is available to integrate GameMode support with GNOME shell. It indicates when GameMode is active in the top panel.

For other games, you may need to manually request GameMode support like below.

```
gamemoderun ./game
```

I am not fond of games and I haven’t played any games for years. So, I can’t share any actual benchmarks.

However, I’ve found a short video tutorial on Youtube to enable GameMode support for Lutris games. It is a good start point for those who wants to try GameMode for the first time.

<https://youtu.be/4gyRyYfyGJw>

By looking at the comments in the video, I can say that that GameMode has indeed improved gaming performance on Linux.

For more details, refer the [**GameMode GitHub repository**][7].

* * *

**Related read:**

  * [**GameHub – An Unified Library To Put All Games Under One Roof**][8]
  * [**How To Run MS-DOS Games And Programs In Linux**][9]



* * *

Have you used GameMode tool? Did it really improve the Gaming performance on your Linux box? Share you thoughts in the comment section below.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/gamemode-a-tool-to-improve-gaming-performance-on-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Gamemode-720x340.png
[2]: https://www.ostechnix.com/manage-games-using-lutris-linux/
[3]: http://www.feralinteractive.com/en/
[4]: https://aur.archlinux.org/packages/gamemode/
[5]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]: https://github.com/gicmo/gamemode-extension
[7]: https://github.com/FeralInteractive/gamemode
[8]: https://www.ostechnix.com/gamehub-an-unified-library-to-put-all-games-under-one-roof/
[9]: https://www.ostechnix.com/how-to-run-ms-dos-games-and-programs-in-linux/
