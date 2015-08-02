为 Kodi 自制遥控器
================================================================================
**通过运行在 Android 手机上的自制遥控器来控制你的家庭媒体播放器。**

**Kodi** 是一款很优秀的软件，能够将几乎所有电脑变身成媒体中心。它可以播放音乐和视频，显示图片，甚至还能显示天气预报。为了在配置成家庭影院后方便使用，你可以通过手机 app 访问运行在连接到 Wi-Fi 的 XBMC 机器上的服务来控制它。可以找到很多这种工具，几乎覆盖所有智能手机系统。

> **XBMC**
> 
> Kodi 原名叫做 XBMC，在你阅读这篇文章的时候，**XBMC** 已经成为历史。因为法律原因（因为名字 **XBMC** 或 X**-Box Media Center** 里引用了不再支持的过时硬件）项目组决定使用新的名字 **Kodi**。不过，除了名字，其他的都会保持原样。或者说除开通常新版本中所期待的大量新改进。这一般不会影响到遥控软件，它应该能在已有的 **XBMC** 系统和新的 Kodi 系统上都能工作。

我们目前已经配置好了一个用于播放音乐的 **Kodi** 系统，不过我们找到的所有 Kodi 遥控没一个好用的，特别是和媒体中心连接的电视没打开的时候。它们都有点太复杂了，集成了太多功能在手机的小屏幕上。我们希望能有这样的系统，从最开始就是设计成只用于访问音乐库和电台插件，所以我们决定自己实现一个。它不需要用到 Kodi 的所有功能，因为除了音乐以外的任务，我们可以简单地切换使用通用的 Kodi 遥控。我们的测试系统是一个刷了 RaspBMC 发行版的树莓派，但是我们要做的工具并不受限于树莓派或Kodi那个发行版，它应该可以匹配任何安装了相关插件的基于 Linux 的 Kodi 系统。

首先，遥控程序需要一个用户界面。大多数 Kodi 遥控程序都是独立的 app。不过对于我们要做的这个音乐控制程序，我们希望用户可以不用安装任何东西就可以使用。显然我们需要使用网页界面。Kodi 本身自带网页服务器，但是为了获得更多权限，我们还是使用了独立的网页框架。在同一台电脑上跑两个以上网页服务器没有问题，只不过它们不能使用相同的端口。

有几个网页框架可以使用。而我们选用 Bottle 是因为它是一个简单高效的框架，而且我们也确实用不到任何高级功能。Bottle 是一个 Python 模块，所以这也将是我们编写服务器模块的语言。

你应该能在软件包管理器里找到 Bottle。在基于 Debian 的系统（包括 RaspBMC）里，你可以通过下面的命令安装：

    sudo apt-get install python-bottle

遥控程序实际上只是连接用户和系统的中间层。Bottle 提供了和用户交互的方式，而我们将通过 JSON API 来和 **Kodi** 交互。这样可以让我们通过发送 JSON 格式消息的方式去控制媒体播放器。

我们将用到一个叫做 xbmcjson 的简单 XBMC JASON API 封装。足够用来发送控制请求，而不需要关心实际的 JSON 格式以及和服务器通讯的无聊事。它没有包含在 PIP 包管理中，所以你得直接从 **GitHub** 安装：

    git clone https://github.com/jcsaaddupuy/python-xbmc.git
    cd python-xbmc
    sudo python setup.py install

万事俱备，只欠代码。

#### 先从 Bottle 开始 ####

我们程序的基本结构：

    from xbmcjson import XBMC
    from bottle import route, run, template, redirect, static_file, request
    import os
    xbmc = XBMC("http://192.168.0.5/jsonrpc", "xbmc", "xbmc")
    @route('/hello/<name>')
    def index(name):
    return template('<h1>Hello {{name}}!</h1>', name=name)
    run(host="0.0.0.0", port=8000)

这样程序将连接到 **Kodi**（不过实际上用不到）；然后 Bottle 会开始提供网站服务。在我们的代码里，它将监听主机 0.0.0.0（意味着允许所有主机连接）的端口 8000。它只设定了一个站点，就是 /hello/XXXX，这里的 XXXX 可以是任何内容。不管 XXXX 是什么都将作为参数名传递给 index()。然后再替换进去 HTML 网页模版。

你可以先试着把上面内容写到一个文件（我们取的名字是 remote.py），然后用下面的命令启动：

    python remote.py

