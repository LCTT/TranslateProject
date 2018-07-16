simple and elegant free podcast player
======

![](https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Subscriptions.jpg?resize=750%2C393&ssl=1)

CPod (formerly known as Cumulonimbus) is a cross-platform, open source podcast player for the desktop. The application is built with web technologies – it’s written in the JavaScript programming language and uses the Electron framework. Electron is often (rightly?) criticized for being a memory hog and dog slow. But is that mainly because of poor programming, rather than an inherent flaw in the technology?

CPod is available for Linux, Mac OS, and Windows. Installation was a breeze on my Ubuntu 18.04 distribution as the author conveniently provides a 64-bit deb package. If you don’t run a Debian/Ubuntu based distro, there’s an AppImage which effortlessly installs the software on all major Linux distributions. There’s also a snap package from the snapcraft website, but bizarrely (and incorrectly) flags the software as proprietary software. As CPod is released under an open source license, there’s the full source code available too.

The deb package installs the software to /opt/CPod, although the binary is still called cumulonimbus. A bit of tidying up needed there. For Mac OS users, there’s an Apple Disk Image file.

### Home

![CPod Playlist][2]
First off, you cannot fail to notice the gorgeous attractive interface. Presentation is first class.

First off, you cannot fail to notice the gorgeous attractive interface. Presentation is first class.

The home section shows your subscribed podcasts. There are helpful filters at the top. They let you select podcasts of specified duration (handy if time is limited), you can filter by date, filter for podcasts that you’ve downloaded an offline copy, as well as podcasts that have not been listened to, you’ve started listening to, and podcasts you’ve heard to the end.

Below the filters, there’s the option to select multiple podcasts, download local copies, add podcasts to your queue, as well as actually playing a podcast. The interface is remarkably intuitive.

One quirk is that offline episodes are downloaded to the directory ~/.config/cumulonimbus/offline_episodes/. The downloaded podcasts are therefore not visible in the Files file manager by default (this is because the standard installation of Files does not display ‘hidden files’). It’s easy to enable hidden files in the file manager. Good news, the developer plans to add a configurable default download directory.

There’s lots of nice touches which enhance the user experience, such as the progress bars when downloading episodes.

### Playing a podcast

![CPod][3]

Here’s one of my favourite podcasts, Ubuntu Podcast, in playback. There’s visualization effects enabled; they only show when the window has focus. The visualizations don’t always display properly. There’s also the option of changing the playback speed (0.5x – 4x speed). I’m not sure why I’d want to change the playback speed though. Maybe someone could enlighten me?

More functional is the slider that lets you skip to a specific point of the podcast although this is a tad buggy. The software is in an early stage of development. In any case, I prefer using the keyboard shortcuts to move forwards and backwards, and they work fine. Some podcasts offer links that let you skip to a particular segment; they are displayed in the large pane.

There’s also the ability to watch video podcasts in both fullscreen and window mode. I spend most of my time listening to audio podcasts, but having full screen video podcasts is a pretty cool feature. Video playback is powered by ffmpeg.

### Queue

![CPod Queue][4]
There’s not much to say about the queue functionality, but it’s worth noting you can change the order of episodes simply by dragging and dropping them in the interface. It’s well implemented and really simple to use. Another tick for CPod.

### Subscriptions

There’s not much to say about the queue functionality, but it’s worth noting you can change the order of episodes simply by dragging and dropping them in the interface. It’s well implemented and really simple to use. Another tick for CPod.

![CPod Subscriptions][5]

The interface makes it really easy to subscribe and unsubscribe to podcasts. Clicking the image of a subscribed podcast lets you find an episode, as well as a list of recent episodes, again with the ability to play, queue, and download. It’s all very clean and easy to use.

### Explore

In explore you can search for podcasts. Just type some keywords into the Explore dialog box, and you’re presented with a list of podcasts you can listen and subscribe.

If you’re a fan of YouTube, you’re in luck. There’s the ability to preview and subscribe to YouTube channels by pasting a channel’s URL into the Explore box. That’s great if you have YouTube channel hyperlinks handy, but some sort of YouTube channel finder would be a great addition.

Here’s a YouTube video in action.

![CPod YTube][6]

### Settings

![CPod Settings][7]

There’s a lot you can configure in Settings. There’s functionality to:

  * Internationalization support – the ability to select the language displayed. Currently, there’s fairly limited support in this respect. Besides English, there’s Chinese, French, German, Korean, Portuguese, Portuguese (Brazilian), and Spanish available. Contributing translations is probably the easiest way for non-programmers to contribute to an open source project.
  * Option to group episodes in Home by day or month.
  * Keyboard shortcuts that let you skip backward, skip forward, and play/pause playback. I love my keyboard shortcuts.
  * Configure different lengths of forward/backward skip.
  * Enable waveform visualization – you can see examples of the visualization in our images (Playlist and Subscription sections).
  * Basic gpodder.net integration (currently only subscriptions and device sync are supported; other functionality such as episodes actions and queue are planned).
  * Allow pre-releases when auto-updating.
  * Export subscriptions to OPML – Outline Processor Markup Language is an XML format commonly used to exchange lists of web feeds between web feed aggregators.
  * Import subscriptions from OPML.
  * Update podcast cover art.
  * View offline episodes directory.



The software has a bag of neat touches. For example, if I change the language setting, the software presents a pop up saying CPod needs to be restarted for the change to take effect. All very user-friendly.

The Media Player Remote Interfacing Specification (MPRIS) is a standard D-Bus interface which aims to provide a common programmatic API for controlling media players. CPod offers basic MPRIS integration.

### Summary

CPod is another good example of what’s possible with modern web technologies. Sure, it’s got a few quirks, it’s in an early stage of development (read ‘expect to find lots of bugs’), and there’s some useful functionality waiting to be implemented. But I’m using the software on a daily basis, and will definitely keep up-to-date with developments.

Linux already has some high quality open source podcast players. But CPod is definitely worth a download if you’re passionate about podcasts.

**Website:** [**github.com/z————-/CPod**][8]
**Support:**
**Developer:** Zack Guard
**License:** Apache License 2.0

Zack Guard, CPod’s developer, is a student who lives in Hong Kong. You can buy him a coffee at **<https://www.buymeacoffee.com/zackguard>**. Unfortunately, I’m an impoverished student too.

### Related


--------------------------------------------------------------------------------

via: https://www.linuxlinks.com/cpod-simple-elegant-free-podcast-player/

作者：[Luke Baker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxlinks.com/author/luke-baker/
[1]:https://www.linuxlinks.com/wp-content/plugins/jetpack/modules/lazy-images/images/1x1.trans.gif
[2]:https://i2.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Playlist.jpg?resize=750%2C368&ssl=1
[3]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Main.jpg?resize=750%2C368&ssl=1
[4]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Queue.jpg?resize=750%2C368&ssl=1
[5]:https://i0.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Subscriptions.jpg?resize=750%2C368&ssl=1
[6]:https://i1.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-YouTube.jpg?resize=750%2C368&ssl=1
[7]:https://i1.wp.com/www.linuxlinks.com/wp-content/uploads/2018/07/CPod-Settings.jpg?resize=750%2C368&ssl=1
[8]:https://github.com/z-------------/CPod
