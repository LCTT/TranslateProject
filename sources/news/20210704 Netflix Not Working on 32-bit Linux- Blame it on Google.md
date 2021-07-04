[#]: subject: (Netflix Not Working on 32-bit Linux? Blame it on Google)
[#]: via: (https://news.itsfoss.com/netflix-issue-32-bit-linux/)
[#]: author: (Abhishek https://news.itsfoss.com/author/root/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Netflix Not Working on 32-bit Linux? Blame it on Google
======

Here’s the scenario. You were enjoying Netflix and other streaming services with Firefox on your 32-bit Linux system. But all of a sudden, Netflix just stopped working.

You updated the Firefox browser, made sure that DRM is enabled in Firefox, all media codecs have been installed and yet it doesn’t work.

Don’t blame Firefox for this problem. Don’t blame Linux for this problem. Blame Google.

### Google killed Widevine support for 32-bit Linux systems

A little technical background for your understanding.

You can [play Netflix in Firefox on Linux][1] thanks to a proprietary solution ‘[Widevine][2]‘ from Google. It is a free to use, but not open source, project. It enables the playback of DRM protected streaming contents.

Firefox does not come preinstalled with Widevine. However, you can install the Widevine plugin to play DRM protected content from Netflix, Spotify, Prime Video and other streaming sites.

![][3]

**Google ended Widevine support for 32-bit Linux on May 31, 2021.**

And that’s what caused problems for the handful of users who are still rocking an older computers with [32-bit Linux distributions][4].

When the browser was updated, Widevine support was pulled out. Even though it shows that DRM is still enabled in the browser, the plugin won’t work.

![][5]

And this means no Netflix on 32-bit Linux systems. At this time, I do not know if you can play Netflix on a 32-bit Windows or not.

### No open source solution in sight

If Widevine were open source, it would have been easier for knowledgeable and enthusiastic developers to fork it and continue the support for 32-bit systems.

But since it is proprietary, the control is in Google’s hands. And by the looks of it, they are neither going to bring back the 32-bit support nor they are going to open source Widevine.

I looked on the internet for an open source alternative library for Widevine that could allow DRM protected streaming, but my search ended in disappointment.

It is sad to see that a huge and rich organization like Google won’t put resources on supporting older technology.

But this is the same Google who, despite all its engineering might, cannot fix the problem of purchased HD movies playing in standard resolution. Yes, that’s true. If you rent a HD movie on YouTube, it [plays the movies in 480p on the desktop browser][6]. The same rented movie will play in full HD on mobile, Chromecast, Android TV or gaming consoles. And this issue has not been fixed in months despite being in Google’s knowledge.

Anyway. If you are impacted by this Widevine issue, I feel for you. Let’s see if an alternate comes up but don’t keep your hopes high.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/netflix-issue-32-bit-linux/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/netflix-firefox-linux/
[2]: https://www.widevine.com/about
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMyMCIgd2lkdGg9IjgwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://itsfoss.com/32-bit-linux-distributions/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMzOSIgd2lkdGg9Ijc5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://9to5google.com/2020/10/21/google-temporarily-limits-purchased-movie-playback-on-web-to-480p-w-youtube/
