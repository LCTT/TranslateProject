Linux 下如何创建 M3U 播放列表
======

> 简介：关于如何在Linux终端中根据乱序文件创建M3U播放列表实现循序播放的小建议。

![Create M3U playlists in Linux Terminal][1]

我是外国电视连续剧的粉丝，这些连续剧不太容易从 DVD 或像 [Netflix][2] 这样的流媒体上获得。好在，您可以在 YouTube 上找到一些内容并[从 YouTube 下载][3]。

现在出现了一个问题。你的文件可能不是按顺序存储的。在 GNU/Linux中，文件不是按数字顺序自然排序的，因此我必须创建 .m3u 播放列表，以便 [MPV 视频播放器][4]可以按顺序播放视频而不是乱顺进行播放。

同样的，有时候表示第几集的数字是在文件名中间或结尾的，像这样 “My Web Series S01E01.mkv”。这里的剧集信息位于文件名的中间，“S01E01”告诉我们人类这是第一集，后面还有其它剧集。

因此我要做的事情就是在视频墓中创建一个 .m3u 播放列表，并告诉 MPV 播放这个 .m3u 播放列表，MPV 自然会按顺序播放这些视频.

### 什么是 M3U 文件?

[M3U][5] 基本上就是个按特定顺序包含文件名的文本文件。当类似 MPV 或 VLC 这样的播放器打开 M3U 文件时，它会尝试按给定的顺序播放指定文件。

### 创建 M3U 来按顺序播放音频/视频文件

就我而言, 我使用了下面命令：

```
$/home/shirish/Videos/web-series-video/$ ls -1v |grep .mkv > /tmp/1.m3u && mv /tmp/1.m3u .
```

然我们拆分一下看看每个部分表示什么意思：

`ls -1v` = 这就是用普通的 `ls` 来列出目录中的内容. 其中 `-1` 表示每行显示一个文件。而 `-v` 表示根据文本中的数字（版本）进行自然排序。

`| grep .mkv` = 基本上就是告诉 `ls` 寻找那些以 `.mkv` 结尾的文件。它也可以是 `.mp4` 或其他任何你想要的媒体文件格式。

通过在控制台上运行命令来进行试运行通常是个好主意：

```
ls -1v |grep .mkv
My Web Series S01E01 [Episode 1 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E02 [Episode 2 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E03 [Episode 3 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E04 [Episode 4 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E05 [Episode 5 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E06 [Episode 6 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E07 [Episode 7 Name] Multi 480p WEBRip x264 - xRG.mkv
My Web Series S01E08 [Episode 8 Name] Multi 480p WEBRip x264 - xRG.mkv
```

结果显示我要做的是正确的。现在下一步就是让输出以 `.m3u` 播放列表的格式输出。

```
ls -1v |grep .mkv > /tmp/web_playlist.m3u && mv /tmp/web_playlist.m3u .
```

这就在当前目录中创建了 .m3u 文件。这个 .m3u 播放列表只不过是一个 .txt 文件，其内容与上面相同，扩展名为 .m3u 而已。 你也可以手动编辑它，并按照想要的顺序添加确切的文件名。

之后你只需要这样做：

```
mpv web_playlist.m3u
```

一般来说，MPV 和播放列表的好处在于你不需要一次性全部看完。 您可以一次看任意长时间，然后在下一次查看其余部分。

我希望写一些有关 MPV 的文章，以及如何制作在媒体文件中嵌入字幕的 mkv 文件，但这是将来的事情了。

注意: 这是开源软件，不鼓励盗版。

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-m3u-playlist-linux/

作者：[Shirsh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/shirish/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/Create-M3U-Playlists.jpeg
[2]:https://itsfoss.com/netflix-open-source-ai/
[3]:https://itsfoss.com/download-youtube-linux/
[4]:https://itsfoss.com/mpv-video-player/
[5]:https://en.wikipedia.org/wiki/M3U
