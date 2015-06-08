20个令人惊叹的桌面Docker容器
================================================================================

大家好，今天我们会列出一些运行在Docker容器中的很棒的桌面软件，我们可以在自己的桌面系统中运行它们。Docker 是一个开源项目，提供了一个可以打包、装载和运行任何应用的轻量级容器的开放平台。它没有语言支持、框架和打包系统的限制，从小型的家用电脑到高端服务器，在何时何地都可以运行。它可以使部署和扩展web应用程序、数据库和后端服务像搭积木一样容易，而不依赖特定技术栈或提供商。它主要是由开发、运维工程师使用的，因为它简单、快速和方便，可以用来测试和辅助开发他们产品，但是我们也可以在桌面环境使用Docker，这样一些桌面程序可以开箱即用。

下边是20个非常棒的桌面软件docker镜像，我们可以使用Docker来运行。

### 1. Lynx ###

Lynx是一个一直以来最受欢迎的文本界面网页浏览器，很多Linux用户都很熟悉它。它应该是现在还在日常和开发环境中被使用的最古老的网页浏览器了。可以使用如下命令运行Lync。

    $ docker run -it \
    --name lynx \
    jess/lynx

### 2. Irssi ###

Irssi是一个非常棒的文本界面IRC客户端。可以使用如下命令运行Irssi。

    docker run -it --name my-irssi -e TERM -u $(id -u):$(id -g) \
    -v $HOME/.irssi:/home/user/.irssi:ro \
    -v /etc/localtime:/etc/localtime:ro \
    irssi

### 3. Chrome ###

Chrome是一个令人惊叹的图形界面网页浏览器，由Google开发，它基于开源的Chromium项目。Google Chrome是一个被广泛使用的、快速安全的网页浏览器，经常上网的人会非常熟悉它。我们可以使用如下命令在Docker中运行Chrome。

    $ docker run -it \
    --net host \
    --cpuset 0 \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/Downloads:/root/Downloads \
    -v $HOME/.config/google-chrome/:/data \
    -v /dev/snd:/dev/snd --privileged \
    --name chrome \
    jess/chrome

### 4. Tor浏览器 ###

Tor浏览器是一个支持匿名访问的网页浏览器。它让我们可以自由地在网络世界遨游，或者浏览被特定组织或者网络服务提供商封锁的网站。它会阻止别人通过监视我们的网络连接来窃取我们在网络上的一举一动以及我们的确切位置。运行如下命令运行Tor浏览器。

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged \
    --name tor-browser \
    jess/tor-browser

### 5. Firefox浏览器 ###

Firefox浏览器是一个自由开源的网页浏览器，它由Mozilla基金会开发。它使用Gecko和SpiderMonkey引擎。Firefox浏览器有很多新特性，并且它以性能和安全性著称。

    $ docker run -d \
    --name firefox \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    kennethkl/firefox

### 6. Rainbow Stream ###

Rainbow Stream是一个文本界面的Twitter客户端，有实时显示tweetstream、搜索、喜欢和更多其他特性，可以直接在终端使用。使用如下命令运行Rainbow Stream。

    $ docker run -it \
    -v /etc/localtime:/etc/localtime \
    -v $HOME/.rainbow_oauth:/root/.rainbow_oauth \
    -v $HOME/.rainbow_config.json:/root/.rainbow_config.json \
    --name rainbowstream \
    jess/rainbowstream

### 7. Gparted ###

Gparted是一个用来给磁盘分区的开源软件。现在可以在Docker容器里享受分区的乐趣了。可以使用如下命令运行gparted。

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/sda:/dev/sda \ # 将设备挂载为分区
    --name gparted \
    jess/gparted

### 8. GIMP图片编辑器 ###

GIMP（Gnu Image Manipulation Program）是一个令人惊叹的Linux图片编辑软件。它是一个可以自由分发的可以处理照片修正、图像合成和图像创作等任务的工具。

    $ docker run -it \
    --rm -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    jarfil/gimp-git

### 9. Thunderbird ###

Thunderbird是一个自由开源的电子邮件软件，它由Mozilla基金会开发和维护。它有众多一个电子邮件软件应该具有的功能。Thunderbird非常易于安装和定制。使用如下命令在Docker中运行Thunderbird。

    $ docker run -d \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -v $HOME/docker-data/thunderbird:/home/docker/.thunderbird/ \
    yantis/thunderbird thunderbird

### 10. Mutt ###

Mutt是一个文本界面的电子邮件客户端，有很多很酷的功能，如彩色支持，IMAP、POP3、SMTP支持，邮件存储支持等。 使用如下命令运行Mutt。

    $ docker run -it \
    -v /etc/localtime:/etc/localtime \
    -e GMAIL -e GMAIL_NAME \
    -e GMAIL_PASS -e GMAIL_FROM \
    -v $HOME/.gnupg:/home/user/.gnupg \
    --name mutt \
    jess/mutt

