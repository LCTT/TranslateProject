[#]: subject: "Amberol is a Stunning Looking Music Player for Linux That Just Plays Music and Nothing Else"
[#]: via: "https://itsfoss.com/amberol-music-player/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Amberol is a Stunning Looking Music Player for Linux That Just Plays Music and Nothing Else
======
Though the world of music is dominated by streaming services, it has not discouraged developers from creating music players for desktop computers.

Recently, I came across a beautiful looking new music player for the Linux desktop. It’s called Amberol and I was awestruck by its beauty.

![amberol music player interface][1]

Looks good, no? Let’s take a closer look at it.

### Amberol, the cute looking music player for Linux

Looking good is one of the two (or few) things it does. The other thing is playing music.

And that’s about it. [Amberol][2] doesn’t have additional fancy (and useful) features like album art generation, metadata editing, lyrics display or playlists and library management.

It’s not like these features will be added in future releases. Amberol just wants to play music. That’s it.

#### The stunning UI

Amberol is written in Rust and GTK like most new GNOME applications.

It has an adaptive UI that changes color based on the album color you are playing. The gradient effect gives it a modern, sleek look that would surely be part of your Linux ricing screenshots.

![amberol music player][3]

Since the UI does not have the traditional handlebar and menu, it gives the application a unified look.

#### Playlists

It generates a playlist automatically from the files present in the folder you add. It is displayed in the lefthand sidebar.

![amberol playlist][4]

You can see how long the entire playlist will play the music in the top left corner. Clicking on the ‘correct sign’ allows you to select songs and remove them from the playlist.

If you want, you can hide the playlist sidebar.

![amberol without playlist][5]

#### Music playing options

You can see the progress of the songs on the interface. The player integrates well with the media control buttons on the keyboard. You can play/pause and change tracks with the dedicated media keys (if you have it on your system).

Amberol does give you a few more options for playing the music. You can turn on the shuffle to play music in random order. You may also put a song on repeat and keep on playing it till you get bored of it.

![amberol music playing options][6]

The handlebar menu at the bottom gives you the option to add a file or folder and show available keyboard shortcuts.

![amberol keyboard shortcuts][7]

You may also disable the UI color changing to match the album art from here.

### Installing Amberol on Linux

Amberol is [available as Flatpak][8]. Please ensure that [your system has Flatpak support enabled][9].

To install Amberol, open a terminal and use the following command:

```
flatpak install flathub io.bassi.Amberol
```

Once installed search for the application in the menu and start from here.

On the first run, it asks you to add music files or folders. You can also drag and drop files.

![amberol first run][10]

### Conclusion

Personally, I prefer streaming services because I don’t have a good collection of local music. But I know there are people who have/had a huge collection of CDs that are now saved on the hard disk.

Amberol is a beautiful-looking application and it is good enough for playing local music. The main attraction is the adaptive UI based on the album art.

I let you play with it and share your experience in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/amberol-music-player/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-music-player-interface-800x693.png
[2]: https://apps.gnome.org/app/io.bassi.Amberol/
[3]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-music-player-800x580.png
[4]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-playlist-800x548.png
[5]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-without-playlist-800x693.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-music-playing-options-800x548.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/Amberol-keyboard-shortcuts-800x528.png
[8]: https://flathub.org/apps/details/io.bassi.Amberol
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://itsfoss.com/wp-content/uploads/2022/06/amberol-first-run-800x693.png
