[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (2 new apps for music tweakers on Fedora Workstation)
[#]: via: (https://fedoramagazine.org/2-new-apps-for-music-tweakers-on-fedora-workstation/)
[#]: author: (Justin W. Flory https://fedoramagazine.org/author/jflory7/)

2 new apps for music tweakers on Fedora Workstation
======

![][1]

Linux operating systems are great for making unique customizations and tweaks to make your computer work better for you. For example, the [i3 window manager][2] encourages users to think about the different components and pieces that make up the modern Linux desktop.

Fedora has two new packages of interest for music tweakers: **mpris-scrobbler** and **playerctl**. _mpris-scrobbler_ [tracks your music listening history][3] on a music-tracking service like Last.fm and/or ListenBrainz. _playerctl_ is a command-line [music player controller][4].

## _mpris-scrobbler_ records your music listening trends

_mpris-scrobbler_ is a CLI application to submit play history of your music to a service like [Last.fm][5], [Libre.fm][6], or [ListenBrainz][7]. It listens on the [MPRIS D-Bus interface][8] to detect what’s playing. It connects with several different music clients like spotify-client, [vlc][9], audacious, bmp, [cmus][10], and others.

![Last.fm last week in music report. Generated from user-submitted listening history.][11]

### Install and configure _mpris-scrobbler_

_mpris-scrobbler_ is available for Fedora 28 or later, as well as the EPEL 7 repositories. Run the following command in a terminal to install it:

```
sudo dnf install mpris-scrobbler
```

Once it is installed, use _systemctl_ to start and enable the service. The following command starts _mpris-scrobbler_ and always starts it after a system reboot:

```
systemctl --user enable --now mpris-scrobbler.service
```

### Submit plays to ListenBrainz

This article explains how to link _mpris-scrobbler_ with a ListenBrainz account. To use Last.fm or Libre.fm, see the [upstream documentation][12].

To submit plays to a ListenBrainz server, you need a ListenBrainz API token. If you have an account, get the token from your [profile settings page][13]. When you have a token, run this command to authenticate with your ListenBrainz API token:

```
$ mpris-scrobbler-signon token listenbrainz
Token for listenbrainz.org:
```

Finally, test it by playing a song in your preferred music client on Fedora. The songs you play appear on your ListenBrainz profile.

![Basic statistics and play history from a user profile on ListenBrainz. The current track is playing on a Fedora Workstation laptop with mpris-scrobbler.][14]

## _playerctl_ controls your music playback

_playerctl_ is a CLI tool to control any music player implementing the MPRIS D-Bus interface. You can easily bind it to keyboard shortcuts or media hotkeys. Here’s how to install it, use it in the command line, and create key bindings for the i3 window manager.

### Install and use _playerctl_

_playerctl_ is available for Fedora 28 or later. Run the following command in a terminal to install it:

```
sudo dnf install playerctl
```

Now that it’s installed, you can use it right away. Open your preferred music player on Fedora. Next, try the following commands to control playback from a terminal.

To play or pause the currently playing track:

```
playerctl play-pause
```

If you want to skip to the next track:

```
playerctl next
```

For a list of all running players:

```
playerctl -l
```

To play or pause what’s currently playing, only on the spotify-client app:

```
playerctl -p spotify play-pause
```

### Create _playerctl_ key bindings in i3wm

Do you use a window manager like the [i3 window manager?][2] Try using _playerctl_ for key bindings. You can bind different commands to different key shortcuts, like the play/pause buttons on your keyboard. Look at the following [i3wm config excerpt][15] to see how:

```
# Media player controls
bindsym XF86AudioPlay exec "playerctl play-pause"
bindsym XF86AudioNext exec "playerctl next"
bindsym XF86AudioPrev exec "playerctl previous"
```

## Try it out with your favorite music players

Need to know more about customizing the music listening experience on Fedora? The Fedora Magazine has you covered. Check out these five cool music players on Fedora:

> [5 cool music player apps][16]

Bring order to your music library chaos by sorting and organizing it with MusicBrainz Picard:

> [Picard brings order to your music library][17]

* * *

_Photo by _[ _Frank Septillion_][18]_ on _[_Unsplash_][19]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/2-new-apps-for-music-tweakers-on-fedora-workstation/

作者：[Justin W. Flory][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jflory7/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/2-music-tweak-apps-816x345.jpg
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://github.com/mariusor/mpris-scrobbler
[4]: https://github.com/acrisci/playerctl
[5]: https://www.last.fm/
[6]: https://libre.fm/
[7]: https://listenbrainz.org/
[8]: https://specifications.freedesktop.org/mpris-spec/latest/
[9]: https://www.videolan.org/vlc/
[10]: https://cmus.github.io/
[11]: https://fedoramagazine.org/wp-content/uploads/2019/02/Screenshot_2019-04-13-jflory7%E2%80%99s-week-in-music2-1024x500.png
[12]: https://github.com/mariusor/mpris-scrobbler#authenticate-to-the-service
[13]: https://listenbrainz.org/profile/
[14]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot_2019-04-13-User-jflory-ListenBrainz.png
[15]: https://github.com/jwflory/swiss-army/blob/ba6ac0c71855e33e3caa1ee1fe51c05d2df0529d/roles/apps/i3wm/files/config#L207-L210
[16]: https://fedoramagazine.org/5-cool-music-player-apps/
[17]: https://fedoramagazine.org/picard-brings-order-music-library/
[18]: https://unsplash.com/photos/Qrspubmx6kE?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[19]: https://unsplash.com/search/photos/music?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
