How To Install Kodi 14 (XBMC) In Ubuntu 14.04 & Linux Mint 17
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Kodi_Xmas.jpg)

[Kodi][1], formerly and popularly known as XBMC, has [released its latest version 14][2] which is code named Helix. It is fairly easy to **install Kodi 14 in Ubuntu 14.04** thanks to the official PPA provided by XBMC.

For those who do not know already, Kodi is a media center application available for all major platforms like Windows, Linux, Mac, Android etc. It turns your device in to a full screen media center where you can manage all your music and videos, either on local or on network drive, watch You Tube, [Netflix][3], Hulu, Amazon Prime and other streaming services.

### Install XBMC 14 Kodi Helix in Ubuntu 14.04, 14.10 and Linux Mint 17 ###

Thanks to the official PPA, you can easily install Kodi 14 in Ubuntu 14.04, Ubuntu 12.04, Linux Mint 17, Pinguy OS 14.04, Deepin 2014, LXLE 14.04, Linux Lite 2.0, Elementary OS and other Ubuntu based Linux distributions. Open a terminal (Ctrl+Alt+T) and use the following commands:

    sudo add-apt-repository ppa:team-xbmc/ppa
    sudo apt-get update
    sudo apt-get install kodi

The download size would be around 100 MB, which is not huge in my opinion. To install some encode addons, use the command below:

    sudo apt-get install kodi-audioencoder-* kodi-pvr-*

#### Remove Kodi 14 from Ubuntu ####

To uninstall Kodi 14 from your system, use the command below:

    sudo apt-get remove kodi

You should also remove the PPA from the software sources:

    sudo add-apt-repository --remove ppa:team-xbmc/ppa

I hope this quick post helped you to install Kodi 14 in Ubuntu, Linux Mint and other Linux. How do you find Kodi 14 Helix? Do you use some other media center as an alternative to XBMC? Do share your views in the comment section.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-kodi-14-xbmc-in-ubuntu-14-04-linux-mint-17/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://kodi.tv/
[2]:http://kodi.tv/kodi-14-0-helix-unwinds/
[3]:http://itsfoss.com/watch-netflix-in-ubuntu-14-04/