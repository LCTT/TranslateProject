[#]: subject: (Meet Clapper: A Sleek Looking Linux Video Player for Minimalists)
[#]: via: (https://itsfoss.com/clapper-video-player/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13638-1.html)

认识 Clapper：一款外观时尚的 Linux 视频播放器，极简主义者适用
======

喜欢极简主义吗？你会喜欢 Clapper 的。

Clapper 是一个全新 [Linux 视频播放器][1]。实际上，它更多的是基于 GNOME 而不是 Linux。

它基于 GNOME 的 JavaScript 库和 GTK4 工具包构建，自然地融合在 GNOME 的桌面环境中。它使用 [GStreamer][2] 作为媒体后端，使用 [OpenGL][3] 进行渲染。

我喜欢极简主义的应用。虽然 VLC 是媒体播放器中的瑞士军刀，但我更喜欢 [MPV 播放器][4]，因为它的界面时尚、简约。现在我想要坚持使用 Clapper 一段时间了。

### Clapper 视频播放器

![A screenshot of Clapper video player][5]

[Clapper 默认开启硬件加速][6]。它支持英特尔和 AMD 的 GPU，在 Xorg 和 Wayland 上都能工作。

[Clapper][7] 不使用传统的上部窗口栏。为你提供自动隐藏的偏好菜单、模式切换器和窗口控制按钮供等功能。这给了它一个时尚、简约的外观。

它有三种模式：

  * 窗口模式：默认模式显示进度条和窗口控制。
  * 浮动模式：隐藏进度条，播放器浮于其他应用程序的顶部，就像“[总是在顶部][8]”或“画中画”模式。
  * 全屏模式：播放器进入全屏，进度条变大，但它们都会自动隐藏起来

![Interface of Clapper video player with preference control and window modes][9]

Clapper 也有一个自适应的用户界面，可基于 Linux 的智能手机和平板电脑上使用。因此，如果你有自己的 Pine Phone 或 Librem5，你可以在它上面使用 Clapper。

它支持字幕，并可选择改变字体。然而，在我的测试中，字幕并不可用。也没有可以明确地在播放的视频中添加字幕的选项。这一点必须改进。

和 VLC 一样，如果你再次打开同一个视频文件，Clapper 也可以让你选择从最后一个时间点恢复播放。这是我喜欢的 VLC 中的一个 [方便的功能][10]。

如果你有 URL，Clapper 也支持从互联网上播放视频。

这里的截图中，我正在 Clapper 中播放一个 YouTube 视频。这是一首由一位美丽的歌手和演员唱的优美歌曲。你能猜到这是哪首歌或哪部电影吗？

![Clapper playing a video from YouTube][11]

### 在 Linux 上安装 Clapper

对 Arch 和 Manjaro 用户而言，Clapper 可在 AUR 中找到。这很稀疏平常，因为 AUR 包罗万象。

对于其他发行版，Clapper 官方提供了 [Flatpak 包][12]。所以，请 [为你的发行版启用 Flatpak 支持][13]，然后使用下面的命令来安装它：

```
flatpak install flathub com.github.rafostar.Clapper
```

安装后，只需在应用菜单中搜索它，或右击视频文件，选择用 Clapper 打开它。

Clapper 仍不是一个完美的视频播放器。然而，它有可能成为一个流行的 Linux 应用。

如果你使用它，请分享你的经验。如果你发现问题，请[通知开发者][14]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/clapper-video-player/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/video-players-linux/
[2]: https://gstreamer.freedesktop.org/
[3]: https://www.opengl.org/
[4]: https://itsfoss.com/mpv-video-player/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-screenshot.png?resize=800%2C498&ssl=1
[6]: https://github.com/Rafostar/clapper/wiki/Hardware-acceleration
[7]: https://github.com/Rafostar/clapper
[8]: https://itsfoss.com/always-on-top/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-video-player-interface.jpg?resize=800%2C480&ssl=1
[10]: https://itsfoss.com/simple-vlc-tips/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-youtube-video.jpg?resize=800%2C501&ssl=1
[12]: https://flathub.org/apps/details/com.github.rafostar.Clapper
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://github.com/Rafostar/clapper/issues
