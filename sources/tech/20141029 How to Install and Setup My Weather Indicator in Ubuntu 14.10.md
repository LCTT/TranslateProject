How to Install and Setup ‘My Weather Indicator’ in Ubuntu 14.10
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/my-weather-indicator.jpg)

**There’s no drought of ways to be kept abreast of the weather on the Ubuntu desktop, with the Unity Dash and desktop apps like [Typhoon][1] all offering to help.**

But panel applets that offer quick glance condition and temperature stats, with a ream of detailed meteorological data never more than a quick click away, are by far the most popular weather utilities on Linux.

[My Weather Indicator][2] by Atareao is one of this breed, and arguably the best.

It displays current temperature and conditions on the Unity panel, and has a menu stuffed full of stats, including ‘feels like’, cloudiness and sunrise/set times. In addition, there’s a desktop widget, multiple location support, a choice of backend data providers, and plenty of configuration options.

Sounds pretty comprehensive, right? Let’s walk through how to install and set it up on Ubuntu.

### Install My Weather Indicator in Ubuntu ###

My Weather Indicator is not available to install from the Ubuntu Software Center directly, but both a .deb installer and an officially maintained PPA (providing packages for both Ubuntu 14.04 LTS and 14.10) are provided by the developers.

- Download My Weather Indicator (.deb)

To ensure you’re always kept up-to-date with the latest release I recommend adding the [Atareao PPA][3] to your Software Sources and installing from there.

How? **Open a new Terminal** window (Unity Dash > Terminal, or press Ctrl+Alt+T) and **enter the following two commands carefully**, entering your system password when prompted:

    sudo add-apt-repository ppa:atareao/atareao
    
    sudo apt-get update && sudo apt-get install my-weather-indicator

#### Setting Up My Weather Indicator ####

Regardless of how you install the tool, once you have you can launch it from the Unity Dash by searching for “weather”.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/weather-icon.jpg)

The first time you open the app the following Preferences window will open. From here you can search for a location manually or set it to auto-detect using geo-ip — the latter of which can sometimes be a little imprecise, but saves the need to faff.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/Screen-Shot-2014-10-27-at-17.39.07.jpeg)

If you’re travelling (or in need of some small talk fodder) **you can monitor a second locale**, too. This is set up in the same way as the first but in the ‘Second Location’ tab. 

Checking the ‘**Show Widget**’ box in the “**Widget Options**” section adds a small forecast desklet to your desktop. There are a number of different skins included, so be sure to play around to find the one you like the most (note: widget changes are applied on clicking ‘Ok’).

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/widgets.jpg)

My Weather Indicator uses [Open Weather Map][4] as its forecast backend by default, but other options can be selected from the ‘**Weather Services**’ pane (*require an API key to function):

- Open Weather Map
- Yahoo! Weather
- Weather Underground*
- World Weather Online*

The ‘**Units**’ tab is where you can configure measurements for temperature, pressure, wind speed, etc. These are applied globally to all configured locations; you can’t have one location in Celsius and the other in Fahrenheit.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/Screen-Shot-2014-10-27-at-17.38.54.jpeg)

Finally, in the ‘General Options‘ section you can set the refresh interval, set autostart preference, and choose from one of two panel icons.

MWI not your thing? Why not try [the nerdy way to view weather forecasts on Linux][5]?

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/10/install-weather-indicator-ubuntu-14-10

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://launchpad.net/typhoon
[2]:https://launchpad.net/my-weather-indicator
[3]:https://launchpad.net/~atareao/+archive/ubuntu/atareao
[4]:http://openweathermap.org/
[5]:http://www.omgubuntu.co.uk/2014/02/get-weather-forecast-terminal-linux