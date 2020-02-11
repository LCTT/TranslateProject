[#]: collector: (lujun9972)
[#]: translator: (chai-yuan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Playing Music on your Fedora Terminal with MPD and ncmpcpp)
[#]: via: (https://fedoramagazine.org/playing-music-on-your-fedora-terminal-with-mpd-and-ncmpcpp/)
[#]: author: (Carmine Zaccagnino https://fedoramagazine.org/author/carzacc/)

Playing Music on your Fedora Terminal with MPD and ncmpcpp
======

![][1]

MPD, as the name implies, is a Music Playing Daemon. It can play music but, being a daemon, any piece of software can interface with it and play sounds, including some CLI clients.

One of them is called _ncmpcpp_, which is an improvement over the pre-existing _ncmpc_ tool. The name change doesn’t have much to do with the language they’re written in: they’re both C++, but _ncmpcpp_ is called that because it’s the _NCurses Music Playing Client_ _Plus Plus_.

### Installing MPD and ncmpcpp

The _ncmpmpcc_ client can be installed from the official Fedora repositories with DNF directly with

```
$ sudo dnf install ncmpcpp
```

On the other hand, MPD has to be installed from the RPMFusion _free_ repositories, which you can enable, [as per the official installation instructions][2], by running

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

and then you can install MPD by running

```
$ sudo dnf install mpd
```

### Configuring and Starting MPD

The most painless way to set up MPD is to run it as a regular user. The default is to run it as the dedicated _mpd_ user, but that causes all sorts of issues with permissions.

Before we can run it, we need to create a local config file that will allow it to run as a regular user.

To do that, create a subdirectory called _mpd_ in _~/.config_:

```
$ mkdir ~/.config/mpd
```

copy the default config file into this directory:

```
$ cp /etc/mpd.conf ~/.config/mpd
```

and then edit it with a text editor like _vim_, _nano_ or _gedit_:

```
$ nano ~/.config/mpd/mpd.conf
```

I recommend you read through all of it to check if there’s anything you need to do, but for most setups you can delete everything and just leave the following:

```
db_file "~/.config/mpd/mpd.db"
log_file "syslog"
```

At this point you should be able to just run

```
$ mpd
```

with no errors, which will start the MPD daemon in the background.

### Using ncmpcpp

Simply run

```
$ ncmpcpp
```

and you’ll see a ncurses-powered graphical user interface in your terminal.

Press _4_ and you should see your local music library, be able to change the selection using the arrow keys and press _Enter_ to play a song.

Doing this multiple times will create a _playlist_, which allows you to move to the next track using the _&gt;_ button (not the right arrow, the _&gt;_ closing angle bracket character) and go back to the previous track with _&lt;_. The + and – buttons increase and decrease volume. The _Q_ button quits ncmpcpp but it doesn’t stop the music. You can play and pause with _P_.

You can see the current playlist by pressing the _1_ button (this is the default view). From this view you can press _i_ to look at the information (tags) about the current song. You can change the tags of the currently playing (or paused) song by pressing _6_.

Pressing the \ button will add (or remove) an informative panel at the top of the view. In the top left, you should see something that looks like this:

```
[------]
```

Pressing the _r_, _z_, _y_, _R_, _x_ buttons will respectively toggle the _repeat_, _random_, _single_, _consume_ and _crossfade_ playback modes and will replace one of the _–_ characters in that little indicator to the initial of the selected mode.

Pressing the _F1_ button will display some help text, which contains a list of keybindings, so there’s no need to write a complete list here. So now go on, be geeky, and play all your music from your terminal!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/playing-music-on-your-fedora-terminal-with-mpd-and-ncmpcpp/

作者：[Carmine Zaccagnino][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/carzacc/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/play_music_mpd-816x346.png
[2]: https://rpmfusion.org/Configuration
