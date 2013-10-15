如何在终端命令行测试你的网速
================================================================================
![](http://img.gawkerassets.com/img/190w8luc8u8jjjpg/original.jpg)

你可能知道关于互联网[速度测试][1],它可以在你的浏览器里进行.这里给展现一个更简单的方法,你可以在你的树莓派或者家用服务器通过终端做同样的事.

打开一个终端,运行下面命令:

    wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip

使用[wget][2]命令从远程仓库服务器测试下载一个10MB文件.当文件下载完成,速度会显示在终端,你就可以知道你正在连接的网络速度有多快了

任何linux PC(译者注:一般,我们所说的PC是指'IBM PC兼容机',此架构中的中央处理器采用英特尔或超微等厂商所生产的中央处理器)能够运行wget命令.[Windows][3]和[Mac][4]用户需要下载这个程序,但是功能不多不少完全一样.点击链接可以读到更多.

--------------------------------------------------------------------------------

via: http://lifehacker.com/how-to-test-your-internet-speed-with-a-terminal-command-1364123567

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[flsf](https://github.com/flsf) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.speedtest.net/
[2]:http://lifehacker.com/161202/geek-to-live--mastering-wget
[3]:http://gnuwin32.sourceforge.net/packages/wget.htm
[4]:https://www.macupdate.com/app/mac/33951/wget
