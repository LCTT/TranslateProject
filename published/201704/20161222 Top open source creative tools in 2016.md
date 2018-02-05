2016 年度顶级开源创作工具
============================================================

> 无论你是想修改图片、编译音频，还是制作动画，这里的自由而开源的工具都能帮你做到。

![2016 年度 36 个开源创作工具](https://opensource.com/sites/default/files/styles/image-full-size/public/u23316/art-yearbook-paint-draw-create-creative.png?itok=KgEF_IN_ "Top 34 open source creative tools in 2016 ") 

>图片来源 : opensource.com

几年前，我在 Red Hat 总结会上做了一个简单的演讲，给与会者展示了 [2012 年度开源创作工具][12]。开源软件在过去几年里发展迅速，现在我们来看看 2016 年的相关领域的软件。

### 核心应用

这六款应用是开源的设计软件中的最强王者。它们做的很棒，拥有完善的功能特征集、稳定发行版以及活跃的开发者社区，是很成熟的项目。这六款应用都是跨平台的，每一个都能在 Linux、OS X 和 Windows 上使用，不过大多数情况下 Linux 版本一般都是最先更新的。这些应用广为人知，我已经把最新特性的重要部分写进来了，如果你不是非常了解它们的开发情况，你有可能会忽视这些特性。

如果你想要对这些软件做更深层次的了解，或许你可以帮助测试这四个软件 —— GIMP、Inkscape、Scribus，以及 MyPaint 的最新版本，在 Linux 机器上你可以用 [Flatpak][13] 软件轻松地安装它们。这些应用的每日构建版本可以[按照指令][14] 通过 Flatpak 的“每日构建的绘图应用（Nightly Graphics Apps）”得到。有一件事要注意：如果你要给每个应用的 Flatpak 版本安装笔刷或者其它扩展，用于移除这些扩展的目录将会位于相应应用的目录 **~/.var/app** 下。 

#### GIMP

[GIMP][15] [在 2015 年迎来了它的 20 周岁][16]，使得它成为这里资历最久的开源创造型应用之一。GIMP 是一款强大的应用，可以处理图片，创作简单的绘画，以及插图。你可以通过简单的任务来尝试 GIMP，比如裁剪、缩放图片，然后循序渐进使用它的其它功能。GIMP 可以在 Linux、Mac OS X 以及 Windows 上使用，是一款跨平台的应用，而且能够打开、导出一系列格式的文件，包括在与之相似的软件 Photoshop 上广为应用的那些格式。

GIMP 开发团队正在忙着 2.10 发行版的工作；[2.8.18][17] 是最新的稳定版本。更振奋人心的是非稳定版，[2.9.4][18]，拥有全新的用户界面，旨在节省空间的符号式图标和黑色主题，改进了颜色管理，更多的基于 GEGL 的支持分离预览的过滤器，支持 MyPaint 笔刷（如下图所示），对称绘图，以及命令行批次处理。想了解更多信息，请关注 [完整的发行版注记][19]。

![GIMP 截图](https://opensource.com/sites/default/files/gimp_520.png "GIMP 截图") 

#### Inkscape

[Inkscape][20] 是一款富有特色的矢量绘图设计软件。可以用它来创作简单的图形、图表、布局或者图标。

最新的稳定版是 [0.91][21] 版本；与 GIMP 相似，能在预发布版 0.92pre3 版本中找到更多有趣的东西，其发布于 2016 年 11 月。最新推出的预发布版的突出特点是 [梯度网格特性（gradient mesh feature）][22]（如下图所示）；0.91 发行版里介绍的新特性包括：[强力笔触（power stroke）][23] 用于完全可配置的书法笔画（下图的 “opensource.com” 中的 “open” 用的就是强力笔触技术），画布测量工具，以及 [全新的符号对话框][24]（如下图右侧所示）。（很多符号库可以从 GitHub 上获得；[Xaviju's inkscape-open-symbols set][25] 就很不错。）_对象_对话框是在改进版或每日构建中可用的新特性，整合了一个文档中的所有对象，提供工具来管理这些对象。

![Inkscape 截图](https://opensource.com/sites/default/files/inkscape_520.png "Inkscape 截图") 

#### Scribus

[Scribus][26] 是一款强大的桌面出版和页面布局工具。Scribus 让你能够创造精致美丽的物品，包括信封、书籍、杂志以及其它印刷品。Scribus 的颜色管理工具可以处理和输出 CMYK 格式，还能给文件配色，可靠地用于印刷车间的重印。

[1.4.6][27] 是 Scribus 的最新稳定版本；[1.5.x][28] 系列的发行版更令人期待，因为它们是即将到来的 1.6.0 发行版的预览。1.5.3 版本包含了 Krita 文件（*.KRA）导入工具； 1.5.x 系列中其它的改进包括了表格工具、文本框对齐、脚注、导出可选 PDF 格式、改进的字典、可驻留边框的调色盘、符号工具，和丰富的文件格式支持。

![Scribus 截图](https://opensource.com/sites/default/files/scribus_520.png "Scribus 截图") 

#### MyPaint

[MyPaint][29] 是一款用于数位屏的快速绘图和插画工具。它很轻巧，界面虽小，但快捷键丰富，因此你能够不用放下数位笔而专心于绘图。

[MyPaint 1.2.0][30] 是其最新的稳定版本，包含了一些新特性，诸如 [直观上墨工具][31] 用来跟踪铅笔绘图的轨迹，新的填充工具，层分组，笔刷和颜色的历史面板，用户界面的改进包括暗色主题和小型符号图标，以及可编辑的矢量层。想要尝试 MyPaint 里的最新改进，我建议安装每日构建版的 Flatpak 构建，尽管自从 1.2.0 版本没有添加重要的特性。

 ![MyPaint 截图](https://opensource.com/sites/default/files/mypaint_520.png "MyPaint 截图") 

#### Blender

[Blender][32] 最初发布于 1995 年 1 月，像 GIMP 一样，已经有 20 多年的历史了。Blender 是一款功能强大的开源 3D 制作套件，包含建模、雕刻、渲染、真实材质、套索、动画、影像合成、视频编辑、游戏创作以及模拟。

Blender 最新的稳定版是 [2.78a][33]。2.78 版本很庞大，包含的特性有：改进的 2D 蜡笔（Grease Pencil） 动画工具；针对球面立体图片的 VR 渲染支持；以及新的手绘曲线的绘图工具。

![Inkscape 截图](https://opensource.com/sites/default/files/blender_520.png "Inkscape 截图") 

要尝试最新的 Blender 开发工具，有很多种选择，包括：

*   Blender 基金会在官方网址提供 [非稳定版的每日构建版][2]。
*   如果你在寻找特殊的开发中特性，[graphicall.org][3] 是一个适合社区的网站，能够提供特殊版本的 Blender（偶尔还有其它的创造型开源应用），让艺术家能够尝试体验最新的代码。
*   Mathieu Bridon 通过 Flatpak 做了 Blender 的一个开发版本。查看它的博客以了解详情：[Flatpak 上每日构建版的 Blender][4]

#### Krita

[Krita][34] 是一款拥有强大功能的数字绘图应用。这款应用贴合插画师、印象艺术家以及漫画家的需求，有很多附件，比如笔刷、调色板、图案以及模版。

最新的稳定版是 [Krita 3.0.1][35]，于 2016 年 9 月发布。3.0.x 系列的新特性包括 2D 逐帧动画；改进的层管理器和功能；丰富的常用快捷键；改进了网格、向导和图形捕捉；还有软打样。

 ![Krita 截图](https://opensource.com/sites/default/files/krita_520.png "Krita 截图") 

### 视频处理工具

关于开源的视频编辑工具则有很多很多。这这些工具之中，[Flowblade][36] 是新推出的，而 Kdenlive 则是构建完善、对新手友好、功能最全的竞争者。对你排除某些备选品有所帮助的主要标准是它们所支持的平台，其中一些只支持 Linux 平台。它们的软件上游都很活跃，最新的稳定版都于近期发布，发布时间相差不到一周。

#### Kdenlive

[Kdenlive][37]，最初于 2002 年发布，是一款强大的非线性视频编辑器，有 Linux 和 OS X 版本（但是 OS X 版本已经过时了）。Kdenlive 有用户友好的、基于拖拽的用户界面，适合初学者，又有专业人员需要的深层次功能。

可以看看 Seth Kenlon 写的 [Kdenlive 系列教程][38]，了解如何使用 Kdenlive。

*   最新稳定版: 16.08.2 (2016 年 10 月)

![](https://opensource.com/sites/default/files/images/life-uploads/kdenlive_6_leader.png) 

#### Flowblade

2012 年发布, [Flowblade][39]，只有 Linux 版本的视频编辑器，是个相当不错的后起之秀。

*   最新稳定版: 1.8 (2016 年 9 月)

#### Pitivi

[Pitivi][40] 是用户友好型的自由开源视频编辑器。Pitivi 是用 [Python][41] 编写的（“Pitivi” 中的 “Pi”来源于此），使用了 [GStreamer][42] 多媒体框架，社区活跃。

*   最新稳定版: 0.97 (2016 年 8 月)
*   通过 Flatpak 获取 [最新版本][5]

#### Shotcut

[Shotcut][43] 是一款自由开源的跨平台视频编辑器，[早在 2004 年]就发布了，之后由现在的主要开发者 [Dan Dennedy][45] 重写。

*   最新稳定版: 16.11 (2016 年 11 月)
*   支持 4K 分辨率
*   仅以 tar 包方式发布

#### OpenShot Video Editor

始于 2008 年，[OpenShot Video Editor][46] 是一款自由、开源、易于使用、跨平台的视频编辑器。

*   最新稳定版: [2.1][6] (2016 年 8 月)


### 其它工具

#### SwatchBooker

[SwatchBooker][47] 是一款很方便的工具，尽管它近几年都没有更新了，但它还是很有用。SwatchBooler 能帮助用户从各大制造商那里合法地获取色卡，你可以用其它自由开源的工具处理它导出的格式，包括 Scribus。

#### GNOME Color Manager

[GNOME Color Manager][48] 是 GNOME 桌面环境内建的颜色管理器，而 GNOME 是某些 Linux 发行版的默认桌面。这个工具让你能够用色度计为自己的显示设备创建属性文件，还可以为这些设备加载/管理 ICC 颜色属性文件。

#### GNOME Wacom Control

[The GNOME Wacom controls][49] 允许你在 GNOME 桌面环境中配置自己的 Wacom 手写板；你可以修改手写板交互的很多选项，包括自定义手写板灵敏度，以及手写板映射到哪块屏幕上。

#### Xournal

[Xournal][50] 是一款简单但可靠的应用，可以让你通过手写板手写或者在笔记上涂鸦。Xournal 是一款有用的工具，可以让你签名或注解 PDF 文档。

#### PDF Mod

[PDF Mod][51] 是一款编辑 PDF 文件很方便的工具。PDF Mod 让用户可以移除页面、添加页面，将多个 PDF 文档合并成一个单独的 PDF 文件，重新排列页面，旋转页面等。

#### SparkleShare

[SparkleShare][52] 是一款基于 git 的文件分享工具，艺术家用来协作和分享资源。它会挂载在 GitLab 仓库上，你能够采用一个精妙的开源架构来进行资源管理。SparkleShare 的前端通过在顶部提供一个类似下拉框界面，避免了使用 git 的复杂性。

### 摄影

#### Darktable

[Darktable][53] 是一款能让你开发数位 RAW 文件的应用，有一系列工具，可以管理工作流、无损编辑图片。Darktable 支持许多流行的相机和镜头。

![改变颜色平衡度的图片](https://opensource.com/sites/default/files/dt_colour.jpg "改变颜色平衡度的图片") 

#### Entangle

[Entangle][54] 允许你将数字相机连接到电脑上，让你能从电脑上完全控制相机。

#### Hugin

[Hugin][55] 是一款工具，让你可以拼接照片，从而制作全景照片。

### 2D 动画

#### Synfig Studio

[Synfig Studio][56] 是基于矢量的二维动画套件，支持位图原图，在平板上用起来方便。

#### Blender Grease Pencil

我在前面讲过了 Blender，但值得注意的是，最近的发行版里[重构的蜡笔特性][57]，添加了创作二维动画的功能。

#### Krita

[Krita][58] 现在同样提供了二维动画功能。

### 音频编辑

#### Audacity

[Audacity][59] 在编辑音频文件、记录声音方面很有名，是用户友好型的工具。

#### Ardour

[Ardour][60] 是一款数字音频工作软件，界面中间是录音，编辑和混音工作流。使用上它比 Audacity 要稍微难一点，但它允许自动操作，并且更高端。（有 Linux、Mac OS X 和 Windows 版本）

#### Hydrogen

[Hydrogen][61] 是一款开源的电子鼓，界面直观。它可以用合成的乐器创作、整理各种乐谱。

#### Mixxx

[Mixxx][62] 是四仓 DJ 套件，让你能够以强大操控来 DJ 和混音歌曲，包含节拍循环、时间延长、音高变化，还可以用 DJ 硬件控制器直播混音和衔接。

### Rosegarden

[Rosegarden][63] 是一款作曲软件，有乐谱编写和音乐作曲或编辑的功能，提供音频和 MIDI 音序器。（LCTT 译注：MIDI 即 Musical Instrument Digital Interface 乐器数字接口）

#### MuseScore

[MuseScore][64] 是乐谱创作、记谱和编辑的软件，它还有个乐谱贡献者社区。

### 其它具有创造力的工具

#### MakeHuman

[MakeHuman][65] 是一款三维绘图工具，可以创造人型的真实模型。

#### Natron

[Natron][66] 是基于节点的合成工具，用于视频后期制作、动态图象和设计特效。

#### FontForge

[FontForge][67] 是创作和编辑字体的工具。允许你编辑某个字体中的字形，也能够使用这些字形生成字体。

#### Valentina

[Valentina][68] 是用来设计缝纫图案的应用。

#### Calligra Flow

[Calligra Flow][69] 是一款图表工具，类似 Visio（有 Linux，Mac OS X 和 Windows 版本）。

### 资源

这里有很多小玩意和彩蛋值得尝试。需要一点灵感来探索？这些网站和论坛有很多教程和精美的成品能够激发你开始创作：

1、 [pixls.us][7]： 摄影师 Pat David 管理的博客，他专注于专业摄影师使用的自由开源的软件和工作流。
2、 [David Revoy 's Blog][8]： David Revoy 的博客，热爱自由开源，非常有天赋的插画师，概念派画师和开源倡议者，对 Blender 基金会电影有很大贡献。
3、 [The Open Source Creative Podcast][9]: 由 Opensource.com 社区版主和专栏作家 [Jason van Gumster][10] 管理，他是 Blender 和 GIMP 的专家， [《Blender for Dummies》][1] 的作者，该文章正好是面向我们这些热爱开源创作工具和这些工具周边的文化的人。
4、 [Libre Graphics Meeting][11]: 自由开源创作软件的开发者和使用这些软件的创作者的年度会议。这是个好地方，你可以通过它找到你喜爱的开源创作软件将会推出哪些有意思的特性，还可以了解到这些软件的用户用它们在做什么。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/picture-343-8e0fb148b105b450634e30acd8f5b22b.png?itok=oxzTm70z)

Máirín Duffy - Máirín 是 Red Hat 的首席交互设计师。她热衷于自由软件和开源工具，尤其是在创作领域：她最喜欢的应用是 [Inkscape](http://inkscape.org)。

--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/yearbook-top-open-source-creative-tools-2016

作者：[Máirín Duffy][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mairin
[1]:http://www.blenderbasics.com/
[2]:https://builder.blender.org/download/
[3]:http://graphicall.org/
[4]:https://mathieu.daitauha.fr/blog/2016/09/23/blender-nightly-in-flatpak/
[5]:https://pitivi.wordpress.com/2016/07/18/get-pitivi-directly-from-us-with-flatpak/
[6]:http://www.openshotvideo.com/2016/08/openshot-21-released.html
[7]:http://pixls.us/
[8]:http://davidrevoy.com/
[9]:http://monsterjavaguns.com/podcast/
[10]:https://opensource.com/users/jason-van-gumster
[11]:http://libregraphicsmeeting.org/2016/
[12]:https://opensource.com/life/12/9/tour-through-open-source-creative-tools
[13]:https://opensource.com/business/16/8/flatpak
[14]:http://flatpak.org/apps.html
[15]:https://opensource.com/tags/gimp
[16]:https://linux.cn/article-7131-1.html
[17]:https://www.gimp.org/news/2016/07/14/gimp-2-8-18-released/
[18]:https://www.gimp.org/news/2016/07/13/gimp-2-9-4-released/
[19]:https://www.gimp.org/news/2016/07/13/gimp-2-9-4-released/
[20]:https://opensource.com/tags/inkscape
[21]:http://wiki.inkscape.org/wiki/index.php/Release_notes/0.91
[22]:http://wiki.inkscape.org/wiki/index.php/Mesh_Gradients
[23]:https://www.youtube.com/watch?v=IztyV-Dy4CE
[24]:https://inkscape.org/cs/~doctormo/%E2%98%85symbols-dialog
[25]:https://github.com/Xaviju/inkscape-open-symbols
[26]:https://opensource.com/tags/scribus
[27]:https://www.scribus.net/scribus-1-4-6-released/
[28]:https://www.scribus.net/scribus-1-5-2-released/
[29]:http://mypaint.org/
[30]:http://mypaint.org/blog/2016/01/15/mypaint-1.2.0-released/
[31]:https://github.com/mypaint/mypaint/wiki/v1.2-Inking-Tool
[32]:https://opensource.com/tags/blender
[33]:http://www.blender.org/features/2-78/
[34]:https://opensource.com/tags/krita
[35]:https://krita.org/en/item/krita-3-0-1-update-brings-numerous-fixes/
[36]:https://opensource.com/life/16/9/10-reasons-flowblade-linux-video-editor
[37]:https://opensource.com/tags/kdenlive
[38]:https://opensource.com/life/11/11/introduction-kdenlive
[39]:http://jliljebl.github.io/flowblade/
[40]:http://pitivi.org/
[41]:http://wiki.pitivi.org/wiki/Why_Python%3F
[42]:https://gstreamer.freedesktop.org/
[43]:http://shotcut.org/
[44]:http://permalink.gmane.org/gmane.comp.lib.fltk.general/2397
[45]:http://www.dennedy.org/
[46]:http://openshot.org/
[47]:http://www.selapa.net/swatchbooker/
[48]:https://help.gnome.org/users/gnome-help/stable/color.html.en
[49]:https://help.gnome.org/users/gnome-help/stable/wacom.html.en
[50]:http://xournal.sourceforge.net/
[51]:https://wiki.gnome.org/Apps/PdfMod
[52]:https://www.sparkleshare.org/
[53]:https://opensource.com/life/16/4/how-use-darktable-digital-darkroom
[54]:https://entangle-photo.org/
[55]:http://hugin.sourceforge.net/
[56]:https://opensource.com/article/16/12/synfig-studio-animation-software-tutorial
[57]:https://wiki.blender.org/index.php/Dev:Ref/Release_Notes/2.78/GPencil
[58]:https://opensource.com/tags/krita
[59]:https://opensource.com/tags/audacity
[60]:https://ardour.org/
[61]:http://www.hydrogen-music.org/
[62]:http://mixxx.org/
[63]:http://www.rosegardenmusic.com/
[64]:https://opensource.com/life/16/03/musescore-tutorial
[65]:http://makehuman.org/
[66]:https://natron.fr/
[67]:http://fontforge.github.io/en-US/
[68]:http://valentina-project.org/
[69]:https://www.calligra.org/flow/
