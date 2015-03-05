在Ubuntu上安装Flow 'N Play—界面独具风格的视频播放器
================================================================================
**Flow ‘N Play**是个用Qt编写的新视频播放器。它有着漂亮又简洁的界面，只提供基本播放功能。

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play.jpg)

[Flow ‘N Play][1]是个比较新的视频播放器，它有着漂亮的界面和简单的操作（2014年3月份第一次发行）。其中一个功能就是能通过拖动鼠标滑动视频列表。播放器带有基本功能，一个搜索功能，支持彩色主题。

打开一个新的视频——你还可以在同一个对话框下自定义一个封面：

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play_open.jpg)

设置对话框——在这里设置基本的选项：

![](http://www.tuxarena.com/wp-content/uploads/2014/11/flow_n_play_settings.jpg)

Flow ‘N Play仍然处在早起开发中，因此相对于更高级的播放器它有一些瑕疵。可以设置的选项少，不支持加载字幕或视频和声音的过滤器。目前，在打开一个新的视频时偶尔会出错或是表现异常。

我相信在它变成一款相当不错的播放器来替代其他播放器之前，还需要再添加几个功能。但从长远来看，Flow ‘N Play很有前途。

### 在Ubuntu 14.04上安装Flow ‘N Play 0.922 ###

在Ubuntu上有几种不同的方法安装Flow ‘N Play，可以用DEB包，或用Bash命令编写的RUN安装文件，或在[Qt-Apps页面][2]上获得单独的二进制安装文件。

要安装Flow ‘N Play得先获取依赖项:

    sudo apt-get install libqt5multimediaquick-p5 qtdeclarative5-controls-plugin qtdeclarative5 qtmultimedia-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-quicklayouts-plugin

然后下载DEB安装包，可以双击或在终端里把正操作的目录换到你保存安装包的目录下并输入以下命令（这个是64位的命令，对于32位的系统请将DEB文件换成32位的）:

    sudo dpkg -i flow-n-play_v0.926_qt-5.3.2_x64.deb 

然后在终端里输入**flow-n-play**来运行它。注意：为防止产生依赖项错误，当你试图安装DEB文件时，你可以运行**sudo apt-get -f install**，这样可以自动获取丢失的依赖项并安装Flow ‘N Play。

若用RUN脚本安装，先安装上边提到的依赖项，然后运行这个脚本:

    wget -O http://www.prest1ge-c0ding.24.eu/programs/Flow-N-Play/v0.926/bin/flow-n-play_v0.926_qt-5.3.2_x64.run
    sudo ./flow-n-play_v0.926_qt-5.3.2_x64.run

第三种方法是手动安装到你选择的地方（在安装完依赖项后下载提供的二进制文件）以32位版本为例:

    wget -O http://www.prest1ge-c0ding.24.eu/programs/Flow-N-Play/v0.926/bin/Flow-N-Play_v0.926_Qt-5.3.2_x86

--------------------------------------------------------------------------------

via: http://www.tuxarena.com/2014/11/flow-n-play-movie-player-has-a-stylish-interface-ubuntu-installation/

作者：Craciun Dan 
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.prest1ge-c0ding.24.eu/programme-php/app-flow_n_play.php?lang=en
[2]:http://qt-apps.org/content/show.php/Flow+%27N+Play?content=167736
