Fix Adobe Flash Player Issue In Chromium In Ubuntu 14.04
================================================================================
One of the first few [things to do after installing Ubuntu 14.04][1] is to install Adobe Flash Player. Normally, if you install [Ubuntu Restricted Extras][2], Flash Player should be working and you should be able to watch online videos from websites like You Tube etc.

But this is not the case with Chromium and Ubuntu 14.04 combination. While you can easily play You Tube videos etc on other web browsers such as Firefox, Chrome etc, in Chromium you will see Adobe Flash player missing notice:

**Adobe Flash Player is required to display some elements on this page. Install plug-in..**

![](http://itsfoss.com/wp-content/uploads/2014/04/Flash_Player_Ubuntu_1404_Chromium.jpeg)

### Reason for flash player issue exclusively in Chromium: ###

The reason why this issue occurs only in Chromium is that until now Chromium used Netscape Plugin API for Flash support. Starting from Ubuntu 14.04, [Chromium will stop using Netscape Plugin API][3]. Hence, you will face issues with Adobe Flash Player with Chromium.

Now, why this issue doesn’t occur with other web browsers? Answer is because they use Flash version 11.2.

### Fix Adobe Flash Player issue with Chromium: ###

To fix this issue, we’ll be using Pepper Flash Player, a safer and more stable version of Flash Player from Google. An [Adobe Flash Player Pepper installer][4] is available in Ubuntu 14.04 repositories. This installer downloads Google Chrome, extracts Pepper Flash Player and sets it up for Chromium usage.

To install Pepper Flash Player in Ubuntu 14.04, open a terminal and use the following commands:

    sudo apt-get install pepperflashplugin-nonfree
    sudo update-pepperflashplugin-nonfree --install

Restarting Chromium will do. No need of a system reboot. I hope this quick post helped you to fix Adobe Flash Player issue with Chromium. Any questions or suggestions are always welcomed. 

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-flash-player-issue-chromium-in-ubuntu-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[2]:https://help.ubuntu.com/community/RestrictedFormats
[3]:http://blog.chromium.org/2013/09/saying-goodbye-to-our-old-friend-npapi.html
[4]:https://wiki.debian.org/PepperFlashPlayer