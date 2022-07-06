[#]: subject: "Top 10 Essential Ubuntu Apps For Everyone in 2022"
[#]: via: "https://www.debugpoint.com/2022/05/essential-ubuntu-apps-2022-part-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14794-1.html"

10 大必备 Ubuntu 应用：基本篇
======

![](https://img.linux.net.cn/data/attachment/album/202207/05/132504xx09az5i4ip0pel5.jpg)

> 本文列出了 2022 年可以用于不同情况的 10 个 Ubuntu 基本应用。

不管你是偶尔使用的用户、学生、老师，还是科学家、开发人员和创意工作者，在工作上你需要各种各样的应用程序。Linux 生态系统有数以千计的应用程序，它们分散在各个角落，几乎可以满足各种需求。而包括 Ubuntu 在内的大多数主流 Linux 发行版，默认都只提供了基本的应用程序。

在这个五篇系列文章的第一篇中，我们列出了一些每个人都用的上的专门应用。

### 1、GNOME 优化工具

如果你在使用 Ubuntu GNOME 版，<ruby>GNOME 优化工具<rt>GNOME Tweak Tool</rt></ruby>是你必备的实用工具。使用这个工具来定制你的桌面，你可以改变字体、缩放比例、主题、光标和许多其他选项。默认的设置窗口现在没有列出所有这些选项。

此外，你也能用该应用改变窗口装饰、标题栏、标题栏按钮以及开机启动项。

你可以使用应用商店搜索 “Tweaks” 来安装它，或者通过下列终端的命令来安装：

```
sudo apt install gnome-tweaks
```

![GNOME Tweaks Tool][2]

### 2、Steam

由于 Valve 公司和相关社区的贡献，在 Linux 上玩游戏不再困难。[Steam][3] 是 Valve 公司开发的电子游戏服务的前端平台，你可以通过 Steam 在 Ubuntu 上获取最新的游戏版本。此外，Steam 客户端提供反外挂监测、自动更新，和支持带有流媒体功能的社交对话。

如果你是一个 Linux 游戏玩家，Steam 是常用的客户端，你可以用下面的命令来安装。此外，你可以在应用商店中搜索 “Steam Installer” 并使用 [Flatpak][4] 或 [Snap][5] 进行安装。

```
sudo apt install steam
```

![Steam Client][6]

### 3、Peek

在我看来，[Peek][7] 是一款被低估的应用。它是一个 GIF 动画录像机，对各种工作场景都非常有用。这是一款非常强大的应用程序，它适合在 Ubuntu 或任何 Linux 发行版中使用。此外，Peek 带有诸如录制区域选择、倒计时、GIF/MP4/WebM 支持等选项。它的后端使用的是 ffmpeg 。

在应用商店中搜索 “peek” 或者在命令行输入以下命令来安装这款优秀的应用。

```
sudo apt install peek
```

![Peek][8]

### 4、新立得

<ruby>[新立得][9]<rt>Synaptic</rt></ruby> 是一款杰出的软件包管理器，可以帮助你以传统方式添加和移除软件包。有经验的 Linux 用户知道它的特性以及灵活性。你可以在各种库中搜索软件包、验证依赖性并进行安装。

如果你经常安装和卸载软件包，这是一个完美的应用程序。你可以通过以下命令或在应用商店中搜索 “synaptic” 来安装它。

```
sudo apt install synaptic
```

![Synaptic Package Manager][10]

### 5、GDebi

正如上面提到的新立得，你也可以试试 [GDebi][11] 软件包安装程序，它带有几种功能。GDebi 软件包安装程序是用于安装外部 deb 文件的命令行实用程序。此外，GDebi 安装 .deb 包速度更快、效率更高，可以快速解决依赖关系并为你下载它们。

它是 Ubuntu 上安装 .deb 包最好的终端程序之一，你可以用以下命令安装它。安装后，你可以运行 `gdebi <你的 .deb 软件包路径>` 来安装任何软件包。

```
sudo apt install gdebi
```

### 6、Geary

不管从事什么工作，你需要一个 Ubuntu 桌面的本地 [邮箱客户端][12]。电子邮件对很多人来说仍然是有意义和有价值的。尽管 Ubuntu 默认带有最好的 Thunderbird 电子邮件客户端，但你也可以试试其它的电子邮件客户端应用，或许可以给你带来更好体验。

[Geary][13] 拥有友好而简洁的用户界面，能够让你更简单的设置多个邮件账号。此外， Geary 也带来了会话功能、更快的搜索、撰写富文本电子邮件以及其他功能，这使它成为 Linux 桌面的“首选”电子邮件客户端。

你可以使用如下命令或者在应用商店中搜索 “Geary” 来安装 Geary 。也可以通过 [Flatpak][14] 获得。

```
sudo apt install geary
```

![Geary][15]

### 7. 谷歌 Chrome 浏览器

虽然很多人担心隐私以及跟踪，但谷歌 Chrome 仍然是浏览器市场的领头者。Ubuntu 默认提供了 Firefox 浏览器，但随着近期火狐的 Snap 事件，你可能想换到其它浏览器。

如果你与谷歌生态系统密切相关，并希望在流媒体和浏览方面获得更好的网络体验，你可能会考虑使用谷歌 Chrome。但是，如果你担心隐私和跟踪，你可以选择其他一些浏览器，例如 Brave 或 Vivaldi。

你可以从下面链接中下载 .deb 包来安装谷歌 Chrome 安装器。安装后，你可以打开应用商店来安装它。 

> **[下载谷歌 Chrome][16]**

### 8、Kdenlive

[Kdenlive][17] 是 Linux 上最好的自由开源的视频编辑器之一。 Kdenlive 设计良好的用户界面易于使用，并且带来了各种功能。使用 Kdenlive，你可以简单的导入视频片段，更改画布分辨率，并在编辑后导出为多种格式。时间线和工具让只需你单击一个按钮即可剪切和添加标题、转场和效果。此外，如果你是视频编辑新手，学习起来也非常容易。

Kdenlive 是一个非常活跃的项目，每个主要版本都会带有更多先进的功能。这是 2022 年必不可少的 Ubuntu 应用程序之一，如果你想与其它 [免费视频编辑器][18] 进行比较，你可以看看此列表。

使用以下命令安装 Kdenlive 很简单。除此，你可以用 [Flatpak][19] 或 [Snap][20] 版本来安装。

```
sudo apt install kdenlive
```

![Kdenlive Video Editor][21]

### 9. Spectacle

你可能尝试过很多截屏应用。但在我看来，[Spectacle][22] 或许是最好的、也是被低估了的一款应用。Spectacle 是一款 KDE 应用程序，速度超快，非常适合需要截屏并使用的任何工作需求。你可以在自定义的延时后截取整个桌面、部分桌面或窗口。如果需要，窗口截屏还可以选择截取窗口装饰和光标。Spectacle 还为你提供了一个内置的注释功能，可以涂鸦、书写和标记你的图像。

此外，你还可以直接从其主窗口在 GIMP 或任何图像编辑器中打开图像，并将其导出。此外，自动保存、将截屏复制到剪贴板以及共享到社交媒体是 Spectacle 的一些独特功能。

在我看来，它是一个带有内置屏幕录像机的完整截图工具。

你可以用以下命令或者从 [Snap][23] 中安装 Spectacle。

```
sudo apt install kde-spectacle
```

![Spectacle Screenshot tool][24]

### 10. VLC 媒体播放器

Ubuntu Linux 的 GNOME 版默认带有可以播放视频文件的 GNOME 视频应用程序。但由于缺乏解码功能，GNOME 视频无法播放多种视频格式。这就是为什么你应该考虑一下 [VLC 媒体播放器][25] —— 它是 Linux 桌面上的“首选”媒体播放器。

VLC 确实可以播放任何格式。它甚至可以帮助你播放数据不完整的损坏视频文件。它是强大的媒体播放器之一，你可以使用下面的命令来安装。

此外，如果你偏向于另一种安装方式，你可以通过 [Flatpak][26] 或者 [Snap][27] 安装。

```
sudo apt install vlc
```

![VLC Media Player][28]

### 结语

2022 年必备的 Ubuntu 应用程序系列的第 1 部分到此结束。通过以上信息，我希望你可以选择一些应用供你的日常使用。在下面的评论框中告诉我你更喜欢此列表中的哪些应用程序。

最后，请继续关注本 Ubuntu 应用程序系列的第 2 部分。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/essential-ubuntu-apps-2022-part-1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://gitlab.gnome.org/GNOME/gnome-tweaks
[2]: https://www.debugpoint.com/wp-content/uploads/2022/05/GNOME-Tweaks-Tool.jpg
[3]: https://store.steampowered.com/
[4]: https://flathub.org/apps/details/com.valvesoftware.Steam
[5]: https://snapcraft.io/steam
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Steam-Client.jpg
[7]: https://github.com/phw/peek
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/Peek-in-action2.jpg
[9]: https://www.nongnu.org/synaptic/
[10]: https://www.debugpoint.com/wp-content/uploads/2022/05/Synaptic-Package-Manager.jpg
[11]: https://launchpad.net/gdebi
[12]: https://www.debugpoint.com/2019/06/best-email-client-linux-windows/
[13]: https://wiki.gnome.org/Apps/Geary
[14]: https://flathub.org/apps/details/org.gnome.Geary
[15]: https://www.debugpoint.com/wp-content/uploads/2019/06/Geary.png
[16]: https://www.google.com/chrome
[17]: https://kdenlive.org/
[18]: https://www.debugpoint.com/2019/09/best-free-video-editors-linux-ubuntu/
[19]: https://flathub.org/apps/details/org.kde.kdenlive
[20]: https://snapcraft.io/kdenlive
[21]: https://www.debugpoint.com/wp-content/uploads/2021/01/Kdenlive-Video-Editor.jpg
[22]: https://apps.kde.org/spectacle/
[23]: https://snapcraft.io/spectacle
[24]: https://www.debugpoint.com/wp-content/uploads/2022/05/Spectacle-Screenshot-tool.jpg
[25]: https://www.videolan.org/vlc
[26]: https://flathub.org/apps/details/org.videolan.VLC
[27]: https://snapcraft.io/vlc
[28]: https://www.debugpoint.com/wp-content/uploads/2022/05/VLC-Media-Player.jpg
