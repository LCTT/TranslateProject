在Ubuntu 13.10或者13.04上安装Rhythmbox 3.0
================================================================================
Rhythmbox 3.0已经发布了超过一个月了，这个版本改进了用户界面，使用Python 3来支持插件。很可惜，新版本并没有集成到13.10里面，但是你可以使用PPA来安装它（Ubuntu 13.04也支持）。

![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-3.0.png)

Rhythmox 3.0的新功能：

- 插件现在使用Python 3;
- 新的任务进度显示在曲目列表的下方（可以供很多东西使用包括包括轨道更换和导入作业等）；
- 支持作曲家标签；
- 重新制作了播放控制栏；
- 使用象征性的图片重新设计了源列表；
- 所有东西都更好的优化过；
- 通过不同的公开属性将CBR和VBR编码方式区分开；
- 播放列表设置内容（浏览方式等）保存到playlists.xml文件；
- 在适当情况下更好的使用了RTL图标；
- 修复了IM状态和ReplayGain插件；
- 修复了其他很多漏洞。

能在[这里][1]找到完整的Rhythmbox 3.0更新日志。

### 在Ubuntu 13.10或者13.04下安装Rhythmbox 3.0

![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-3.0_2.png)

*Ubuntu 13.10 (Unity)下的Rhythmbox 3.0*

因为Rhythmbox 3.0的插件使用Python 3而不是Python 2， **[第三方插件 PPA][2]里面的插件都不能在Rhythmbox里面使用了** 。你可以通过手动安装的方式来使用它们中的一些（包括Equalizer插件和超酷的**[CoverArt browser][3]**）

  - 更多信息请看**[这篇][4]**文章。

Rhythmbox 3.0现在可以在一个非官方PPA里面找到，它是由Jacob Zimmermann维护，为Ubuntu 13.10和13.04（及衍生系统）准备。**通过以下命令添加这个PPA然后安装/升级Rhythmbox 3.0**:

    sudo add-apt-repository ppa:jacob/media
    sudo apt-get update
    sudo apt-get install rhythmbox

--------------------------------------------------------------------------------

来自: http://www.webupd8.org/2013/10/install-rhythmbox-30-in-ubuntu-1310-or.html

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[SCUSJS](https://github.com/scusjs) 校对：[Caroline](https://github.com/carolinewuyan)

[1]:http://ftp.acc.umu.se/pub/GNOME/sources/rhythmbox/3.0/rhythmbox-3.0.news
[2]:http://www.webupd8.org/2012/08/rhythmbox-third-party-plugins-ubuntu-ppa.html
[3]:http://www.webupd8.org/2013/08/rhythmbox-coverart-browser-plugin-gets.html
[4]:http://xpressubuntu.wordpress.com/2013/10/06/how-to-install-rhythmbox-3-0-in-saucy/ 
