[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nuvola: Desktop Music Player for Streaming Services)
[#]: via: (https://itsfoss.com/nuvola-music-player)
[#]: author: (Atharva Lele https://itsfoss.com/author/atharva/)

Nuvola: Desktop Music Player for Streaming Services
======

[Nuvola][1] is not like your usual music players. It’s different because it allows you to play a number of streaming services in a desktop music player.

Nuvola provides a runtime called [Nuvola Apps Runtime][2] which runs web apps. This is why Nuvola can support a host of streaming services. Some of the major players it supports are:

  * Spotify
  * Google Play Music
  * YouTube, YouTube Music
  * [Pandora][3]
  * [SoundCloud][4]
  * and many many more.



You can find the full list [here][1] in the Music streaming services section. Apple Music is not supported, if you were wondering.

Why would you use a streaming music service in a different desktop player when you can run it in a web browser? The advantage with Nuvola is that it provides tight integration with many [desktop environments][5].

Ideally it should work with all DEs, but the officially supported ones are GNOME, Unity, and Pantheon (elementary OS).

### Features of Nuvola Music Player

Let’s see some of the main features of the open source project Nuvola:

  * Supports a wide variety of music streaming services
  * Desktop integration with GNOME, Unity, and Pantheon.
  * Keyboard shortcuts with the ability to customize them
  * Support for keyboard’s multimedia keys (paid feature)
  * Background play with notifications
  * [GNOME Media Player][6] extension support
  * App Tray indicator
  * Dark and Light themes
  * Enable or disable features
  * Password Manager for web services
  * Remote control over internet (paid feature)
  * Available for a lot of distros ([Flatpak][7] packages)



Complete list of features is available [here][8].

### How to install Nuvola on Ubuntu & other Linux distributions

Installing Nuvola consists of a few more steps than simply adding a PPA and then installing the software. Since it is based on [Flatpak][7], you have to set up Flatpak first and then you can install Nuvola.

[Enable Flatpak Support][9]

The steps are pretty simple. You can follow the guide [here][10] if you want to install using the GUI, however I prefer terminal commands since they’re easier and faster.

**Warning: If already installed, remove the older version of Nuvola (Click to expand)**

If you have ever installed Nuvola before, you need to uninstall it to avoid issues. Run these commands in the terminal to do so.

```
sudo apt remove nuvolaplayer*
```

```
rm -rf ~/.cache/nuvolaplayer3 ~/.local/share/nuvolaplayer ~/.config/nuvolaplayer3 ~/.local/share/applications/nuvolaplayer3*
```

Once you have made sure that your system has Flatpak, you can install Nuvola using this command:

```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists nuvola https://dl.tiliado.eu/flatpak/nuvola.flatpakrepo
```

This is an optional step but I recommend you install this since the service allows you to commonly configure settings like shortcuts for each of the streaming service that you might use.

```
flatpak install nuvola eu.tiliado.Nuvola
```

Nuvola supports 29 streaming services. To get them, you need to add those services individually. You can find all the supported music services are available on this [page][10].

For the purpose of this tutorial, I’m going to go with [YouTube Music][11].

```
flatpak install nuvola eu.tiliado.NuvolaAppYoutubeMusic
```

After this, you should have the app installed and should be able to see the icon if you search for it.

![Nuvola App specific icons][12]

Clicking on the icon will pop-up the first time setup. You’ll have to accept the Privacy Policy and then continue.

![Terms and Conditions page][13]

After accepting terms and conditions, you should launch into the web app of the respective streaming service, YouTube Music in this case.

![YouTube Music web app running on Nuvola Runtime][14]

In case of installation on other distributions, specific guidelines are available on the [Nuvola website][15].

### My experience with Nuvola Music Player

Initially I thought that it wouldn’t be too different than simply running the web app in [Firefox][16], since many desktop environments like KDE support media controls and shortcuts for media playing in Firefox.

However, this isn’t the case with many other desktops environments and that’s where Nuvola comes in handy. Often, it’s also faster to access than loading the website on the browser.

Once loaded, it behaves pretty much like a normal web app with the benefit of keyboard shortcuts. Speaking of shortcuts, you should check out the list of must know [Ubuntu shortcuts][17].

![Viewing an Artist’s page][18]

Integration with the DE comes in handy when you quickly want to change a song or play/pause your music without leaving your current application. Nuvola gives you access in GNOME notifications as well as provides an app tray icon.

  * ![Notification music controls][19]

  * ![App tray music controls][20]




Keyboard shortcuts work well, globally as well as in-app. You get a notification when the song changes. Whether you do it yourself or it automatically switches to the next song.

![][21]

By default, very few keyboard shortcuts are provided. However you can enable them for almost everything you can do with the app. For example I set the song change shortcuts to Ctrl + Arrow keys as you can see in the screenshot.

![Keyboard Shortcuts][22]

All in all, it works pretty well and it’s fast and responsive. Definitely more so than your usual Snap app.

**Some criticism**

Some thing that did not please me as much was the installation size. Since it requires a browser back-end and GNOME integration it essentially installs a browser and necessary GNOME libraries for Flatpak, so that results in having to install almost 350MB in dependencies.

After that, you install individual apps. The individual apps themselves are not heavy at all. But if you just use one streaming service, having a 300+ MB installation might not be ideal if you’re concerned about disk space.

Nuvola also does not support local music, at least as far as I could find.

**Conclusion**

Hope this article helped you to know more about Nuvola Music Player and its features. If you like such different applications, why not take a look at some of the [lesser known music players for Linux][23]?

As always, if you have any suggestions or questions, I look forward to reading your comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nuvola-music-player

作者：[Atharva Lele][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/atharva/
[b]: https://github.com/lujun9972
[1]: https://nuvola.tiliado.eu/
[2]: https://nuvola.tiliado.eu/#fn:1
[3]: https://itsfoss.com/install-pandora-linux-client/
[4]: https://itsfoss.com/install-soundcloud-linux/
[5]: https://itsfoss.com/best-linux-desktop-environments/
[6]: https://extensions.gnome.org/extension/55/media-player-indicator/
[7]: https://flatpak.org/
[8]: http://tiliado.github.io/nuvolaplayer/documentation/4/explore.html
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://nuvola.tiliado.eu/nuvola/ubuntu/bionic/
[11]: https://nuvola.tiliado.eu/app/youtube_music/ubuntu/bionic/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_youtube_music_icon.png?resize=800%2C450&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_eula.png?resize=800%2C450&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_youtube_music.png?resize=800%2C450&ssl=1
[15]: https://nuvola.tiliado.eu/index/
[16]: https://itsfoss.com/why-firefox/
[17]: https://itsfoss.com/ubuntu-shortcuts/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_web_player.png?resize=800%2C449&ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_music_controls.png?fit=800%2C450&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_web_player2.png?fit=800%2C450&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_song_change_notification-e1553077619208.png?ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nuvola_shortcuts.png?resize=800%2C450&ssl=1
[23]: https://itsfoss.com/lesser-known-music-players-linux/
