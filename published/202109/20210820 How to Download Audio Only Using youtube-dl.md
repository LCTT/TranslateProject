[#]: subject: "How to Download Audio Only Using youtube-dl"
[#]: via: "https://itsfoss.com/youtube-dl-audio-only/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13753-1.html"

如何使用 youtube-dl 只下载音频
======

![](https://img.linux.net.cn/data/attachment/album/202109/05/153110dkamc1kv0173ggc3.jpg)

[youtube-dl][1] 是一个多功能的命令行工具，用于从 YouTube 和许多其他网站下载视频。我用它来做我自己的 YouTube 视频的备份。

默认情况下，你会 [使用 youtube-dl 下载视频][2]。用 youtube-dl 只提取音频怎么样？ 其实很简单。让我告诉你步骤。

> **注意**
>
> 从网站下载视频可能违反他们的政策。这取决于你是否选择下载视频或音频。

### 使用 youtube-dl 只下载音频

请确保你已经在你的 Linux 发行版上安装了 `youtube-dl`。

```
sudo snap install youtube-dl
```

如果你只想从 YouTube 视频中下载音频，你可以使用 `youtube-dl` 的 `-x` 选项。这个提取音频的选项将视频文件转换为纯音频文件。

```
youtube-dl -x video_URL
```

该文件被保存在你运行 `youtube-dl` 命令的同一目录下。

这是我下载 Zorin OS 16 评论视频的画外音的示例：

```
youtube-dl -x https://www.youtube.com/watch?v=m_PmLG7HqbQ
[youtube] m_PmLG7HqbQ: Downloading webpage
[download] Destination: Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a
[download] 100% of 4.26MiB in 00:03
[ffmpeg] Correcting container in "Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a"
[ffmpeg] Post-process file Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a exists, skipping
```

你注意到音频格式了吗？它是 .m4a 格式。你可以把音频格式指定为你所选择的格式。

比如你想提取 MP3 格式的音频。你可以像这样使用它：

```
youtube-dl -x --audio-format mp3 video_URL
```

下面是我之前展示的同一个例子。你可以看到它 [使用 ffmpeg 转换][3] m4a 文件为 mp3：

```
youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=m_PmLG7HqbQ
[youtube] m_PmLG7HqbQ: Downloading webpage
[download] Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a has already been downloaded
[download] 100% of 4.26MiB
[ffmpeg] Correcting container in "Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a"
[ffmpeg] Destination: Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.mp3
Deleting original file Zorin OS 16 Review - It's a Visual Masterpiece-m_PmLG7HqbQ.m4a (pass -k to keep)
```

### 以 MP3 格式下载整个 YouTube 播放列表

是的，你完全可以这样做。最主要的是要在这里得到播放列表的 URL。它通常是以下格式：

```
https://www.youtube.com/playlist?list=XXXXXXXXXXXXXXXXXXX
```

要获得一个播放列表的 URL，当播放列表显示在右边栏时，点击其名称。

![Click on the playlist title][4]

它将带你到播放列表页面，你可以在这里复制 URL。

![Grab the playlist URL][5]

现在你有了播放列表的 URL，你可以用它来下载 MP3 格式的音频文件，方法如下：

```
youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" playlist_URL
```

那个看起来很可怕的 `-o "%(title)s.%(ext)s"` 指定了输出文件（选项 `-o`），并指示它使用视频的标题和扩展名（本例为 mp3）来命名音频文件。

![][6]

我希望你觉得这个技巧对你有帮助。享受音频文件吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/youtube-dl-audio-only/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://github.com/ytdl-org/youtube-dl
[2]: https://itsfoss.com/download-youtube-linux/
[3]: https://itsfoss.com/ffmpeg/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/getting-youtube-playlist-url.png?resize=797%2C366&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/youtube-playlist-url.png?resize=800%2C388&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-youtube-playlist-audio.png?resize=800%2C559&ssl=1
