[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PyRadio: An open source alternative for internet radio)
[#]: via: (https://opensource.com/article/19/11/pyradio)
[#]: author: (Lee Tusman https://opensource.com/users/leeto)

PyRadio: An open source alternative for internet radio
======
Play your favorite internet radio stations—while keeping your personal
data private—with PyRadio.
![Stereo radio with dials][1]

[PyRadio][2] is a convenient, open source, command-line application for playing any radio station that has a streaming link. And in 2019, almost every radio station (certainly, every one that has a web presence) has a way to listen online. Using the free PyRadio program, you can add, edit, play and switch between your own selected list of streaming radio stations. It is a command-line tool for Linux that can run on many computers, including Macintosh and tiny computers like Raspberry Pi. To some, a command-line client for playing music might sound needlessly complicated, but it's actually a simple alternative and one that serves as an instant text-based dashboard to easily select music to listen to.

A little background about myself: I spend a lot of time browsing for and listening to new music on [Bandcamp][3], on various blogs, and even Spotify. I don't spend time casually listening to app *radio* stations, which are really algorithmically-generated continuous streams of similarly tagged music. Rather, I prefer listening to non-profit, college and locally-produced independent radio stations that are run by a community and don't rely on advertisements to sustain themselves.

I have always been a huge fan of community radio, from Drexel University's great reggae weekends on WKDU; the uncanny experimental WFMU from Orange, N.J.; and WNYC's eclectic schedule, including New Sounds. In my college days, I was a DJ on Brandeis' WBRS 100.1FM, playing experimental electronic music on the show Frequency. And as recently as 2018, I helped manage the station managers and schedule for [KCHUNG Radio][4], an artist-run internet and low-power AM station run out of Chinatown, Los Angeles.

![The PyRadio interface][5]

Just as a car radio (in days of yore) had buttons with presets for the owner's favorite radio stations, PyRadio lets me create a very simple list of radio stations that I can easily turn on and switch between. Since I spend most days working, researching, or writing to music, it's become my go-to software for listening. In an era where many people are used to commercial streaming services like curated Spotify mood playlists or Pandora "stations," it's nice to be able to set my own radio stations from a variety of sources outside of a commercial app and sans additional advertising.

Importantly, by not using commercial clients in the cloud, nothing is sending my user data or preferences to a company for whatever purposes they see fit. Nothing is collecting my preferences to build a profile to sell me more things.

PyRadio just works, and it's easy to use. Like some other Linux software, the hardest part of using PyRadio is installing it. This tutorial will help you install and run PyRadio for the first time. It assumes some basic knowledge of the command line. If you have no experience working in the terminal, I recommend reading a beginner-friendly [introduction to the command line][6] first.

### Installing PyRadio

In the past, I've used the Python package installer [pip][7] to install PyRadio, but the latest version is not yet installable from pip, and I couldn't find a package on Homebrew for my Mac. On my laptop running Ubuntu, I really wanted the latest version of PyRadio for its excellent new features, but I couldn't find an installation on Apt.

**[[Download our pip cheat sheet][8]]**

To get the current version on these computers, I built it from source. You can download the latest release from [github.com/coderholic/pyradio/releases][9], and then unzip or [untar][10] it. Change directory into the PyRadio source folder, and you're ready to begin.

Install the dependencies using your distribution's package manager (such as **dnf** on Fedora or **apt** on Ubuntu):

  * python3-setuptools
  * git
  * MPV, MPlayer, or VLC



On a Mac, install [Git][11], [sed][12], and [MPlayer][13] dependencies using Homebrew:


```
brew install git
brew install gnu-sed --default-names
brew install mplayer
```

Once all dependencies are resolved, run the installer script, using the argument **3** to indicate that you want PyRadio to build for Python3:


```
`$ sh devel/build_install_pyradio 3`
```

The installation process takes about a minute.

### Using and tweaking the station list

To launch the application, just run **pyradio**. You can navigate up and down the default station list with the arrow or [Vim][14] keys and select a station with Enter. The artist name and track title currently streaming from the station should be displayed, if they are available. Typing **?** brings up a help text box that lists available commands. You can change the interface color themes with **t** or modify your configuration with **c**.

Out of the box, PyRadio comes with an extensive list of internet streaming stations. But I wanted to add my favorite public radio and college radio stations to the list, as well as some online music playlists. You can find streaming URLs on your favorite radio stations' websites or by browsing online station directories such as [Shoutcast][15]. In particular, I recommend the variety of excellent stations from [Soma FM][16]. You'll need to input the station's streaming playlist file, a URL that ends in **.pls**. You can also enter direct links to streaming audio files, such as MP3s.

The easiest way to add a station is to type **a**. PyRadio will ask you for the name of the station and its streaming URL, and you can press Enter to add it to your **stations** file. To delete any station, navigate to it and press **x**. You'll be prompted to confirm. The default station list is stored in **~/.config/pyradio/stations.csv**. The station list is a two-column CSV file with the station names and the stream URLs.

![Adding a station to PyRadio][17]

Those are the basics of PyRadio. You can find additional information in its [GitHub repo][18]. I hope you have many hours of audio enjoyment ahead of you. If you have any other PyRadio tips or suggestions for stations, please leave a comment below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/pyradio

作者：[Lee Tusman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/leeto
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-stereo-radio-music.png?itok=st66SdwS (Stereo radio with dials)
[2]: http://www.coderholic.com/pyradio/
[3]: http://bandcamp.com
[4]: https://kchungradio.org/
[5]: https://opensource.com/sites/default/files/interface_0.png (The PyRadio interface)
[6]: https://www.redhat.com/sysadmin/navigating-filesystem-linux-terminal
[7]: https://pypi.org/project/pip/
[8]: https://opensource.com/article/19/11/introducing-our-python-pip-cheat-sheet
[9]: https://github.com/coderholic/pyradio/releases
[10]: https://opensource.com/article/17/7/how-unzip-targz-file
[11]: https://git-scm.com/
[12]: https://www.gnu.org/software/sed/manual/sed.html
[13]: http://www.mplayerhq.hu/design7/news.html
[14]: https://www.vim.org/
[15]: https://directory.shoutcast.com/
[16]: https://somafm.com/
[17]: https://opensource.com/sites/default/files/pyradio-add.png (Adding a station to PyRadio)
[18]: https://github.com/coderholic/pyradio
