如何在Linux命令行中下载GOG游戏
================================================================================
如果你是一个游戏玩家同时也是一个Linux用户，你可能很高兴在[GOG][1]在几个月前宣布它会在你最喜欢的操作系统上推出游戏。如果你之前从来没有听说过GOG，我鼓励你看看他们的产品目录中的“很棒的老游戏”，价格合理，无DRM限制，而且充满了很棒的东西。虽然Windows上的GOG客户端已经存在了很长的时间，但是官方的Linux版本客户端却是无处可见。因此，如果你不想等待官方的正式版本，一个名为LGOGDownloader非官方的开放源码计划能让你在命令行中访问你的库。

![](https://farm4.staticflickr.com/3843/15121593356_b13309c70f_z.jpg)

### 在Linux中安装 LGOGDownloader ###

对于Ubuntu用户来说，其[官方页面][2]建议您下载源代码并执行：

    $ sudo apt-get install build-essential libcurl4-openssl-dev liboauth-dev libjsoncpp-dev libhtmlcxx-dev libboost-system-dev libboost-filesystem-dev libboost-regex-dev libboost-program-options-dev libboost-date-time-dev libtinyxml-dev librhash-dev help2man
    $ tar -xvzf lgogdownloader-2.17.tar.gz
    $ cd lgogdownloader-2.17
    $ make release
    $ sudo make install 

如果你是ArchLinux用户。有一个[AUR 包][2]等着你：

### LGOGDownloader 的使用###

一旦安装了该程序，你需要用下面的命令登录：

    $ lgogdownloader --login 

![](https://farm6.staticflickr.com/5593/15121593346_9c5d02d5ce_z.jpg)

如果你需要配置文件，那它在这里：~/.config/lgogdownloader/config.cfg

验证通过后，你可以列出你库中所有的游戏：

    $ lgogdownloader --list 

![](https://farm6.staticflickr.com/5581/14958040387_8321bb71cf.jpg)

用下面的命令下载游戏：

    $ lgogdownloader --download --game [game name] 

![](https://farm6.staticflickr.com/5585/14958040367_b1c584a2d1_z.jpg)

你可以注意到lgogdownloader允许你恢复之前中断的下载，这当下载的游戏并不小时是很有用的。

像每一个可敬的命令行实用程序，您可以添加各种选项：

- **--platform [number]** 选择您的操作系统，1是 Windows， 4是Linux。
- **--directory [destination]** 下载安装包到指定的目录。
- **--language [number]** 下载特定的语言包 (根据你的语言查阅手册上对应的数字)。
- **--limit-rate [speed]** 限制下载速度。

一个额外的福利，lgogdownloader同样可以检查GOG网站上的更新：

    $ lgogdownloader --update-check 

![](https://farm4.staticflickr.com/3882/14958035568_7889acaef0.jpg)

结果将列出论坛上收到的私人邮件的数量以及更新的游戏数量。

最后，lgogdownloader是非常标准的命令行实用工具。我甚至可以说，它是清晰和连贯性的一个缩影。我们距离Steam Linux客户端的确还差的很远，但在另一方面，官方GOG Windows客户端不会做的比这个非官方的Linux版本更多。换句话说lgogdownloader是一个完美的替代品。我等不及要看到GOG上更多的Linux兼容游戏，尤其是在他们最近公告称会提供的无DRM电影，会有视频游戏的专题。希望在电影目录中有游戏库时能在客户端看到更新。

你觉得GOG怎么样？你会使用非官方的Linux客户端么？让我们在评论中知道你的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/download-gog-games-command-line-linux.html

作者：[Adrien Brochard][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://www.gog.com/
[2]:https://sites.google.com/site/gogdownloader/home
[3]:https://aur.archlinux.org/packages/lgogdownloader/