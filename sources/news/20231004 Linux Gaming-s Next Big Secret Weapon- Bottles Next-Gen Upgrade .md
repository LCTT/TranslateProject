[#]: subject: "Linux Gaming's Next Big Secret Weapon: Bottles Next-Gen Upgrade 🔥"
[#]: via: "https://news.itsfoss.com/bottles-next-linux-gaming/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Gaming's Next Big Secret Weapon: Bottles Next-Gen Upgrade 🔥
======
Exciting development plans for 'Bottles' as a better tool to run Windows
apps and games on Linux.
Wine and Steam's Proton have made it possible for Linux users to get an enhanced gaming experience.

And apps like Lutris, Heroic Games Launcher, and others help utilize the technologies to let you easily manage, install, and launch games at your convenience.

**Bottles** is one such utility that helps you [run Windows apps and games on Linux][1]. It is one of the best methods to use the [Epic Games Store on Linux][2].

And, I think it will be a more exciting tool in the near future! _Why?_ 🤔

Well, I came across some interesting updates regarding the next-gen upgrade planned for Bottles 🤯

### Bottles Next: A Complete Overhaul

[Bottles][3] in its current form is a simple and customizable app to help you manage/run Windows apps and games in a couple of clicks.

![Screenshot of Bottles for the current version][4]

With its planned upgrade ( _with no particular schedule presently_ ), the devs plan to take the user experience a notch up, with a **more capable back-end**. To compliment it, they also plan to **redesign the user interface** to cater to beginners and advanced users.

Let me tell you more about it…

#### The User Interface Redesign

Here are some mockups shared by [Mirko Brombin][5] (the creator) for Bottles Next:

![Bottles Next, presenting you two modes][6]

As you can see, they are aiming to introduce two modes of usage, i.e., ' **Next Mode** ' for beginners and a ' **Classic Mode** ' for advanced users.

🚧

The mockups may not represent the final design of Bottles Next.

Bottles Next update aims to give a simpler user experience, and still retain the customizability of the tool.

![][7]

The game information screen looks interesting with vital information, and the option to head to advanced settings.

![][8]

It looks good to me, _what do you think?_

**Suggested Read** 📖

![][9]

#### Under-the-hood Changes

The planned technical changes are big, but of course, you may not notice it on the user-facing side.

Some goals with the backend rewrite include:

  * **Making the back-end independent of the GUI**
  * **Redefining how the app communicates with the created bottles, focusing on a single application.**
  * **Introducing new capabilities along with it (like the ability to cancel a bottle creation)**



To make the back-end independent of the GUI, they plan to utilize a client and local server concept. So, anyone (other applications) can use Bottles server to work with wineprefix created.

💡

Wineprefix is the directory where Wine stores the configuration files and installed Windows programs. (For more info on Wine: [Arch Linux Wiki][10])

In other words, they aim to change how it all works, and at the same time, ensure that their back-end could be beneficial for other applications to manage wine.

On the technical changes, Mirko mentions:

> This new structure allows using bottles in any applications which need to handle wine prefixes. It is possible to write clients in any toolkit, like qt, GTK or whatever. We are going the Electron road but also working on a GTK client.

One more **interesting bit about how Bottles Next works (planned)** :

> _Bottles Next will be the first wineprefix manager to manage prefixes from the inside. We are writing a project called[WineBridge][11] which runs from inside the prefix, and then communicate via protocol with Bottles. This way we can avoid using shell commands to launch programs or tweak the prefix, which is painful._

Furthermore, he mentions the rewrite will be based on the **Go** programming language.

In a nutshell, we have many significant changes coming under-the-hood and on the front-end. Combined, this should level up the user experience that you get on Bottles.

As they reveal more about the plans and progress for Bottles Next, we could get more fascinating information.

### Help Them Out If You Can! 🙌

I'm sure by now, as a Linux gaming enthusiast, you cannot wait for the next-gen upgrade!

However, the **development plans** shared will take a while to be worked on and finally make its way to a release.

**Fret not, you can help!**

You can contribute to the project on [GitHub][12], suggest ideas/feedback on [forums][13], and join their [Discord][14] server to explore more ways to get involved with the **Bottles Next** project.

[Bottles][3]

_💬 What do you think about Bottles Next? Share your thoughts in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bottles-next-linux-gaming/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/use-windows-applications-linux/
[2]: https://itsfoss.com/epic-games-linux/
[3]: https://usebottles.com/
[4]: https://news.itsfoss.com/content/images/2023/10/bottle-dark-screenshot.png
[5]: https://news.itsfoss.com/interview-mirko-brombin/
[6]: https://news.itsfoss.com/content/images/2023/10/bottles-next.jpg
[7]: https://news.itsfoss.com/content/images/2023/10/bottles-next-ui.jpg
[8]: https://news.itsfoss.com/content/images/2023/10/bottles-next-game-info.jpg
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[10]: https://wiki.archlinux.org/title/wine
[11]: https://github.com/bottlesdevs/winebridge
[12]: https://github.com/bottlesdevs
[13]: https://forum.usebottles.com/
[14]: https://discord.gg/wF4JAdYrTR
