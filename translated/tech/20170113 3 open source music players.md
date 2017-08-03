
3 个开源的音乐播放器：Aqulung，Lollypop，和 GogglesMM
============================================================


 ![3 open source music players: Aqualung, Lollypop, and GogglesMM](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/music-birds-recording-520.png?itok=wvh1g4Lw "3 open source music players: Aqualung, Lollypop, and GogglesMM") 


图片来源：[互联网档案馆][2]书中的图片；由 Opensource.com 编辑发布。遵循 [CC BY-SA 4.0][3] 协议。


音乐是生活的一部分。[维基百科关于音乐发展历史的文章][4]有这样一段不错的描述说：“全世界所有的人们，包括哪怕是最孤立、与世隔绝的部落，都会有自己的特色音乐．．．”好吧，能够确定的是我们已经把那种部落的民乐推广出来广为人知。我建议我们对于“音乐形式”的划分也应该包括开源音乐播放器。在过去几年里，我已经使用体验过不少我能接触到的音乐播放器；[2016 年 12 月份][5]我根据这六个标准来总结概括分享我使用开源音乐播放器的经验感受：


1.  必须是能够通过设置让音乐从一成不变转换到 [ALSA][1]。（最高分 ５分）
2.  应该有一个不错的“智能播放列表”。（１ 分）
3.  不应该强迫用户总是只能通过播放列表来进行交互。（1 分）
4.  应该能够提供一个简单的方法来覆盖掉歌曲内嵌的图片或者在音乐目录里后退到 cover．jpg（或者 ．png）。
5.  应该能够在音乐播放的时候显示信号级别和实际的比特率。（１ 分）
6.  能够呈现出不错的整体组织，结构布局和执行性能。（１ 分）


热心的读者让我想起来有三个播放器是在我的资源仓库里找不到的：[Aqualung][6]，[Lollypop][7]，和 [GogglesMM][8]。我并不想在我办公用的电脑里面安装不必要的非办公需要的软件，我向大家承诺到时候我会配置一个“试验台”来达到测试这三个音乐播放器用户体验的目的并详细描述最终结果。

### Aqualung


[Aqualung][9] 有一个清晰明了的文字描述站点来解释它众多的特点。站点提供的说明中我发现其中一点特别有趣：


“你能够（也应该）将你的所有音乐按照艺术家／档案／声轨这样的分类标准系统化归类成一个树型结构，从而生成一个一体的 Winamp／XMMS 播放列表来让你的生活更简单。”


这点让我有些困惑因为我印象中我一直总是把我的音乐按照艺术家，专辑和声轨这样的分类标准系统归类。但这就可能解释了为什么我有时发现我的 XMMS-derived 播放器运行的时候有一点古怪，与这种音乐分类标准下播放器的浏览音乐的性能有关。


根据在 Aqualung 官网下载的参考文档说明，官方发布的只有源代码。但是文档上的说明暗示了绝大多数主流的 Linux 发行版本都内置的有一份复制的编译后的 Aqualung，我当前用的办公电脑所使用的 Linux 发行版本并不在此范围内，Ubuntu 16.10。[Launchpad.net][10] 提供的有个人软件包库（PPAs），但那些软件看起来都有些过时了，版本比较老，所以为什么不试试编译源码安装软件呢？


