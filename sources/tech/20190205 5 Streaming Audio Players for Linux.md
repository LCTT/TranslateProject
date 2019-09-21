[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Streaming Audio Players for Linux)
[#]: via: (https://www.linux.com/blog/2019/2/5-streaming-audio-players-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

5 Streaming Audio Players for Linux
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/music-main.png?itok=bTxfvadR)

As I work, throughout the day, music is always playing in the background. Most often, that music is in the form of vinyl spinning on a turntable. But when I’m not in purist mode, I’ll opt to listen to audio by way of a streaming app. Naturally, I’m on the Linux platform, so the only tools I have at my disposal are those that play well on my operating system of choice. Fortunately, plenty of options exist for those who want to stream audio to their Linux desktops.

In fact, Linux offers a number of solid offerings for music streaming, and I’ll highlight five of my favorite tools for this task. A word of warning, not all of these players are open source. But if you’re okay running a proprietary app on your open source desktop, you have some really powerful options. Let’s take a look at what’s available.

### Spotify

Spotify for Linux isn’t some dumb-downed, half-baked app that crashes every other time you open it, and doesn’t offer the full-range of features found on the macOS and Windows equivalent. In fact, the Linux version of Spotify is exactly the same as you’ll find on other platforms. With the Spotify streaming client you can listen to music and podcasts, create playlists, discover new artists, and so much more. And the Spotify interface (Figure 1) is quite easy to navigate and use.

![Spotify][2]

Figure 1: The Spotify interface makes it easy to find new music and old favorites.

[Used with permission][3]

You can install Spotify either using snap (with the command sudo snap install spotify), or from the official repository, with the following commands:

  * sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

  * sudo echo deb <http://repository.spotify.com> stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  * sudo apt-get update

  * sudo apt-get install spotify-client




Once installed, you’ll want to log into your Spotify account, so you can start streaming all of the great music to help motivate you to get your work done. If you have Spotify installed on other devices (and logged into the same account), you can dictate to which device the music should stream (by clicking the Devices Available icon near the bottom right corner of the Spotify window).

### Clementine

Clementine one of the best music players available to the Linux platform. Clementine not only allows user to play locally stored music, but to connect to numerous streaming audio services, such as:

  * Amazon Cloud Drive

  * Box

  * Dropbox

  * Icecast

  * Jamendo

  * Magnatune

  * RockRadio.com

  * Radiotunes.com

  * SomaFM

  * SoundCloud

  * Spotify

  * Subsonic

  * Vk.com

  * Or internet radio streams




There are two caveats to using Clementine. The first is you must be using the most recent version (as the build available in some repositories is out of date and won’t install the necessary streaming plugins). Second, even with the most recent build, some streaming services won’t function as expected. For example, with Spotify, you’ll only have available to you the Top Tracks (and not your playlist … or the ability to search for songs).

With Clementine Internet radio streaming, you’ll find musicians and bands you’ve never heard of (Figure 2), and plenty of them to tune into.

![Clementine][5]

Figure 2: Clementine Internet radio is a great way to find new music.

[Used with permission][3]

### Odio

Odio is a cross-platform, proprietary app (available for Linux, MacOS, and Windows) that allows you to stream internet music stations of all genres. Radio stations are curated from [www.radio-browser.info][6] and the app itself does an incredible job of presenting the streams for you (Figure 3).


![Odio][8]

Figure 3: The Odio interface is one of the best you’ll find.

[Used with permission][3]

Odio makes it very easy to find unique Internet radio stations and even add those you find and enjoy to your library. Currently, the only way to install Odio on Linux is via Snap. If your distribution supports snap packages, install this streaming app with the command:

sudo snap install odio

Once installed, you can open the app and start using it. There is no need to log into (or create) an account. Odio is very limited in its settings. In fact, it only offers the choice between a dark or light theme in the settings window. However, as limited as it might be, Odio is one of your best bets for playing Internet radio on Linux.

Streamtuner2 is an outstanding Internet radio station GUI tool. With it you can stream music from the likes of:

  * Internet radio stations

  * Jameno

  * MyOggRadio

  * Shoutcast.com

  * SurfMusic

  * TuneIn

  * Xiph.org

  * YouTube


### StreamTuner2

Streamtuner2 offers a nice (if not slightly outdated) interface, that makes it quite easy to find and stream your favorite music. The one caveat with StreamTuner2 is that it’s really just a GUI for finding the streams you want to hear. When you find a station, double-click on it to open the app associated with the stream. That means you must have the necessary apps installed, in order for the streams to play. If you don’t have the proper apps, you can’t play the streams. Because of this, you’ll spend a good amount of time figuring out what apps to install for certain streams (Figure 4).

![Streamtuner2][10]

Figure 4: Configuring Streamtuner2 isn’t for the faint of heart.

[Used with permission][3]

### VLC

VLC has been, for a very long time, dubbed the best media playback tool for Linux. That’s with good reason, as it can play just about anything you throw at it. Included in that list is streaming radio stations. Although you won’t find VLC connecting to the likes of Spotify, you can head over to Internet-Radio, click on a playlist and have VLC open it without a problem. And considering how many internet radio stations are available at the moment, you won’t have any problem finding music to suit your tastes. VLC also includes tools like visualizers, equalizers (Figure 5), and more.

![VLC ][12]

Figure 5: The VLC visualizer and equalizer features in action.

[Used with permission][3]

The only caveat to VLC is that you do have to have a URL for the Internet Radio you wish you hear, as the tool itself doesn’t curate. But with those links in hand, you won’t find a better media player than VLC.

### Always More Where That Came From

If one of these five tools doesn’t fit your needs, I suggest you open your distribution’s app store and search for one that will. There are plenty of tools to make streaming music, podcasts, and more not only possible on Linux, but easy.

Learn more about Linux through the free ["Introduction to Linux" ][13] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/2/5-streaming-audio-players-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[2]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/spotify_0.jpg?itok=8-Ym-R61 (Spotify)
[3]: https://www.linux.com/licenses/category/used-permission
[5]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/clementine_0.jpg?itok=5oODJO3b (Clementine)
[6]: http://www.radio-browser.info
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/odio.jpg?itok=sNPTSS3c (Odio)
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/streamtuner2.jpg?itok=1MSbafWj (Streamtuner2)
[12]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/vlc_0.jpg?itok=QEOsq7Ii (VLC )
[13]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
