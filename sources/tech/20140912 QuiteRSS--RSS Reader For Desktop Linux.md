QuiteRSS: RSS Reader For Desktop Linux
================================================================================
[QuiteRSS][1] is a free and [open source][2] RSS/Atome reader available for Windows , Linux and Mac. Written in C++/QT, it comes with a number of features.

The interface of QuiteRSS reminds me of Lotus Notes mail. You have plenty of RSS displayed in right side pane, which you can group together in labels. Clicking on an item, opens the RSS feed in lower panel.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/QuiteRSS_Ubuntu.jpeg)

Apart from this, it has ad blocker, a newspaper layout view, importing feeds from URL features etc. You can find the full list of features [here][3].

### Install QuiteRSS in Ubuntu and Linux Mint ###

QuiteRSS is available in Ubuntu 14.04 and Linux Mint 17. You can install it by simply using the command below:

    sudo apt-get install quiterss

If you want to have the latest stable version, you can use the official [QuiteRSS PPA][4]:

    sudo add-apt-repository ppa:quiterss/quiterss
    sudo apt-get update
    sudo apt-get install quiterss

The above should work for all Ubuntu based Linux distributions such as Linux Mint, Elementary OS, Linux Lite, Pinguy OS etc. For other Linux distributions and other platforms, you can get the source code and installers from the [download page][5].

### Uninstall QuiteRSS ###

To uninstall QuiteRSS, use the following command:

    sudo apt-get remove quiterss

If you used the PPA, you should also remove the repository from the sources list.

    sudo add-apt-repository --remove ppa:quiterss/quiterss

QuiteRSS is a fine Open Source RSS reader, though I prefer [Feedly][6]. Though there is no desktop application of Feedly for Linux as of now, you can still use it in web browser apart from your smartphone. I hope you find QuiteRSS worth a try on desktop Linux.

--------------------------------------------------------------------------------

via: http://itsfoss.com/quiterss-rss-reader-desktop-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://quiterss.org/
[2]:http://itsfoss.com/category/open-source-software/
[3]:http://quiterss.org/en/about
[4]:https://launchpad.net/~quiterss/+archive/ubuntu/quiterss/
[5]:http://quiterss.org/en/download
[6]:http://feedly.com/