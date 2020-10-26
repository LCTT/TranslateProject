[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Microsoft Disables GitHub Repository of Open Source Project youtube-dl)
[#]: via: (https://itsfoss.com/youtube-dl-github-takedown/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Microsoft Disables GitHub Repository of Open Source Project youtube-dl
======

The open source project [youtube-dl is one of the best tools to download videos][1] from YouTube and many other video hosting websites.

But the existence of this project is under threat right now. Recording Industry Association of America, Inc. (RIAA) sent a notice to GitHub against youtube-dl and its forked repositories on 23 Oct 2020.

Microsoft owned GitHub complied immediately and within 24 hours, the official youtube-dl and its forked repository were disabled as DMCA takedown.

![][2]

### What is a DMCA takedown?

[DMCA][3] (Digital Millennium Copyright Act) is a US copyright law regarding copyright and the internet.

If the rightful owner of content (video, audio, text) believes that a certain webpage is using (or enabling others to use) the content without authorization (infringing upon the rights of the content owner), the owner can send a DMCA takedown notice to the hosting service.

Upon receiving the DMCA takedown notice, the hosting service may disable/delete the webpage (or entire website).

There is also a provision of counter notice where the other party can challenge the takedown.

### RIAA’s letter against youtube-dl

As per the [letter sent by RIAA][4], it accuses youtube-dl of infringing upon the rights of its members. It accuses youtube-dl:

> “The clear purpose of this source code is to (i) circumvent the technological protection measures used by authorized streaming services such as YouTube, and (ii) reproduce and distribute music videos and sound recordings owned by our member companies without authorization for such use. We note that the source code is described on GitHub as “a command-line program to download videos from YouTube.com and a few more sites.””

The letter mentions how the GitHub repository of youtube-dl mentions that it is a program for downloading videos from the YouTube.

The README of the youtube-dl had mentioned downloading videos of Justin Timberlake, Taylor Siwft etc in the command usage examples. That has also been used in the notice to make a case against youtube-dl.

Microsoft’s GitHub considered/converted the letter into a DMCA notice and disabled youtube-dl and seventeen other repositories mentioned in the letter.

John Bergmayer, Legal Director at Public Knowledge, says that it is not an assertion that youtube-dl is an infringing work but the RIAA claim is that it’s illegal.

> This isn’t really a DMCA request. I don’t see an assertion that youtube-dl is an infringing work. Rather the claim is that it’s illegal per se <https://t.co/vQ16nVleCf>
>
> — John Bergmayer (@bergmayer) [October 23, 2020][5]

### What lies ahead for youtube-dl?

The youtube-dl team should surely file a counter appeal because they are not serving copyright content to the users directly.

But they should ensure a couple of things:

  * Consider changing their name and remove youtube from it so that they are safe from copyright notice from Google (owner of YouTube) in the future.
  * They should not mention any examples in their repository that demonstrates downloading of a copyrighted video from YouTube.
  * Put up a notice that onus of downloading videos lies on the user and discourage them from downloading copyrighted videos. This is something [Linux torrent clients][6] like Transmission already do.



### Projects like youtube-dl need to live

youtube-dl is used by many other tools and websites to provide the ability to download videos from YouTube and other video hosting websites.

This may sound like piracy but that might not be the case all the time. Some video creators make their videos available under Creative Common license so that others can use this work.

Downloading such copyright-free videos through youtube-dl should not be a problem.

Many people across the globe have limited internet connectivity. Downloading educational videos so that they can refer to it later without spending bandwidth is a genuine use of such a tool.

### Was it fair to takedown youtbe-dl?

I am surprised at the swift action taken by Microsoft GitHub in this case. They chickened out so easily.

Imagine a bunch of DMCA trolls start sending takedown notices to other projects on the pretext of copyright. This is a possibility. Remember how a [patent troll tried to extort money from GNOME’s Shotwell][7] image viewer program.

I do hope that the youtube-dl team counters the takedown and doesn’t give into the pressure.

I know that it is an open source project and its code can be hosted on a [GitHub alternative website like GitLab][8]. However, RIAA is a powerful organization and they can pressure other code hosting websites to remove youtube-dl repositories again. The repeated takedowns may also demoralize the developers into abandoning the project.

I have always wondered why YouTube doesn’t allow the video creators to have the ability to make their videos available for download either for free or for a fee.

What do you think of the entire episode? Do you think the takedown is right? Do express your views.

--------------------------------------------------------------------------------

via: https://itsfoss.com/youtube-dl-github-takedown/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/download-youtube-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/youtube-dl-dmca.jpg?resize=740%2C375&ssl=1
[3]: https://www.dmca.com/FAQ/What-is-DMCA
[4]: https://github.com/github/dmca/blob/master/2020/10/2020-10-23-RIAA.md
[5]: https://twitter.com/bergmayer/status/1319729582329790465?ref_src=twsrc%5Etfw
[6]: https://itsfoss.com/best-torrent-ubuntu/
[7]: https://itsfoss.com/shotwell-lawsuit/
[8]: https://itsfoss.com/github-alternatives/
