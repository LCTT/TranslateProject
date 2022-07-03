[#]: subject: "Download YouTube Videos with VLC (Because, Why Not?)"
[#]: via: "https://itsfoss.com/download-youtube-videos-vlc/"
[#]: author: "Community https://itsfoss.com/author/itsfoss/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14788-1.html"

使用 VLC 下载 YouTube 视频
======

![](https://img.linux.net.cn/data/attachment/album/202207/03/100812twzmm942m4o7lmzq.jpg)

[VLC][1] 是 [Linux 和其他平台上最受欢迎的视频播放器][2]之一。

它不仅仅是一个视频播放器。它提供了许多多媒体和网络相关的功能。你会惊讶地 [了解 VLC 的能力][3]。

我将演示一个简单的 VLC 功能，即使用它下载 YouTube 视频。

是的。你可以在 VLC 中播放 YouTube 视频并下载它们。让我告诉你怎么做。（LCTT 校注：发布此文只探讨技术可行性。）

### 使用 VLC 媒体播放器下载 YouTube 视频

现在，有一些方法可以 [下载 YouTube 视频][4]。使用浏览器扩展或使用专门的网站或工具。

但是如果你不想使用任何额外的东西，已经安装的 VLC 播放器可以用于此目的。

**重要提示：**在从 YouTube 复制链接之前，请确保从 YouTube 播放器中选择所需的视频质量，因为我们将获得与复制链接时流式传输视频相同的质量。

#### 步骤 1：获取所需视频的视频链接

你可以使用任何你喜欢的浏览器并从地址栏中复制视频链接。

![copy youtube link][5]

#### 步骤 2：将复制的链接粘贴到网络流

“<ruby>网络流<rt>Network Stream</rt></ruby>”选项位于“<ruby>媒体<rt>Media</rt></ruby>”菜单下，这是我们顶部菜单栏的第一个选项。你也可以使用快捷方式 `CTRL + N` 打开网络流 。

![click on media and select network stream][6]

现在，你只需粘贴复制的 YouTube 视频链接，然后单击播放按钮。我知道它只是在我们的 VLC 中播放视频，但还有一点额外的步骤可以让我们下载当前的流媒体视频。

![paste video link][7]

#### 步骤 3：从编解码器信息中获取位置链接

在“<ruby>编解码器信息<rt>Codec Information</rt></ruby>”下，我们会得到当前播放视频的位置链接。要打开编解码器信息，你可以使用快捷键 `CTRL + J` 或者你会在“<ruby>工具<rt>Tools</rt></ruby>”菜单下找到编解码器信息选项。

![click on tools and then codec information][8]

它将带来有关当前流媒体视频的详细信息。但我们需要的是“<ruby>位置<rt>Location</rt></ruby>”。你只需复制位置链接，我们的任务就完成了 90%。

![copy location link][9]

#### 步骤 4：将位置链接粘贴到新选项卡

打开任何你喜欢的浏览器，并将复制的位置链接粘贴到新选项卡，它将开始在浏览器中播放该视频。

现在，右键单击播放视频，你将看到“将视频另存为”的选项。

![click on save][10]

它将打开文件管理器并询问你是否要在本地保存此视频。你还可以重命名该文件，默认情况下它将被命名为 “videoplayback.mp4”。

![showing file in folder][11]

### 结论

如果你有互联网连接问题，或者如果你想保存一些视频以供将来观看，下载 YouTube 视频是有意义的。

当然，我们不鼓励盗版。此方法仅用于合理使用，请确保视频的创建者已允许该视频进行合理使用，并确保在将其用于其他地方之前将其归属于视频的原始所有者。

--------------------------------------------------------------------------------

via: https://itsfoss.com/download-youtube-videos-vlc/

作者：[Community][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lkxed
[1]: https://www.videolan.org/vlc/
[2]: https://itsfoss.com/video-players-linux/
[3]: https://itsfoss.com/vlc-pro-tricks-linux/
[4]: https://itsfoss.com/download-youtube-videos-ubuntu/
[5]: https://itsfoss.com/wp-content/uploads/2022/06/copy-Youtube-link-800x190.jpg
[6]: https://itsfoss.com/wp-content/uploads/2022/06/click-on-media-and-select-network-stream.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/paste-video-link.png
[8]: https://itsfoss.com/wp-content/uploads/2022/06/click-on-tools-and-then-codec-information-800x249.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/copy-location-link.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/click-on-save-800x424.jpg
[11]: https://itsfoss.com/wp-content/uploads/2022/06/showing-file-in-folder-800x263.png