然后你可以在浏览器里访问 localhost:8000/hello/world 看看模版生效的效果。

@route() 用来设定网页服务器的路径，而函数 index() 会返回该路径的数据。通常是返回由模版生成的 HTML 页面，但是并不是说只能这样（后面会看到）。

随后，我们将给应用添加更多页面入口，让它变成一个全功能的 Kodi 遥控，但仍将采用相同代码结构。

XBMC JSON API 接口可以从和 Kodi 机器同网段的任意电脑上访问。也就是说你可以在自己的笔记本上开发，然后再布置到媒体中心上，而不需要浪费时间上传每次改动。

模版 - 比如前面例子里的那个简单模版 - 是一种结合 Python 和 HTML 来控制输出的方式。理论上，这俩能做很多很多事，但是会非常混乱。我们将只是用它们来生成正确格式的数据。不过，在开始动手之前，我们先得准备点数据。

> **Paste**
> 
> Bottle 自带网页服务器，我们用它来测试遥控程序。不过，我们发现它性能有时不够好。当我们的遥控程序正式上线时，我们希望页面能更快一点显示出来。Bottle 可以和很多不同的网页服务器配合工作，而我们发现 Paste 用起来非常不错。而要使用的话，只要简单地安装（Debian 系统里的 python-paste 包），然后修改一下代码里的 run 调用：
> 
>     run(host=hostname, port=hostport, server="paste")
> 
> 你可以在 [http://bottlepy.org/docs/dev/deployment.html][1] 找到如何使用其他服务器的相关细节。

#### 从 Kodi 获取数据 ####

XBMC JSON API 分成 14 个命名空间：JSONRPC, Player, Playlist, Files, AudioLibrary, VideoLibrary, Input, Application, System, Favourites, Profiles, Settings, Textures 和 XBMC。每个都可以通过 Python 的 XBMC 对象访问（Favourites 除外，明显是个疏忽）。每个命名空间都包含许多方法用于对程序的控制。例如，Playlist.GetItems() 可以用来获取某个特定播放列表的内容。服务器会返回给我们 JSON 格式的数据，但 xbmcjson 模块会为我们转化成 Python 词典。

我们需要用到 Kodi 里的两个组件来控制播放：播放器和播放列表。播放器处理播放列表并在每首歌结束时从列表里取下一首。为了查看当前正在播放的内容，我们需要获取正在工作的播放器的 ID，然后根据它找到当前播放列表的 ID。这个可以通过下面的代码来实现：

    def get_playlistid():
    player = xbmc.Player.GetActivePlayers()
    if len(player['result']) > 0:
    playlist_data = xbmc.Player.GetProperties({"playerid":0, "properties":["playlistid"]})
    if len(playlist_data['result']) > 0 and "playlistid" in playlist_data['result'].keys():
    return playlist_data['result']['playlistid']
    return -1

如果当前没有播放器在工作（就是说，返回数据的结果部分的长度是 0），或者当前播放器没有处理播放列表，这样的话函数会返回 -1。其他时候，它会返回当前播放列表的数字 ID。

当我们拿到当前播放列表的 ID 后，就可以获取该列表的细节内容。按照我们的需求，有两个重要的地方：播放列表里包含的项，以及当前播放所处的位置（已经播放过的项并不会从播放列表移除，只是移动当前播放位置）。

    def get_playlist():
    playlistid = get_playlistid()
    if playlistid >= 0:
    data = xbmc.Playlist.GetItems({"playlistid":playlistid, "properties": ["title", "album", "artist", "file"]})
    position_data = xbmc.Player.GetProperties({"playerid":0, 'properties':["position"]})
    position = int(position_data['result']['position'])
    return data['result']['items'][position:], position
    return [], -1

这样可以返回正在播放的项开始的列表（因为我们并不关心已经播放过的内容），而且也包含了用来从列表里移除项的位置信息。

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/04/xbmc2-large.jpg)

