How To Easily Install Tor Browser In Ubuntu 14.04 And Linux Mint 17
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Tor_Browser_Ubuntu.jpeg)

Keeping all the fiasco of [NSA snooping on citizens and governments worldwide][1] in mind, privacy is a growing concern for many. If you too are concerned about your online safety and want to protect yourself from network surveillance, [Tor project][2] is the best option available.

Tor Project has its own [Tor browser][3] which is based on Firefox and configured to protect users’ privacy and anonymity by using Tor and [Vidalia][4] tools that come bundled with it. Though you can [download Tor browser and install it from the source code][5], we shall see an easier way to install Tor browser in Ubuntu 14.04 and Linux Mint 17.

### How to install Tor browser in Ubuntu 14.04 and Linux Mint 17 ###

Thanks to [Webupd8][6], we have a PPA that we can use to install Tor browser in Ubuntu and other Ubuntu based Linux OSes easily (if you are not comfortable installing from source code). Open a terminal (Ctrl+Alt+T) and use the following commands:

    sudo add-apt-repository ppa:webupd8team/tor-browser
    sudo apt-get update
    sudo apt-get install tor-browser

The above PPA should also be valid for Ubuntu 12.04 and other Linux distributions based on it.

#### Uninstall Tor browser ####

If you want to uninstall Tor browser, use the following command:

    sudo apt-get remove tor-browser
    rm -r ~/.tor-browser-en

I hope this quick test helped you to **easily install Tor browser in Ubuntu 14.04 and Linux Mint 17**.  Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-tar-browser-ubuntu-linux-mint-17/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://projects.propublica.org/nsa-grid/
[2]:https://www.torproject.org/
[3]:https://www.torproject.org/projects/torbrowser.html.en
[4]:https://www.torproject.org/projects/vidalia.html.en
[5]:https://www.torproject.org/projects/torbrowser.html.en#linux
[6]:http://www.webupd8.org/