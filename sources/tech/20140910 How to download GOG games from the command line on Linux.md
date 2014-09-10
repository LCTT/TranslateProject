How to download GOG games from the command line on Linux
================================================================================
If you are a gamer and a Linux user, you probably were delighted when [GOG][1] announced a few months ago that it will start proposing games for your favorite OS. If you have never heard of GOG before, I encourage you to check out their catalog of “good old games”, reasonably priced, DRM-free, and packed with goodies. However, if the Windows client for GOG existed for quite some time now, an official Linux version is nowhere to be seen. So if waiting for the official version is uncomfortable for you, an unofficial open source program named LGOGDownloader gives you access to your library from the command line.

![](https://farm4.staticflickr.com/3843/15121593356_b13309c70f_z.jpg)

### Install LGOGDownloader on Linux ###

For Ubuntu users, the [official page][2] recommends that you download the sources and do:

    $ sudo apt-get install build-essential libcurl4-openssl-dev liboauth-dev libjsoncpp-dev libhtmlcxx-dev libboost-system-dev libboost-filesystem-dev libboost-regex-dev libboost-program-options-dev libboost-date-time-dev libtinyxml-dev librhash-dev help2man
    $ tar -xvzf lgogdownloader-2.17.tar.gz
    $ cd lgogdownloader-2.17
    $ make release
    $ sudo make install 

If you are an Archlinux user, an [AUR package][2] is waiting for you.

### Usage of LGOGDownloader ###

Once the program is installed, you will need to identify yourself with the command:

    $ lgogdownloader --login 

![](https://farm6.staticflickr.com/5593/15121593346_9c5d02d5ce_z.jpg)

Notice that the configuration file if you need it is at ~/.config/lgogdownloader/config.cfg

Once authenticated, you can list all the games in your library with:

    $ lgogdownloader --list 

![](https://farm6.staticflickr.com/5581/14958040387_8321bb71cf.jpg)

Then download one with:

    $ lgogdownloader --download --game [game name] 

![](https://farm6.staticflickr.com/5585/14958040367_b1c584a2d1_z.jpg)

You will notice that lgogdownloader allows you to resume previously interrupted downloads, which is nice because typical game downloads are not small.

Like every respectable command line utility, you can add various options:

- **--platform [number]** to select your OS where 1 is for windows and 4 for Linux.
- **--directory [destination]** to download the installer in a particular directory.
- **--language [number]** for a particular language pack (check the manual pages for the number corresponding to your language).
- **--limit-rate [speed]** to limit the downloading rate at a particular speed. 

As a side bonus, lgogdownloader also comes with the possibility to check for updates on the GOG website:

    $ lgogdownloader --update-check 

![](https://farm4.staticflickr.com/3882/14958035568_7889acaef0.jpg)

The result will list the number of forum and private messages you have received, as well as the number of updated games.

To conclude, lgogdownloader is pretty standard when it comes to command line utilities. I would even say that it is an epitome of clarity and coherence. It is true that we are far in term of features from the relatively recent Steam Linux client, but on the other hand, the official GOG windows client does not do much more than this unofficial Linux version. In other words lgogdownloader is a perfect replacement. I cannot wait to see more Linux compatible games on GOG, especially after their recent announcements to offer DRM free movies, with a thematic around video games. Hopefully we will see an update in the client for when movie catalog matches the game library.

What do you think of GOG? Would you use the unofficial Linux Client? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/download-gog-games-command-line-linux.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://www.gog.com/
[2]:https://sites.google.com/site/gogdownloader/home
[3]:https://aur.archlinux.org/packages/lgogdownloader/