API 文档在这里：[http://wiki.xbmc.org/?title=JSON-RPC_API/v6][2]。它列出了所有支持的函数，但是关于具体如何使用的描述有点太简单了。

> **JSON**
> 
> JSON 是 JavaScript Object Notation 的缩写，最初设计用于 JavaScript 对象的序列化。目前仍然起到这个作用，但是它也是用来编码任意数据的一种很好用的方式。
> 
> JSON 对象都是这样的格式：
> 
>     {property1:value1, property2:value2, property3:value3}
> 
> 支持任意数目的属性/值配对。对 Python 程序员来说，看上去和字典数据结构很相似，不过这两个确实很像。
> 
> 在字典数据结构里，值本身可以是另一个 JSON 对象，或者一个列表，所以下面的格式也是正确的：
> 
>     {"name":"Ben", "jobs":["cook", "bottle-washer"], "appearance": {"height":195, "skin":"fair"}}
> 
> JSON 通常在网络服务中用来发送和接收数据，并且大多数编程语言都能很好地支持，所以如果你熟悉 Python 的话，你应该可以使用你熟悉的编程语言调用相同的接口来轻松地控制  Kodi。

#### 整合到一起 ####

把之前的功能连接到 HTML 页面很简单：

    @route('/juke')
    def index():
    current_playlist, position = get_playlist()
    return template('list', playlist=current_playlist, offset = position)

只需要抓取播放列表（调用我们之前定义的函数），然后将结果传递给负责显示的模版。

负责显示列表数据的模版的主要部分是：

    <h2>Currently Playing:</h2>
    % if playlist is not None:
    % position = offset
    % for song in playlist:
    <strong> {{song['title']}} </strong>
    % if song['type'] == 'unknown':
    Radio
    % else:
    {{song['artist'][0]}}
    % end
    % if position != offset:
    <a href="/remove/{{position}}">remove</a>
    % else:
    <a href="/skip/{{position}}">skip</a>
    % end
    <br>
    % position += 1
    % end

可以看到，模版大部分是用 HTML 写的，只有一小部分用来控制输出的其他代码。用两个大括号括起来的变量是输出位置（像我们在第一个 'hello world' 例子里看到的）。你也可以嵌入以百分号开头的 Python 代码。因为没有缩进，你需要用一个 `% end` 来结束当前的代码块（就像循环或 if 语句）。

这个模版首先检查列表是否为空，然后遍历里面的每一项。每一项会用粗体显示歌曲名字，然后是艺术家名字，然后是一个是否跳过（如果是当前正在播的歌曲）或从列表移除的链接。所有歌曲的类型都是 'song'，如果类型是 'unknown'，那就不是歌曲而是网络电台。

/remove/ 和 /skip/ 路径只是简单地封装了 XBMC 控制功能，在改动生效后重新加载 /juke：

    @route('/skip/<position>')
    def index(position):
    print xbmc.Player.GoTo({'playerid':0, 'to':'next'})
    redirect("/juke")
    @route('/remove/<position>')
    def index(position):
    playlistid = get_playlistid()
    if playlistid >= 0:
    xbmc.Playlist.Remove({'playlistid':int(playlistid), 'position':int(position)})
    redirect("/juke")

当然，如果不能往列表里添加歌曲的话那这个列表管理功能也不行。

因为一旦播放列表结束，它就消失了，所以你需要重新创建一个，这会让事情复杂一些。而且有点让人迷惑的是，播放列表是通过调用 Playlist.Clear() 方法来创建的。这个方法也还用来删除包含网络电台（类型是 unknown）的播放列表。另一个麻烦的地方是列表里的网络电台开始播放后就不会停，所以如果当前在播网络电台，也会需要清除播放列表。

这些页面包含了指向 /play/\<songid> 的链接来播放歌曲。通过下面的代码处理：

    @route('/play/<id>')
    def index(id):
    playlistid = get_playlistid()
    playlist, not_needed= get_playlist()
    if playlistid < 0 or playlist[0]['type'] == 'unknown':
    xbmc.Playlist.Clear({"playlistid":0})
    xbmc.Playlist.Add({"playlistid":0, "item":{"songid":int(id)}})
    xbmc.Player.open({"item":{"playlistid":0}})
    playlistid = 0
    else:
    xbmc.Playlist.Add({"playlistid":playlistid, "item":{"songid":int(id)}})
    remove_duplicates(playlistid)
    redirect("/juke")

最后一件事情是实现 remove_duplicates 调用。这并不是必须的 - 而且还有人并不喜欢这个 - 不过可以保证同一首歌不会多次出现在播放列表里。

我们也实现了一些页面用来列出收藏歌曲里所有艺术家，以及列出指定艺术家的歌曲和专辑。这些都非常简单，和 /juke 页面基本类似。

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/04/xbmc1-large.jpg)

还需要处理一下 UI，不过功能已经有了。

