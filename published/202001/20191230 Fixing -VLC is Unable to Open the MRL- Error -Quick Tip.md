[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11748-1.html)
[#]: subject: (Fixing “VLC is Unable to Open the MRL” Error [Quick Tip])
[#]: via: (https://itsfoss.com/vlc-is-unable-to-open-the-mrl/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

修复 “VLC is Unable to Open the MRL” 错误
======

![](https://img.linux.net.cn/data/attachment/album/202001/05/084139mzlt1lfivilnnbkl.jpg)

一个使用 [VLC 的技巧][1]是使用 [VLC] [2] 播放 YouTube 和其他在线视频。这可以帮助你[观看带有字幕的在线视频][3]。

但是事情并不总是这么简单，因为有时使用 VLC 打开 YouTube 视频时会遇到此错误：

> Your input can’t be opened: VLC is unable to open the MRL '<https://youtubeurl.com>'. Check the log for details.

![VLC error while playing YouTube videos][4]

这是因为 Google 不想让你使用任何第三方应用观看 YouTube，因为这样他们就无法正常收集数据。

因此，他们不断修改服务端，以使第三发开发更难与 Youtube 集成。

以 [youtube-dl][5] 为例。你会发现自己无法突然[下载 YouTube 视频] [6]，最简单的方案是安装最新版本的 youtube-dl。

对于 VLC 也是如此。如果你[在 Ubuntu 或任何你用的系统中安装了最新的 VLC][7]，那么可能不会看到此错误。

### 修复 “VLC is unable to open the MRL” 错误

让我向你展示对于 YouTube 的修复步骤。

进入 VLC 媒体播放器的官方 Github 仓库页面的[这个页面][8]，并使用 `Ctrl+S` 保存文件：

现在，你需要做的是用此下载文件替换 `lib/vlc/lua/playlist` 目录中的 `youtube.luac`（注意 luac 中的 “c”）。

#### Linux 中的步骤

如果你使用的是 Linux，请打开终端并使用 [locate 命令][9]查找 `youtube.luac` 文件的确切位置：

```
locate youtube.luac
```

当你得到文件的路径时，只需将该文件替换为下载的文件即可。我相信你可以完成这项简单的任务。

对我而言，以下是文件路径：

```
abhishek@itsfoss:~$ locate youtube.lua
/usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac
```

因此，我要做的就是将下载的文件移到该位置并替换它的内容：

```
sudo cp ~/Downloads/youtube.lua /usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac
```

你现在应该可以在 VLC 中播放 YouTube 视频了。

#### Windows 中的步骤

如果你使用的是 Windows，那么应遵循以下步骤：

  * 将下载的 `youtube.lua` 文件重命名为 `youtube.luac`
  * 复制此文件并将其粘贴到 `C:\Program Files (x86)\VideoLAN\VLC\lua\playlist\`

就是这些了。

如果你在 Dailymotion 或其他视频流网站上遇到问题，那么可以从 VLC 仓库的[此处][10]下载它们各自的 lua 文件，并替换 VLC 安装中的现有 lua 文件。

我希望这个快速提示可以解决 VLC 无法为你播放 YouTube 视频的问题。

--------------------------------------------------------------------------------

via: https://itsfoss.com/vlc-is-unable-to-open-the-mrl/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/simple-vlc-tips/
[2]: https://www.videolan.org/index.html
[3]: https://itsfoss.com/penguin-subtitle-player/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/vlc_error_input_cant_be_played.png?ssl=1
[5]: https://itsfoss.com/download-youtube-linux/
[6]: https://itsfoss.com/download-youtube-videos-ubuntu/
[7]: https://itsfoss.com/install-latest-vlc/
[8]: https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua
[9]: https://linuxhandbook.com/locate-command/
[10]: https://github.com/videolan/vlc/tree/master/share/lua/playlist
