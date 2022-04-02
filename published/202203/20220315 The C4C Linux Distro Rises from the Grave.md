[#]: subject: "The C4C Linux Distro Rises from the Grave"
[#]: via: "https://news.itsfoss.com/c4c-linux-distro-revived/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14377-1.html"

复活的 C4C Linux 发行版
======

> Computers4Christians 项目以定制发行版的形式进行了改革，该发行版为有基督教信仰的人提供了软件。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/c4c-disto-rises-from-the-grave.png?w=1200&ssl=1)

当我刚开始在这里写作时，我介绍了一个 [基督徒的 Linux 发行版][1]，距离现在已经有 6 个年头了，让我们来速览一下这个项目在 6 年的时间里都有哪些变化吧。

### 名字变了，性质也变了

当我们第一次碰到 [Computers4Christians][2]，他们是一个基督教团体，通过安装 Linux 系统来翻新旧电脑，并把它们捐赠给当地社区。他们大约捐赠了 1000 台翻新的旧电脑。该团体基于 Lubuntu 定制了自己的 Linux 版本，名字叫 “Computers4Christians Linux Project”。

今天，Computers4Christians 已经不再捐赠翻新的旧电脑了。取而代之的是，这三个开发者正在专注于开发重命名的 [C4C Ubuntu][3]。

当我问他们为什么决定要继续开发这个发行版时，他们回答说：

> 我们希望引导那些不信奉上帝的人与耶稣·基督建立真正的联系，并借此发展一些信徒。任何人都可以，在几乎任何电脑上，下载、运行临场镜像或者安装我们的 Linux 发行版。C4C Ubuntu 用户可以通过多个版本的圣经、基督教教义、每日灵修、基督教视频和游戏等方式聆听上帝的教诲。我们祈祷每一次的下载、运行和安装 C4C Ubuntu 镜像，都能帮助用户走向基督，或是更接近上帝。“向软弱的人，我就作软弱的人，为要得软弱的人；向甚么样的人，我就作甚么样的人。无论如何总要救些人。” —— 哥林多前书 9:22（网络）

### C4C Ubuntu 中都有什么？

当前版本的 C4C Ubuntu 基于最新的 Ubuntu LTS（20.04.4）构建。它使用 Xfce 桌面环境代替了 GNOME 桌面环境。我问他们为什么决定基于 Ubuntu 而不是 Lubuntu。开发者 Eric Bradshaw 告诉我说，他们之所以切换到 Ubuntu，是因为 Lubuntu 的 LXQt 桌面环境有缺陷，而且它在旧电脑上表现不佳。

以下是 C4C Ubuntu 预装的内容：

  * 主要的常用软件：Catfish、FileZilla、GIMP、Gnash、GnuCash、Gufw、LibreOffice、OpenJDK Java 11、Pidgin、Pinta、Synaptic、Thunderbird 和 VLC。
  * 与基督教或圣经相关的软件和媒体：十二使徒问答和记忆游戏、圣经、圣经桌面版、8 个圣经知识游戏、10 个圣经经文迷宫探索游戏、Diatheke、117 个 Flash 圣经游戏、24 个有趣的圣经故事、Verse、Wide Margin、西福斯圣经指南、新信徒和门徒的阅读材料以及基督教视频。
  * 圣经：有声圣经（WEB）、AKJV、ASV、BBE、ERV、KJV、NHEB 和 WEB。注释：MHC、NETnotesfree、Personal 和 TFG。每日灵修：DBD 和 SME。词典：MLStrong、Robinson、StrongsGreek 和 StrongsHebrew。通用书籍：MollColossions 和 Pilgram。地图：ABSMaps、eBibleTeacherMaps、EpiphanyMaps、HistMidEast、KretzmannMaps、NETMaps、SmithBibleAtlas 和 SonLightFreeMaps。
  * 我们的背景图片包括 150 张不同的“<ruby>上帝的创造<rt>God's creation</rt></ruby>”，提供高清、标准和宽屏等尺寸大小。我们还提供快捷方式或启动器，你可以在“基督教”子菜单中找到它们，点击即可直达 37 个在线的基督教视频集、音乐视频集和 YouTube 频道。
  * 预装的 Firefox 上有数百个手工挑选和分类的书签，不管你是要学习 Linux 还是要了解上帝，你都可以找到相关书签。有一个叫 “FoxFilter” 的家长控制扩展可以帮助过滤掉网页上不适当的内容，用户如果觉得有用，可以订阅它。
  * C4C Ubuntu 团队引入了 [GNU Gnash 的 snap 包][4]，它是一个 Flash 播放器。有了它，用户就可以玩预装的 Flash 圣经游戏了。

如果你想要尝试 C4C Ubuntu，你可以在 [这里][5] 找到下载链接。这个网站有很多关于他们的历史版本信息。同时，开发团队也在不断更新这个网站。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/c4c-linux-distro-revived/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/computers-christians-linux/
[2]: https://computers4christians.org/
[3]: https://computers4christians.org/C4C.html
[4]: https://snapcraft.io/gnash-raymii
[5]: https://computers4christians.org/Download.html
