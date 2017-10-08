3 个开源的音乐播放器：Aqulung、Lollypop 和 GogglesMM
============================================================

![3 open source music players: Aqualung, Lollypop, and GogglesMM](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/music-birds-recording-520.png?itok=wvh1g4Lw "3 open source music players: Aqualung, Lollypop, and GogglesMM") 


音乐是生活的一部分。[维基百科关于音乐发展历史的文章][4]有这样一段不错的描述说：“全世界所有的人们，包括哪怕是最孤立、与世隔绝的部落，都会有自己的特色音乐……”好吧，我们开源人就构成了一个部落。我建议我们的“音乐形式”应该包括开源音乐播放器。在过去几年里，我已经使用体验过不少我能接触到的音乐播放器；[2016 年 12 月份][5]我根据这六个标准来总结概括了我使用开源音乐播放器的感受：

1.  必须是能够通过设置让音乐一成不变地转换到 [ALSA][1]。（最高分 ５分）
2.  应该有一个不错的“智能播放列表”。（１ 分）
3.  不应该强迫用户只能通过播放列表来进行交互。（1 分）
4.  应该能够提供一个简单的方法来显示歌曲的封面图片——使用内嵌的封面图或使用在音乐目录里面 cover．jpg（或者 .png）文件替代。
5.  应该能够在音乐播放的时候显示信号级别和实际比特率。（１ 分）
6.  能够呈现出不错的整体组织，结构布局和执行性能。（１ 分）

热心的读者让告诉我有三个播放器是在我的资源仓库里没有的：[Aqualung][6]、[Lollypop][7] 和 [GogglesMM][8]。我并不想在我办公用的电脑里面安装那些来自外面的软件，我承诺过我会配置一个“试验台”来测试这三个音乐播放器，并给出测试的细节。

### Aqualung

[Aqualung][9] 有一个写的清晰明了的网站来解释它众多的特点。其上提供的说明中我发现其中一点特别有趣：

“你能够（也应该）将你的所有音乐按照艺术家／档案／声轨这样组织成一个树型结构，这样比生成一个一体化的 Winamp／XMMS 播放列表更舒服。”

这点让我有些困惑，因为我总是把我的音乐按照艺术家、专辑和声轨这样组织成树状。但这就可能解释了为什么我有时发现 XMMS 流派的播放器在浏览音乐时有一点古怪。

根据 Aqualung 官网的下载页面说明，官方发布的只有源代码。但是文档上的说明暗示了绝大多数主流的 Linux 发行版本都包括一份 Aqualung 的构建副本，但我当前用的办公电脑所使用的 Linux 发行版 Ubuntu 16.10 并不在此范围内。[Launchpad.net][10] 提供有 PPA，但那些软件看起来都有些过时了，所以为什么不试试编译源码安装软件呢？

我根据官网上编译文档的建议和配置脚本的提示安装了 **pkgconf** 以及 **libasound**、**libflac**、**libmp3lame**、**libvorbis**、**libxml2**、**libglib2.0** 和 **libgtk+-2.0** 的开发库。接下来，我就能够干净利索的进行 `configure` 然后进行 `make` 和 `make install`。最终我可以执行 `/usr/local/bin/aqualung` 了。


