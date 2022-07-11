[#]: subject: "10 Best Ubuntu Apps for Everyone in 2022 [Part 2]"
[#]: via: "https://www.debugpoint.com/best-ubuntu-apps-2022-part2/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14816-1.html"

10 大必备 Ubuntu 应用：优选篇
======

![](https://img.linux.net.cn/data/attachment/album/202207/11/180521obse00404niahjof.jpg)

> 本文列出了 2022 年可以用于不同情况的 10 个 Ubuntu 优选应用。

如果你计划永久的转移到 Linux 系统上，你应该会很高兴地知道在 Linux 上有数以千计的能与商业或付费应用媲美的应用。如果你是第一次使用 Linux 的 Windows 用户，你可能都没有听说过这些应用。

因此，在这一系列文章中，我们每一篇重点介绍一组 Ubuntu 应用，以增加 Linux 用户们的协作和认识。

这是 Ubuntu 应用程序系列的第二篇文章，如果你错过了其他部分，可以在这里阅读：

* [第一篇][1]

### 1、OBS Studio

第一个应用是著名的 [流媒体应用][3] —— OBS Studio 。这是一款自由开源的应用，主要用于互联网上的流媒体应用。此外，你可以使用该应用创建一个复杂的流媒体项目，包括多源、覆盖式横幅等功能。

而且，由于它能够支持“<ruby>实时消息传输协议<rt>Real-Time Messaging Protocol</rt></ruby>”（RTMP），你可以使用它在 Facebook、Youtube、Twitch 以及其他支持的平台上进行流式传输。

这个有十年历史的应用程序是 Linux 上最好的应用程序之一。

![OBS Studio][4]

你可以在 [OBS Studio 官网][5] 了解更多的信息并下载，或者通过以下方式安装。

通过 PPA 在 Ubuntu 和相关发行版上安装：

```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio
```

如果你希望通过 Flatpak 安装 ，首先 [为 Flatpak 设置系统][6] 然后 [通过这个页面安装][7] 。

在 Arch Linux 或者其他 Linux 版本，访问 [此页面][8] 了解。

#### 2、Inkscape

这里介绍的第二款应用是流行的 Inkscape。 Inkscape 是一个自由开源的矢量图形编辑软件。它主要用于创建可缩放的矢量图形（SVG）。此外，它是一款一流的应用，可以使用基本的矢量形状如矩形、多边形、螺旋形等。你可以使用这些基本图形以及辅助工具（见下文）创作一流的绘图。

此外，只要你有足够的技能，就可以使用 Inkscape 创作出 [绝妙的动画][9] 。这是艺术家必备的一款应用。

![Sample Image – credit-Inkscape][10]

![Inkscape][11]

你可以在 [Inkscape 官网][12] 下载并了解更多相关信息，或者通过以下方式下载。

通过 PPA 在 Ubuntu 和相关发行版上安装：

```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape
```

更多下载方式可以查看 [此页面][13] 。

#### 3、GIMP

GIMP 是 “<ruby>GNU 图像操作程序<rt>GNU Image Manipulation Program</rt></ruby>”的缩写，它是一个光栅图形编辑器，它有时候被视作 Linux 平台上的 [Photoshop 替代品][14]（值得商榷）。这款拥有 20 年历史的应用适合于从基础到高级的图像编辑。此外，它支持图层、滤镜、装饰和其它对摄影工作必不可少的高级图像编辑功能。

![GIMP Image Editor][15]

[官方主页][16] 是你了解更多关于 GIMP 的知识的最好的途径，可以在官网下载或者通过以下方式安装。

我推荐的方式是通过 Flatpak 下载最新版本 GIMP 。你可以为 Flatpak 设置 [你的系统][17] 然后 [通过该页面安装][18] 。

[该页面][19] 提供了更多下载选项。

#### 4、Spotify

Spotify 是一家专业提供音频流媒体和媒体服务的提供商。它是最广泛的音乐流媒体服务之一，有超过 400 万的月活用户。

首先，你需要安装客户端才能获取 Spotify 流媒体服务。其次，如果你是移动用户，你可以通过 Google Play 商店或者苹果应用商店获取 Spotify 应用。

在 Linux 上安装桌面客户端后你可以收听上百万首歌曲。你可以为不同的 Linux 发行版通过不同的方式安装 Spotify 。

![Spotify Client in Ubuntu][20]

推荐你在 Ubuntu 或者其他 Linux 上使用 Snap 来安装，你可以通过以下命令安装：

```
snap install spotify
```

如果你偏爱原始的 deb 包，你可以通过以下命令安装：

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```

你也可以使用非官方 [Flatpak 包][21] 进行安装。

#### 5、SimpleScreenRecorder

SimpleScreenRecorder 可能是最好的开源截屏工具。该应用程序易于使用并提供了各种功能。并且，其独特的 3 步录制屏幕的方法完全不需要学习。此外，你可以选择整个屏幕、窗口或自定义形状来记录屏幕。

此外，你还可以指定音频/视频比特率、音频源选项和不同的输出选项。最后，它可以安装在所有 Linux 发行版中。

![SimpleScreenRecorder][22]

[官方页面][23] 囊括了更多的 SimpleScreenRecorder 信息，你也可以使用如下方式下载。

在 Ubuntu 或其他相关发行版中使用下面的 PPA 命令安装该应用：

```
sudo apt-get updatesudo apt-get install simplescreenrecorder
```

访问 [此页][24] 获取更多下载版本。

#### 6、Calibre

Calibre 是一款可以在 Ubuntu、Linux Mint 以及其他 Linux 平台使用的自由开源的电子书库管理应用程序。它拥有书库管理、电子书格式转换、同步你的电子书设备以及其他独特的功能。你可以下载新闻和其他互联网上的文章，并可以使用 Calibre 转换成电子书格式。同时，它支持多种电子书格式进行管理。Calibre 是一款具有这些功能最好的电子书管理应用程序之一。

![Calibre][25]

[Calibre 主页][26] 提供了很多文件以及指导手册，你也可以使用以下方式下载。

* [下载 Linux 版本][27]
* [下载其他系统版本][28]

#### 7、Scribus

多年来，桌面出版已经发生了变化。现今，仍有一些桌面出版的应用程序和基于网页的服务。Scribus 是早期的一款自由开源的桌面出版应用程序，可以在 Linux 发行版和其他操作系统中使用。此外，它基于 Qt，并带来了吸引人的用户界面，让你可以马上投入学习。此外，初学者和专业人士都可以使用它来创建令人惊叹的 DTP 页面。

并且它仍然在积极开发中。

![Scribus][29]

你可以在 Scribus 的 [官方页面][30] 了解更多信息并下载，或者通过以下方式安装。

Scribus 位于 Ubuntu 和其他相关发行版的主要存储库中。你可以运行以下命令进行安装：

```
sudo apt install scribus
```

[该页面][31] 提供了其他下载选项。

#### 8、MyPaint

第八个应用程序是 MyPaint 。MyPaint 是一个自由开源的绘图程序，适用于数字艺术家。MyPaint 支持并可用于压感平板电脑和设备。其独特的无干扰设计可以让你专注于绘图而不是应用程序。此外，它还带来了真实铅笔和画笔的仿真，提供了各种画笔、颜色和图层。

![MyPaint 2.0.1][32]

浏览 MyPaint 的 [官方页面][33] 获取更多信息，可以使用以下方式下载。

推荐使用 Flatpak 安装 。你可以为 Flatpak 设置 [系统][34] 然后 [通过该页面安装][35] 。

[该页面][36] 提供了其他下载选项。

#### 9、LibreOffice

如果有任何专业的办公套件可以和市场领导者微软 Office 相媲美，那一定是文档基金会的 LibreOffice 了 。它是所有 Linux 发行版的默认办公套件。它带有电子表格程序（Calc）、文字处理器（Writer）、演示文稿（Impress）和用来绘图的 Draw。此外，它还带来了一个数据库系统 （Base）和用来撰写数学公式的 Math。

除此之外， LibreOffice 提供两个版本。其一是社区版，用于社区和一般用途，并带有最新的功能和更新。第二是商务版，也称企业版，更稳定，更适合专业工作。

LibreOffice 办公套件已默认安装在 Ubuntu 上。

![LibreOffice 7.3.x Community Edition in Ubuntu 22.04 LTS Jammy Jellyfish][37]

[LibreOffice 的官方文档][38] 很庞大，你可以通过各种方式浏览它们，包括在它 [友好的论坛][39] 。你可以 [从此处][40] 下载 LibreOffice。

如果你也想升级 LibreOffice ，你可以访问 [这里][41] 。

#### 10、Cawbird

如果你是重度 Twitter 用户，你或许应考虑一款桌面应用。 Cawbird 是一款 Linux 发行版上的 Twitter 桌面程序。它是 Corebird 应用（已停止维护）的复刻，Cawbird 带来了内嵌图片、视频预览、列表支持等。此外，它可以在 Twitter 上进行全文搜索，并支持多个 Twitter 帐户。

但是，由于 Twitter API 的限制，它只能每两分钟刷新一次，此外，还有一些其他限制，例如没有关注和取消关注的通知、阻止、静音和其他功能。Twitter 强加了这些限制。

![Cawbird][42]

最后，你可以通过 [该链接][43] 在任何 Linux 发行版上下载 Cawbird 。

### 结语

这是 2022 年 5 篇系列的必备 Ubuntu 应用程序的第 2 篇。通过以上信息，我希望你可以选择一些应用供你的日常使用。在下面的评论框中告诉我你更喜欢此列表中的哪些应用程序。

最后，请继续关注本 Ubuntu 应用程序系列的第 3 部分。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/best-ubuntu-apps-2022-part2/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/essential-ubuntu-apps-2022-part-1/
[2]: https://www.debugpoint.com/necessary-ubuntu-apps-2022/
[3]: https://www.debugpoint.com/2022/02/live-streaming-applications-linux-2022/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/OBS-Studio.jpg
[5]: https://obsproject.com/
[6]: https://www.debugpoint.com/2018/07/how-to-install-flatpak-apps-ubuntu-linux/
[7]: https://flathub.org/apps/details/com.obsproject.Studio
[8]: https://obsproject.com/wiki/unofficial-linux-builds
[9]: https://inkscape.org/gallery/
[10]: https://www.debugpoint.com/wp-content/uploads/2022/06/Sample-Image-credit-Inkscape.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2018/09/Inkscape-Running.png
[12]: https://inkscape.org/
[13]: https://inkscape.org/release/
[14]: https://www.debugpoint.com/2018/09/3-best-free-photoshop-alternatives-ubuntu-linux/
[15]: https://www.debugpoint.com/wp-content/uploads/2018/09/GIMP-Running.png
[16]: https://www.gimp.org/
[17]: https://www.debugpoint.com/2018/07/how-to-install-flatpak-apps-ubuntu-linux/
[18]: https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
[19]: https://www.gimp.org/downloads/
[20]: https://www.debugpoint.com/wp-content/uploads/2022/06/Spotify-Client-in-Ubuntu.jpg
[21]: https://flathub.org/apps/details/com.spotify.Client
[22]: https://www.debugpoint.com/wp-content/uploads/2022/06/SimpleScreenRecorder.jpg
[23]: https://www.maartenbaert.be/simplescreenrecorder/
[24]: https://www.maartenbaert.be/simplescreenrecorder/#download
[25]: https://www.debugpoint.com/wp-content/uploads/2019/11/Calibre.png
[26]: https://calibre-ebook.com/
[27]: https://calibre-ebook.com/download_linux
[28]: https://calibre-ebook.com/download
[29]: https://www.debugpoint.com/wp-content/uploads/2022/06/Scribus.jpg
[30]: https://www.scribus.net/
[31]: https://www.scribus.net/downloads/stable-branch/
[32]: https://www.debugpoint.com/wp-content/uploads/2020/05/MyPaint-2.0.1.png
[33]: http://mypaint.org/
[34]: https://www.debugpoint.com/2018/07/how-to-install-flatpak-apps-ubuntu-linux/
[35]: https://flathub.org/repo/appstream/org.mypaint.MyPaint.flatpakref
[36]: http://mypaint.org/downloads/
[37]: https://www.debugpoint.com/wp-content/uploads/2019/09/LibreOffice-7.3.x-Community-Edition-in-Ubuntu-22.04-LTS-Jammy-Jellyfish.jpg
[38]: https://help.libreoffice.org/latest/index.html
[39]: https://ask.libreoffice.org/
[40]: https://www.libreoffice.org/download/download/
[41]: https://www.debugpoint.com/2022/06/libreoffice-upgrade-update-latest/
[42]: https://www.debugpoint.com/wp-content/uploads/2022/06/Cawbird.jpg
[43]: https://software.opensuse.org//download.html?project=home%3AIBBoard%3Acawbird&package=cawbird
[44]: https://www.debugpoint.com/essential-ubuntu-apps-2022-part-1/
[45]: https://www.debugpoint.com/necessary-ubuntu-apps-2022/
