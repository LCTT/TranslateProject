[#]: subject: "Valve is Not Happy With Ubuntu's Snap Version of Steam: Here's Why"
[#]: via: "https://news.itsfoss.com/valve-steam-snap-ubuntu/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Valve is Not Happy With Ubuntu's Snap Version of Steam: Here's Why
======
The Snap Package for Steam does not work as well as you would expect,
thoughts?
Over the years, [playing games on Linux][1] has become very accessible, thanks to the rise of tools like Wine, Proton, and others based on those two.

Even **game developers are increasingly providing native support for Linux** by releasing games for Valve's handheld, Steam Deck that runs [SteamOS][2].

However, according to recent reports, it appears that **the unofficial Snap package of the Steam client is not behaving as intended** , as noticed by a Valve developer.

**Suggested Read** 📖

![][3]

**What's Happening:** A developer ( **Timothée Besset)** who works on the Steam client for Valve raised the concern in a [Mastodon post][4] about Steam's Snap app for Linux.

If you didn't know, the [Snap version][5] is an unofficial offering developed by Canonical that was introduced back in 2022, as part of them going _“all in on the gaming experience on Ubuntu_ ”.

The developer highlighted that they are **seeing a considerable increase in the number of bug reports** for issues caused by the Snap version of the Steam client.

But, the thing is, **many users may not be aware that they are running the Snap version** of the Steam client, and reaching out to Valve with their issues instead of getting in touch with Canonical.

And, why is that the case?

Primarily, Ubuntu (and its official flavors) promote the use of Snap packages. And, whenever a user decides to install Steam from the software center, you end up installing the Snap app. And, many do not realize it.

![][6]

You do not get any disclosure that this package not officially maintained by Valve.

Sure, a tick mark shows that Canonical maintains it, verifying the authenticity of the package. But, it is still not something officially recommended by Valve.

So, I guess, the users are being misled (or confused) with the user experience when installing Steam on Ubuntu.

![][7]

And, naturally, users will expect it to work out of the box. And, if it does not, everyone will say " _Steam does not work on Ubuntu or Linux_ " affecting Valve's reputation.

**What to do:** Well, according to Timothée, for Debian and any other Debian-based distros (including Ubuntu, of course), your **best bet is to install the official _.deb_** package from their [GitHub repo][8].

As an alternative, you can opt for the [unofficial Flatpak][9].

When **someone suggested making Steam detect Snap and stop it from working** , Timothée had the following to add:

> the runtime report detects snap/flatpak (or it will). But generally we wouldn't error out .. user freedom and all that. If it gets really bad I guess we could start popping a warning.

A warning does sound good to me. But, of course, now that Valve's concern is out there as a news, Canonical should work on resolving the issue and working together with Valve to improve the state of things.

_💬 What do you think? Will Canonical step up and address the issues with their Snap-based Steam Client?_

Via: [GamingOnLinux][10]

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/valve-steam-snap-ubuntu/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-gaming-guide/
[2]: https://itsfoss.com/steamos/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://mastodon.social/@TTimo/111772575146054328
[5]: https://snapcraft.io/steam
[6]: https://news.itsfoss.com/content/images/2024/01/steam-list-app.png
[7]: https://news.itsfoss.com/content/images/2024/01/steam-snap.png
[8]: https://github.com/ValveSoftware/steam-for-linux/
[9]: https://flathub.org/apps/com.valvesoftware.Steam
[10]: https://www.gamingonlinux.com/2024/01/valve-seeing-increasing-bug-reports-due-to-steam-snap-other-methods-recommended/
