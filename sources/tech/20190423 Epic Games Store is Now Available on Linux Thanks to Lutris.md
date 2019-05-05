[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Epic Games Store is Now Available on Linux Thanks to Lutris)
[#]: via: (https://itsfoss.com/epic-games-lutris-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Epic Games Store is Now Available on Linux Thanks to Lutris
======

_**Brief: Open Source gaming platform Lutris now enables you to use Epic Games Store on Linux. We tried it on Ubuntu 19.04 and here’s our experience with it.**_

[Gaming on Linux][1] just keeps getting better. Want to [play Windows games on Linux][2], Steam’s new [in-progress feature][3] enables you to do that.

Steam might be new in the field of Windows games on Linux but Lutris has been doing it for years.

[Lutris][4] is an open source gaming platform for Linux where it provides installers for game clients like Origin, Steam, Blizzard.net app and so on. It utilizes Wine to run stuff that isn’t natively supported on Linux.

Lutris has recently announced that you can now use Epic Games Store using Lutris.

### Lutris brings Epic Games to Linux

![Epic Games Store Lutris Linux][5]

[Epic Games Store][6] is a digital video game distribution platform like Steam. It only supports Windows and macOS for the moment.

The Lutris team worked hard to bring Epic Games Store to Linux via Lutris. Even though I’m not a big fan of Epic Games Store, it was good to know about the support for Linux via Lutris:

> Good news! [@EpicGames][7] Store is now fully functional under Linux if you use Lutris to install it! No issues observed whatsoever. <https://t.co/cYmd7PcYdG>[@TimSweeneyEpic][8] will probably like this 😊 [pic.twitter.com/7mt9fXt7TH][9]
>
> — Lutris Gaming (@LutrisGaming) [April 17, 2019][10]

As an avid gamer and Linux user, I immediately jumped upon this news and installed Lutris to run Epic Games on it.

**Note:** _I used[Ubuntu 19.04][11] to test Epic Games store for Linux._

### Using Epic Games Store for Linux using Lutris

To install Epic Games Store on your Linux system, make sure that you have [Lutris][4] installed with its pre-requisites Wine and Python 3. So, first [install Wine on Ubuntu][12] or whichever Linux you are using and then [download Lutris from its website][13].

[][14]

Suggested read Ubuntu Mate Will Be Default OS On Entroware Laptops

#### Installing Epic Games Store

Once the installation of Lutris is successful, simply launch it.

While I tried this, I encountered an error (nothing happened when I tried to launch it using the GUI). However, when I typed in “ **lutris** ” on the terminal to launch it otherwise, I noticed an error that looked like this:

![][15]

Thanks to Abhishek, I learned that this is a common issue (you can check that on [GitHub][16]).

So, to fix it, all I had to do was – type in a command in the terminal:

```
export LC_ALL=C
```

Just copy it and enter it in your terminal if you face the same issue. And, then, you will be able to open Lutris.

**Note:** _You’ll have to enter this command every time you launch Lutris. So better to add it to your .bashrc or list of environment variable._

Once that is done, simply launch it and search for “ **Epic Games Store** ” as shown in the image below:

![Epic Games Store in Lutris][17]

Here, I have it installed already, so you will get the option to “Install” it and then it will automatically ask you to install the required packages that it needs. You just have to proceed in order to successfully install it. That’s it – no rocket science involved.

#### Playing a Game on Epic Games Store

![Epic Games Store][18]

Now that we have Epic Games store via Lutris on Linux, simply launch it and log in to your account to get started.

But, does it really work?

_Yes, the Epic Games Store does work._ **But, all the games don’t.**

Well, I haven’t tried everything, but I grabbed a free game (Transistor – a turn-based ARPG game) to check if that works.

![Transistor – Epic Games Store][19]

Unfortunately, it didn’t. It says that it is “Running” when I launch it but then again, nothing happens.

As of now, I’m not aware of any solutions to that – so I’ll try to keep you guys updated if I find a fix.

[][20]

Suggested read Alpha Version Of New Skype Client For Linux Is Out Now

**Wrapping Up**

It’s good to see the gaming scene improve on Linux thanks to the solutions like Lutris for users. However, there’s still a lot of work to be done.

For a game to run hassle-free on Linux is still a challenge. There can be issues like this which I encountered or similar. But, it’s going in the right direction – even if it has issues.

What do you think of Epic Games Store on Linux via Lutris? Have you tried it yet? Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/epic-games-lutris-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://itsfoss.com/steam-play/
[3]: https://itsfoss.com/steam-play-proton/
[4]: https://lutris.net/
[5]: https://itsfoss.com/wp-content/uploads/2019/04/epic-games-store-lutris-linux-800x450.png
[6]: https://www.epicgames.com/store/en-US/
[7]: https://twitter.com/EpicGames?ref_src=twsrc%5Etfw
[8]: https://twitter.com/TimSweeneyEpic?ref_src=twsrc%5Etfw
[9]: https://t.co/7mt9fXt7TH
[10]: https://twitter.com/LutrisGaming/status/1118552969816018948?ref_src=twsrc%5Etfw
[11]: https://itsfoss.com/ubuntu-19-04-release-features/
[12]: https://itsfoss.com/install-latest-wine/
[13]: https://lutris.net/downloads/
[14]: https://itsfoss.com/ubuntu-mate-entroware/
[15]: https://itsfoss.com/wp-content/uploads/2019/04/lutris-error.jpg
[16]: https://github.com/lutris/lutris/issues/660
[17]: https://itsfoss.com/wp-content/uploads/2019/04/lutris-epic-games-store-800x520.jpg
[18]: https://itsfoss.com/wp-content/uploads/2019/04/epic-games-store-800x450.jpg
[19]: https://itsfoss.com/wp-content/uploads/2019/04/transistor-game-epic-games-store-800x410.jpg
[20]: https://itsfoss.com/skpe-alpha-linux/