我根据官网上编译文档的建议和配置脚本的提示安装了 **pkgconf** 以及 **libasound**，**libflac**，**libmp3lame**，**libvorbis**，**libxml2**，**libglib2.0** 和 **libgtk+-2.0** 的开发版。接下来，我就能够干净利索的进行**配置**然后进行**编译**和**编译安装**。最终我是通过执行 **/usr/local/bin/aqualung** 这个文件来进行 aqualung 的安装。


 ![Aqualung](https://opensource.com/sites/default/files/aqualung.png "Aqualung") 


Aqualung，不能切换音乐播放的码率。


一旦 Aqualung 启动运行，我就能看到两个相当简洁直接的窗口用户界面，播放器本身和“音乐商店”。我通过右键点击播放器的音乐面板打开参数设置查看这些可设置的参数看是否能找到 AudioQuest DragonFly 这个数字模拟转换器，但我没有找到任何相关的参数。然而，站点上的说明指出你可以通过命令行指定输出设备。最终我用 **plughw** 外置声卡设备来让 Aqualung 启动。


在那个时候，真正让我对 Aqualung 感到失望的是 Aqualung 似乎是需要一个固定的输出设备来抽样检查频率。我能够用 Aqualung 播放器的默认设置来正常播放我的 44.1 Khz 文件，但是同样的抽样检查频率播放 96 Khz 的音乐文件时，我不得不关闭软件并重新启动。也正是因为这一点，我不会再继续进行对 Aqualung 的使用测评。


**不作进一步的评论。**


### Lollypop


 ![Lollypop interface](https://opensource.com/sites/default/files/lollypop_interface.png "Lollypop interface") 


优美的 Lollypop 用户界面。


[Lollypop][11] 有一个华丽的网站。尽管它不在我办公专用的电脑的软件仓库里面，但是有一个“针对 Ubuntu/Debian 用户的下载”链接带你跳转到 [launchpad.net 站点提供的最新的 PPA][12]。这个站点还提供针对 Flatpak，Arch Linux，Fedora，和 OpenSUSE 这些系统的 Lollypop 软件包的下载。我看了下[Fedora COPR 上针对各个 Fedora 版本的 Lollypop 下载链接][13]，看起来 Lollypop 更新的比较及时而且从 Fedora 版本的 23 到 26 都有对应的软件包提供下载安装。 


就一天内从源码编译安装 Lollypop 软件是一件非常刺激的事，所以我决定试试从 PPA 安装这款软件。我通过命令行来安装执行 Lollypop 软件。设置菜单能够在 Lollypop 界面的右上方很明显地看见。更新完音乐后，我开始找电脑的输出设备设置，但是在一番查看后，我不知道如何针对 Lollypop 选择合适正确的输出设备。即便我在命令行通过 **-help** 也找不到有用的帮助信息。


经过一番网上搜索后我找到一个 Lollypop 的开发者的描述说明才知道我需要 **gstreamer libav** 来让 Lollypop 工作。通过这个说明我暂时推断出可能还需要一个 **gstreamer** 相关配置才有可能让 Lollypop 成功正常运行工作，但是我至少现在不会去继续尝试。


Lollypop 有一个优美的用户交互界面和它的优美的网站相得益彰，但是我现在不会进一步对它进行测评。否则我就又多了一个进一步去学习了解 **gstreamer** 的理由。


**不作进一步的评论。**

### GogglesMM


[Goggles Music Manager][14] 也有一个[在 launchpad.net 及时更新的 PPA][15]；安装流程简单明了，我可以在命令行通过执行 **gogglesmm** 来完成安装。


GogglesMM，非常容易上手使用，看上去和 Rhythmbox 有点像。我在 GogglesMM 的设置里面的参数设置中找到了音频选项设置，能够让我选择 ALSA 和设置音频输出用哪块输出设备。通过查看 **/proc/asound/DragonFly/stream0** 文件和 DragonFly 设备上 LED 的颜色我确定我能够用 GogglesMM 播放 44.1-KHz／21-bit 和 96-KHz／24-bit 这两种规格的音乐；因此，就凭“rate/depth passthrough”我给 GogglesMM 打 5 分。


 ![GogglesMM](https://opensource.com/sites/default/files/gogglesmm.png "GogglesMM") 


上图是 GogglesMM 在播放 96/24 这种规格的音乐，显示音频输出设备选择。 


GogglesMM 的说明文档并没有大量的细节介绍，但是我尽可能能够说明的是，开发者们使用了不少过滤条件来实现类似“智能播放列表”的功能。我在我的测试环境下使用三张专辑来尽我所能检测过滤功能，当我使用“智能播放列表”功能的时候尽管我喜欢我看到的通过过滤筛选出来的歌曲（特别是能够基于广泛的标准来针对歌曲定义筛选条件），但这并不是我认为的“智能播放列表”，对我来说我认为“智能播放列表”应该是这样的，通过借助一些社区数据库来推荐提供和你近期播放的歌曲类似的曲目。或者我该把这个叫作“自动的 DJ”而不是“智能播放列表”，但是通过测试我最终能够确定的是，这个特性并不会在近期版本的 GogglesMM 中出现，所以我给它这个所谓的“智能播放列表”打 0 分。


至于播放列表队列的操作，这款应用能够支持播放你选中的音乐也能够随机播放音乐或者把一些音乐整合到一个播放列表里面，所以我因为“播放列表的队列选项”给它打 1 分。


同样的，它看起来也能够很好地不需要额外的干预来管理我的音乐艺术封面（每个专辑都包含一张合适的由 GogglesMM 自动识别的艺术封面），所以为“内嵌的艺术封面或者封面图片”打 1 分。


我找不到任何方法来让 GogglesMM 显示信号级别或者实际的比特率。我也不能找到显示比特率和位深度的方法；尽管这款应用能够在一个列表里面显示所有的音乐“格式”，但是在我的音乐栏里面除了显示音乐格式不会显示其他的信息了，所以为 GogglesMM 的“信号级别和有效比特率”打 0 分。


至于 GogglesMM 的整体结构，它设计的所有按钮选项都正好完全符合我的使用习惯。我能够在播放队列里面看到歌曲的时间和歌曲当前已播放的时间所占歌曲总体时间的比例，专辑封面，歌曲名，专辑名和歌唱者。可用的播放栏列表看起来相当的大容量有用，比如也包括了作曲者。最后，一个真正让我眼前一亮的特点是，音量控制竟然包含了 ALSA 音量。也就是如果我启动控制台调整音量的话然后不管是在控制台还是在 GogglesMM 里面调整音量，另一个音量控制也会做相应的音量调整。这个出乎我意外之外的功能相当的酷而且这个功能在其他的音乐播放器上也不常见，因此为它的整体架构给 GogglesMM 加 1 分。


最终 GogglesMM 的这些优点共计得分 8。所表现出来的特点确实很优秀。


**评分：8**


### 到目前为止所给出的评分


我所提到的这几个开源音乐播放器中，我最喜欢的还是 [Guayadeque][16]，根据我制定的标准来进行排名的话，我给 Guayadeque 打满分 10 分。来看下我对这三个开源音乐播放器的评分总结吧（N／R 代表“不作评论”，因为我不确定如何配置这些播放器来让它们以完美的码率和贯穿模式工作以便我的数字模拟信号转换器在相应源的码率和位深度接收 PCM 数据）：


 ![Open source audio players](https://opensource.com/sites/default/files/open_source_audio.png "Open source audio players") 


请注意下我用的这个排名方法不是针对所有音乐播放器通用的。特别是很多人并不清楚高品质音乐的价值，他们更高兴专有格式的音乐能够给他们带来更好的音乐品质。


与此同时，我会继续评测一些之前向大家承诺的音乐播放器一些和评测评分无关的特性。我特别喜欢 Lollypop 的外观，我也觉得待解锁的 **gstreamer** 有一种神秘的魅力，他能让基于 **gstreamer** 的音乐播放器不用通过转换就能传输他们的数据。 


### 关于音乐的部分．．．


我还在保持继续购买唱片的习惯，对于唱片的购买我有些不错的推荐。


第一个就是 Nils Frahm 的专辑，[Felt][17]，是我女儿送我的一份非常贴心的礼物。我真的真的很喜欢这张专辑，它的绝大部分歌曲都是在深夜用电麦录制的非常接近钢琴的弦乐而且也有不少有趣的钢琴演奏的背景音乐，真的是很棒的音乐。至于 Nils Frahm 其他的音乐，这些唱片也提供的有下载链接允许你下载质量高达 96-KHz，24-bit FLAC 格式的音乐。


第二个就是 Massive Attack 的 [Mad Professor's remix][18] 这份专辑。你可以[在这里了解这份专辑][19]，并且如果你想要尝试这份专辑最原始的版本，[这里是汇总的它的所有相关信息][20]。最原始的版本诞生于 20 世纪 90 年代，这份专辑刻录在唱片上面而且听起来非常奇幻。遗憾的是，不提供下载链接。


第三个就是 Bayonne 的 [Primitives][21]。[这是专辑要表达的想法][22]。Guardian 报社把这份专辑称作是“新花样的无聊”。那么这种类型的音乐到底怎么样呢？如果这些音乐真的是非常令人乏味的，或许是时候来换份工作了，无论如何你可以试试听这些音乐；或许你会觉得它确实很乏味或者你会像我一样喜欢上这份音乐。

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/clh_portrait2.jpg?itok=V1V-YAtY)


Chris Hermansen - 自 1978 年毕业于 British Columbia 大学后一直从事计算机相关工作，2005 年之前是 Solaris，SunOS，UNIX System V 的忠实用户，之后是 Linux 的忠实用户。在技术方面，我的职业生涯大部分时间都是在做数据分析；特别是空间数据分析。拥有丰富的和数据分析相关的编程经验，用过的编程语言有 awk，Python，PostgreSQL， PostGIS 和 最新的 Groovy。


--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/open-source-music-players

作者：[Chris Hermansen][a]
译者：[WangYueScream](https://github.com/WangYueScream)
校对：[校对者ID](https://github.com/校对者ID)

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
