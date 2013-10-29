Here’s How To Enable DVD Playback In Ubuntu 13.10
================================================================================
If you find yourself struggling to play DVDs in Ubuntu 13.10 after installing, here’s the reason why. You see, Ubuntu is always shipped with some limitations when it comes to playing DVDs and other media. For legal reasons, Canonical, the parent company of Ubuntu leaves out these packages and programs that are required to play DVDs and most media in Ubuntu.

I am not going to tell you what the reasons are, but here’s how to get these packages in Ubuntu so you can play and watch commercial DVD as well as other encrypted media.

There are many options available to you. You could install free versions of these packages or get some paid versions if you want to help those behind the efforts of making Ubuntu media friendly.

Another method that’s no longer available was to use Medibuntu repositories to install these packages which will allow you play DVDs. Now, Medibuntu has [stopped support][1] for Ubuntu 12.10 and up.

So, to play DVDs again in Ubuntu, follow the steps below.

[Purchase Fluendo DVD Player][2] – this program is designed to help Ubuntu users play commercial DVDs.  It supports full DVD playback, full screen and support for subtitles.

If you don’t want to buy software that allows you to play DVDs, install these free tools.

Press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below.

    sudo apt-get install ubuntu-restricted-extras

Next, run the commands below.

    sudo apt-get install libavformat-extra-53 libavcodec-extra-53 libdvdread4

Finally, run the commands below and you’re done.

    sudo /usr/share/doc/libdvdread4/install-css.sh

You may have to restart your computer. After that, insert your DVD and try again. If all of the above steps fail, run the commands below to install VLC Player.

    sudo apt-get install vlc

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/heres-enable-dvd-playback-ubuntu-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://gauvain.pocentek.net/node/61
[2]:https://apps.ubuntu.com/cat/applications/fluendo-dvd/