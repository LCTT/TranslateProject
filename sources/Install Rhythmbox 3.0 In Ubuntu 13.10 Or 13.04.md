Install Rhythmbox 3.0 In Ubuntu 13.10 Or 13.04
================================================================================
Rhythmbox 3.0 was released more than a month ago, bringing an improved user interface, Python 3 support for the plugins and more. Unfortunately, the new version didn't make it into Ubuntu 13.10, but there's a PPA you can use to install it (also available for Ubuntu 13.04).

![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-3.0.png)

Changes in Rhythmox 3.0:

- the plugins now use Python 3;
- new task progress display below the track list (used for various things including track transfers and import jobs);
- support for composer tags;
- restyled playback controls;
- restyled source list using symbolic icons;
- better introspection of everything;
- separate CBR and VBR encoding styles with different sets of exposed properties;
- playlist settings (browser visibility etc.) saved in playlists.xml;
- better use of RTL icons where appropriate;
- fixed IM status and ReplayGain plugins;
- many other bug fixes.

A complete Rhythmbox 3.0 changelog can be found [HERE][1].

## Install Rhythmbox 3.0 in Ubuntu 13.10 or 13.04 ##

![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-3.0_2.png)

*Rhythmbox 3.0 in Ubuntu 13.10 (Unity)*

Because Rhythmbox 3.0 uses Python3 for plugins instead of Python 2, **none of the plugins available in the Rhythmbox [third-party plugins PPA][2] will work**. You can get some of them to work by installing them manually (including the Equalizer plugin and the cool **[CoverArt browser][3]**) - for more info, see **[THIS][4]** article.

Rhythmbox 3.0 is available in an unofficial PPA maintained by Jacob Zimmermann, for Ubuntu 13.10 and 13.04 (and derivatives). **Add the PPA and install/upgrade Rhythmbox 3.0 using the following commands**:

    sudo add-apt-repository ppa:jacob/media
    sudo apt-get update
    sudo apt-get install rhythmbox

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2013/10/install-rhythmbox-30-in-ubuntu-1310-or.html

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://ftp.acc.umu.se/pub/GNOME/sources/rhythmbox/3.0/rhythmbox-3.0.news
[2]:http://www.webupd8.org/2012/08/rhythmbox-third-party-plugins-ubuntu-ppa.html
[3]:http://www.webupd8.org/2013/08/rhythmbox-coverart-browser-plugin-gets.html
[4]:http://xpressubuntu.wordpress.com/2013/10/06/how-to-install-rhythmbox-3-0-in-saucy/