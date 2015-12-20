Linux/Unix桌面趣事：猫和老鼠在屏幕中追逐
================================================================================
Oneko是一个有趣的app。它会把你的光标变成一直老鼠,并在后面创建一个可爱的小猫，并且始终在老鼠光标后面追着。单词“neko”再日语中的意思是老鼠。它最初是作为Macintosh桌面附件由一位日本人开发的。

### 安装 oneko ###

试下下面的命令：

    $ sudo apt-get install oneko

示例输出：

    [sudo] password for vivek:
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      oneko
    0 upgraded, 1 newly installed, 0 to remove and 10 not upgraded.
    Need to get 38.6 kB of archives.
    After this operation, 168 kB of additional disk space will be used.
    Get:1 http://debian.osuosl.org/debian/ squeeze/main oneko amd64 1.2.sakura.6-7 [38.6 kB]
    Fetched 38.6 kB in 1s (25.9 kB/s)
    Selecting previously deselected package oneko.
    (Reading database ... 274152 files and directories currently installed.)
    Unpacking oneko (from .../oneko_1.2.sakura.6-7_amd64.deb) ...
    Processing triggers for menu ...
    Processing triggers for man-db ...
    Setting up oneko (1.2.sakura.6-7) ...
    Processing triggers for menu ...

FreeBSD用户输入下面的命令安装oneko：

    # cd /usr/ports/games/oneko
    # make install clean

### 我该如何使用oneko？ ###

Simply type the following command:
输入下面的命令：

    $ oneko

你可以把猫变成“tora-neko”，一只像白老虎条纹的猫：

    $ oneko -tora

### 不喜欢猫? ###

你可以用狗代替猫：

    $ oneko -dog

下面可以用樱花代替猫：

    $ oneko -sakura

用大道寺代替猫：

    $ oneko -tomoyo

### 查看相关媒体 ###

这个教程同样也有视频格式：

注：youtube 视频
<iframe width="596" height="335" frameborder="0" allowfullscreen="" src="http://www.youtube.com/embed/Nm3SkXThL0s"></iframe>

(Video.01: 示例 - 在Linux下安装和使用oneko)

### 其他选项 ###

You can pass the following options:
你可以传入下面的选项

1.**-tofocus**：让猫再聚焦的窗口顶部奔跑。当聚焦的窗口不在视野中时，猫像平常那样追逐老鼠。
2. **-position 坐标** ：指定X和Y来调整猫相对老鼠的位置
3. **-rv**：将前景色和背景色对调
4. **-fg 颜色** : 前景色 (比如 oneko -dog -fg red)。
5. **-bg 颜色** : 背景色 (比如 oneko -dog -bg green)。
6. 查看oneko的手册获取更多信息。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/oneko-app-creates-cute-cat-chasing-around-your-mouse/

作者：Vivek Gite 
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
