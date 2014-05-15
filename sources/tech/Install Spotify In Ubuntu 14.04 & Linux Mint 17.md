liushui312 translating
Install Spotify In Ubuntu 14.04 & Linux Mint 17
================================================================================
Spotify is the most popular streaming music service these days. While you can listen it via its web interface, you can also install a desktop client of Spotify in Linux. This gives you some additional features such as listening to local music in Spotify, sync local music to Spotify server or sync local music to iPhone, iPod or other mobile devices.

In this quick post, we shall see how to quickly **install Spotify in Ubuntu 14.04** and other Debian based distributions such as Linux Mint, Elementary OS, Bodhi etc.

### Install Spotify in Ubuntu 14.04 & Linux Mint ###

To install desktop client of Spotufy, open a terminal (Ctrl+Alt+T) and use the following commands:

    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

This will add the above repository in software sources list. Now add the GPG key:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

Next is simple. Update and install Spotify client.

    sudo apt-get update
    sudo apt-get install spotify-client

That’s all you need to do. Next you can start Spotify by searching for it Unity Dash (in Ubuntu). It integrates very well in Ubuntu environment. Here is what Spotify interface looks like in Ubuntu 14.04:

![](http://itsfoss.com/wp-content/uploads/2014/05/Spotify_Ubuntu_Linux.jpeg)

I hope this quick post helped you to install Spotify desktop client in Ubuntu and other Linux OS. I think this could be counted as one of the first [few things to do after installing Ubuntu 14.04][1]. How do you find it? Do you use any other service similar to Spotify? Do share your views.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-spotify-ubuntu-1404/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
