[#]: subject: "After Chromium, Ubuntu Now Converts Firefox to Snap by Default"
[#]: via: "https://news.itsfoss.com/ubuntu-firefox-snap-default/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

After Chromium, Ubuntu Now Converts Firefox to Snap by Default
======

One of the major and controversial [changes in the upcoming Ubuntu 21.10][1] is the conversion of Firefox from deb to snap.

Yes, you heard it right. The default Firefox will be a Snap application, not the regular DEB version.

As [spotted by OMG! Ubuntu][2], this is done as per an agreement between Mozilla and Canonical (Ubuntu’s parent company).

The [feature freeze exception (FFE)][3] mentions it clearly:

> Per Canonical’s distribution agreement with Mozilla, we’re making the snap the default installation of Firefox on desktop ISOs starting with Ubuntu 21.10.

With this change, the Firefox deb package will be converted to Firefox snap package.

This means that going forward, Firefox will be available as Snap. I think this change also means that even if you use apt command to install it, you’ll be getting the Snap package.

### Deja vu?

If you feel that this has been done in the past, you have got the right feeling. In the past, Ubuntu converted the Chromium browser to Snap.

Today, if you use apt install chromium-browser, you still get the Snap version. There is no DEB package for Chromium in Ubuntu anymore.

When Ubuntu made this sudden change on its own, there was an uproar. The conversion of Firefox to Snap will also create controversy. But this time, Ubuntu shares the blame with Mozilla.

### Mozilla wants Snap

![][4]

Interestingly, it was [Mozilla that approached Canonical for this change][5]. Mozilla will maintain the Snap version of Firefox and the end users will get quick updates directly from the source.

After all, it takes a few days before a new Firefox release lands in Ubuntu. With the Snap move, your Firefox will be updated to the new version the same day.

### Concerns?

A few for sure. I know there are a few people completely averted to Snap, I am not one of them.

I have three major complaints with Snap packages: slow start up speed, poor system integration and high disk space.

Over the time, Snaps have improved on the disk space front. But despite all the improvements, Snap packages still take longer to start. This could be tolerable with an IDE but it may ruin the browsing experience.

This slow startup speed makes me wonder why it is called ‘Snap’ because surely, it doesn’t start in a snap.

Another thing that bothers me is the Snap auto-refresh. Snap apps are updated automatically. If Mozilla starts pushing updates more frequently, this [Firefox restart annoyance][6] in the middle of work will be more frequently as well.

![][7]

The change will impact you when you install or upgrade to Ubuntu 21.10. The change will eventually propagate to Ubuntu 22.04 LTS.

What do you think of this change? Yeah or neah?

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-firefox-snap-default/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/ubuntu-21-10-release-schedule/
[2]: https://www.omgubuntu.co.uk/2021/09/ubuntu-makes-firefox-snap-default
[3]: https://bugs.launchpad.net/ubuntu/+source/ubuntu-release-upgrader/+bug/1943840
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI1NCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://discourse.ubuntu.com/t/feature-freeze-exception-seeding-the-official-firefox-snap-in-ubuntu-desktop/24210
[6]: https://news.itsfoss.com/mozilla-annoying-new-tab/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMwOCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
