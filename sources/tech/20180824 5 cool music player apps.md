translating---geekpi

5 cool music player apps
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/5-cool-music-apps-816x345.jpg)
Do you like music? Then Fedora may have just what you’re looking for. This article introduces different music player apps that run on Fedora. You’re covered whether you have an extensive music library, a small one, or none at all. Here are four graphical application and one terminal-based music player that will have you jamming.

### Quod Libet

Quod Libet is a complete manager for your large audio library. If you have an extensive audio library that you would like not just listen to, but also manage, Quod Libet might a be a good choice for you.

![][1]

Quod Libet can import music from multiple locations on your disk, and allows you to edit tags of the audio files — so everything is under your control. As a bonus, there are various plugins available for anything from a simple equalizer to a [last.fm][2] sync. You can also search and play music directly from [Soundcloud][3].

Quod Libet works great on HiDPI screens, and is available as an RPM in Fedora or on [Flathub][4] in case you run [Silverblue][5]. Install it using Gnome Software or the command line:
```
$ sudo dnf install quodlibet

```

### Audacious

If you like a simple music player that could even look like the legendary Winamp, Audacious might be a good choice for you.

![][6]

Audacious probably won’t manage all your music at once, but it works great if you like to organize your music as files. You can also export and import playlists without reorganizing the music files themselves.

As a bonus, you can make it look likeWinamp. To make it look the same as on the screenshot above, go to Settings / Appearance, select Winamp Classic Interface at the top, and choose the Refugee skin right below. And Bob’s your uncle!

Audacious is available as an RPM in Fedora, and can be installed using the Gnome Software app or the following command on the terminal:
```
$ sudo dnf install audacious

```

### Lollypop

Lollypop is a music player that provides great integration with GNOME. If you enjoy how GNOME looks, and would like a music player that’s nicely integrated, Lollypop could be for you.

![][7]

Apart from nice visual integration with the GNOME Shell, it woks nicely on HiDPI screens, and supports a dark theme.

As a bonus, Lollypop has an integrated cover art downloader, and a so-called Party Mode (the note button at the top-right corner) that selects and plays music automatically for you. It also integrates with online services such as [last.fm][2] or [libre.fm][8].

Available as both an RPM in Fedora or a [Flathub][4] for your [Silverblue][5] workstation, install it using the Gnome Software app or using the terminal:
```
$ sudo dnf install lollypop

```

### Gradio

What if you don’t own any music, but still like to listen to it? Or you just simply love radio? Then Gradio is here for you.

![][9]

Gradio is a simple radio player that allows you to search and play internet radio stations. You can find them by country, language, or simply using search. As a bonus, it’s visually integrated into GNOME Shell, works great with HiDPI screens, and has an option for a dark theme.

Gradio is available on [Flathub][4] which works with both Fedora Workstation and [Silverblue][5]. Install it using the Gnome Software app.

### sox

Do you like using the terminal instead, and listening to some music while you work? You don’t have to leave the terminal thanks to sox.

![][10]

sox is a very simple, terminal-based music player. All you need to do is to run a command such as:
```
$ play file.mp3

```

…and sox will play it for you. Apart from individual audio files, sox also supports playlists in the m3u format.

As a bonus, because sox is a terminal-based application, you can run it over ssh. Do you have a home server with speakers attached to it? Or do you want to play music from a different computer? Try using it together with [tmux][11], so you can keep listening even when the session closes.

sox is available in Fedora as an RPM. Install it by running:
```
$ sudo dnf install sox

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-music-player-apps/

作者：[Adam Šamalík][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/asamalik/
[1]:https://fedoramagazine.org/wp-content/uploads/2018/08/qodlibet-300x217.png
[2]:https://last.fm
[3]:https://soundcloud.com/
[4]:https://flathub.org/home
[5]:https://teamsilverblue.org/
[6]:https://fedoramagazine.org/wp-content/uploads/2018/08/audacious-300x136.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/08/lollypop-300x172.png
[8]:https://libre.fm
[9]:https://fedoramagazine.org/wp-content/uploads/2018/08/gradio.png
[10]:https://fedoramagazine.org/wp-content/uploads/2018/08/sox-300x179.png
[11]:https://fedoramagazine.org/use-tmux-more-powerful-terminal/
