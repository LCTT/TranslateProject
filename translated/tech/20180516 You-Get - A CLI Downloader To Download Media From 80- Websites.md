You-Get - 支持 80+ 网站的命令行多媒体下载器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/you-get-1-720x340.jpg)

你们大多数人可能用过或听说过 **Youtube-dl**，这个命令行程序可以从包括 Youtube 在内的 100+ 网站下载视频。我偶然发现了一个类似的工具，名字叫做 **"You-Get"**。这是一个 Python 编写的命令行下载器，可以让你从 Youtube，Facebook，Twitter 等很多热门网站下载图片，音频和视频。目前该下载器支持 80+ 站点，点击[**这里**][1]查看所有支持的网站。

You-Get 不仅仅是一个下载器，它还可以将在线视频导流至你的视频播放器。更进一步，它还允许你在 Google 上搜索视频，只要给出搜索项，You-Get 使用 Google 搜索并下载相关度最高的视频。另外值得一提的特性是，它允许你暂停和恢复下载过程。它是一个完全自由、开源及跨平台的应用，适用于 Linux，MacOS 及 Windows。

### 安装 You-Get

确保你已经安装如下依赖项：

+ Python 3
+ FFmpeg (强烈推荐) 或 Libav
+ (可选) RTMPDump

有多种方式安装 You-Get，其中官方推荐采用 pip 包管理器安装。如果你还没有安装 pip，可以参考如下链接：

[如何使用 pip 管理 Python 软件包][2]

需要注意的是，你需要安装 Python 3 版本的 pip。

接下来，运行如下命令安装 You-Get：
```
$ pip3 install you-get

```

可以使用命令升级 You-Get 至最新版本：
```
$ pip3 install --upgrade you-get

```

### 开始使用 You-Get

使用方式与 Youtube-dl 工具基本一致。

**下载视频**

下载视频，只需运行：
```
$ you-get https://www.youtube.com/watch?v=HXaglTFJLMc

```

输出示例：
```
site: YouTube
title: The Last of The Mohicans by Alexandro Querevalú
stream:
 - itag: 22
 container: mp4
 quality: hd720
 size: 56.9 MiB (59654303 bytes)
 # download-with: you-get --itag=22 [URL]

Downloading The Last of The Mohicans by Alexandro Querevalú.mp4 ...
 100% ( 56.9/ 56.9MB) ├███████████████████████████████████████████████████████┤[1/1] 752 kB/s

```

下载视频前，你可能希望查看视频的细节信息。You-Get 提供了 **“–info”** 或 **“-i”** 参数，使用该参数可以获得给定视频所有可用的分辨率和格式。
```
$ you-get -i https://www.youtube.com/watch?v=HXaglTFJLMc

```

或者
```
$ you-get --info https://www.youtube.com/watch?v=HXaglTFJLMc

```

输出示例如下：
```
site: YouTube
title: The Last of The Mohicans by Alexandro Querevalú
streams: # Available quality and codecs
 [ DASH ] ____________________________________
 - itag: 137
 container: mp4
 quality: 1920x1080
 size: 101.9 MiB (106816582 bytes)
 # download-with: you-get --itag=137 [URL]

- itag: 248
 container: webm
 quality: 1920x1080
 size: 90.3 MiB (94640185 bytes)
 # download-with: you-get --itag=248 [URL]

- itag: 136
 container: mp4
 quality: 1280x720
 size: 56.9 MiB (59672392 bytes)
 # download-with: you-get --itag=136 [URL]

- itag: 247
 container: webm
 quality: 1280x720
 size: 52.6 MiB (55170859 bytes)
 # download-with: you-get --itag=247 [URL]

- itag: 135
 container: mp4
 quality: 854x480
 size: 32.2 MiB (33757856 bytes)
 # download-with: you-get --itag=135 [URL]

- itag: 244
 container: webm
 quality: 854x480
 size: 28.0 MiB (29369484 bytes)
 # download-with: you-get --itag=244 [URL]

[ DEFAULT ] _________________________________
 - itag: 22
 container: mp4
 quality: hd720
 size: 56.9 MiB (59654303 bytes)
 # download-with: you-get --itag=22 [URL]

```

