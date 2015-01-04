Translating by H-mudcup

Flow ‘N Play Movie Player Has a Stylish Interface [Ubuntu Installation]
================================================================================
**Flow ‘N Play** is a new video player written in Qt which features a pretty slick and simple interface which provides only the basic features for playing movies.

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play.jpg)

[Flow ‘N Play][1] is relatively new video player (the first release was made earlier this year in March) with a beautiful interface and a pretty simple approach, with one of the features being the possibility to slide over the list of movies by dragging the mouse. The player comes with basic functionality, a search function, support for colored themes.

Opening a new video – you can also choose a custom cover in the same dialog:

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play_open.jpg)

The Settings dialog – customize some basic options here:

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play_settings.jpg)

Flow ‘N Play is still in early development though, and as such it has a few downsides over more advanced players. There are few options to customize it, no support for subtitles or video and audio filters. Currently there seems to be either a bug or strange behavior upon opening a new movie, which doesn’t always start automatically.

I believe a few more features could be added before it gets to being usable as a decent alternative to other players, but given the time, Flow ‘N Play looks really promising.

### Install Flow ‘N Play 0.922 in Ubuntu 14.04 ###

There are several different ways to install Flow N’ Play in Ubuntu. There are DEB packages, RUN Bash installers, and standalone binaries available on the [Qt-Apps page][2].

To install Flow ‘N Play first get the dependencies:

    sudo apt-get install libqt5multimediaquick-p5 qtdeclarative5-controls-plugin qtdeclarative5 qtmultimedia-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-quicklayouts-plugin

Then download the DEB package and either double click it or change the working directory to the one where you saved it and type the following in a terminal (for 64-bit, replace the DEB file for 32-bit):

    sudo dpkg -i flow-n-play_v0.926_qt-5.3.2_x64.deb 

Then type **flow-n-play** in a terminal to run it. Notice that in case you get dependency errors when trying to install the DEB file, you can run **sudo apt-get -f install**, which will fetch the missing dependencies automatically and will install Flow ‘N Play as well.

To install Flow ‘N Play using the RUN script, install the dependencies mentioned above and then run the script:

    wget -O http://www.prest1ge-c0ding.24.eu/programs/Flow-N-Play/v0.926/bin/flow-n-play_v0.926_qt-5.3.2_x64.run
    sudo ./flow-n-play_v0.926_qt-5.3.2_x64.run

The third method is to install it manually to a location of your choice (just download the binary provided after installing the dependencies) e.g. for 32-bit:

    wget -O http://www.prest1ge-c0ding.24.eu/programs/Flow-N-Play/v0.926/bin/Flow-N-Play_v0.926_Qt-5.3.2_x86

--------------------------------------------------------------------------------

via: http://www.tuxarena.com/2014/11/flow-n-play-movie-player-has-a-stylish-interface-ubuntu-installation/

作者：Craciun Dan 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.prest1ge-c0ding.24.eu/programme-php/app-flow_n_play.php?lang=en
[2]:http://qt-apps.org/content/show.php/Flow+%27N+Play?content=167736
