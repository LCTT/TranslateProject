[#]: subject: "Listen to your favorite music on Linux with Juk"
[#]: via: "https://opensource.com/article/22/2/listen-music-linux-juk-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Listen to your favorite music on Linux with Juk
======
Juk is the default open source music player for the KDE Plasma Desktop
on Linux. Create playlists, use tagging, and play your favorite tunes on
Linux.
![Headphones on a yellow backdrop][1]

The KDE project doesn't just provide a famous desktop, it generates a lot of software, from tools for [video editng][2], [photography][3], and [illustration][4], to graphing calculators, email, and office work. Those are all productivity tools, but KDE is also good for relaxing. It has games and media players, and the music player I use is known simply as [Juk][5].

### Install Juk on Linux

As long as your Linux distribution offers KDE packages, you can install Juk using your package manager.

On Fedora, Mageia, and similar:


```
`$ sudo dnf install juk`
```

On Elementary, Linux Mint, and other Debian-based distributions:


```
`$ sudo apt install juk`
```

### Using Juk

When you first launch Juk, you're asked what directory or directories you want to use as the source of your music collection. Select the folders you want Juk to look in for music, and optionally exclude any subdirectories you want Juk to ignore.

![Adding music to Juk][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

Depending on how much music you have, it may take a few moments for Juk to parse the filesystem and metadata. Once it has, the usual Juk window appears with all of your music in a central collection called **Collection List**.

![Juk music player][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

In the top search bar, you can search for any string in any field. Double-click on the song to begin playback.

Juk defaults to continuous play, meaning that after it's finished playing your selection, it proceeds to the next song in the Collection List, even if you've filtered your list down to just one song. This keeps the music going no matter what, like a true Jukebox.

Personally, I prefer to listen to complete albums, with just enough of a break in between to meander into the kitchen to top off my coffee, so I use playlists.

### Playlists in Juk

A playlist in Juk can contain anything in your Collection List. Juk plays through the playlist once, and then stops.

To create a playlist, right-click in the left playlist column and select **New** from the contextual menu that appears. You can create an empty playlist or a playlist from a specific folder on your hard drive.

![Creating a new playlist][9]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Automatic playlists

You can also create a special playlist bound to a specific search, which is useful for artists whose music you frequently purchase and add to your collection. With a search playlist, their new music gets added to their playlist without your manual intervention.

### Tagging

Let's face it, music players are pretty easy to come by, and they mostly all do the same thing. Juk, however, adds an important feature. It gives you the ability to modify metadata tags.

![Metadata editor][10]

(Seth Kenlon, [CC BY-SA 4.0][7])

A lot of music is tagged inconsistently, incompletely, or not at all, so it's a luxury to be able to correct them as you discover them when they come up in the play queue.

There's also a tag guesser feature, which tries to parse filenames and tag songs accordingly.

### The obvious choice

Juk is the easy and obvious choice when you're looking for a music player on KDE. There are, of course, lots of other very good choices, as Opensource.com's resident audiophile [Chris Hermansen][11] details in his [3 open source music players][12] article, but sometimes you just want to use whatever comes easiest to you. Juk is both intuitive to use and excellent at what it does. How lucky it is that it's the default player on the KDE Plasma Desktop.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/listen-music-linux-juk-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/c-d-x-pdx_a_82obo-unsplash.jpg?itok=2txWDP31 (Headphones on a yellow backdrop)
[2]: https://opensource.com/article/21/12/kdenlive-linux-creative-app
[3]: https://opensource.com/life/16/5/how-use-digikam-photo-management
[4]: https://opensource.com/article/21/12/krita-digital-paint
[5]: https://juk.kde.org/
[6]: https://opensource.com/sites/default/files/juk-import.jpg (Adding music to Juk)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/juk-player.jpg (Juk music player)
[9]: https://opensource.com/sites/default/files/juk-playlist-new.jpg (Creating a new playlist)
[10]: https://opensource.com/sites/default/files/juk-tagger.png (Metadata editor)
[11]: https://opensource.com/users/clhermansen
[12]: https://opensource.com/article/17/1/open-source-music-players
