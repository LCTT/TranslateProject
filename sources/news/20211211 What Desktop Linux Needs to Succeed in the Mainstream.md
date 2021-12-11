[#]: subject: "What Desktop Linux Needs to Succeed in the Mainstream"
[#]: via: "https://news.itsfoss.com/what-desktop-linux-needs-to-succeed-in-the-mainstream/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What Desktop Linux Needs to Succeed in the Mainstream
======

You might be aware of the [recent Linus Tech Tips videos about switching to Linux][1], including [one with some complaints about KDE software][2]. For those of you who are following along, I want to let you know that we’re (KDE) working on fixing the issues Linus brought up, and you can track our progress [here][3]. Thankfully, most of the issues are fairly minor and should be easy to fix.

This blog post is my version of [Sway][4] developer [Drew DeVault’s post][5] about the videos, regarding the question of what desktop Linux needs to go mainstream. Drew emphasizes accessibility, and I agree, but with a slightly different conclusion:

### Desktop Linux needs to be pre-installed on retail hardware to succeed in the mainstream

That’s it.

Allow me to explain.

People get hung up a lot on features and usability, and these are important. But they’re means to an end and not good enough ends by themselves. Quality means nothing if people can’t get it. And people can’t get it without accessible distribution. High quality Linux distros aren’t enough; they need to be pre-installed on hardware products you can buy in mainstream retail stores! “The mainstream” buys products they can touch and hold; if you can’t find it in a mainstream store, it doesn’t exist.

Think about it: **why do normal people use Windows or macOS**? Because the physical computer they bought included it. iOS or Android? Because it was shipped by default on their physical smartphone. The notion of replacing a device’s operating system with a new one doesn’t exist to “the mainstream”. Only the [“three-dot” users][6] ever do that, and they’re about 5% of the market. If the only way to get your OS is to install it yourself, you have no chance of succeeding in the mainstream.

As for features, people generally use only a very small fraction of what’s available to them. When it comes to usability, most users [memorize their software rather than understanding it][7]–and you can memorize anything if you really have to. A better user interface helps, but it isn’t needed for the memorizers and mostly benefits power users (the 30% of the market “two-dot and up” crowd) who recognize patterns and appreciate logic, consistency, and good design. So these are not good enough on their own.

This doesn’t mean we should forget about features and usability! Not at all! But if the goal is to “go mainstream,”we have to understand the true audience: **hardware vendors, not end users**. The goal is to have a software product appealing enough to get picked up by vendors when they go shopping for one, because that’s mostly how it works. Companies like Apple that do their own custom top-to-bottom hardware and software for big-name products are rare. Most build on top of 3rd-party software that requires the least integration and custom work from their in-house software team. If your software isn’t up to the task, they move onto the next option. So when some hardware vendor has a need, your software better be ready!

And what do hardware vendors need?

  * **Flexibility**. Your software has to be easily adaptable to whatever kind of device they have without tons of custom engineering they’ll be on the hook for supporting over the product’s lifecycle.
  * **Features that make their devices look good**. Support for its physical hardware characteristics, good performance, a pleasant-looking user interface… reasons for people to buy it, basically.
  * **Stability**. Can’t crash and dump users at a command line terminal prompt. Has to actually work. Can’t feel like a hobbyist science fair project.
  * **Usability that’s to be good enough to minimize support costs**. When something goes wrong, “the mainstream” contacts their hardware vendor. Usability needs to be good enough so that this happens as infrequently as possible.



It doesn’t need to be perfect. It just needs to do that stuff. This is how Windows conquered the PC market in the 90s despite being terrible! And our stuff is much better!

I see evidence that this is already working for KDE. Pine ships Manjaro with Plasma Mobile and Plasma Desktop on the [PinePhone][8] and [PineBook Pro][9], respectively. Valve also picked Plasma Desktop for the [Steam Deck][10], replacing GNOME for their new version of SteamOS. I see KDE software as well-positioned here and getting better all the time. So let’s keep doubling down on delivering what hardware vendors need to sell their awesome products.

_Originally written by KDE developer Nate Graham on his [blog PointiestStick][11]. The content has been reproduced here with his permission. The views expressed are of author’s own and it may not reflect the views of It’s FOSS._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/what-desktop-linux-needs-to-succeed-in-the-mainstream/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=0506yDSgU7M&list=PL8mG-RkN2uTyhe6fxWpnsHv53Y1I-K3yu
[2]: https://www.youtube.com/watch?v=TtsglXhbxno&list=PL8mG-RkN2uTyhe6fxWpnsHv53Y1I-K3yu&index=3
[3]: https://invent.kde.org/teams/usability/issue-board/-/boards/7723
[4]: https://swaywm.org/
[5]: https://drewdevault.com/2021/12/05/What-desktop-Linux-needs.html
[6]: https://pointieststick.com/2021/11/29/who-is-the-target-user
[7]: https://pointieststick.com/2021/11/30/more-about-those-zero-dot-users/
[8]: https://www.pine64.org/pinephone/
[9]: https://www.pine64.org/pinebook-pro/
[10]: https://www.steamdeck.com/
[11]: https://pointieststick.com/2021/12/09/what-desktop-linux-needs-to-succeed-in-the-mainstream/
