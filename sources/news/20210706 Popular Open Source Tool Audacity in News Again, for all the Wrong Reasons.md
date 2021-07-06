[#]: subject: (Popular Open Source Tool Audacity in News Again, for all the Wrong Reasons)
[#]: via: (https://news.itsfoss.com/audacity-fiasco-fork/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Popular Open Source Tool Audacity in News Again, for all the Wrong Reasons
======

Audacity is a popular, free and [open-source audio editor][1] available cross-platform.

[Muse Group recently acquired Audacity][2]. In case you didn’t know, they are popularly known for open-source music notation software, [Musescore][3].

While this was a good thing considering Audacity’s future growth with all the extended resources after the acquisition, it is turning out to be a nightmare. Why?

After Muse Group bought Audacity, they have managed to spark multiple controversies. To put it in an organized timeline, here’s what it looks like:

  * Proposed [adding new telemetry features][4] which potentially violated privacy and then [dropped the plan][5] after backlash.
  * Introduced a **Contributor License Agreement (CLA)** as one of the steps to change the license
  * Updated the **privacy policy** for the desktop app and then trying to correct it after backlash.



### Here’s What Happened: Overview

As one of the go-to audio editing tools for beginners and professionals, Audacity is something important for the users and the open-source community.

Even though the addition of telemetry may have been a bad business decision, introducing a CLA and updating the privacy policy that encourages selling data took things to another level.

As far as I’m aware, a CLA may give the project maintainer rights to reuse/re-license a contributor’s work and use it in a closed-source software.

Officially, they [clarify][6] that this is going to supercharge the development of Audacity. But many of the contributors do not seem to agree with it and suggest better ways to monetize Audacity, if that is the goal of Muse group.

Let’s assume for a moment that the contributors agree to that (which they do not), the latest privacy policy for Audacity’s desktop app makes things worse.

To give you an overview, here’s what happened with the privacy policy for the desktop app:

![][7]

For a software, data collection practices can vary depending on what they want to know to improve their product.

But, with whom they share that data with is more important.

And as per the last update to their [privacy policy][8] on **July 2**, 2021; personal data collected may be shared to a “**potential buyer**” and “**advisors**” or similar agents.

This introduces the fact that they may share your personal data with any third-party they work with.

Not just limited to this, they also added a restriction that this software is not meant for individuals below 13 years of age (kids). I don’t see any reason for that.

Also, it violates the [GPL license][9], which should not prevent usage of the software.

There are more instances to how bad the privacy policy is—it mentions that they will record your IP address for a day and then hash it for storage.

So your IP address will be tracked even if you are using an offline audio editor—is that even necessary?

![][10]

In fact, they officially clarified that they will be making changes to it because of “**unclear phrasing in the Privacy Policy**” that may have led to confusion. Well, I wonder what were they thinking when they first updated the policy?

And there’s no going back from that.

By the time you are reading this, they may have updated it as well.

### Choosing Audacity’s Fork Instead of Audacity

Now, after the fiasco, there’s a [fork][11], which is gaining attention and the community may end up going forward with it.

![][12]

The Audacity fork has not yet been concluded with a name. But it aims to revert all the changes influenced by Muse group.

The fork may not be ready for prime time with binary packages available for common users, but you can build it from source.

While it is still something in progress, the fork already has **1.7k stars** at the time of writing this. It is only a matter of time that the fork gets more attention than the original project.

You can continue to use Audacity from its [official website][13] or original [GitHub page][14]. But if you do not agree with Audacity’s latest developments, you should keep an eye on its fork.

_What are your thoughts on Audacity’s latest fiasco? Do you want to support the original Audacity tool bought by Muse group or are you in favor of the new fork?_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/audacity-fiasco-fork/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-audio-editors-linux/
[2]: https://www.musicradar.com/news/ultimate-guitar-owner-music-group-acquires-audacity-pledging-to-keep-it-free-and-open-source
[3]: https://itsfoss.com/musescore/
[4]: https://github.com/audacity/audacity/pull/835
[5]: https://github.com/audacity/audacity/discussions/889
[6]: https://github.com/audacity/audacity/discussions/932
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjIwMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://www.audacityteam.org/about/desktop-privacy-notice/
[9]: https://en.wikipedia.org/wiki/GNU_General_Public_License
[10]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[11]: https://github.com/temporary-audacity/audacity
[12]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQwMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[13]: https://www.audacityteam.org
[14]: https://github.com/audacity/audacity
