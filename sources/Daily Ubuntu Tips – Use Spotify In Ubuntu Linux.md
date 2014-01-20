Daily Ubuntu Tips – Use Spotify In Ubuntu Linux
================================================================================
Spotify cloud music service has just lifted the restricted time limits for all users of all platforms (web/desktop/mobile). Users using any of these platforms can now listen to free music whenever without restrictions.

At first, there was a straight time limit after the first 6 months had passed for all free accounts. Of course, that depends on your location. Now all free accounts can listen to music online free without the limits.

Users who also listen to music from their Ubuntu desktop client will also not have the limits that were previously attached to free accounts. Ubuntu users can now enjoy music from their favorite desktop OS for free.

If you’re excited, here’s a quick tip that shows you how to install the latest version of Spotify in Ubuntu Linux if you don’t already have it.

For some users who are in locations Spotify isn’t available, they will have to try other means to listen. That’s because Spotify isn’t available in all countries. Here’s the list of current countries Spotify is available in. 

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifycountrylist.jpg)

### Installing Spotify in Ubuntu ###

To install Spotify in Ubuntu, open the terminal console and run the commands below to add Spotify’s repository to Ubuntu

    sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"

Next, add Spotify repository key to Ubuntu by running the commands below.

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

Finally, run the commands below to update your system and install Spotify.

    sudo apt-get update && sudo apt-get install spotify-client

That’s it!

After Spotify is installed, you should launch Unity Dash and search for it. Launch it and begin enjoying your free music.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifyclientubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-use-spotify-in-ubuntu-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出