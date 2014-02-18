zpl1025 translating
How to Play Blizzard's Hearthstone: Heroes of Warcraft on Linux
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Play-Blizzard-s-Hearthstone-Heroes-of-Warcraft-on-Linux-424410-3.jpg)

**Hearthstone: Heroes of Warcraft is a collectible card game developed by Blizzard Entertainment that is free to play. You can get it to work on Linux, with the right amount of effort.**

Just like most games on the Windows platform, Hearthstone: Heroes of Warcraft can be made to work with the help of Wine (wine is not an emulator). Installing it is not enough, you also have to tweak it a bit in order for it to work. 

Thanks to [Michael Washington][1] (moderator of the Gaming On Linux community on Google+) and [Michael Speth][2], the maintainer on winehq.org, who gathered all instructions in one place, playing Hearthstone is just a few commands away.

First of all, you're going to have to download the client from Blizzard's servers. This being a free to play game and in the open beta stages, the file is readily available for anyone who wants to grab it.

Then, you have to install the latest development version of Wine. If you are on Ubuntu (the tutorial works best on Ubuntu), you can do this from the official PPA. Just enter the following commands in a terminal:

    sudo add-apt-repository ppa:ubuntu-wine/ppa
    sudo apt-get update
    sudo apt-get install wine1.7
    sudo apt-get install wine1.7-i386

The appdb.winehq.org has all the information necessary to make it work. You're going to have to edit some properties for a couple of libraries.

### dbghelp ###

    Run winecfg
    In the libraries tab, type dbghelp into the New override for library box.
    Click Add, then Yes when it asks.
    Click on dbghelp in the Existing_overrides list.
    Click Edit.
    Set to Disabled.
    Click Ok. Then Ok.

### msvcp100 ###

    Run winecfg
    In the libraries tab, type msvcp100 into the New override for library box.
    Click Add, then Yes when it asks.
    Click on msvcp100 in the Existing_overrides list.
    Click Edit.
    Set to native,embedded.
    Click Ok. Then Ok.

You also need to run the following command in a terminal and wait for it to complete:

    winetricks wininet

All you have to do now is double click the .exe file you downloaded from Blizzard and you're good to go.

[Follow @thesilviu][3]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Play-Blizzard-s-Hearthstone-Heroes-of-Warcraft-on-Linux-424410.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://plus.google.com/u/0/106295000788676760101/posts/aYfwYEoThJw?cfem=1
[2]:http://appdb.winehq.org/objectManager.php?bShowAll=true&bIsQueue=false&bIsRejected=false&sClass=version&sTitle=&sReturnTo=&iId=29747
[3]:https://twitter.com/thesilviu
