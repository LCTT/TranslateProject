Daily Ubuntu Tips – Make Ubuntu 14.04 Trusty Tahr Perform Better
================================================================================


Ubuntu 14.04 Trusty Tahr was released yesterday and if you are one of those who installed it, here are some things you might want to do to improve your experience with it.

For those upgrading, this may have already be done so no need to do it again, except if you didn’t do it in Ubuntu 13.10.

Ubuntu right out-of-the-box isn’t complete. There are some packages and tools which improve user experience that are purposely left out by Canonical for legal reasons.

These packages, if not installed, will make watching movies, playing flash videos and listening to MP3 files difficult. For legal and other reasons, Ubuntu parent company left them out.

If you wish to do all the above things, you must continue below to learn how to resolve these problems.

For those who already have Ubuntu 13.10 and wish to upgrade, [read this post][1], or click the link below.

When you’ve upgraded or installed Ubuntu 14.04, open your command terminal, then run the commands below to install the missing packages which make playing media files easier in Ubuntu.

    sudo apt-get install ubuntu-restricted-extras

When prompted for your password, enter it to continue. After installing, go and test out your system. This package helps install Adobe Flash Player, MP3 codes so you can listen to MP3 music, movie plugins to watch legal DVD movies and other useful programs.

So, whenever you install Ubuntu, try installing this package first. This will improve your experience a bit when using Ubuntu.

There may also be cases where you might want to watch DVD movies that are encrypted. In these cases, you might want to run the commands below.

    sudo apt-get install libavformat-extra-54 libavcodec-extra-54 libdvdread4

Then run the commands below and you’re done.

    sudo /usr/share/doc/libdvdread4/install-css.sh

Finally, install VLC media player which is a great program to watch DVD movies in Windows or Linux systems.

    sudo apt-get install vlc

Hope this helps.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-make-ubuntu-14-04-trusty-tahr-perform-better/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-upgrade-to-ubuntu-14-04-trusty-tahr-from-13-10/