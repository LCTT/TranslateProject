[#]: subject: "Sunamu: Display Lyrics for Currently Playing Music on the Desktop in Linux"
[#]: via: "https://itsfoss.com/sunamu-music-widget/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Sunamu: Display Lyrics for Currently Playing Music on the Desktop in Linux
======

Being an eye candy **music widget** (or controller).

That’s the only focus of Sunamu, and it does its job pretty well.

Sunamu is an intriguing tool. It is not a music player but lets you display the music you’re playing and control it.

I’m not a fan of having a floating widget on my primary workspace, but Sunamu’s minimal yet elegant approach changed my mind!

So, I will walk you through its features, installation, configuration tweaks, and my experience with it.

### Sunamu: An Open-Source Music Controller

![playing music with sunamu][1]

As you can notice in the screenshot above, it looks like a pretty nice way to display the music being played, with the lyrics, while having the basic controls.

You can play/pause, go to the next/previous track, shuffle, and enable a loop.

Sunamu supports a wide range of audio platforms, including Spotify. It also detects music from your local collection, supporting some of the [best music players][2] available for Linux.

Additionally, it supports Windows. So, if you are streaming something through the Microsoft Edge browser on Windows, it should work well.

You can check the [compatibility list][3] on its GitHub page to learn more about the supported players and browsers.

Fortunately, you do not have to be limited by what it offers by default. It provides an easy way to tweak the config file (learn more about it on its [GitHub page][4]). This makes it possible for newbies to tweak some settings and have fun.

I’ll mention a few tips about it in the later section of this article.

### Features of Sunamu

![Sunamu on empty workspace][5]

Sunamu comes with a set of promising features, and some of them are:

* Detects and display the song that is currently playing.
* Fetch color schemes from the album art and use the same color palette for better visuals.
* Customizable through its config file.
* Integrates well with Discord.
* Consumes minimal system resources.

### Install Sunamu on Linux

![Disable lyrics in sunamu][6]

It provides AppImage, deb, and rpm packages for easy installation across various Linux distributions. I used AppImage for testing, and it worked like a charm.

You can also benefit from our guide on [how to use AppImage][7] or [install deb packages][8] and [rpm packages][9], if you are new to Linux.

Interestingly, Sunamu is one of the few open-source music tools that provide direct support for ARM-based machines.

Visit their [GitHub releases page][10] to download packages or build it from the source.

**Let me show you a quick installation method** for a Debian-based distro via the terminal. Just follow the given instructions, and you’ll be good to go:

First, let’s download the .deb package using wget command as follows:

```
wget https://github.com/NyaomiDEV/Sunamu/releases/download/v2.0.0/sunamu_2.0.0_amd64.deb
```

Once you are done downloading the package, use the given command for installation:

```
sudo dpkg -i sunamu_2.0.0_amd64.deb
```

![install sunamu in ubuntu][11]

### Tip: Tweak the Configuration file

By default, Sunamu won’t fetch colors from the album art but show the lyrics for each song. And like many others, I like to avoid reading lyrics.

Config file of Sunamu is usually located at **~/.config/sunamu/config.json5**.

To open the Sunamu config file, type the given command:

```
nano ~/.config/sunamu/config.json5
```

Make changes in the electron section as given below (to enable colors and disable lyrics):

```
electron: {
      type: 'electron',
      widgetMode: true,
      colors: true,
      font: '',
      theme: 'default',
      showLyrics: false,
    }
```

Here’s what the final config file should look like:

![modify config file of sunamu][12]

### Final Thoughts

Unless you are someone who avoids electron-based apps, Sunamu is a good enough app to enhance your music experience on Linux. After, [Amberol][13], this is the second Music-related app I have liked recently.

If you try it, don’t forget to share your experience in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/sunamu-music-widget/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/playing-music-with-sunamu.png
[2]: https://itsfoss.com/best-music-players-linux/
[3]: https://github.com/NyaomiDEV/Sunamu/blob/master/COMPATIBILITY.md
[4]: https://github.com/NyaomiDEV/Sunamu/blob/master/assets/config.json5
[5]: https://itsfoss.com/wp-content/uploads/2022/08/song-with-no-lyrics-min.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/playing-music-with-sunamu-inclusing-lyrics-min1.png
[7]: https://itsfoss.com/use-appimage-linux/
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://itsfoss.com/install-rpm-files-fedora/
[10]: https://github.com/NyaomiDEV/Sunamu/releases/tag/v2.0.0
[11]: https://itsfoss.com/wp-content/uploads/2022/08/install-sunamu-in-ubuntu.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/modified-config-file-of-sunamu.png
[13]: https://itsfoss.com/amberol-music-player/
