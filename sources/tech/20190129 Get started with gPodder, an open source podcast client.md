[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with gPodder, an open source podcast client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-gpodder)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with gPodder, an open source podcast client
======
Keep your podcasts synced across your devices with gPodder, the 17th in our series on open source tools that will make you more productive in 2019.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/podcast-record-microphone.png?itok=8yUDOywf)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the 17th of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### gPodder

I like podcasts. Heck, I like them so much I record three of them (you can find links to them in [my profile][1]). I learn a lot from podcasts and play them in the background when I'm working. But keeping them in sync between multiple desktops and mobile devices can be a bit of a challenge.

[gPodder][2] is a simple, cross-platform podcast downloader, player, and sync tool. It supports RSS feeds, [FeedBurner][3], [YouTube][4], and [SoundCloud][5], and it also has an open source sync service that you can run if you want. gPodder doesn't do podcast playback; instead, it uses your audio or video player of choice.

![](https://opensource.com/sites/default/files/uploads/gpodder-1.png)

Installing gPodder is very straightforward. Installers are available for Windows and MacOS, and packages are available for major Linux distributions. If it isn't available in your distribution, you can run it directly from a Git checkout. With the "Add Podcasts via URL" menu option, you can enter a podcast's RSS feed URL or one of the "special" URLs for the other services. gPodder will fetch a list of episodes and present a dialog where you can select which episodes to download or mark old episodes on the list.

![](https://opensource.com/sites/default/files/uploads/gpodder-2.png)

One of its nicer features is that if a URL is already in your clipboard, gPodder will automatically place it in its URL field, which makes it really easy to add a new podcast to your list. If you already have an OPML file of podcast feeds, you can upload and import it. There is also a discovery option that allows you to search for podcasts on [gPodder.net][6], the free and open source podcast listing site by the people who write and maintain gPodder.

![](https://opensource.com/sites/default/files/uploads/gpodder-3.png)

A [mygpo][7] server synchronizes podcasts between devices. By default, gPodder uses [gPodder.net][8]'s servers, but you can change this in the configuration files if want to run your own (be aware that you'll have to modify the configuration file directly). Syncing allows you to keep your lists consistent between desktops and mobile devices. This is very useful if you listen to podcasts on multiple devices (for example, I listen on my work computer, home computer, and mobile phone), as it means no matter where you are, you have the most recent lists of podcasts and episodes without having to set things up again and again.

![](https://opensource.com/sites/default/files/uploads/gpodder-4.png)

Clicking on a podcast episode will bring up the text post associated with it, and clicking "Play" will launch your device's default audio or video player. If you want to use something other than the default, you can change this in gPodder's configuration settings.

gPodder makes it simple to find, download, and listen to podcasts, synchronize them across devices, and access a lot of other features in an easy-to-use interface.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-gpodder

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/users/ksonney
[2]: https://gpodder.github.io/
[3]: https://feedburner.google.com/
[4]: https://youtube.com
[5]: https://soundcloud.com/
[6]: http://gpodder.net
[7]: https://github.com/gpodder/mygpo
[8]: http://gPodder.net
