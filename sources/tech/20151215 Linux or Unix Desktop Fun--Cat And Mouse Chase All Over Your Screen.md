Linux / Unix Desktop Fun: Cat And Mouse Chase All Over Your Screen
================================================================================
Oneko is a little fun app. It will change your cursor into mouse and creates a little cute cat and the cat start chasing around your mouse cursor. The word "neko" means "cat" in Japanese and it was originally written by a Japanese author as a Macintosh desktop accessory.

### Install oneko ###

Type the following command:

    $ sudo apt-get install oneko

Sample outputs:

    [sudo] password for vivek:
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      oneko
    0 upgraded, 1 newly installed, 0 to remove and 10 not upgraded.
    Need to get 38.6 kB of archives.
    After this operation, 168 kB of additional disk space will be used.
    Get:1 http://debian.osuosl.org/debian/ squeeze/main oneko amd64 1.2.sakura.6-7 [38.6 kB]
    Fetched 38.6 kB in 1s (25.9 kB/s)
    Selecting previously deselected package oneko.
    (Reading database ... 274152 files and directories currently installed.)
    Unpacking oneko (from .../oneko_1.2.sakura.6-7_amd64.deb) ...
    Processing triggers for menu ...
    Processing triggers for man-db ...
    Setting up oneko (1.2.sakura.6-7) ...
    Processing triggers for menu ...

FreeBSD unix user type the following command to install oneko:

    # cd /usr/ports/games/oneko
    # make install clean

### How do I use oneko? ###

Simply type the following command:

    $ oneko

You can make cat into "tora-neko", a cat wite tiger-like stripe:

    $ oneko -tora

### Not a cat person? ###

You can run a dog instead of a cat:

    $ oneko -dog

The followin will runs Sakura Kinomoto instead of a cat:

    $ oneko -sakura

Runs Tomoyo Daidouji instead of a cat:

    $ oneko -tomoyo

### Check out related media ###

This tutorial also available in video format:

注：youtube 视频
<iframe width="596" height="335" frameborder="0" allowfullscreen="" src="http://www.youtube.com/embed/Nm3SkXThL0s"></iframe>

(Video.01: Demo - Install and use oneko under Linux)

### Other options ###

You can pass the following options:

1. **-tofocus** : Makes cat run to and on top of focus window. When focus window is not in sight, cat chases mouse as usually.
1. **-position geometry** : Specify X and Y offsets in pixels to adjust position of cat relative to mouse pointer./li>
1. **-rv** : Reverse background color and foreground color.
1. **-fg color** : Foreground color (e.g., oneko -dog -fg red).
1. **-bg color** : Background color (e.g., oneko -dog -bg green).
1. See oneko man page for more information.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/oneko-app-creates-cute-cat-chasing-around-your-mouse/

作者：Vivek Gite 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出