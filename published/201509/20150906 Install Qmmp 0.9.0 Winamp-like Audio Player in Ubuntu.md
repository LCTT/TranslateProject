在 Ubuntu 上安装类 Winamp 的音频播放器 Qmmp 0.9.0 
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2015/01/qmmp-icon-simple.png)

Qmmp，一个基于 Qt 的音频播放器，与 Winamp 或 xmms 的用户界面类似，现在最新版本是0.9.0。PPA 已经在 Ubuntu 15.10，Ubuntu 15.04，Ubuntu 14.04，Ubuntu 12.04 和其衍生版本中已经更新了。

Qmmp 0.9.0 是一个较大的版本，有许多新的功能，有许多改进和新的转变。它添加了如下功能：

- 音频-信道序列转换器;
- 9通道支持均衡器;
- 支持艺术家专辑标签;
- 异步排序;
- 不用修改 qmmp.pri 来禁用插件（仅在 qmake 中）功能
- 记住播放列表滚动位置功能;
- 排除 cue 数据文件功能;
- 更改用户代理功能;
- 改变窗口标题功能;
- 禁用 gme 插件淡出的功能;
- 简单用户界面（QSUI）有以下变化：
	- 增加了多列的支持;
	- 增加了按艺术家专辑排序;
	- 增加了按文件的修改日期进行排序;
	- 增加了隐藏歌曲长度功能;
	- 增加了“Rename List”的默认热键;
	- 增加了“Save List”功能到标签菜单;
	- 增加了复位字体功能;
	- 增加了复位快捷键功能;
	- 改进了状态栏;

它还改进了播放列表的改变通知，播放列表容器，采样率转换器，cmake 构建脚本，标题格式化，在 mpeg 插件中支持 ape 标签，fileops 插件，降低了 cpu 占用率，改变默认的皮肤（炫光）和分离的播放列表。

![qmmp-090](http://ubuntuhandbook.org/wp-content/uploads/2015/09/qmmp-090.jpg)

### 在 Ubuntu 中安装 Qmmp 0.9.0 : ###

新版本已经制做了 PPA，适用于目前所有 Ubuntu 发行版和衍生版。

1、 添加 [Qmmp PPA][1].

从 Dash 中打开终端并启动应用，通过按 Ctrl+Alt+T 快捷键。当它打开时，运行命令：

    sudo add-apt-repository ppa:forkotov02/ppa

![qmmp-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/09/qmmp-ppa.jpg)

2、 在添加 PPA 后，通过更新软件来升级 Qmmp 播放器。刷新系统缓存，并通过以下命令安装软件：

    sudo apt-get update
    
    sudo apt-get install qmmp qmmp-plugin-pack

就是这样。尽情享受吧！

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/09/qmmp-0-9-0-in-ubuntu/

作者：[Ji m][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://launchpad.net/~forkotov02/+archive/ubuntu/ppa