### 11. Skype ###

Skype是一个支持文字、语音和视频的即时通讯软件，它不是开源的，但在Linux下可以运行的很好。我们同样可以在Docker中运行Skype，使用如下命令。

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/snd:/dev/snd --privileged \
    -e DISPLAY="unix$DISPLAY" \
    tianon/skype

### 12. Cathode ###

Cathode是一个漂亮并且高度可定制的终端模拟器，灵感来自古典计算机。使用如下命令运行Cathode。

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --name cathode \
    jess/1995

### 13. LibreOffice ###

LibreOffice是一个功能强大的办公套件，它是自由开源的，现在由The Document基金会维护。它有干净的界面和强大的功能，让我们释放创造力和提升生产力。LibreOffice将数个应用程序集成在一起，是市面上最强大的自由并且开源的办公套件。

    $docker run \
    -v $HOME/Documents:/home/libreoffice/Documents:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e uid=$(id -u) -e gid=$(id -g) \
    -e DISPLAY=unix$DISPLAY --name libreoffice \
    chrisdaish/libreoffice

### 14. Spotify ###

Spotify可以即时访问数百万的歌曲，从经典老歌到最新单曲。可以使用如下命令在Docker中听我们最喜欢的歌曲。

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged \
    --name spotify \
    jess/spotify

### 15. Audacity ###

Audacity是一个自由开源的跨平台软件，用来录制和编辑音频。Audacity可以用来做所有类型音频（例如podcast）的后期处理，如归一化、调整、淡入淡出。使用如下命令来运行Audacity。

    $ docker run --rm \
    -u $(id -u):$(id -g) \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/snd:/dev/snd \
    -v "$HOME:$HOME" \
    -w "$HOME" \
    -e DISPLAY="unix$DISPLAY" \
    -e HOME \
    $(find /dev/snd/ -type c | sed 's/^/--device /') \
    knickers/audacity

### 16. Eclipse ###

Eclipse是一个集成开发环境。它包含基本的工作区和用来定制环境的可扩展插件系统。它在Java开发者中很流行。

    $ docker run -v ~/workspace/:/home/eclipse/workspace/ \
    -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -d leesah/eclipse

### 17. VLC媒体播放器 ###

VLC是一个自由开源的跨平台多媒体播放器，可以播放本地文件、DVD、CD、VCD和各种流媒体。VLC由VideoLAN组织开发和维护。使用如下命令运行VLC。

    $ docker run -v\
    $HOME/Documents:/home/vlc/Documents:rw \
    -v /dev/snd:/dev/snd --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e uid=$(id -u) -e gid=$(id -g) \
    -e DISPLAY=unix$DISPLAY --name vlc \
    chrisdaish/vlc

### 18. Vim编辑器 ###

Vim是一个高度可配置的文本界面文字编辑器，为高效的文本编辑而生。它是预装在多数UNIX系统中的vi编辑器的改进版本。

    $ docker run -i -t --name my-vim -v ~/:/home/dev/src haron/vim

### 19. Inkscape ###

Inkscape是一个自由开源的矢量图形编辑器。它可以创建、编辑矢量图形，如插图、图示、线条艺术、图表、徽标以及更复杂的绘画。Inkscape使用的主要矢量图形格式是SVG 1.1版本。它也可以导入和导出一些其他的格式，但实际编辑使用的还是SVG格式。

    $docker build -t rasch/inkscape --rm .
    $ docker run --rm -e DISPLAY \
    -u inkscaper
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/home/inkscaper/.Xauthority \
    --net=host rasch/inkscape

### 20. Filezilla ###

Filezilla是一个免费的FTP解决方案，支持FTP、SFTP、FTPS协议。它的客户端是一个功能强大的文件管理工具。它是一个很棒的高度可靠和易用的开源FTP解决方案。

    $ xhost +si:localuser:$(whoami)
    $ docker run \
    -d \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -v /:/host \
    -v $HOME/docker-data/filezilla:/home/docker/.config/filezilla/ \
    yantis/filezilla filezilla

### 总结 ###

使用Docker运行桌面软件真的是很棒的体验。Docker是一个快速、简单的开发平台，适合从家里、办公室到生产环境里传送和开发软件的场景。使用Docker运行桌面软件是试用而不将其安装到自己实体机文件系统中的很酷的方法。如果你有任何问题、评论或者反馈，清写在下方的评论框中，让我们知道哪些是需要增加或者改进的。谢谢！享受Docker吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/20-docker-containers-desktop-user/

作者：[Arun Pyasi][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/