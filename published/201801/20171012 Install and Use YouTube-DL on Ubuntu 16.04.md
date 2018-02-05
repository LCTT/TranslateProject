在 Ubuntu 16.04 上安装并使用 YouTube-DL
======

Youtube-dl 是一个自由开源的命令行视频下载工具，可以用来从 Youtube 等类似的网站上下载视频，目前它支持的网站除了 Youtube 还有 Facebook、Dailymotion、Google Video、Yahoo 等等。它构架于 pygtk 之上，需要 Python 的支持来运行。它支持很多操作系统，包括 Windows、Mac 以及 Unix。Youtube-dl 还有断点续传、下载整个频道或者整个播放清单中的视频、添加自定义的标题、代理等等其他功能。

本文中，我们将来学习如何在 Ubuntu 16.04 上安装并使用 Youtube-dl 和 Youtube-dlg。我们还会学习如何以不同质量，不同格式来下载 Youtube 中的视频。

### 前置需求

* 一台运行 Ubuntu 16.04 的服务器。
* 非 root 用户但拥有 sudo 特权。

让我们首先用下面命令升级系统到最新版：

```
sudo apt-get update -y
sudo apt-get upgrade -y
```

然后重启系统应用这些变更。

### 安装 Youtube-dl

默认情况下，Youtube-dl 并不在 Ubuntu-16.04 仓库中。你需要从官网上来下载它。使用 `curl` 命令可以进行下载：

首先，使用下面命令安装 `curl`：

```
sudo apt-get install curl -y
```

然后，下载 `youtube-dl` 的二进制包：

```
curl -L https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
```

接着，用下面命令更改 `youtube-dl` 二进制包的权限：

```
sudo chmod 755 /usr/bin/youtube-dl
```

`youtube-dl` 算是安装好了，现在可以进行下一步了。

### 使用 Youtube-dl

运行下面命令会列出 `youtube-dl` 的所有可选项：

```
youtube-dl --h
```

`youtube-dl` 支持多种视频格式，像 Mp4，WebM，3gp，以及 FLV 都支持。你可以使用下面命令列出指定视频所支持的所有格式：

```
youtube-dl -F https://www.youtube.com/watch?v=j_JgXJ-apXs
```

如下所示，你会看到该视频所有可能的格式：

```
[info] Available formats for j_JgXJ-apXs:
format code  extension  resolution note
139          m4a        audio only DASH audio   56k , m4a_dash container, mp4a.40.5@ 48k (22050Hz), 756.44KiB
249          webm       audio only DASH audio   56k , opus @ 50k, 724.28KiB
250          webm       audio only DASH audio   69k , opus @ 70k, 902.75KiB
171          webm       audio only DASH audio  110k , vorbis@128k, 1.32MiB
251          webm       audio only DASH audio  122k , opus @160k, 1.57MiB
140          m4a        audio only DASH audio  146k , m4a_dash container, mp4a.40.2@128k (44100Hz), 1.97MiB
278          webm       256x144    144p   97k , webm container, vp9, 24fps, video only, 1.33MiB
160          mp4        256x144    DASH video  102k , avc1.4d400c, 24fps, video only, 731.53KiB
133          mp4        426x240    DASH video  174k , avc1.4d4015, 24fps, video only, 1.36MiB
242          webm       426x240    240p  221k , vp9, 24fps, video only, 1.74MiB
134          mp4        640x360    DASH video  369k , avc1.4d401e, 24fps, video only, 2.90MiB
243          webm       640x360    360p  500k , vp9, 24fps, video only, 4.15MiB
135          mp4        854x480    DASH video  746k , avc1.4d401e, 24fps, video only, 6.11MiB
244          webm       854x480    480p  844k , vp9, 24fps, video only, 7.27MiB
247          webm       1280x720   720p 1155k , vp9, 24fps, video only, 9.21MiB
136          mp4        1280x720   DASH video 1300k , avc1.4d401f, 24fps, video only, 9.66MiB
248          webm       1920x1080  1080p 1732k , vp9, 24fps, video only, 14.24MiB
137          mp4        1920x1080  DASH video 2217k , avc1.640028, 24fps, video only, 15.28MiB
17           3gp        176x144    small , mp4v.20.3, mp4a.40.2@ 24k
36           3gp        320x180    small , mp4v.20.3, mp4a.40.2
43           webm       640x360    medium , vp8.0, vorbis@128k
18           mp4        640x360    medium , avc1.42001E, mp4a.40.2@ 96k
22           mp4        1280x720   hd720 , avc1.64001F, mp4a.40.2@192k (best)
```

然后使用 `-f` 指定你想要下载的格式，如下所示：

```
youtube-dl -f 18 https://www.youtube.com/watch?v=j_JgXJ-apXs
```

该命令会下载 640x360 分辨率的 mp4 格式的视频：

```
[youtube] j_JgXJ-apXs: Downloading webpage
[youtube] j_JgXJ-apXs: Downloading video info webpage
[youtube] j_JgXJ-apXs: Extracting video information
[youtube] j_JgXJ-apXs: Downloading MPD manifest
[download] Destination: B.A. PASS 2 Trailer no 2 _ Filmybox-j_JgXJ-apXs.mp4
[download] 100% of 6.90MiB in 00:47
```

如果你想以 mp3 音频的格式下载 Youtube 视频，也可以做到：

```
youtube-dl https://www.youtube.com/watch?v=j_JgXJ-apXs -x --audio-format mp3
```

你也可以下载指定频道中的所有视频，只需要把频道的 URL 放到后面就行，如下所示：

```
youtube-dl -citw https://www.youtube.com/channel/UCatfiM69M9ZnNhOzy0jZ41A
```

若你的网络需要通过代理，那么可以使用 `--proxy` 来下载视频：

```
youtube-dl --proxy http://proxy-ip:port https://www.youtube.com/watch?v=j_JgXJ-apXs
```

若想一条命令下载多个 Youtube 视频，那么首先把所有要下载的 Youtube 视频 URL 存在一个文件中（假设这个文件叫 `youtube-list.txt`），然后运行下面命令：

```
youtube-dl -a youtube-list.txt
```

### 安装 Youtube-dl GUI

若你想要图形化的界面，那么 `youtube-dlg` 是你最好的选择。`youtube-dlg` 是一款由 wxPython 所写的免费而开源的 `youtube-dl` 界面。

该工具默认也不在 Ubuntu 16.04 仓库中。因此你需要为它添加 PPA。

```
sudo add-apt-repository ppa:nilarimogard/webupd8
```

下一步，更新软件包仓库并安装 `youtube-dlg`：

```
sudo apt-get update -y
sudo apt-get install youtube-dlg -y
```

安装好 Youtube-dl 后，就能在 Unity Dash 中启动它了：

[![][2]][3]

[![][4]][5]

现在你只需要将 URL 粘贴到上图中的 URL 域就能下载视频了。Youtube-dlg 对于那些不太懂命令行的人来说很有用。

### 结语

恭喜你！你已经成功地在 Ubuntu 16.04 服务器上安装好了 youtube-dl 和 youtube-dlg。你可以很方便地从 Youtube 及任何 youtube-dl 支持的网站上以任何格式和任何大小下载视频了。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-and-use-youtube-dl-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:/cdn-cgi/l/email-protection
[2]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/Screenshot-of-youtube-dl-dash.png
[3]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/big/Screenshot-of-youtube-dl-dash.png
[4]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/Screenshot-of-youtube-dl-dashboard.png
[5]:https://www.howtoforge.com/images/install_and_use_youtube_dl_on_ubuntu_1604/big/Screenshot-of-youtube-dl-dashboard.png