> **日志**
> 
> 通常拿到 XBMC JSON API 并不清楚能用来做什么，而且它的文档也有点模糊。找出如何使用的一种方式是看别的遥控程序是怎么做的。如果打开日志功能，就可以在使用其他遥控程序的时候看到哪个 API 被调用了，然后就可以应用到在自己的代码里。
> 
> 要打开日志功能，把 Kodi 媒体中心 接到显示器上，再依次进入设置 > 系统 > 调试，打开允许调试日志。在打开日志功能后，还需要登录到 Kodi 机器上（比如通过 SSH），然后就可以查看日志了。日志文件的位置应该显示在 Kodi 界面左上角。在 RaspBMC 系统里，文件位置是 /home/pi/.xbmc/temp/xbmc.log。你可以通过下面的命令实时监视哪个 API 接口被调用了：
> 
>     cd /home/pi/.xbmc/temp
>     tail -f xbmc.log | grep "JSON"

#### 增加功能 ####

上面的代码都是用来播放 Kodi 媒体库里的歌曲的，但我们还希望能播放网络电台。每个插件都有自己的独立 URL 可以通过普通的 XBMC JSON 命令来获取信息。举个例子，要从电台插件里获取选中的电台，可以使用；

    @route('/radio/')
    def index():
    my_stations = xbmc.Files.GetDirectory({"directory":"plugin://plugin.audio.radio_de/stations/my/", "properties":
    ["title","thumbnail","playcount","artist","album","episode","season","showtitle"]})
    if 'result' in my_stations.keys():
    return template('radio', stations=my_stations['result']['files'])
    else:
    return template('error', error='radio')

这样可以返回一个可以和歌曲一样能添加到播放列表的文件。不过，这些文件能一直播下去，所以（之前说过）在添加其他歌曲的时候需要重新创建列表。

#### 共享歌曲 ####

除了伺服页面模版，Bottle 还支持静态文件，方便用于那些不会因为用户输入而改变的内容。可以是 CSS 文件，一张图片或是一首 MP3 歌曲。在我们的简单遥控程序里（目前）还没有任何用来美化的 CSS 或图片，不过我们增加了一个下载歌曲的途径。这个可以让媒体中心变成一个存放歌曲的 NAS 盒子。在需要传输大量数据的时候，最好还是用类似 Samba 的功能，但只是下几首歌到手机上的话使用静态文件也是很好的方式。

通过歌曲 ID 来下载的 Bottle 代码：

    @route('/download/<id>')
    def index(id):
    data = xbmc.AudioLibrary.GetSongDetails({"songid":int(id), "properties":["file"]})
    full_filename = data['result']['songdetails']['file']
    path, filename = os.path.split(full_filename)
    return static_file(filename, root=path, download=True)

应用的时候，只需要为 /songsby/ 页面里的相应 ID 加个链接。

我们已经把所有的代码过了一遍，不过还需要一点工作来把它们集合到一起。可以自己去 GitHub 页面 [https://github.com/ben-ev/xbmc-remote][3] 看下。

> **设置**
> 
> 我们的遥控程序已经开发完成，还需要保证让它在媒体中心每次开机的时候都能启动。有几种方式，最简单的是在 /etc/rc.local 里增加一行命令来启动。我们的文件位置在 /opt/xbmc-remote/remote.py，其他文件也和它一起。然后在 /etc/rc.local 最后的 exit 0 之前增加了下面一行。
> 
>     cd /opt/xbmc-remote && python remote.py &

> **GitHub**
> 
> 这个项目目前还只是个架子，但是 - 我们运营杂志就意味着没有太多自由时间来编程。不过，我们启动了一个 GitHub 项目，希望能持续完善， 而如果你觉得这个项目有用的话，欢迎做出贡献。
> 
> 要查看最新的进展，请访问 [https://github.com/ben-ev/xbmc-remote][4] 看看所处的状态。你可以从页面里获取最新的代码，或者通过命令行复制。
> 
> 如果你希望改善它，可以复制项目到你自己的分支开发，然后在功能完成后发起合并请求。关于如何使用 GitHub 的更多信息，请访问 [https://github.com/features][5]。

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/xbmc-build-a-remote-control/

作者：[Ben Everard][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/ben_everard/
[1]:http://bottlepy.org/docs/dev/deployment.html
[2]:http://wiki.xbmc.org/?title=JSON-RPC_API/v6
[3]:https://github.com/ben-ev/xbmc-remote
[4]:https://github.com/ben-ev/xbmc-remote
[5]:https://github.com/features
