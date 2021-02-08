23 款开源的声音、视觉生产工具
======

> 无论你是要进行音频、图形、视频、动画还是它们的任意组合，都有一个开源工具可以帮助你产生专业水平的结果。

![](https://img.linux.net.cn/data/attachment/album/201912/04/093037w8ab8v0voz0b5u88.jpg)

“开源”在云基础设施、网站托管、嵌入式设备和其他领域已经建立的相当完善。很少数人知道开源在生产专业级的声音视觉素材上也是一个不错的选择。

作为一名产品经理（有时候也是市场支持），我为终端用户提供很多内容：文档、文章、视频教学，甚至是展台物料、白皮书、采访等等。我找到了很多可以帮我制作音频、视频、排版、截屏的开源软件。人们选择开源软件而不是专有软件的[原因][1]有很多，而我也为以下人群编制了一份开源音视频工具清单：

* 想要入坑 GNU/Linux，但需要在原来的操作系统上慢慢从使用跨平台软件开始
* 热爱开源，但对音视频开源软件所知甚少，不知道该如何选择
* 想要为创造力充电而探索新的工具，并且不想使用其他人使用过的方法工具
* 存在某些其他的原因使用开源音视频解决方案（如果是你，不妨在评论里分享一下）

幸运的是，存在着很多开源的音视频创作软件，也存在着很多硬件来支持这些应用。本文清单里的所有软件都符合以下标准：

* 跨平台
* 开源（软件和驱动）
* 稳定
* 积极维护
* 良好的文档与技术支持

我将清单中的解决方案划分为图形、音频、视频和动画。注意，本文中提到的应用程序并不完全等同于一些有名的私有软件，它们需要花时间来学习，并且可能需要改变你的工作流程，但是学习新的工具能够让体验全新的创造方式。

### 图形

我制作过很多出版和网站使用的图形，包括徽标、横幅、视频节目、草图。这里是一些我用过的开源应用，也包括一同使用的硬件。

#### 软件

**1、[Inkscape][2]**（矢量图）

Inkscape 是一款不错的矢量图编辑器，用来制作 RGB 颜色空间下的 SVG 和 PDF 文件。（它可以制作 CMYK 图像，但不是主要用途）它是为 web 应用制作 SVG 格式的地图和图表的人的救命稻草。你不仅可以使用集成的 XML 编辑器打开文件，也可以用它查看对象的所有参数。但有一个缺点：它在 Mac 上的优化不是很好。有很多样例，可以看[Inkscape 画廊][3]。

**2、[GIMP][4]**（图片编辑器）

GIMP 是我最喜欢的图片编辑程序，它包括了色彩调整、裁剪和拉伸，并且（尤其是）对于网页使用的文件大小进行了优化（很多使用 Photoshop 的同事让我帮他们做这最后一步）。你也可以从头制作并绘制一张图片，但 GIMP 并不是我最喜欢用来做这件事的工具。在 [GIMP Artists on DevianArt][5] 上查看众多的样例。

**3、[Krita][6]**（数字绘画）

当你桌子上摆着一个漂亮的 Wacom 数位板，你肯定想试试真正的数字绘画应用。Krita 就是你创作漂亮插画所需要的工具。在 [Krita 画廊][7] 里看看我说的东西吧。

**4、[Scribus][8]**（桌面印刷系统）

你可以使用 Scribus 来创建一个完整的文档，或者只是把用 Inkscape 或 Libre Office 制作的 PDF 从 RGB 转换到 CMYK。有一个功能我非常喜欢：你可以试着模拟视觉障碍人士使用 Scribus 时的体验。当我发送 PDF 文件给商业印刷公司时全指望 Scribus。尽管出版社可能使用像 InDesign 这样的私有软件创建文档，但如果你用 Scribus 正确的完成一份文档，那么打印时就不会出现任何问题。免费建议：第一次发送文件给印刷公司时，不要告诉印刷公司创建该文档所使用的软件。你可以在 [Scribus 教程][9]中寻找创建文档的例子。

**5、[RawTherapee][10]**（RAW 图像开发工具）

RawTherapee 是我所知道唯一跨平台可替代 Lightroom 的软件。你可以将相机调整到 RAW 模式，然后使用 RawTherapee 来修图。它提供了非常强大的引擎和对图片没有破坏的编辑器。例如，可以见 [Raw Therapee 截图][11]。

**6、[LibreOffice Draw][12]**（桌面印刷系统）

尽管你可能认为 LibraOffice Draw 不是一款专业的桌面印刷解决方案，但它仍然能够在很多情况下帮助你。例如，制作其他人（尽管是那些不懂图形软件的人）以后可以修改的白皮书、图表或海报。它不仅方便使用，而且当创建有趣的文档时也是 Impress 或 PowerPoint 的绝佳替代软件。

#### 图形硬件

**绘图板**

[Wacom][13] 数位板（和兼容设备）通常支持所有的操作系统。

**颜色校正**

颜色校正产品通常可用于所有操作系统，也包括了 GNU/Linux。Datacolor 生产的 [Spyder][14] 在所有平台上都有应用程序的支持。

**扫描仪和打印机**

图形艺术家需要输出（无论是打印还是电子版）的颜色是精确的。但是真正跨平台的设备，以及所有平台都易于安装的驱动，并不像你想的那样普遍。你的最佳选择是兼容 TWAIN 的扫描仪和兼容 Postscript 的打印机。以我的经验，Epson 和 Xerox 的专业级扫描仪和打印机更不容易出现驱动问题，并且它们通常也是开箱即用，拥有漂亮精确的颜色。

### 音频

有许多可供音乐家、视频制作者、游戏制作者、音乐出版商等等人群选择的开源音频软件。这里有一些我曾经用来进行内容创作与声音录制时所使用的软件。

#### 软件

**7、[Ardour][15]**（数字音频录制）

对录音与编辑来说，最专业级的工具选择当然是唾手可得的 Ardour。听起来很棒，它的混音部分非常的完整灵活，能够提供给你喜欢的插件，并且易于回放、编辑、对比修改。我经常用它进行声音录制和视频混音。要找出一些使用 Ardour 录制好的音乐并不容易，因为音乐家们很少表明他们使用的软件。然而，你可以查看它的[截图][16]和一些特性来了解它的功能。

（如果你在寻求一种声音制作方面的“模拟体验”，你可以试试 [Harrison Mixbus][17]，它并不是一个开源项目，但是高度基于 Ardour，拥有模拟显示的终端。我非常喜欢用它进行工作，我的客户也喜欢用它制作的声音。Mixbus 也是跨平台的）

**8、[Audacity][18]** （声音编辑）

Audacity 属于“瑞士军刀”级的声音制作软件。它并不完美，但你几乎可以用它做所有的事情。加上非常易于使用，任何人都能在几分钟之内上手。像 Ardour 一样，很难找到一份归功于 Audacity 的作品，但你可以从这些[截图][19]中了解如何使用它。

**9、[LMMS][20]** （音乐制作）

LMMS，设计作为 FL Studio 的替代品，也许使用并不那么广泛，但它非常完整并易于使用。你可以使用自己最喜欢的插件，使用“钢琴键”编辑乐器，使用<ruby>步定序器<rt>step sequencer</rt></ruby>播放鼓点，混合音轨...几乎能做任何事情。在我没有时间为音乐家录音的时候我就使用它为视频创建声音片段。查看[最好的 LMMS][21] 榜单来看看一些例子。

**10、[Mixxx][22]** （DJ，音乐混音）

如果你需要强大的混音和播放 DJ 软件，Mixxx 就可以满足你的需求。它与大多数 MIDI 控制器、唱片、专用声卡所兼容。你可以用它管理音乐库、添加音效，做一些有趣的事情。查看它的[功能][23]来了解它是如何工作的。

#### 音频接口硬件

尽管你可以使用任何一个计算机的声卡录制音频，但要录制的很好，就需要一个音频接口——一个录制高质量音频输入的专用的外部声卡。对于跨平台兼容性来说，大多数“兼容 USB”和“兼容 iOS”的音频接口设备应该都能录制 MIDI 或其他音频。下面是一些我用过的一些有名气的跨平台设备。

**[Behringer U-PHORIA UMC22][24]**

UMC22 是你可以考虑的最便宜的选择。但它的前置放大器噪音太大，<ruby>音腔<rt>box</rt></ruby>质量也比较低。

**[Presonus AudioBox USB][25]**

AudioBox USB 是第一个兼容 USB（因此也跨平台）的录音系统。它非常的耐用，经常在二手市场也能见到。

**[Focusrite Scarlett][26]**

Scarlett 在我看来是目前最高质量的跨平台声卡。不同种类的设备可以涵盖 2-18 个输入/输出端口。你可以在二手市场找到它的最初版本，而最新的第二代具有更好的前置放大器与规格。[2i2][27] 型号是我经常使用的那一款。

**[Arturia AudioFuse][28]**

AudioFuse 几乎可以让你接入任何设备，从麦克风到黑胶唱片机再到各种数字输入设备。它具有优质的声音与良好的设计，也是我目前用的最多的一款设备。它是跨平台的，但目前配置软件还不能在 GUN/Linux 上使用。即使我把它从 Windows 电脑上断开，它仍然保留着我的配置。但是讲真，Arturia，劳烦认真考虑做一个 Linux 的软件。

#### MIDI 控制器

MIDI 控制器是一种乐器——例如电子琴、鼓垫等等。可以让你控制音乐软件或者硬件。现有的大多数 USB MIDI 控制器都跨平台并兼容主流的录音编辑软件。基于网页的教程可以帮你对不同的软件进行配置。尽管找到有关在 GNU/Linux 上配置的信息可能比较困难，但它们仍然是可以使用的。我用过许多 Akai 和 M-Audio 设备，没有任何问题。在买乐器之前最好先试一下，至少去听一下它们的音质或体验一下按键触感。

#### 音频编解码器

音频编解码器压缩或解压数字音频，用尽可能小的文件大小获得最佳质量的声音。幸运的是，用于收听或流媒体播放的编解码器恰好是开源的：[FLAC][29]。[Ogg Vorbis][30] 是另一个值得了解的开源音频编解码器；在相同的比特率下比 MP3 好的多。如果你需要输出不同的音频格式，我建议通常存档最好质量的音频，然后再压缩成特定的版本。

### 视频

视频对于品牌的传播是影响巨大的。即使你不是一个视频专家，学习一些基础的东西也是非常明智的。

#### 软件

**11、[VLC][31]** （视频播放器与转换器）

最初是为流媒体而开发的，VLC 现在因能够在所有设备上读取所有的视频格式被人们熟知。它非常的实用，例如，你可以使用它将视频转换成其他编解码格式或容器，也可以用来恢复破损的视频。

**12、[OpenShot][32]** （视频编辑）

OpenShot 是一个简单的软件，但它却可以制作出很好的效果，尤其是在短视频上。（在编辑或改善音质方面有一定的限制，但它也能够完成）我非常喜欢它的移动、拉伸、裁剪工具；用它创建视频的开头或结尾，导出之后使用更复杂的编辑器进行编辑，非常的完美。你可以在 OpenShot 的网站上看这些[例子][33]（并获取更多信息）。

**13、[Shotcut][34]** （视频编辑）

我认为 Shotcut 是比 OpenShot 更完整一些的工具——它在你的操作系统上比起其他较为基础的编辑器更具有竞争力，并且它支持 4K 分辨率，具有专业的解码器。尝试一下，我相信你会爱上它的。你可以在这些[视频教程][35]里看一些范例。

**14、[Blender Velvets][36]** （视频编辑、合成、特效）

尽管这一章节不是本文的学习重点，但 Blender Velvets 是你能找到的最强大的解决方案之一。它是由一些视频创作者所制作的一系列扩展工具和脚本的合集，是通过 Blender 3D 制作软件转换成的 2D 视频编辑器。尽管它的复杂度意味着不是我的首选视频编辑器，但你仍可以在 YouTube 和其他网站上找到它的教程，并且一旦你学习了它，你就能通过它做任何事情。观看这个[视频教程][37]来了解它的功能与运作方式。

**15、[Natron][38]**（合成）

我不使用 Natron，但我听说它广受好评。它是 Adobe After Effects 的替代品，但运作方式并不同。想了解更多可以观看一些视频教程，比如这些 Natron 的 [YouTube 频道][39]。

**16、[OBS][40]** （实时编辑、录制、流媒体）

Open Broadcaster Software（OBS）是一个领先的在 YouTube 或 Twitch 上进行现场录制或现场直播电子竞技、电视游戏的解决方案。我经常使用它记录用户的屏幕、会议和聚会。要获取更多信息，查看我曾经在 Opensource.com 上写的关于录制现场汇报的教程，[第一部分：选择你的设备][42]和[第二部分：软件安装][43]。

#### 视频硬件

结论先行：你需要一个强大的工作站以及快速的硬盘和更新的软件和驱动。

**图形处理单元（GPU）**

一部分包含在清单里的软件比如 Blender 和 Shotcut 使用 OpenGL 和硬件加速，这些都高度依赖 GPU。我建议你使用可以负担起的最强大的 GPU。我所使用过的 AMD 和 Nvidia 都有着良好的体验，这取决于使用的平台。不要忘记安装最新的驱动。

**硬盘**

大体上来说，越快越大的硬盘，对视频越好。不要忘记在软件里配置好正确的路径。

**视频录制硬件**

* [Blackmagic Design][44]: Blackmagic 提供了非常好的、专业级的视频录制和回放硬件。驱动支持 Mac、Windows 和 GNU/Linux（但不是所有的发行版）
* [Epiphan][45]: 在 Epiphan 的专业级 USB 视频录制设备中有一款新型产品，它适用于 HDMI 和高分辨率的屏幕。然而，你也可以在二手市场找到旧的 VGA 设备，因为他们还在继续为 GNU/Linux 和 Windows 上提供专用的驱动程序。

#### 视频编解码

不幸的是，使用开源的编解码器仍然很困难。例如，许多相机使用专有的编解码器录制 H.264 的视频和 AC3 的音频，组成称为 AVCHD 的格式。因此，我们必须务实，尽可能利用现有资源。

好消息是内容产业正在步向开源的编解码器来避免一些费用，并使用开源标准。对于出版和流媒体，[谷歌][46]的 [WebM][46] 便是一款优秀的开源编解码器，并且大多数视频编辑器可以导入这种格式。同样地， [GoPro][47]的超高分辨率和 360° 视频编解码器 [Cineform][47] 现在也进行了开源。希望更多的设备和供应商将会在不久之后使用它。

### 2D 和 3D 动画

动画不是我的专业领域，因此我问了从事于动画内容生产的朋友一些建议并加入到清单中，他的工作包含儿童电影和连续剧。

#### 软件

**17、[Blender][48]** （3D 模型和渲染）

Blender 是顶级的开源跨平台 3D 建模和渲染软件。你可以直接在 Blender 中完成整个项目的工作，或者使用它为电影或视频创建 3D 效果。你能够在网上找到许多视频教程，因此即使它不是一个简单的软件，但也非常容易上手。Blender 是一个非常活跃的项目，经常还会制作一些微电影来展示他们的技术。你可以在 [Blender Open Movies][49] 上观看。

**18、[Synfig Studio][50]** （2D 动画）

第一次用 Synfig 时，它让我想起了那个不错的 Macromedia 老式 Flash 编辑器。在那之后，它已经发展成一个全功能的 2D 动画工作室。你可以使用它制作宣传故事、商业广告、演示、开场或结尾动画以及视频中的转场，或者甚至用它制作全动画的电影。见 [Synfig 作品集][51]。

**19、[TupiTube][52]** （定格 2D 动画）

使用 TupiTube 是一个学习基本 2D 动画的极好方法。你可以将一系列绘画或其他图片转换成一个视频或者创建一个 GIF 循环动画。它是一个相当简单的软件，但非常完整。查看 [TupiTude 的 YouTube][53] 频道获取一些教程和范例。

#### 硬件

动画制作使用与图形设计相同的硬件，因此查看第一小结中的硬件清单获取一些建议。

有一点需要注意：你要用一个强大的 GPU 来进行 3D 建模和渲染。选择可能有些限制，因为这取决于你使用的平台或电脑制造商，但是不要忘记安装最新的驱动。谨慎选择你的显卡：它们非常昂贵，并且在大型的 3D 项目中至关重要，尤其是在渲染步骤中。

### Linux 上的选择

如果你是 GUN/Linux 用户，那么我为你提供了更多不错的选择。它们并不是完全跨平台的，但部分拥有 Windows 版本，还有一些可以在 Mac 上使用 Macports 安装。

**20、[Kdenlive][54]** （视频编辑）

伴随着最新版本的发布（几个月之前），Kdenlive 成为了我最喜欢的视频编辑器，尤其是当我在 Linux 机器上处理一些长视频的时候。如果你经常使用流行的非线性视频编辑器，Kdenlive（全称是 <ruby>KDE 非线性视频编辑器<rt>KDE Non-Linear Video Editor</rt></ruby>）对你来说将非常简单。它拥有很棒的视频和音频特效，强大的细节处理能力。并且在 BSD 和 MacOS（尽管它对准的是 GNU/Linux）都能使用，还有望移植到 Windows 上。

**21、[Darktable][55]** （RAW 图像开发）

Darktable 是一款由摄影师制作的非常完整的 DxO PhotoLab 替代品。一些研究型项目使用它当做开发平台并测试一些图像处理算法。它是一个非常活跃的项目，我已经等不及的见到它的跨平台版本了。

**22、[MyPaint][56]** （digital painting数字绘画）

MyPaint 就像数字绘画领域的 light table（LCTT 译注：集成开发环境）。它在 Wacom 设备上表现良好，并且它的笔刷引擎尤其值得赞赏，因此 GIMP 开发人员正在密切的关注它。

**23、[Shutter][57]** （桌面截图）

当我写这篇教程的时候，我使用了许多截图来进行展示。我最喜欢的 GNU/Linux 截图工具就是 Shutter。事实上，我都找不到在 Windows 或 Mac 上能与之抗衡的一些功能。有一点小遗憾：我很期待 Shutter 在将来能够增加新的功能来创建几秒动态的 GIF 截图。

我希望这些足以说服你开源软件是一种非常卓越且可行的音视频内容生产解决方案。如果你正在使用其他开源软件，或者对于使用跨平台软件和硬件进行音视频项目有好的建议，请在评论中分享你的观点。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/open-source-audio-visual-production-tools

作者：[Antoine Thomas][a]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ttoine
[1]:https://opensource.com/resources/what-open-source
[2]:https://inkscape.org/
[3]:https://inkscape.org/en/gallery/
[4]:https://www.gimp.org/
[5]:https://gimp-artists.deviantart.com/gallery/
[6]:https://krita.org/
[7]:https://krita.org/en/features/gallery/
[8]:https://www.scribus.net/
[9]:https://www.scribus.net/category/made-with-scribus/
[10]:http://rawtherapee.com/
[11]:http://rawtherapee.com/blog/screenshots
[12]:https://www.libreoffice.org/discover/draw/
[13]:http://www.wacom.com/en-us
[14]:http://www.datacolor.com/photography-design/product-overview/#workflow_2
[15]:https://www.ardour.org/
[16]:http://ardour.org/features.html
[17]:http://harrisonconsoles.com/site/mixbus.html
[18]:http://www.audacityteam.org/
[19]:http://www.audacityteam.org/about/screenshots/
[20]:https://lmms.io/
[21]:https://lmms.io/showcase/
[22]:https://www.mixxx.org/
[23]:https://www.mixxx.org/features/
[24]:http://www.musictri.be/Categories/Behringer/Computer-Audio/Interfaces/UMC22/p/P0AUX
[25]:https://www.presonus.com/products/audiobox-usb
[26]:https://us.focusrite.com/scarlett-range
[27]:https://us.focusrite.com/usb-audio-interfaces/scarlett-2i2
[28]:https://www.arturia.com/products/audio/audiofuse/overview
[29]:https://en.wikipedia.org/wiki/FLAC
[30]:https://xiph.org/vorbis/
[31]:https://www.videolan.org/
[32]:https://www.openshot.org/
[33]:https://www.openshot.org/videos/
[34]:https://shotcut.com/
[35]:https://shotcut.org/tutorials/
[36]:http://blendervelvets.org/
[37]:http://blendervelvets.org/video-tutorial-new-functions-for-the-blender-velvets/
[38]:https://natron.fr/
[39]:https://www.youtube.com/playlist?list=PL2n8LbT_b5IeMwi3AIzqG4Rbg8y7d6Amk
[40]:https://obsproject.com/
[41]:https://opensource.com/article/17/7/obs-studio-pro-level-streaming
[42]:https://opensource.com/article/17/9/equipment-recording-presentations
[43]:https://opensource.com/article/17/9/equipment-setup-live-presentations
[44]:https://www.blackmagicdesign.com/
[45]:https://www.epiphan.com/
[46]:https://www.webmproject.org/
[47]:https://fr.gopro.com/news/gopro-open-sources-the-cineform-codec
[48]:https://www.blender.org/
[49]:https://www.blender.org/about/projects/
[50]:https://www.synfig.org/
[51]:https://www.synfig.org/#portfolio
[52]:https://maefloresta.com/
[53]:https://www.youtube.com/channel/UCBavSfmoZDnqZalr52QZRDw
[54]:https://kdenlive.org/
[55]:https://www.darktable.org/
[56]:http://mypaint.org/
[57]:http://shutter-project.org/
