Open Source Media Player MPlayer 1.2 Released
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/MPlayer-1.2.jpg)

Almost three years after [MPlaayer][1] 1.1, the new version of MPlayer has been released last week. MPlayer 1.2 brings up support for many new codecs in this release.

MPlayer is a cross-platform, open source media player. Its name is an abbreviation of “Movie Player”. MPlayer has been one of the oldest video players for Linux and during last 15 years, it has inspired a number of other media players. Some of the famous media players based on MPlayer are:

- [MPV][2]
- SMPlayer
- KPlayer
- GNOME MPlayer
- Deepin Player

#### What’s new in MPlayer 1.2? ####

- Compatibility with FFmpeg 2.8
- VDPAU hardware acceleration for H.265/HEVC
- A number of new codecs supported via FFmpeg
- Improvements in TV and DVB support
- GUI improvements
- external dependency on libdvdcss/libdvdnav packages

#### Install MPlayer 1.2 in Linux ####

Most Linux distributions are still having MPlayer 1.1. If you want to use the new MPlayer 1.2, you’ll have to compile it from the source code which could be tricky at times for beginners.

I have used Ubuntu 15.04 for the installation of MPlayer 1.2. Installation instructions will remain the same for all Linux distributions except the part where you need to install yasm.

Open a terminal and use the following commands:

    wget http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz
    
    tar xvf MPlayer-1.1.1.tar.xz
    
    cd MPlayer-1.2
    
    sudo apt-get install yasm
    
    ./configure

When you run make, it will throw a number of things on the terminal screen and takes some time to build it. Have patience.

    make
    
    sudo make install

If you feel uncomfortable using the source code, I advise you to either wait forMPlayer 1.2 to land in the repositories of your Linux distribution or use an alternate like MPV.

--------------------------------------------------------------------------------

via: http://itsfoss.com/mplayer-1-2-released/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://www.mplayerhq.hu/
[2]:http://mpv.io/