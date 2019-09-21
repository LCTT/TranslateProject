Linux 下如何通过两个或多个输出设备播放声音
======

![](https://www.maketecheasier.com/assets/uploads/2018/01/output-audio-multiple-devices-featured.jpg)

在 Linux 上处理音频是一件很痛苦的事情。Pulseaudio 的出现则是利弊参半。虽然有些事情 Pluseaudio 能够做的更好，但有些事情则反而变得更复杂了。处理音频的输出就是这么一件事情。

如果你想要在 Linux PC 上启用多个音频输出，你只需要利用一个简单的工具就能在一个虚拟j接口上启用另一个声音设备。这比看起来要简单的多。

你可能会好奇为什么要这么做，一个很常见的情况是用电脑在电视上播放视频，你可以同时使用电脑和电视上的扬声器。

### 安装 Paprefs

实现从多个来源启用音频播放的最简单的方法是是一款名为 “paprefs” 的简单图形化工具。它是 PulseAudio Preferences 的缩写。

该软件包含在 Ubuntu 仓库中，可以直接用 apt 来进行安装。

```
sudo apt install paprefs
```

安装后就能狗启动这款程序了。

### 启动双音频播放

虽然这款工具是图形化的，但作为普通用户在命令行中输入 `paprefs` 来启动它恐怕还是要更容易一些。

打开的窗口中有一些标签页，这些标签页内有一些可以调整的设置项。我们这里选择最后那个标签页，“Simultaneous Output。”

![Paprefs on Ubuntu][1]

这个标签页中没有什么内容，只是一个复选框用来启用该设置。

下一步，打开常规的声音首选项。这在不同的发行版中位于不同的位置。在 Ubuntu 上，它位于 GNOME 系统设置内。

![Enable Simultaneous Audio][2]

打开声音首选项后，选择 “output” 标签页。勾选 “Simultaneous output” 单选按钮。现在它就成了你的默认输出了。

### 测试一下

用什么东西进行测试随你喜欢，不过播放音乐总是可行的。如果你像前面建议的一样，用视频来进行测试也没问题。

一切顺利的话，你就能从所有连接的设备中听到有声音传出了。

这就是所有要做的事了。此功能最适用于有多个设备（如 HDMI 端口和标准模拟输出）时。你当然也可以试一下其他配置。你还需要注意，只有一个音量控制器，因此你需要根据实际情况调整物理输出设备。


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/play-sound-through-multiple-devices-linux/

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/assets/uploads/2018/01/sa-paprefs.jpg (Paprefs on Ubuntu)
[2]:https://www.maketecheasier.com/assets/uploads/2018/01/sa-enable.jpg (Enable Simultaneous Audio)
[3]:https://depositphotos.com/89314442/stock-photo-headphones-on-speakers.html
