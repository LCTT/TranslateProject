在Linux系统下玩《炉石传说：魔兽英雄传》
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Play-Blizzard-s-Hearthstone-Heroes-of-Warcraft-on-Linux-424410-3.jpg)

**《炉石传说：魔兽英雄传》是暴雪娱乐开发的一款免费的集换式卡牌游戏。花点工夫，你也可以在Linux上玩这个游戏。**

像Windows平台的大多数游戏一样，《炉石传说：魔兽英雄传》也可以在Wine的帮助下在Linux上运行（Wine Is Not an Emulator）。不过只是安装一下还不够，你得稍微调整一下才行。

非常感谢[迈克尔 华盛顿][1]（Google+上Gaming On Linux社区的版主）和[迈克尔 斯佩斯][2]（winehq.org的维护者），他们整理汇总了所有需要的指令，现在玩炉石传说只是输入几个命令就好了。

首先，你得先把客户端从暴雪的网站下载下来。它是一个免费游戏，目前还处在beta测试阶段，所有人都可以下载。

然后，你得安装wine的最新开发版本。如果你在用Ubuntu（这份指引最适合Ubuntu），你可以从官方PPA源安装。只需要在终端下输入下面的命令：

    sudo add-apt-repository ppa:ubuntu-wine/ppa
    sudo apt-get update
    sudo apt-get install wine1.7
    sudo apt-get install wine1.7-i386

在网站appdb.winhq.org上可以找到让它运行的所有信息。之后你得编辑几个库的一些属性。

### dbghelp ###

- 运行winecfg
- 选择Libraries标签，在New override for library框中输入dbghelp
- 点击Add，然后在提示框里选择Yes
- 在Existing overrides列表中点击dbghelp
- 点击Edit
- 设置成Disabled
- 点击Ok，搞定

### msvcp100 ###

- 运行winecfg
- 选择Libraries标签, 在New override for library框中输入msvcp100
- 点击Add, 然后在提示框中选择Yes
- 在Existing overrides列表中点击msvcp100
- 点击Edit
- 设置成native,embedded
- 点击Ok，搞定

你还需要在终端里运行下面的命令，并等待运行结束。

    winetricks wininet

之后你所需要做的就是双击从暴雪下载下来的exe文件，就可以开始玩了。

[Follow @thesilviu][3]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Play-Blizzard-s-Hearthstone-Heroes-of-Warcraft-on-Linux-424410.shtml

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://plus.google.com/u/0/106295000788676760101/posts/aYfwYEoThJw?cfem=1
[2]:http://appdb.winehq.org/objectManager.php?bShowAll=true&bIsQueue=false&bIsRejected=false&sClass=version&sTitle=&sReturnTo=&iId=29747
[3]:https://twitter.com/thesilviu