默认情况下，You-Get 会下载标记为 **DEFAULT** 的格式。如果你对格式或分辨率不满意，可以选择你喜欢的格式，使用格式对应的 itag 值即可。
```
$ you-get --itag=244 https://www.youtube.com/watch?v=HXaglTFJLMc

```

**下载音频**

执行下面的命令，可以从 soundcloud 网站下载音频：
```
$ you-get 'https://soundcloud.com/uiceheidd/all-girls-are-same-999-prod-nick-mira'
Site: SoundCloud.com
Title: ALL GIRLS ARE THE SAME (PROD. NICK MIRA)
Type: MP3 (audio/mpeg)
Size: 2.58 MiB (2710046 Bytes)

Downloading ALL GIRLS ARE THE SAME (PROD. NICK MIRA).mp3 ...
 100% ( 2.6/ 2.6MB) ├███████████████████████████████████████████████████████┤[1/1] 983 kB/s

```

查看音频文件细节，使用 **-i** 参数：
```
$ you-get -i 'https://soundcloud.com/uiceheidd/all-girls-are-same-999-prod-nick-mira'

```

**下载图片**

运行如下命令下载图片：
```
$ you-get https://pixabay.com/en/mountain-crumpled-cyanus-montanus-3393209/

```

You-Get 也可以下载网页中的全部图片：
You-Get can also download all images from a web page.
```
$ you-get https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/

```

**搜索视频**

你只需向 You-Get 传递一个任意的搜索项，而无需给出有效的 URL；You-Get 会使用 Google 搜索并下载与你给出搜索项最相关的视频。(译者注：Google 的机器人检测机制可能导致 503 报错导致该功能无法使用）。
```
$ you-get 'Micheal Jackson'
Google Videos search:
Best matched result:
site: YouTube
title: Michael Jackson - Beat It (Official Video)
stream:
 - itag: 43
 container: webm
 quality: medium
 size: 29.4 MiB (30792050 bytes)
 # download-with: you-get --itag=43 [URL]

Downloading Michael Jackson - Beat It (Official Video).webm ...
 100% ( 29.4/ 29.4MB) ├███████████████████████████████████████████████████████┤[1/1] 2 MB/s

```

**观看视频**

You-Get 可以将在线视频导流至你的视频播放器或浏览器，跳过广告和评论部分。（译者注：使用 -p 参数需要对应的 vlc/chrominum 命令可以调用，一般适用于具有图形化界面的操作系统）。

以 VLC 视频播放器为例，使用如下命令在其中观看视频：
```
$ you-get -p vlc https://www.youtube.com/watch?v=HXaglTFJLMc

```

或者
```
$ you-get --player vlc https://www.youtube.com/watch?v=HXaglTFJLMc

```

类似地，将视频导流至以 chromium 为例的浏览器中，使用如下命令：
```
$ you-get -p chromium https://www.youtube.com/watch?v=HXaglTFJLMc

```

![][3]

在上述屏幕截图中，可以看到并没有广告和评论部分，只是一个包含视频的简单页面。

**设置下载视频的路径及文件名**

默认情况下，使用视频标题作为默认文件名，下载至当前工作目录。当然，你可以按照你的喜好进行更改，使用 **–output-dir/-o** 参数可以指定路径，使用 **–output-filename/-O** 参数可以指定下载文件的文件名。
```
$ you-get -o ~/Videos -O output.mp4 https://www.youtube.com/watch?v=HXaglTFJLMc

```

**暂停和恢复下载**

按 **CTRL+C** 可以取消下载。一个以 **.download** 为扩展名的临时文件会保存至输出路径。下次你使用相同的参数下载时，下载过程将延续上一次的过程。

当文件下载完成后，以 .download 为扩展名的临时文件会自动消失。如果这时你使用同样参数下载，You-Get 会跳过下载；如果你想强制重新下载，可以使用 **–force/-f** 参数。

查看命令的帮助部分可以获取更多细节，命令如下：
```
$ you-get --help

```

这次的分享到此结束，后续还会介绍更多的优秀工具，敬请期待！

感谢各位阅读！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/you-get-a-cli-downloader-to-download-media-from-80-websites/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://you-get.org/#supported-sites
[2]:https://www.ostechnix.com/manage-python-packages-using-pip/
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/you-get.jpg
