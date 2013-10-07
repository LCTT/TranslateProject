rtorrent - 强大的命令行BT客户端
============================

如果你不使用torrent命令行客户端是担心它太复杂，那么，请重新考虑下。我相信一旦使用过了基于命令行的BT客户端，你就会离不开它：你可以非常轻松地在你的终端窗口启动和监控进度。在这篇文章中,我们将会介绍一个强大的命令行BT客户端 - **rtorrent** 。

**NOTE** - 文中展示的所有示例和指令都已经在Ubuntu 13.04中测试过。

##rtorrent - 命令行BT客户端

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-main.png)

###简明教程

rtorrent 是一个用来轻松下载文件的命令行BT客户端(基于ncurses). 安装这个BT客户端之后,可以用下面命令运行它:

    rtorrent

这有一个运行rtorrent后的窗口的截图:

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-3.png)


好吧,我同意这个主窗口看起来并不是很美观，而且显示的信息有一点点混乱。不要担心,只要在你的键盘上按下enter就会有一个提示出现在窗口底部.

这是截图:

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-4.png)

注意这个出现在屏幕上的提示load.normal>，下一步仅需输入torrent文件的名字。例如，我输入这个torrent文件名 **Fedora-20-Alpha-x86_64-DVD.torrent**.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-6.png)

注意你只需要输入torrent文件名(如果不在当前目录的话,那就要输入完整的路径)。你可以轻松的使用bash的快捷键比如[TAB]来补全文件名和路径。之后，再次按下enter。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-7.png)

现在你可以看到torrent文件已经加载了，但是你需要激活它，让它开始下载。怎么做呢？首先按下向下箭头键。现在应该在之前加载文件的详细信息前面上显示了一个星号（译者注：表示选中）。 

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-8.png)

注意在torrent文件信息开头显示的星号，现在，按下 **Ctrl+s** 开始下载。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-9.png)

rtorrent现在已经开始下载当前文件了。用 **Ctrl+d** 停止下载，再用一次 **Ctrl+d** 可以移除torrent任务，即卸载它。用 **Ctrl+q** 退出rtorrent。 

你可以看到尽管基于命令行，但是事实上操作rtorrent并不是很难。

###下载/安装

一些重要的关于rtorrent的链接:

- [主页][5]
- [下载链接][6]


Ubuntu 用户可以从Ubuntu软件中心下载rtorrent. 现在使用的版本是0.9.2.

rtorrent 下载安装之后，你必须设置一个资源文件(配置文件) - **.rtorrent.rc** 。这个文件必须存在，否则程序无法正常启动。下图就是我没有设置 **~/.rtorrent.rc** 运行程序的结果。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-1.png)

你可以看到程序显示了一个不能读取到资源文件的错误。设置这个文件，首先下载[文件模板][1]，根据需求改一改。

注意 - 我上面提到的链接是官方的下载链接。这个文件和我的 ~/.rtorrent.rc有一点不同。

这是我使用的资源文件:

    # For temporary downloaded files
    # 临时下载文件
    directory = ~/rTempDownloadFiles

    # Directory to save and resume torrent sessions
    # 保存和恢复torrent会话的目录
    session = ~/rSession

    # Other Tunables
    # 其它可调参数
    upload_rate = 30
    download_rate = 200
    peer_exchange = yes

    # DHT enabled
    # 开启DHT
    dht = auto

    # custom throttles
    # 自定义阀门(译者注:流量限制)
    throttle_up = low,10
    throttle_down = low,10
    throttle_up = med,20
    throttle_down = med,20

    # Watch a directory for new torrents, restart torrents that have been
    # 监控目录中新的torrent, 重新启动torrent
    # copied back and stop those that have been deleted.
    # 复制并且阻止已经删除的.

    schedule = watch_directory,0,10,load_start=~/rWatch/*.torrent
    schedule = tied_directory,10,10,start_tied=
    schedule = untied_directory,10,10,close_untied=

    # Enable the default ratio group
    # 启用默认比率组
    ratio.enable=

    # Change the limits, the defaults should be sufficient.
    # 改变限制,默认应该足够
    ratio.min.set=50
    ratio.max.set=150
    ratio.upload.set=20M

    # Changing the command triggered when the ratio is reached.
    # 当比值达到,改变命令触发
    system.method.set = group.seeding.ratio.command, d.close=, d.erase=

    # Move finished torrents to completed
    # 移走完成的torrent
    system.method.set_key = event.download.finished,rm_torrent,”execute=rm,$d.get_tied_to_file=”
    system.method.set_key = event.download.finished,move_complete,”execute=mv,-u,$d.get_base_path=,~/rFullDownloadFiles/ ;d.set_directory=~/rFullDownloadFiles/”

注意 - 这个资源文件引用自[这个链接][2].

要使用这个资源文件,不要忘记运行下面的命令(建立资源文件中提到的目录):

    mkdir /home/<your-username>/rTempDownloadFiles
    mkdir /home/<your-username>/rFullDownloadFiles
    mkdir /home/<your-username>/rSession
    mkdir /home/<your-username>/rWatch

用你自己的用户名替换 <your-username>。还有，确保资源文件的名字是 **.rtorrent.rc** (前面有一个点) 不是 **rtorrent.rc**，把它保存在你的home目录(我的是/home/himashu).

想知道更多关于使用rtorren，请读[用户指南][3]。还可以在rtorrent中浏览[详细教程][4]。

###结论

rtorrent 是为那些想要用命令行BT客户端来代替基于GUI的客户端的用户准备的。虽然它需要为初始化配置付出一些时间并且需要一些操作来习惯，但是这些时间是值得的。尝试一下，它一定会给你留下深刻印象。

**优点**

- 功能丰富
- 大量的自定义选项

**缺点**

- 初始配置时需要一点时间
- 用户可能需要一些时间来习惯

*你使用基于CLI的BT客户端吗?它有什么优势和弊端?和我们分享你的经历。*

---

via: http://mylinuxbook.com/rtorrent-bit-torrent-client/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf01]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:http://libtorrent.rakshasa.no/export/1170/trunk/rtorrent/doc/rtorrent.rc
[2]:http://ankursinha.fedorapeople.org/misc/rtorrentconf/rtorrent.rc
[3]:http://libtorrent.rakshasa.no/wiki/RTorrentUserGuide
[4]:http://fsk141.com/rtorrent-the-complete-guide/
[5]:http://libtorrent.rakshasa.no/
[6]:http://libtorrent.rakshasa.no/wiki/Download
