开源媒体播放器 MPlayer 1.2 发布
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/MPlayer-1.2.jpg)

在 [MPlayer][1] 1.1 发布将近3年后，新版 MPlayer 终于在上周发布了。在新版本 MPlayer 1.2 中带来了对许多新编码的解码支持。

MPlayer 是一款跨平台的开源媒体播放器。它的名字是“Movie Player”的缩写。MPlayer 是 Linux 上最老牌的媒体播放器之一，在过去的15年里，它还带动出现了许多其他媒体播放器。著名的基于 MPlayer 的媒体播放器有：

- [MPV][2]
- SMPlayer
- KPlayer
- GNOME MPlayer
- Deepin Player（深度影音）

#### MPlayer 1.2 更新了些什么？ ####

- 兼容 FFmpeg 2.8
- 对 H.265/HEVC 的 VDPAU 硬件加速
- 通过 FFmpeg 支持一些新的编码解码
- 改善电视与数字视频广播支持
- 界面优化
- libdvdcss/libdvdnav 包外部依赖

#### 在 Linux 安装 MPlayer 1.2 ####

大多数 Linux 发行版仓库中还是 MPlayer 1.1 版本。如果你想使用新的 MPlayer 1.2 版本，你需要从源码手动编译，这对新手来说可能有点棘手。

我是在 Ubuntu 15.04 上安装的 MPlayer 1.2。除了需要安装 yasm 的地方以外，对所有 Linux 发行版来说安装说明都是一样的。

打开一个终端，运行下列命令：

    wget http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.2.tar.xz
    tar xvf MPlayer-1.1.1.tar.xz
    cd MPlayer-1.2
    sudo apt-get install yasm
    ./configure

在你运行 make 的时候，在你的终端屏幕上会显示一些东西，并且你需要一些时间来编译它。保持耐心。

    make
    sudo make install

如果你觉得从源码编译不大习惯的话，我建议你等待 MPlayer 1.2 提交到你的 Linux 发行版仓库中，或者用其它的播放器替代，比如 MPV。

--------------------------------------------------------------------------------

via: http://itsfoss.com/mplayer-1-2-released/

作者：[Abhishek][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://www.mplayerhq.hu/
[2]:http://mpv.io/
