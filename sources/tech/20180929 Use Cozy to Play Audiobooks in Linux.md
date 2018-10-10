Use Cozy to Play Audiobooks in Linux
======
**We review Cozy, an audiobook player for Linux. Read to find out if it’s worth to install Cozy on your Linux system or not.**

![Audiobook player for Linux][1]

Audiobooks are a great way to consume literature. Many people who don’t have time to read, choose to listen. Most people, myself included, just use a regular media player like VLC or [MPV][2] for listening to audiobooks on Linux.

Today, we will look at a Linux application built solely for listening to audiobooks.

![][3]Cozy Audiobook Player

### Cozy Audiobook Player for Linux

The [Cozy Audiobook Player][4] is created by [Julian Geywitz][5] from Germany. It is built using both Python and GTK+ 3. According to the site, Julian wrote Cozy on Fedora and optimized it for [elementary OS][6].

The player borrows its layout from iTunes. The player controls are placed along the top of the application The library takes up the rest. You can sort all of your audiobooks based on the title, author and reader, and search very quickly.

![][7]Initial setup

When you first launch [Cozy][8], you are given the option to choose where you will store your audiobook files. Cozy will keep an eye on that folder and update your library as you add new audiobooks. You can also set it up to use an external or network drive.

#### Features of Cozy

Here is a full list of the features that [Cozy][9] has to offer.

  * Import all your audiobooks into Cozy to browse them comfortably
  * Sort your audiobooks by author, reader & title
  * Remembers your playback position
  * Sleep timer
  * Playback speed control
  * Search your audiobook library
  * Add multiple storage locations
  * Drag & Drop to import new audio books
  * Support for DRM free mp3, m4a (aac, ALAC, …), flac, ogg, wav files
  * Mpris integration (Media keys & playback info for the desktop environment)
  * Developed on Fedora and tested under elementaryOS



#### Experiencing Cozy

![][10]Audiobook library

At first, I was excited to try our Cozy because I like to listen to audiobooks. However, I ran into a couple of issues. There is no way to edit the information of an audiobook. For example, I downloaded a couple audiobooks from [LibriVox][11] to test it. All three audiobooks were listed under “Unknown” for the reader. There was nothing to edit or change the audiobook info. I guess you could edit all of the files, but that would take quite a bit of time.

When I listen to an audiobook, I like to know what track is currently playing. Cozy only has a single progress bar for the whole audiobook. I know that Cozy is designed to remember where you left off in an audiobook, but if I was going to continue to listen to the audiobook on my phone, I would like to know what track I am on.

![][12]Settings

There was also an option in the setting menu to turn on a dark theme. As you can see in the screenshots, the application has a black theme, to begin with. I turned the option on, but nothing happened. There isn’t even an option to add a theme or change any of the colors. Overall, the application had a feeling of not being finished.

#### Installing Cozy on Linux

If you would like to install Cozy, you have several options for different distros.

##### Ubuntu, Debian, openSUSE, Fedora

Julian used the [openSUSE Build Service][13] to create custom repos for Ubuntu, Debian, openSUSE and Fedora. Each one only takes a couple terminal commands to install.

##### Install Cozy using Flatpak on any Linux distribution (including Ubuntu)

If your [distro supports Flatpak][14], you can install Cozy using the following commands:

```
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub com.github.geigi.cozy
```

##### Install Cozy on elementary OS

If you have elementary OS installed, you can install Cozy from the [built-in App Store][15].

##### Install Cozy on Arch Linux

Cozy is available in the [Arch User Repository][16]. All you have to do is search for `cozy-audiobooks`.

### Where to find free Audiobooks?

In order to try out this application, you will need to find some audiobooks to listen to. My favorite site for audiobooks is [LibriVox][11]. Since [LibriVox][17] depends on volunteers to record audiobooks, the quality can vary. However, there are a number of very talented readers.

Here is a list of free audiobook sources:

+ [Open Culture][20]
+ [Project Gutenberg][21]
+ [Digitalbook.io][22]
+ [FreeClassicAudioBooks.com][23]
+ [MindWebs][24]
+ [Scribl][25]


### Final Thoughts on Cozy

For now, I think I’ll stick with my preferred audiobook software (VLC) for now. Cozy just doesn’t add anything. I won’t call it a [must-have application for Linux][18] just yet. There is no compelling reason for me to switch. Maybe, I’ll revisit it again in the future, maybe when it hits 1.0.

Take Cozy for a spin. You might come to a different conclusion.

Have you ever used Cozy? If not, what is your favorite audiobook player? What is your favorite source for free audiobooks? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][19].

--------------------------------------------------------------------------------

via: https://itsfoss.com/cozy-audiobook-player/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:  https://itsfoss.com/author/john/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/audiobook-player-linux.png
[2]: https://itsfoss.com/mpv-video-player/
[3]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/cozy3.jpg
[4]: https://cozy.geigi.de/
[5]: https://github.com/geigi
[6]: https://elementary.io/
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/cozy1.jpg
[8]: https://github.com/geigi/cozy
[9]: https://www.patreon.com/geigi
[10]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/cozy2.jpg
[11]: https://librivox.org/
[12]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/cozy4.jpg
[13]: https://software.opensuse.org//download.html?project=home%3Ageigi&package=com.github.geigi.cozy
[14]: https://itsfoss.com/flatpak-guide/
[15]: https://elementary.io/store/
[16]: https://aur.archlinux.org/
[17]: https://archive.org/details/librivoxaudio
[18]: https://itsfoss.com/essential-linux-applications/
[19]: http://reddit.com/r/linuxusersgroup
[20]: http://www.openculture.com/freeaudiobooks
[21]: http://www.gutenberg.org/browse/categories/1
[22]: https://www.digitalbook.io/
[23]: http://freeclassicaudiobooks.com/
[24]: https://archive.org/details/MindWebs_201410
[25]: https://scribl.com/
