Translating by ZTinoZ
[Solved] Ubuntu Does Not Remember Brightness Settings
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/04/Fix_Ubuntu_Brightness_Issue.jpg)

In the tutorial to [fix brightness control not working for Ubuntu and Linux Mint][1], some users mentioned that though the fix worked for them, **Ubuntu doesn’t remember the brightness settings** and same was the case with Linux Mint. At each boot or when the system wakes up from sleep, the brightness is restored to either maximum or minimum level. Quite an annoyance, I know. But thankfully we have an easy solution for this **brightness issue in Ubuntu and Linux Mint**.

### Fix Ubuntu and Linux Mint doesn’t remember brightness settings ###

[Norbert][2] wrote a script to make Ubuntu and Linux Mint remember the brightness settings at each boot or wake up from sleep. To help you easily use the script, he put up this PPA which is available for Ubuntu 12.04, 14.04 and 14.10. All you need to do is to use the following commands:

    sudo add-apt-repository ppa:nrbrtx/sysvinit-backlight
    sudo apt-get update
    sudo apt-get install sysvinit-backlight

Once installed, restart your system. Now check if the brightness settings are saved or not.

I hope this quick tip helped you. If you find any issues, please take your time to [report a bug][3].

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntu-mint-brightness-settings/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/fix-brightness-ubuntu-1310/
[2]:https://launchpad.net/~nrbrtx/+archive/ubuntu/sysvinit-backlight/+packages
[3]:https://launchpad.net/~nrbrtx/+archive/ubuntu/sysvinit-backlight/+packages
