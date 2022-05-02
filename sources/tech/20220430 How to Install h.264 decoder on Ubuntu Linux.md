[#]: subject: "How to Install h.264 decoder on Ubuntu Linux"
[#]: via: "https://itsfoss.com/install-h-264-decoder-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

怎样在 Ubuntu Linux 安装 h.264 解码器
======

当你开始使用 [新安装的 Ubuntu 系统][1] 并尝试打开一个 MP4 文件进行播放时，它可能会显示一个错误，即：

_**播放这个文件要求 H.264 (高端类) 解码器 ， 但是没有安装。**_

![当播放特定媒体文件时，Ubuntu 的默认视频播放器会显示错误][2]

你可能会猜到这是怎么了。系统没有安装所需的多媒体解码器阻止了视频播放器不能播放视频文件。

所以，解决方案是什么？安装所需的解码器。怎么做呢？

我将讨论解决这个问题的三种方法：

  1. 只安装所需的解码器：它可能会让所需的文件播放但是一些其它格式的文件仍然会处在失去解码器的状态。
  2. 一次安装多种多媒体解码器：它会安装解码器之外，还会安装其它你不需要的软件包，类似微软的字体库一样。
  3. 安装一个不同的视频播放器：像 VLC 和 MPV 视频播放器默认状态下对解码器有更好的支持。对大多数常规视频文件来说，你不必分别安装它们。

如果你遵从我的建议，我建议你采用第二种和第三种方法。为什么？一会你就知道了。

### 在 Ubuntu Linux 获取 h264 解码器

这里我使用 Ubuntu Linux。第一和第三种方法应该适用于其它发行版，但是第二种方法不适用，因为所提到的包 (常常) 是 Ubuntu 所独有的。

#### 方法 1: 只安装所需的解码器 (不建议)

当你看到这个错误，它给你一个叫做 “在 Ubuntu 软件中心查找 ” 的选项。点击这个选项打开软件中心，可能显示(或不显示)一些软件包将会在你的系统上安装 h264 解码器。

![在 Ubuntu 软件中心可能提供 h264 解码器软件包][3]

软件包名可能听起来很相似但是需要带有“糟糕”设置的 GStreamer 多媒体解码器。检查软件包的描述。

或者,你可以使用这个命令在终端来安装软件包：

    sudo apt install gstreamer1.0-plugins-bad

```

如果你对终端不了解，请注意它将要求使用你的账户密码。**当你输入你的密码时，屏幕什么都不显示**。这是 Linux 的方式。你盲输密码然后按回车键。

一旦软件包安装完成，再次打开文件看看是否能够正常播放。

这可能对你有用，但是故事并未结束。你可能有其它格式的一些视频文件要求一些其它的 h264 解码器 或者其它解码器。

![其它的解码器播放视频你可能仍然有问题][4]

你可以像这样尝试安装更多的解码器：

```

    sudo apt install libavcodec-extra gstreamer1.0-plugins-ugly gstreamer1.0-libav

```

然而,在 Ubuntu 有一个 [ 安装多媒体解码器更加方便的方法 ][5] 并且在下一节我会展示给你。

#### 方法 2: 安装所有多媒体解码器 (建议)

Ubuntu provides a meta-package named ubuntu-restricted-extras that consists of most of the common audio and video codecs along with some other packages like the Microsoft fonts.

Install this package and you won’t have to worry about the media codecs anymore.

Open the terminal in Ubuntu and type the following command:

```

    sudo apt install ubuntu-restricted-extras

```

Since this meta-package contains software from Microsoft, you’ll have to accept the End User License Agreement (EULA).

![Press tab and hit enter to accept EULA][6]

The next screen may look like the one below. Just press tab and it will highlight the options. When the correct options are highlighted, press enter to confirm your selection.

![Press tab and when it highlights the correct option, press enter to confirm][7]

With the multimedia codecs installed, you should be able to play (almost) all kinds of media files. Your music player can play MP3 files and your video player should be able to play MP4, MKV, and whatnot.

However, this too is not the end of the story, at least for some people.

Why do I say that? Because I have noticed that the default video player in Ubuntu, Totem, often struggles while playing certain kinds of video files. You’ll notice that suddenly your system heats up, the fans start blowing and your mouse cursor stop functioning smoothly.

Why? Because Totem is struggling in decoding the video and taking too much processing power.

You can test it by running the top command while playing the video. Look for the process named totem (that’s the name of the default video player).

![Ubuntu’s default video player, Totem, may consume more than necessary CPU power][8]

What can you do now? Your trouble seems to be never ending. Fret not. There are [better video players in Linux][9] and they will help you solve the issue.

#### Method 3: Install a better video player (recommended)

There are many good video players in Linux. I find them better than the default Totem video player.

Personally, I prefer two of the lot: [VLC][10] and [MPV][11].

VLC is a versatile and hugely popular video player. Chances are that you have already used VLC.

MPV Media Player is not that popular but this lightweight application is quite good for playing video files.

Both VLC and MPV players are good at handling media codecs. You don’t even need to install media codecs separately with them. Just [install VLC][12] or MPV and you should be able to play various kinds of video files.

Either look for it in the software center:

![MPV player is available in Ubuntu software center][13]

Or [install MPV on Ubuntu][14] using the command line:

```

    sudo apt install mpv

```

Now that you have another video player, you should right click on the video files and choose to open with the new video player.

Alternatively, you can [make it the default application][15] for playing video files and use double clicks.

### Did it work for you?

I hope I didn’t go into too much detail here. I wanted to explain the various methods and the pros and cons associated with each of them.

Did you manage to get rid of the h264 decoder problem in Ubuntu? Which method did you go for?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-h-264-decoder-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/h264-decoder-error-ubuntu-800x241.png
[3]: https://itsfoss.com/wp-content/uploads/2022/04/h264-decoder-ubuntu-software-center-800x532.png
[4]: https://itsfoss.com/wp-content/uploads/2022/04/ac3-decoder-missing-ubuntu-800x251.png
[5]: https://itsfoss.com/install-media-codecs-ubuntu/
[6]: https://itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg
[7]: https://itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras_1.jpg
[8]: https://itsfoss.com/wp-content/uploads/2022/04/totem-consuming-more-cpu-ubuntu-800x454.webp
[9]: https://itsfoss.com/video-players-linux/
[10]: https://www.videolan.org/vlc/
[11]: https://mpv.io/
[12]: https://itsfoss.com/install-latest-vlc/
[13]: https://itsfoss.com/wp-content/uploads/2022/04/mpv-player-ubuntu-software-center-800x346.png
[14]: https://itsfoss.com/mpv-video-player/
[15]: https://itsfoss.com/change-default-applications-ubuntu/
