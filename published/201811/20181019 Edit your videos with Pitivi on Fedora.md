在 Fedora 上使用 Pitivi 编辑视频
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/pitivi-816x346.png)

想制作一部你本周末冒险的视频吗？视频编辑有很多选择。但是，如果你在寻找一个容易上手的视频编辑器，并且也可以在官方 Fedora 仓库中找到，请尝试一下 [Pitivi][1]。

Pitivi 是一个使用 GStreamer 框架的开源非线性视频编辑器。在 Fedora 下开箱即用，Pitivi 支持 OGG、WebM 和一系列其他格式。此外，通过 GStreamer 插件可以获得更多视频格式支持。Pitivi 也与 GNOME 桌面紧密集成，因此相比其他新的程序，它的 UI 在 Fedora Workstation 上会感觉很熟悉。

### 在 Fedora 上安装 Pitivi

Pitivi 可以在 Fedora 仓库中找到。在 Fedora Workstation 上，只需在应用中心搜索并安装 Pitivi。

![][2]

或者，使用以下命令在终端中安装 Pitivi：

```
sudo dnf install pitivi
```

### 基本编辑

Pitivi 内置了多种工具，可以快速有效地编辑剪辑。只需将视频、音频和图像导入 Pitivi 媒体库，然后将它们拖到时间线上即可。此外，除了时间线上的简单淡入淡出过渡之外，Pitivi 还允许你轻松地将剪辑的各个部分分割、修剪和分组。

![][3]

### 过渡和效果

除了两个剪辑之间的基本淡入淡出外，Pitivi 还具有一系列不同的过渡和擦除功能。此外，有超过一百种效果可应用于视频或音频，以更改媒体元素在最终演示中的播放或显示方式。

![][4]

Pitivi 还具有一系列其他强大功能，因此请务必查看其网站上的[教程][5]来获得 Pitivi 功能的完整描述。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/edit-your-videos-with-pitivi-on-fedora/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[b]: https://github.com/lujun9972
[1]: http://www.pitivi.org/
[2]: https://fedoramagazine.org/wp-content/uploads/2018/10/Screenshot-from-2018-10-19-14-46-12.png
[3]: https://fedoramagazine.org/wp-content/uploads/2018/10/Screenshot-from-2018-10-19-15-37-29.png
[4]: http://www.pitivi.org/i/screenshots/archive/0.94.jpg
[5]: http://www.pitivi.org/?go=tour
