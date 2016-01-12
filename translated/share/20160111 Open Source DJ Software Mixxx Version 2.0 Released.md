开源Dj软件Mixxx 2.0版发布
================================================================================
![](http://itsfoss.com/wp-content/uploads/2016/01/DJ-Software-Mixxx-2-Released.jpg)

时隔三年,开源Dj混音软件[Mixxx][1]再度发布一个大的版本更新----Mixxx 2.0.

Mixxx是一个跨平台的免费开源的Dj混音软件,它几乎提供了当你想自己混音时需要的一切功能.Mixxx近几年在专业人士以及业余爱好者中都很火.

在Mixxx中你能使用你的iTunes音乐库.它的强有力的引擎使它支持多种文件格式.Mixxx默认即支持超过85种MIDI Dj调节器以及少部分HID调节器.它也包含一个自动选项,可以让你在混音时休息一下.

Mixxx的完整功能列表可以在[这里][2]找到.在查看完整列表之前,让我们看看最新版有何更新.

### Mixxx 2.0更新 ###

- 可自定义的用户界面
- 4 轨道混音并且和主轨道同步
- 内置特效
- 谐波混频与音乐按键检测
- RGB 音频波形
- 4 个麦克风输入和 4 个音频输出
- 黑胶音源输入、输出
- 支持自定义封面
- 核心升级
- 升级库文件
- 更先进的Dj 调节器

你可以在[这里][3]中看到所有的新功能.

### 在基于Ubuntu的发行版中安装Mixxx 2.0 ###

Mixxx提供了他们自己的ppa源,这使得在在基于Ubuntu的发行版----如Linux Mint, elementary OS, Zorin OS----安装Mixxx 2.0变得十分简单.

打开终端,并输入如下命令:

    sudo add-apt-repository ppa:mixxx/mixxx
    sudo apt-get update
    sudo apt-get install mixxx
    
使用如下命令卸载Mixxx:

    sudo apt-get remove mixxx
    sudo add-apt-repository --remove ppa:mixxx/mixxx
    
如果你使用老版本的Mixxx.它将很快升级到2.0版.

### 在其他发行版中安装Mixxx 2.0 ###

Archliunx

    sudo pacman -S mixxx

对于其他发行版,你可以从源码编译安装Mixxx.

- [源码地址][4]

由于Mixxx是个跨平台的应用,你也可以下载它的Windows版或者Mac OS 版

- [下载地址][5]

--------------------------------------------------------------------------------

via: http://itsfoss.com/dj-mixxx-2/

作者：[Abhishek][a]
译者：[name1e5s](https://github.com/name1e5s)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://mixxx.org/
[2]:http://mixxx.org/features/
[3]:http://mixxx.org/whats-new-in-mixxx-2-0/
[4]:http://downloads.mixxx.org/mixxx-2.0.0/mixxx-2.0.0-src.tar.gz
[5]:http://mixxx.org/download/
