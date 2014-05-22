JonathanKang is translating

Native Spotify for Linux Client Updated With New Dark Design
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/spotify.jpg)

**Spotify for Linux has been updated with the same flatter, darker design that the streaming service brought to its apps on other platforms last month. **

Steely grey gradients and expansive swathes of white have given way to a colour scheme based on black, black and slightly lighter black. Even the company’s trademark green hasn’t been spared the overhaul, with its use now limited to the odd flourish here and there.

> ‘Spotify say the design puts the emphasis squarely on content’

Rounded elements have been introduced on artist and profile photos, while navigation and player controls buttons have been given iOS 7-style thin line makeovers.

Spotify say the design puts the emphasis squarely on content, likening the new look to “*a cinema when you dim the lights.*”

Aside from the changes staring you in the face there are a couple under the hood that you might otherwise miss. These include the use of OpenSSL 1.0.x, working local music playback using *libavcodec54* and support for native system notifications on track change.

For now, 32-bit builds are not available.

The native, if eternally-in-preview, Spotify client for Linux **supports free and subscription accounts**.

### Install Spotify ###

To install Spotify on Ubuntu 14.04 LTS open a new terminal and enter the following commands.

The first adds the official Spotify repository to your software sources list:

    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'

Add the secure key for the repository to prevent errors being thrown up:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

Finally, update and install the application:

    sudo apt-get update && sudo apt-get install spotify-client-qt

Launch the app from the Dash once installation has completed.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/spotify-linux-preview-update-new-design

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