![Aqualung](https://opensource.com/sites/default/files/aqualung.png "Aqualung") 

*Aqualung，不能切换音乐播放的码率。*

一旦 Aqualung 启动运行，我就能看到相当简洁直接的两窗口界面：播放器本身和“音乐商店”。我通过右键点击播放器的音乐面板打开参数设置查看这些可设置的参数，看是否能找到 AudioQuest DragonFly 这个数模转换器，但我没有找到任何相关的迹象。然而，站点上的说明指出可以通过命令行指定输出设备。最终我用 **plughw** 设备才让 Aqualung 启动起来。

在那个时候，真正让我对 Aqualung 感到失望的是 Aqualung 似乎是需要一个固定的输出采样频率。我能够用 Aqualung 播放器的默认设置来正常播放我的 44.1 Khz 文件，但是同样的采样频率播放 96 Khz 的音乐文件时，我不得不关闭软件并重新启动。也正是因为这一点，我不会再继续对 Aqualung 进行使用测评。

**无评分。**

### Lollypop

![Lollypop interface](https://opensource.com/sites/default/files/lollypop_interface.png "Lollypop interface") 

*优美的 Lollypop 用户界面。*

[Lollypop][11] 有一个华丽的网站。尽管它不在我办公专用的电脑的软件仓库里面，但是有一个“针对 Ubuntu/Debian 用户的下载”链接带你跳转到 [launchpad.net 站点提供的最新的 PPA][12]。这个站点还提供针对 Flatpak、Arch Linux、Fedora 和 OpenSUSE 这些系统的 Lollypop 软件包的下载。我看了下 [Fedora COPR 上针对各个 Fedora 版本的 Lollypop 下载链接][13]，看起来 Lollypop 更新的比较及时而且从 Fedora 版本的 23 到 26 都有对应的软件包提供下载安装。 

一天内做一次源码编译就足够了，所以我决定试试从 PPA 安装这款软件。我通过命令行来执行 Lollypop 软件。设置菜单能够在 Lollypop 界面的右上方很显眼地看见。更新完我的音乐后，我开始找电脑的输出设备设置，但是在一番查看后，我不知道该怎么选择合适的输出设备。即便我在命令行通过 **-help** 也找不到有用的帮助信息。

经过一番网上搜索后我找到一个 Lollypop 的开发者的提示才知道我需要 **gstreamer libav** 来让 Lollypop 工作。通过这个说明我决定停止，因为这可能需要一个 **gstreamer** 相关配置才有能工作，但是我不太想继续尝试了。

Lollypop 有一个优美的用户交互界面和它的优美的网站相得益彰，但是我现在不会进一步对它进行测评，否则我就又多了一个进一步去学习了解 **gstreamer** 的理由。

**无评分。**

### GogglesMM

[Goggles Music Manager][14] 也有一个[在 launchpad.net 及时更新的 PPA][15]；安装流程简单明了，我现在可以在命令行执行 **gogglesmm** 了。

GogglesMM，非常容易上手使用，看上去和 Rhythmbox 有点像。我在 GogglesMM 的设置里面的参数设置中找到了音频选项设置，能够让我选择 ALSA 和设置音频输出设备。通过查看 **/proc/asound/DragonFly/stream0** 文件和 DragonFly 自己的 LED 颜色，我确定我能够用 GogglesMM 播放 44.1-KHz／21-bit 和 96-KHz／24-bit 这两种规格的 mp3；因此，就凭 “rate/depth passthrough” 我给 GogglesMM 打 5 分。

![GogglesMM](https://opensource.com/sites/default/files/gogglesmm.png "GogglesMM") 

*GogglesMM 在播放 96/24 这种规格的音乐，显示音频输出设备选择。 *

GogglesMM 的说明文档并没有大量的细节介绍，但是我尽可能说明的是，开发者们使用了过滤器来实现类似“智能播放列表”的功能。我在我的测试环境下使用三张专辑来尽我所能检测过滤功能，当我使用“智能播放列表”功能的时候尽管我喜欢我看到的通过过滤筛选出来的歌曲（特别是能够基于广泛的标准来针对歌曲定义筛选条件），但这并不是我认为的“智能播放列表”，对我来说我认为“智能播放列表”应该是这样的，通过借助一些社区数据库来推荐提供和你近期播放的歌曲类似的曲目。或者我该把这个叫作“自动的 DJ”而不是“智能播放列表”，但是通过测试我最终能够确定的是，这个特性并不会在近期版本的 GogglesMM 中出现，所以我给它这个所谓的“智能播放列表”打 0 分。

至于播放列表队列的操作，这款应用能够支持播放你选中的音乐，也能够随机播放音乐或者把一些音乐整合到一个播放列表里面，所以我因为“播放列表的队列选项”给它打 1 分。

同样的，它看起来也能够很好地不需要额外的干预来管理我的音乐艺术封面（每个专辑都包含一张合适的艺术封面， GogglesMM 可以自动识别），所以为“内嵌的艺术封面或者封面图片”打 1 分。

我找不到任何方法来让 GogglesMM 显示信号级别或者实际的比特率。我也不能找到显示比特率和位深度的方法；尽管这款应用能够显示一个“格式”列，但是在我的音乐栏里面除了显示音乐格式不会显示其他的信息了，所以为 GogglesMM 的“信号级别和有效比特率”打 0 分。

至于 GogglesMM 的整体结构，它的所有按钮选项都正好完全符合我的使用习惯。我能够在播放队列里面看到歌曲的时间和歌曲当前已播放的时间所占歌曲总体时间的比例，专辑封面，歌曲名，专辑名和歌唱者。可用的播放栏列表看起来相当大而有用，比如也包括了作曲者。最后，一个真正让我眼前一亮的特点是，音量控制竟然包含了 ALSA 音量。也就是如果我启动 alsamixer 的话，然后不管是在 alsamixer 还是在 GogglesMM 里面调整音量，另一个音量控制也会做相应的音量调整。这个出乎我意外之外的功能相当的酷而且这个功能在其他的音乐播放器上也不常见，因此为它的整体架构给 GogglesMM 加 1 分。

最终 GogglesMM 的这些优点共计得分 8。所表现出来的特点确实很优秀。

**评分：8**

### 到目前为止所给出的评分

我之前所提到的这几个开源音乐播放器中，我最喜欢的还是 [Guayadeque][16]，根据我制定的标准来进行排名的话，我给 Guayadeque 打满分 10 分。来看下我对这三个开源音乐播放器的评分总结吧（N/R 代表“无评分”，因为我不确定如何配置这些播放器来让它们以完美的码率和贯穿模式工作，以便我的数模信号转换器在相应源的码率和位深度接收 PCM 数据）：

![Open source audio players](https://opensource.com/sites/default/files/open_source_audio.png "Open source audio players") 

请注意下我用的这个排名方法并不适合每个人。特别是很多人并不清楚高品质音乐的价值，他们更喜欢专有格式的音乐能够给他们带来更好的音乐品质。

与此同时，我会继续评测一些之前向大家承诺的音乐播放器一些和评测评分无关的特性。我特别喜欢 Lollypop 的外观，我也觉得待揭秘的 **gstreamer** 有一种神秘的魅力，它能让基于 **gstreamer** 的音乐播放器不用通过转换就能传输它们的数据。 

### 关于音乐的部分……

我还在保持继续购买唱片的习惯，对于唱片的购买我有些不错的推荐。

第一个就是 Nils Frahm 的专辑 [Felt][17]，这是我女儿送我的一份非常贴心的礼物。我真的真的很喜欢这张专辑，它的绝大部分歌曲都是在深夜用电麦录制的非常接近钢琴的弦乐，而且也有不少有趣的钢琴演奏的背景音乐，真的是很棒的音乐。至于 Nils Frahm 其他的音乐，这些唱片提供的下载链接允许你下载质量高达 96-KHz，24-bit FLAC 格式的音乐。

第二个就是 Massive Attack 的专辑 Protection 的 [Mad Professor 的重混版][18]，专辑名是 No Protection。你可以[在这里了解这份专辑][19]，并且如果你想要尝试这份专辑最原始的版本，[这里是它的所有汇总信息][20]。该专辑最初发布于 20 世纪 90 年代，这份专辑刻录在唱片上面而且听起来非常奇幻。遗憾的是，不提供下载链接。

第三个就是 Bayonne 的 [Primitives][21]。[这是专辑要表达的想法][22]。Guardian 报社把这份专辑称作是“新式无聊”。那么这种类型的音乐到底怎么样呢？如果这些音乐真的是非常令人乏味的，或许是时候来换份工作了，无论如何你可以试试听这些音乐；或许你会觉得它确实很乏味或者你会像我一样喜欢上这份音乐。

（图片来源：[互联网档案馆][2]书中的图片；由 Opensource.com 编辑发布。遵循 [CC BY-SA 4.0][3] 协议。）

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/clh_portrait2.jpg?itok=V1V-YAtY)


Chris Hermansen - 自 1978 年毕业于 British Columbia 大学后一直从事计算机相关工作，2005 年之前是 Solaris、SunOS、UNIX System V 的忠实用户，之后是 Linux 的忠实用户。在技术方面，我的职业生涯大部分时间都是在做数据分析；特别是空间数据分析。拥有丰富的和数据分析相关的编程经验，用过的编程语言有 awk，Python、PostgreSQL、 PostGIS 和 最新的 Groovy。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/open-source-music-players

作者：[Chris Hermansen][a]
译者：[WangYueScream](https://github.com/WangYueScream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:http://www.alsa-project.org/main/index.php/Main_Page
[2]:https://www.flickr.com/photos/internetarchivebookimages/14565158187/in/photolist-ocoBRG-ocqdPM-ot9YYX-ovb7SE-oroqfj-ot8Sfi-of1HoD-oc5c28-otBk3B-foZxvq-ocoUvo-4TqEKE-otsG7t-oeYo4w-ornGMQ-orpD9y-wLDBUf-outZV7-oc26Ui-ortZpW-ocpWLH-ocoK6c-ocYDY1-od6ADb-xxAKyY-ocofDx-oc4Jr5-otyT2E-ocpUyu-xqTAb6-oc8gK1-otdsK5-ovhkz2-ocpcHj-oc8xwk-otgmZG-otr595-otnv4o-otvdRs-ovfYEt-ovDXUV-obUPJ6-oc2MuJ-oc4zLE-oruPbN-oc1P2H-ouRk93-otaGd3-otTmwB-oc5f62
[3]:http://creativecommons.org/licenses/by-sa/4.0/
[4]:https://en.wikipedia.org/wiki/History_of_music
[5]:https://opensource.com/article/16/12/soundtrack-open-source-music-players
[6]:http://aqualung.jeremyevans.net/
[7]:https://gnumdk.github.io/lollypop-web/
[8]:https://gogglesmm.github.io/
[9]:http://aqualung.jeremyevans.net/
[10]:https://launchpad.net/+search?field.text=aqualung+ppa
[11]:https://gnumdk.github.io/lollypop-web/
[12]:https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop
[13]:https://copr.fedorainfracloud.org/coprs/gnumdk/lollypop/
[14]:https://gogglesmm.github.io/
[15]:https://launchpad.net/~s.jansen/+archive/ubuntu/gogglesmm
[16]:http://www.guayadeque.org/
[17]:http://www.nilsfrahm.com/works/felt/
[18]:https://en.wikipedia.org/wiki/No_Protection_(Massive_Attack_album)
[19]:https://www.youtube.com/watch?v=9TvgRb4wiB0
[20]:https://www.youtube.com/watch?v=LCUv-hLN71c
[21]:https://musicglue.com/bayonne/products/primitives---vinyl--/
[22]:https://www.youtube.com/watch?v=WZ6xl6CKITE
