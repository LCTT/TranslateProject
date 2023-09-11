[#]: subject: "How to Check VLC Log Files"
[#]: via: "https://itsfoss.com/vlc-check-log/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16180-1.html"

如何检查 VLC 日志文件
======

![][0]

> 解决 VLC 的视频播放问题？以下是检查 VLC 日志文件的方法。

在 VLC 上观看你喜爱的视频时，你可能会遇到与编解码器、时间戳、视频播放等相关的问题。

但好消息是，就像 [检查防火墙的日志][1] 一样，你可以使用 VLC 执行相同的操作来跟踪错误的根本原因。

> 📋 与 Linux 不同，VLC 不会自动保存日志，一旦关闭，所有日志都会自动删除，因此你必须手动保存它们。

因此，请确保在关闭 VLC 播放器之前保存或读取日志文件。

### 检查并保存 VLC 日志文件

虽然听起来很复杂，但这是最简单的方法，它不仅允许你保存日志，还可以让你读取日志而不将其保存到文件中。

首先，从顶部菜单栏转到“<ruby>工具<rt>Tools</rt></ruby>”菜单，然后选择“<ruby>消息<rt>Messages</rt></ruby>”，或者，你也可以按 `Ctrl + M` 达到相同的效果：

![][2]

它将显示与当前播放的视频文件相关的日志。

在这里，你有两种选择：你可以仅读取日志，也可以保存日志。

单击“消息”选项卡后，你会注意到 “<ruby>冗余<rt>Verbosity</rt></ruby>” 选项，因此让我们看一下多个详细程度选项的效果。

  * <ruby>错误<rt>Errors</rt></ruby>: 只会记录错误信息
  * <ruby>警告<rt>Warnings</rt></ruby>: 它将总结错误和警告消息
  * <ruby>调试<rt>Debug</rt></ruby>：此级别将包括错误、警告和调试消息

选择适当的详细程度选项后，你很快就会看到与所选选项相关的日志。

![][3]

正如你所看到的，当我选择 “调试” 选项时，它还包含警告日志。

要保存日志，请点击 “<ruby>另存为<rt>Save as...</rt></ruby>” 按钮，它将打开文件管理器，在这选择保存文件的位置并为其指定适当的名称：

![][4]

现在，你可以使用任何文本编辑器打开日志文件：

![][5]

从这里，你可以识别导致错误的罪魁祸首。

### 有关 VLC 的更多信息

你是否知道你可以使用 VLC 下载 YouTube 视频或使用 YouTube 链接来流式传输视频而无需广告？

嗯，VLC 能做的远不止这些。如果你有兴趣，请查看我们详细的 [让 VLC 更出色的技巧指南][6]。

我希望本指南对你有所帮助。

*（题图：MJ/f614be05-cc16-40ef-9b2d-8f7a6864400f）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/vlc-check-log/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://learnubuntu.com/check-firewall-logs/
[2]: https://itsfoss.com/content/images/2023/08/Go-to-messages-to-read-logs-in-VLC.png
[3]: https://itsfoss.com/content/images/2023/08/Choose-verbosity-to-capture-different-types-of-logs-1.png
[4]: https://itsfoss.com/content/images/2023/08/Save-VLC-logs-1.png
[5]: https://itsfoss.com/content/images/2023/08/Open-VLC-log-file.png
[6]: https://itsfoss.com/simple-vlc-tips/
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[8]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[0]: https://img.linux.net.cn/data/attachment/album/202309/11/100519hz58dpd9bdjbbrzd.jpg