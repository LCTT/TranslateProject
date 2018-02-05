Annoying Experiences Every Linux Gamer Never Wanted!
============================================================


 [![Linux gamer's problem](https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg)][10]

[Gaming on Linux][12] has come a long way. There are dedicated [Linux gaming distributions][13] now. But this doesn’t mean that gaming experience on Linux is as smooth as on Windows.

What are the obstacles that should be thought about to ensure that we enjoy games as much as Windows users do?

[Wine][14], [PlayOnLinux][15] and other similar tools are not always able to play every popular Windows game. In this article, I would like to discuss various factors that must be dealt with in order to have the best possible Linux gaming experience.

### #1 SteamOS is Open Source, Steam for Linux is NOT

As stated on the [SteamOS page][16], even though SteamOS is open source, Steam for Linux continues to be proprietary. Had it also been open source, the amount of support from the open source community would have been tremendous! Since it is not, [the birth of Project Ascension was inevitable][17]:

[video](https://youtu.be/07UiS5iAknA)

Project Ascension is an open source game launcher designed to launch games that have been bought and downloaded from anywhere – they can be Steam games, [Origin games][18], Uplay games, games downloaded directly from game developer websites or from DVD/CD-ROMs.

Here is how it all began: [Sharing The Idea][19] resulted in a very interesting discussion with readers all over from the gaming community pitching in their own opinions and suggestions.

### #2 Performance compared to Windows

Getting Windows games to run on Linux is not always an easy task. But thanks to a feature called [CSMT][20] (command stream multi-threading), PlayOnLinux is now better equipped to deal with these performance issues, though it’s still a long way to achieve Windows level outcomes.

Native Linux support for games has not been so good for past releases.

Last year, it was reported that SteamOS performed [significantly worse][21] than Windows. Tomb Raider was released on SteamOS/Steam for Linux last year. However, benchmark results were [not at par][22] with performance on Windows.

[video](https://youtu.be/nkWUBRacBNE)

This was much obviously due to the fact that the game had been developed with [DirectX][23] in mind and not [OpenGL][24].

Tomb Raider is the [first Linux game that uses TressFX][25]. This video includes TressFX comparisons:

[video](https://youtu.be/-IeY5ZS-LlA)

Here is another interesting comparison which shows Wine+CSMT performing much better than the native Linux version itself on Steam! This is the power of Open Source!

[Suggested readA New Linux OS "OSu" Vying To Be Ubuntu Of Arch Linux World][26]

[video](https://youtu.be/sCJkC6oJ08A)

TressFX has been turned off in this case to avoid FPS loss.

Here is another Linux vs Windows comparison for the recently released “[Life is Strange][27]” on Linux:

[video](https://youtu.be/Vlflu-pIgIY)

It’s good to know that  [_Steam for Linux_][28]  has begun to show better improvements in performance for this new Linux game.

Before launching any game for Linux, developers should consider optimizing them especially if it’s a DirectX game and requires OpenGL translation. We really do hope that [Deus Ex: Mankind Divided on Linux][29] gets benchmarked well, upon release. As its a DirectX game, we hope it’s being ported well for Linux. Here’s [what the Executive Game Director had to say][30].

### #3 Proprietary NVIDIA Drivers

[AMD’s support for Open Source][31] is definitely commendable when compared to [NVIDIA][32]. Though [AMD][33] driver support is [pretty good on Linux][34] now due to its better open source driver, NVIDIA graphic card owners will still have to use the proprietary NVIDIA drivers because of the limited capabilities of the open-source version of NVIDIA’s graphics driver called Nouveau.

In the past, legendary Linus Torvalds has also shared his thoughts about Linux support from NVIDIA to be totally unacceptable:

[video](https://youtu.be/O0r6Pr_mdio)

You can watch the complete talk [here][35]. Although NVIDIA responded with [a commitment for better linux support][36], the open source graphics driver still continues to be weak as before.

### #4 Need for Uplay and Origin DRM support on Linux

[video](https://youtu.be/rc96NFwyxWU)

The above video describes how to install the [Uplay][37] DRM on Linux. The uploader also suggests that the use of wine as the main tool of games and applications is not recommended on Linux. Rather, preference to native applications should be encouraged instead.

The following video is a guide about installing the [Origin][38] DRM on Linux:

[video](https://youtu.be/ga2lNM72-Kw)

Digital Rights Management Software adds another layer for game execution and hence it adds up to the already challenging task to make a Windows game run well on Linux. So in addition to making the game execute, W.I.N.E has to take care of running the DRM software such as Uplay or Origin as well. It would have been great if, like Steam, Linux could have got its own native versions of Uplay and Origin.

[Suggested readLinux Foundation Head Calls 2017 'Year of the Linux Desktop'... While Running Apple's macOS Himself][39]

### #5 DirectX 11 support for Linux

Even though we have tools on Linux to run Windows applications, every game comes with its own set of tweak requirements for it to be playable on Linux. Though there was an announcement about [DirectX 11 support for Linux][40] last year via Code Weavers, it’s still a long way to go to make playing newly launched titles on Linux a possibility. Currently, you can

Currently, you can [buy Crossover from Codeweavers][41] to get the best DirectX 11 support available. This [thread][42] on the Arch Linux forums clearly shows how much more effort is required to make this dream a possibility. Here is an interesting [find][43] from a [Reddit thread][44], which mentions Wine getting [DirectX 11 patches from Codeweavers][45]. Now that’s definitely some good news.

### #6 100% of Steam games are not available for Linux  

This is an important point to ponder as Linux gamers continue to miss out on every major game release since most of them land up on Windows. Here is a guide to [install Steam for Windows on Linux][46].

### #7 Better Support from video game publishers for OpenGL

Currently, developers and publishers focus primarily on DirectX for video game development rather than OpenGL. Now as Steam is officially here for Linux, developers should start considering development in OpenGL as well.

[Direct3D][47] is made solely for the Windows platform. The OpenGL API is an open standard, and implementations exist for not only Windows but a wide variety of other platforms.

Though quite an old article, [this valuable resource][48] shares a lot of thoughtful information on the realities of OpenGL and DirectX. The points made are truly very sensible and enlightens the reader about the facts based on actual chronological events.

Publishers who are launching their titles on Linux should definitely not leave out the fact that developing the game on OpenGL would be a much better deal than translating it from DirectX to OpenGL. If conversion has to be done, the translations must be well optimized and carefully looked into. There might be a delay in releasing the games but still it would definitely be worth the wait.

Have more annoyances to share? Do let us know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-gaming-problems/

作者：[Avimanyu Bandyopadhyay  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/avimanyu/
[1]:https://itsfoss.com/author/avimanyu/
[2]:https://itsfoss.com/linux-gaming-problems/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21&url=https://itsfoss.com/linux-gaming-problems/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=itsfoss2
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:http://www.stumbleupon.com/submit?url=https://itsfoss.com/linux-gaming-problems/&title=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21
[8]:https://www.reddit.com/submit?url=https://itsfoss.com/linux-gaming-problems/&title=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21
[9]:https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg
[10]:https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg
[11]:http://pinterest.com/pin/create/bookmarklet/?media=https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg&url=https://itsfoss.com/linux-gaming-problems/&is_video=false&description=Linux%20gamer%27s%20problem
[12]:https://itsfoss.com/linux-gaming-guide/
[13]:https://itsfoss.com/linux-gaming-distributions/
[14]:https://itsfoss.com/use-windows-applications-linux/
[15]:https://www.playonlinux.com/en/
[16]:http://store.steampowered.com/steamos/
[17]:http://www.ibtimes.co.uk/reddit-users-want-replace-steam-open-source-game-launcher-project-ascension-1498999
[18]:https://www.origin.com/
[19]:https://www.reddit.com/r/pcmasterrace/comments/33xcvm/we_hate_valves_monopoly_over_pc_gaming_why/
[20]:https://github.com/wine-compholio/wine-staging/wiki/CSMT
[21]:http://arstechnica.com/gaming/2015/11/ars-benchmarks-show-significant-performance-hit-for-steamos-gaming/
[22]:https://www.gamingonlinux.com/articles/tomb-raider-benchmark-video-comparison-linux-vs-windows-10.7138
[23]:https://en.wikipedia.org/wiki/DirectX
[24]:https://en.wikipedia.org/wiki/OpenGL
[25]:https://www.gamingonlinux.com/articles/tomb-raider-released-for-linux-video-thoughts-port-report-included-the-first-linux-game-to-use-tresfx.7124
[26]:https://itsfoss.com/osu-new-linux/
[27]:http://lifeisstrange.com/
[28]:https://itsfoss.com/install-steam-ubuntu-linux/
[29]:https://itsfoss.com/deus-ex-mankind-divided-linux/
[30]:http://wccftech.com/deus-ex-mankind-divided-director-console-ports-on-pc-is-disrespectful/
[31]:http://developer.amd.com/tools-and-sdks/open-source/
[32]:http://nvidia.com/
[33]:http://amd.com/
[34]:http://www.makeuseof.com/tag/open-source-amd-graphics-now-awesome-heres-get/
[35]:https://youtu.be/MShbP3OpASA
[36]:https://itsfoss.com/nvidia-optimus-support-linux/
[37]:http://uplay.com/
[38]:http://origin.com/
[39]:https://itsfoss.com/linux-foundation-head-uses-macos/
[40]:http://www.pcworld.com/article/2940470/hey-gamers-directx-11-is-coming-to-linux-thanks-to-codeweavers-and-wine.html
[41]:https://itsfoss.com/deal-run-windows-software-and-games-on-linux-with-crossover-15-66-off/
[42]:https://bbs.archlinux.org/viewtopic.php?id=214771
[43]:https://ghostbin.com/paste/sy3e2
[44]:https://www.reddit.com/r/linux_gaming/comments/3ap3uu/directx_11_support_coming_to_codeweavers/
[45]:https://www.codeweavers.com/about/blogs/caron/2015/12/10/directx-11-really-james-didnt-lie
[46]:https://itsfoss.com/linux-gaming-guide/
[47]:https://en.wikipedia.org/wiki/Direct3D
[48]:http://blog.wolfire.com/2010/01/Why-you-should-use-OpenGL-and-not-DirectX
