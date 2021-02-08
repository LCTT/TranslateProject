[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11766-1.html)
[#]: subject: (GNOME has a ‘Secret’ Screen Recorder. Here’s How to Use it!)
[#]: via: (https://itsfoss.com/gnome-screen-recorder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

GNOME 有一个“隐藏”的屏幕录像机
======

[GNOME][1] 是[最受欢迎的桌面环境][2]之一。它有现代的 UI，并且带有许多特定于 GNOME 的应用，这些应用与桌面整体外观完美融合。

你可以根据自己的喜好来[调整 GNOME][3]，但我不在这里讨论。GNOME 桌面有一些你可能不知道的隐藏功能。

这种不太显眼的功能之一是内置的屏幕录像机。

是的，你没有看错。如果你使用的是 GNOME 桌面，那么不必安装其他的 [Linux 屏幕录像机][4]。你只需要知道正确的快捷键即可。

### 立即使用 GNOME 屏幕录像机录制屏幕

要快速打开 GNOME 屏幕录像机，你需要[在 Ubuntu 或其他带有 GNOME 桌面的发行版中按下此快捷键][5]：

```
Ctrl + Alt + Shift + R
```

这将会立即开始录制你的桌面。你可以通过顶部的系统托盘区域的红点了解到正在录制：

![The red dot in the system tray area indicates that screen recording is in progress][6]

#### 增加录制时间

默认的最大录制时间仅为 30 秒。但是可以增加。

打开终端并使用以下命令：

```
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 300
```

在上面的命令中，我将录音的最大长度增加到 300 秒（即 5 分钟）。你可以将其更改为任何其它值，但应以秒为单位。

如果你**不希望最长录音时间有任何限制，请将其设置为 `0`**，之后它会在你手动停止或者磁盘空间不足才会停止。

#### 停止屏幕录制

如前所述，你的桌面录制将在达到最大时间限制后自动停止。

要在此之前停止录制，你可以按下相同的组合键：

```
Ctrl + Alt + Shift + R
```

你的录制内容将以 [webm][7] 格式保存在家目录的 `Videos` 文件夹中。

#### 局限性

尽管使用这个小工具可以方便地快速录制桌面，但是与功能强大的 [Simple Screen Recorder][8] 这样的屏幕录制工具相比，它有一些局限性。

* 录制开始之前没有时间延迟选项
* 没有暂停和播放选项
* 它录制整个屏幕。无法仅录制应用窗口、特定区域或特定屏幕（如果你有多个屏幕）。
* 视频以 webm 格式保存在用户的 `Videos` 目录中。你无法更改。你必须使用 [HandBrake 之类的工具将视频转换为其他格式][9]。

如你所见，这个秘密的 GNOME 屏幕录像机与 [Kazam][10] 之类的工具或其他此类工具所提供的功能相差很远。但是，它并不会尝试成为全功能的屏幕录像机。它只是为你提供录制屏幕的快速方法。

GNOME 是一个多功能的现代桌面环境。你可以大量地[调整 GNOME][3]。[GNOME 扩展][11]为桌面自定义提供了另一个维度。

该屏幕录像机是 GNOME 的隐藏功能之一，就像你自己很难轻易找到的挂起选项。

你喜欢它吗？你是否还想与我们分享其他隐藏的 GNOME 功能？请在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-screen-recorder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://gnome.org/
[2]: https://itsfoss.com/best-linux-desktop-environments/
[3]: https://itsfoss.com/gnome-tweak-tool/
[4]: https://itsfoss.com/best-linux-screen-recorders/
[5]: https://itsfoss.com/ubuntu-shortcuts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/gnome_screen_recording.jpg?ssl=1
[7]: https://www.webmproject.org/about/
[8]: https://itsfoss.com/record-screen-ubuntu-simplescreenrecorder/
[9]: https://itsfoss.com/handbrake/
[10]: https://itsfoss.com/kazam-screen-recorder/
[11]: https://itsfoss.com/best-gnome-extensions/
