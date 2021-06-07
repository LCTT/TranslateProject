[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12063-1.html)
[#]: subject: (Turn Your Regular TV into a Smart TV With KDE Plasma Bigscreen)
[#]: via: (https://itsfoss.com/kde-plasma-bigscreen/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

用 KDE “等离子大屏幕”把你的普通电视变成智能电视
======

> KDE 即将推出的“等离子大屏幕”项目可让你使用开源技术将普通电视变成智能电视。

如今，智能电视已成为新的常态。这些智能电视主要基于 Android，可让你播放 YouTube、Netflix、Spotify 和其他流媒体服务。你甚至可以使用语音命令来控制你的智能电视。

这些所谓的“智能电视”的一个主要问题是它们可能正在[监视你][1]。你的数据在你或许知道或许不知道的情况下被收集。

这就是 KDE 的“[等离子大屏幕项目][2]”旨在解决的问题。（LCTT 译注： <ruby>等离子<rt>Plasma</rt></ruby>恰是  KDE 桌面环境的名称，和<ruby>大屏幕<rt>Bigscreen</rt></ruby>很搭，因此这个惯常不翻译的名称这里翻译出来。）

### “等离子大屏幕”：通过开源技术使电视更智能

![][3]

你可能了解 [KDE][4] 项目。它开始是一个 Linux 桌面环境项目，而在发展了 20 多年后，KDE 项目变得越来越大，这就是为什么他们创建了 Plasma 桌面环境的原因，以明确表明 KDE 不再仅仅是“<ruby>K 桌面环境<rt>K Desktop Environment</rt></ruby>（KDE）”了。

Plasma 项目本身具有多种用途，当然，你可以在台式机 Linux 计算机上使用它，而 [Plasma 也具有移动版本][5]，你可以在基于 Linux 的智能手机上运行它，例如 [Librem5][6] 和 [PinePhone][7]。

“<ruby>等离子大屏幕<rt>Plasma Bigscreen</rt></ruby>”是 KDE 的一个新项目，旨在提供类似于智能电视所提供的界面和功能。

你需要的是一台[树莓派之类的单板计算机][8]和一台带 HDMI 端口的电视，然后在你的树莓派设备上安装“等离子大屏幕”，将其连接到电视就行。

### “等离子大屏幕”的功能：不仅仅是媒体服务器

![YouTube In Plasma Bigscreen][9]

乍一看，它看起来很像是一个媒体服务器，但“等离子大屏幕”却和 Kodi 及其它 [Linux 媒体服务器][10] 不同，它不止于此。

#### 使用常规遥控器进行控制

你不需要新的专用遥控器。多亏了 [CEC][11]，你可以使用常规的电视遥控器。

#### 带有开源 Mycroft AI 的语音控制

“等离子大屏幕”利用了开源 Mycroft AI 项目。借助“等离子大屏幕”内置的 Mycroft AI，你可以使用语音命令播放内容、检查天气并控制智能电视的其他方面。你可以通过教它新技能来进一步训练它。

#### 传统的桌面应用程序

“等离子大屏幕”不仅提供丰富的媒体应用程序，还提供经过重新设计，适合它的体验的传统桌面应用程序。

#### 自由开源软件

最重要的是它是一个开源项目，它使用其他开源技术为你提供对数据和智能电视的完全控制。

由于它是开源的，我相信一旦发布，就会有一些供应商将其作为即插即用设备提供。

### 如何获取“等离子大屏幕”？

“等离子大屏幕”仍处于测试阶段，没有确定稳定版发布的时间表。

但是，测试版已经可以在树莓派 4 等设备上正常运行。下面是一个从事此项目的开发人员的视频。

- [video](https://youtu.be/iOxMuexAPaQ)

如果你有树莓派 4，则可以从其官方下载页面上下载“[等离子大屏幕][13]”的测试版，然后按照[此处][14]的步骤进行安装。

就个人而言，我对此感到非常兴奋。我要花一些时间在[树莓派 4][15]上尝试一下。你呢？你认为该项目具有潜力吗？你想试试看吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/kde-plasma-bigscreen/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.zdnet.com/article/fbi-warns-about-snoopy-smart-tvs-spying-on-you/
[2]: https://plasma-bigscreen.org/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/plasma-bigscreen-menu.jpg?ssl=1
[4]: https://kde.org/
[5]: https://itsfoss.com/kde-announces-plasma-mobile/
[6]: https://itsfoss.com/librem-linux-phone/
[7]: https://itsfoss.com/pinephone/
[8]: https://itsfoss.com/raspberry-pi-alternatives/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/youtube-in-plasma-bigscreen.jpg?ssl=1
[10]: https://itsfoss.com/best-linux-media-server/
[11]: http://libcec.pulse-eight.com/
[12]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[13]: https://plasma-bigscreen.org/#download-jumpto
[14]: https://plasma-bigscreen.org/manual/
[15]: https://itsfoss.com/raspberry-pi-4/
