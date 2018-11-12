translating---geekpi

CPod: An Open Source, Cross-platform Podcast App
======
Podcasts are a great way to be entertained and informed. In fact, I listen to about ten different podcasts covering technology, mysteries, history, and comedy. Of course, [Linux podcasts][1] are also on this list.

Today, we will take a look at a simple cross-platform application for handling your podcasts.

![][2]
Recommended podcasts and podcast search

### The Application

[CPod][3] is the creation of [Zack Guard (z————-)][4]. **It is an[Election][5] app** , which gives it the ability to run on the largest operating systems (Linux, Windows, Mac OS).

Trivia: CPod was originally named Cumulonimbus.

The majority of the application is taken up by two large panels to display content and options. A small bar along the left side of the screen gives you access to the different parts of the application. The different sections of CPod include Home, Queue, Subscriptions, Explore and Settings.

![cpod settings][6]Settings

### Features of CPod

Here is a list of features that CPod has to offer:

  * Simple, clean design
  * Available on the top computer platforms
  * Available as a Snap
  * Search iTunes’ podcast directory
  * Download and play episodes without downloading
  * View podcast information and episode
  * Search for an individual episode of a podcast
  * Dark mode
  * Change playback speed
  * Keyboard shortcuts
  * Sync your podcast subscriptions with gpodder.net
  * Import and export subscriptions
  * Sort subscriptions based on length, date, download status, and play progress
  * Auto-fetch new episodes on application startup
  * Multiple language support



![search option in cpod application][7]Searching for ZFS episode

### Experiencing CPod on Linux

I ended up installing CPod on two systems: ArchLabs and Windows. There are two versions of CPod in the [Arch User Repository][8]. However, they are both out of date, one is version 1.14.0 and the other was 1.22.6. The most recent version of CPod is 1.27.0. Because of the version difference between ArchLabs and Windows, I had to different experiences. For this article, I will focus on 1.27.0, since that is the most current and has the most features.

Right out of the gate, I was able to find most of my favorite podcasts. I was able to add the ones that were not on the iTunes’ list by pasting in the URL for the RSS feed.

It was also very easy to find a particular episode of a podcast. for example, I was recently looking for an episode of [Late Night Linux][9] where they were talking about [ZFS][10]. I clicked on the podcast, typed “ZFS” in the search box and found it.

I quickly discovered that the easiest way to play a bunch of podcast episodes was to add them to the queue. Once they are in the queue, you can either stream them or download them. You can also reorder them by dragging and dropping. As each episode played, it displayed a visualization of the sound wave, along with the episode summary.

### Installating CPod

On [GitHub][11], you can download an AppImage or Deb file for Linux, a .exe file for Windows or a .dmg file for Mac OS.

You can also install CPod as a [Snap][12]. All you need to do is use the following command:

```
sudo snap install cpod
```

Like I said earlier, the [Arch User Repository][8] version of CPod is old. I already messaged one of the packagers. If you use Arch (or an Arch-based distro), I would recommend doing the same.

![cpod for Linux pidcasts][13]Playing one of my favorite podcasts

### Final Thoughts

Overall, I liked CPod. It was nice looking and simple to use. In fact, I like the original name (Cumulonimbus) better, but it is a bit of a mouthful.

I just had two problems with the application. First, I wish that the ratings were available for each podcast. Second, the menus that allow you to sort episodes based on length, date, download status, and play progress don’t work when the dork mode is turned on.

Have you ever used CPod? If not, what is your favorite podcast app? What are some of your favorite podcasts? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Red][14][d][14][it][14].

--------------------------------------------------------------------------------

via: https://itsfoss.com/cpod-podcast-app/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-podcasts/
[2]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/cpod1.1.jpg
[3]: https://github.com/z-------------/CPod
[4]: https://github.com/z-------------
[5]: https://electronjs.org/
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/cpod2.1.png
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/cpod4.1.jpg
[8]: https://aur.archlinux.org/packages/?O=0&K=cpod
[9]: https://latenightlinux.com/
[10]: https://itsfoss.com/what-is-zfs/
[11]: https://github.com/z-------------/CPod/releases
[12]: https://snapcraft.io/cumulonimbus
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/cpod3.1.jpg
[14]: http://reddit.com/r/linuxusersgroup
