[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use GameHub to Manage All Your Linux Games in One Place)
[#]: via: (https://itsfoss.com/gamehub/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Use GameHub to Manage All Your Linux Games in One Place
======

How do you [play games on Linux][1]? Let me guess. Either you install games from the software center or from Steam or from GOG or Humble Bundle etc, right? But, how do you plan to manage all your games from multiple launchers and clients? Well, that sounds like a hassle to me – which is why I was delighted when I come across [GameHub][2].

GameHub is a desktop application for Linux distributions that lets you manage “All your games in one place”. That sounds interesting, isn’t it? Let me share more details about it.

![][3]

### GameHub Features to manage Linux games from different sources at one place

Let’s see all the features that make GameHub one of the [essential Linux applications][4], specially for gamers.

#### Steam, GOG &amp; Humble Bundle Support

![][5]

It supports Steam, [GOG][6], and [Humble Bundle][7] account integration. You can sign in to your account to see manager your library from within GameHub.

For my usage, I have a lot of games on Steam and a couple on Humble Bundle. I can’t speak for all – but it is safe to assume that these are the major platforms one would want to have.

#### Native Game Support

![][8]

There are several [websites where you can find and download Linux games][9]. You can also add native Linux games by downloading their installers or add the executable file.

Unfortunately, there’s no easy way of finding out games for Linux from within GameHub at the moment. So, you will have to download them separately and add it to the GameHub as shown in the image above.

#### Emulator Support

With emulators, you can [play retro games on Linux][10]. As you can observe in the image above, you also get the ability to add emulators (and import emulated images).

You can see [RetroArch][11] listed already but you can also add custom emulators as per your requirements.

#### User Interface

![Gamehub Appearance Option][12]

Of course, the user experience matters. Hence, it is important to take a look at its user interface and what it offers.

To me, I felt it very easy to use and the presence of a dark theme is a bonus.

#### Controller Support

If you are comfortable using a controller with your Linux system to play games – you can easily add it, enable or disable it from the settings.

#### Multiple Data Providers

Just because it fetches the information (or metadata) of your games, it needs a source for that. You can see all the sources listed in the image below.

![Data Providers Gamehub][13]

You don’t have to do anything here – but if you are using anything else other than steam as your platform, you can generate an [API key for IDGB.][14]

I shall recommend you to do that only if you observe a prompt/notice within GameHub or if you have some games that do not have any description/pictures/stats on GameHub.

#### Compatibility Layer

![][15]

Do you have a game that does not support Linux?

You do not have to worry. GameHub offers multiple compatibility layers like Wine/Proton which you can use to get the game installed in order to make it playable.

We can’t be really sure on what works for you – so you have to test it yourself for that matter. Nevertheless, it is an important feature that could come handy for a lot of gamers.

### How Do You Manage Your Games in GameHub?

You get the option to add Steam/GOG/Humble Bundle account right after you launch it.

For Steam, you need to have the Steam client installed on your Linux distro. Once, you have it, you can easily link the games to GameHub.

![][16]

For GOG &amp; Humble Bundle, you can directly sign in using your credentials to get your games organized in GameHub.

If you are adding an emulated image or a native installer, you can always do that by clicking on the “**+**” button that you observe in the top-right corner of the window.

### How Do You Install Games?

For Steam games, it automatically launches the Steam client to download/install (I wish if this was possible without launching Steam!)

![][17]

But, for GOG/Humble Bundle, you can directly start downloading to install the games after signing in. If necessary, you can utilize the compatibility layer for non-native Linux games.

In either case, if you want to install an emulated game or a native game – just add the installer or import the emulated image. There’s nothing more to it.

### GameHub: How do you install it?

![][18]

To start with, you can just search for it in your software center or app center. It is available in the **Pop!_Shop**. So, it can be found in most of the official repositories.

If you don’t find it there, you can always add the repository and install it via terminal by typing these commands:

```
sudo add-apt-repository ppa:tkashkin/gamehub
sudo apt update
sudo apt install com.github.tkashkin.gamehub
```

In case you encounter “**add-apt-repository command not found**” error, you can take a look at our article to help fix [add-apt-repository not found error.][19]

There are also AppImage and Flatpak versions available. You can find installation instructions for other Linux distros on its [official webpage][2].

Also, you have the option to download pre-release packages from its [GitHub page][20].

[GameHub][2]

**Wrapping Up**

GameHub is a pretty neat application as a unified library for all your games. The user interface is intuitive and so are the options.

Have you had the chance it test it out before? If yes, let us know your experience in the comments down below.

Also, feel free to tell us about some of your favorite tools/applications similar to this which you would want us to try.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gamehub/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://tkashkin.tk/projects/gamehub/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-home-1.png?ssl=1
[4]: https://itsfoss.com/essential-linux-applications/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-platform-support.png?ssl=1
[6]: https://www.gog.com/
[7]: https://www.humblebundle.com/monthly?partner=itsfoss
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-native-installers.png?ssl=1
[9]: https://itsfoss.com/download-linux-games/
[10]: https://itsfoss.com/play-retro-games-linux/
[11]: https://www.retroarch.com/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-appearance.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/data-providers-gamehub.png?ssl=1
[14]: https://www.igdb.com/api
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-windows-game.png?fit=800%2C569&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-library.png?ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-compatibility-layer.png?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/gamehub-install.jpg?ssl=1
[19]: https://itsfoss.com/add-apt-repository-command-not-found/
[20]: https://github.com/tkashkin/GameHub/releases
