通过PPA在Ubuntu中安装qBittorrent 3.1.0
================================================================================
[qBittorrent][1]是一个由志愿者开发的自由开源的跨平台BT客户端软件，利用libtorrent-rasterbar库由C++/Qt写成，是现在流行的BT客户端软件[µtorrent][2]的一个替代选择。最新的版本，qBittorrent 3.1.0 已经在2013年10月份放出。qBittorrent轻巧快速，支持unicode编码，而且提供一个完美整合的搜索引擎。它也支持UPnP/NAT-PMP端口转发，支持扩展和PeX(兼容utorrent)。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/qbittorrent_about.png)

### qBittorrent v3.1.0 的特性###
- 精心打磨的类µTorrent界面
- 完美整合，可扩展的搜索引擎
- 同时在众多著名BT网站中进行搜索
- 对搜索请求进行预分类（例如，书籍，音乐，电影）
- 支持各种BT扩展
- 可通过web页面进行远程操作
- 可对trackers, peers 和 torrents进行高级控制
- 连接排队和优选
- Torrent内容选择和优选
- 支持UPnP / NAT-PMP端口转发
- 支持大约25中语言（支持Unicode）
- 种子创建工具
- 支持RSS过滤下载（例如正则表达式）
- IP过滤（兼容eMule和PeerGuardian）
- 兼容IPv6
- 顺序下载（也可以叫做按序下载）
- 支持各种平台： Linux，Mac OS X, Windows, OS/2, FreeBSD

### 安装qBittorrent ###

    $ sudo add-apt-repository ppa:hydr0g3n/qbittorrent-stable
    $ sudo apt-get update && sudo apt-get install qbittorrent

你也可以下载[qbittorrent的源代码][3]，然后编译后安装。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/qBittorrent.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-qbittorrent-3-1-0-ubuntu-via-ppa/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.qbittorrent.org/index.php
[2]:http://www.utorrent.com/
[3]:http://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-3.1.0/qbittorrent-3.1.0.tar.gz/download
