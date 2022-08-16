[#]: subject: "MAKE MORE with Inkscape – Ink/Stitch"
[#]: via: "https://fedoramagazine.org/make-more-with-inkscape-ink-stitch/"
[#]: author: "Sirko Kemter https://fedoramagazine.org/author/gnokii/"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14935-1.html"

Inkscape 拓展应用：Ink/Stitch
======

![MAKE more with Inkscape - Ink/Stitch][1]

Inkscape 是 Fedora 设计团队最喜爱最常用的软件，它的功能可不止于制作精美的矢量图形。矢量图形（也就是 SVG 文件）可以帮助实现更多操作，许多软件也支持这一格式。不过，Inkscape 还有其他功能有待发掘。[本系列][2] 第一篇文章介绍了如何 [使用 Inkscape 生成 GCode 文件][3]；本篇文章将探索 Inkscape 的另一项拓展功能：用于绣花设计的 [Ink/Stitch][4]。

（LCTT 校注：Extension 这个词我们一般翻译为“扩展”，但在 Inkscape 中被翻译为了“拓展”，为了和应用软件一致，此处采用了“拓展”的译法。）

### 绣花 DIY

在过去数年里，DIY 风靡一时。可以说，这一现象始于廉价的 [3D 打印][5] 技术，以及后来的 [数控][6] 机床与激光切割机、激光雕刻机。这些设备都算不上非常昂贵。同时，绣花机等“传统”机器的价格也有下降。[家用绣花机现在只需 500 美元就能买到了][7]。

如果你不想买或者买不到绣花机，离你最近的 [创客空间][8] 一般也会有。即便是一台商用单头绣花机，价格也下降到了 5000 美元。对于购置绣花机这种投资来说，一般很快就能看到回报。

### 绣花设计软件

一些家用绣花机附有配套的绣花设计软件，不过大部分都只能在 Windows 系统上运行，就算该领域最常用的、独立于各绣花机制造商的软件 [Embird][9] 也是如此。不过，你也可以通过 Wine 来运行这些软件。

在 Linux 上，另一个办法就是使用 [Embroidermodde][10]。不过，该软件在 2014 年的募捐活动之后，就停止了开发活动。

到今天，只剩下一个办法：[Ink/Stitch][4]

![The logo of the Ink/Stitch project][11]

### 开源与绣花设计

绣花机价格高以及 Linux 用户少都怪不得制造商，毕竟为 Linux 开发应用的确不太值得。

#### 绣花文件格式问题

绣花机所用文件格式大量涌现，甚至还有一些制造商为自家机器定制了文件格式。在某些情况下，即便是一家制造商，可能也会使用多种文件格式。

  * **.10o** – 丰田绣花机
  * **.100** – 丰田绣花机
  * **.CSD** – Poem、Huskygram 和胜家家用绣花缝纫机
  * **.DSB** – 百灵达绣花机
  * **.JEF** – 车乐美 MemoryCraft 10000
  * **.SEW** – 车乐美 MemoryCraft 5700、8000 和 9000
  * **.PES** – 兄弟和 Babylock 家用绣花缝纫机
  * **.PEC** – 兄弟和 Babylock 家用绣花缝纫机
  * **.HUS** – 好时运家用绣花缝纫机
  * **.PCS** – 百福家用绣花缝纫机
  * **.VIP** – 百福旧格式 & 好时运格式
  * **.VP3** – 百福家用缝纫机新格式
  * **.DST** – 田岛商用绣花缝纫机
  * **.EXP** – 美高商用绣花缝纫机
  * **.XXX** – Compucon 和 胜家家用绣花缝纫机
  * **.ZSK** – 美国市场的 ZSK 绣花机

关于绣花机会用到的文件格式，上面列出来的只是九牛一毛，可 [在此][14] 查看全部格式。如果你想进一步了解这些文件格式，可点击 [此处][15] 获取更多信息。

#### Ink/Stitch 文件格式

Ink/Stitch 最初使用的是 [libembroidery][12] 库，现在则使用 [pyembroidery][13] 库。在 pyembroidery 库的支持下，Ink/Stitch 目前可以读取以下格式：100, 10o, BRO, DAT, DSB, DST, DSZ, EMD, EXP, EXY, FXY, GT, INB, JEF, JPX, KSM, MAX, MIT, NEW, PCD, PCM, PCQ, PCS, PEC, PES, PHB, PHC, SEW, SHV, STC, STX, TAP, TBF, U01, VP3, XXX, ZXY 以及 TXT（内容为 GCode 代码）。

不过，Ink/Stitch 支持的储存格式则比较少：DST, EXP, JEF, PEC, PES, U01, VP3 and of course SVG, CSV 以及 TXT（内容为 GCode 代码）。

除了文件格式，绣花缝纫软件还需解决其它一些问题。

支持繁杂多样的线迹类型是一个难题，绘制工具与缝制工具的搭配使用又是另一个难题。不过，为什么非要从无到有搞出一套新应用？为什么不依赖现有的矢量软件？这样一来，开发者只需要在其基础上增添绣花拓展功能即可。后者就是 [Ink/Stitch 项目][4] 过去四年来的设计理念。

### 安装 Ink/Stitch

Ink/Stitch 是 [Inkscape 的一个拓展功能][16]。不过，由于 Inkscape 下载安装拓展的新功能还处于测试阶段，在其提供的拓展功能中可能无法找到 Ink/Stitch。因此，你需要自行手动 [下载][17] 该拓展。下载后，将压缩包解压到 Inkscape 拓展所在路径，默认路径为 `~/.config/Inkscape/extensions`（或者放置在系统全局路径：`/usr/share/inkscape/extensions`）。若你改变了默认路径，则需检查 Inkscape 设置选项，找到拓展文件的存放位置。

### 自定义：为 Ink/Stitch 安装插件

Ink/Stitch 提供了为 Inkscape 安装插件的功能，用户需首先执行这一功能。

依次点击如下选项：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>线条颜色管理<rt>Thread Color Management</rt></ruby> > <ruby>为 Inkscape 安装线条调色板<rt>Install thread color palettes for Inkscape</rt></ruby>，之后等待片刻。

虽然这一过程不会出现进度条之类的提示，不过也无需着急。

该功能执行后，将会安装来自不同纱线制造商的 70 套色板，以及一套符号库。

![Inkscape with the swatches dialogue open, which shows the Madeira Rayon color palette][18]

如果你使用的 Ink/Stitch 是从 Github 下载的 2.0.0 版本，那么下载下来的 ZIP 文件里就包括了色板文件。你只需将其解压到正确的路径：`~/.config/inkscape/palettes/`。如果你需要环形模板，可以点击 [此处][19] 下载，并将其保存到 `~/.config/inkscape/templates` 目录下。

重新启动 Inkscape，可在 <ruby>文件<rt>File</rt></ruby> > <ruby>由模板新建<rt>New From Template</rt></ruby> 下找到该模板。

### Ink/Stitch 绣字

到目前为止，绣花设计最简单也最常用的方法就是使用 Ink/Stitch 的 <ruby>文字缝制<rt>Lettering</rt></ruby> 功能。该功能位于 <ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>文字缝制<rt>Lettering</rt></ruby>。绣花文字缝制可不是一件简单事儿，它其实就是所谓的缎面绣字，需要做好特殊的文字设置。

![Inkscape with a “Chopin” glyph for satin stitching defined for the Lettering function][20]

你可以将路径转换为缎面绣，但是这种方法比使用文字缝制功能还要繁琐许多。多亏了社区的活跃，2021 年 5 月份发布的 Ink/Stitch 2.0 版本预置了更多的字体。2.0 版本还增加了 <ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>字体管理<rt>Font Management</rt></ruby> 功能，让用户更方便地管理这些字体。

此外，还有制作字体的功能，但是你需要了解如何使用 Inkscape 设计字体，可在 [此处][21] 浏览相关英文教程。这里只给出大概的介绍：首先创建一个 SVG 字体，接着将其储存在 JSON 文件中，这样便可以在 Ink/Stitch 字体管理功能中使用。

![On the left side the Lettering dialogue and on the right the preview of this settings][22]

该功能将打开一个对话窗口，你可以把文字输进去，调整字体及其大小，然后即可将输入的文字渲染出来。

### 绣制区域、路径等对象

Ink/Stitch 最容易实现的就是绣制区域或者路径。你需要做的只是画出路径。如果你使用的是形状，那么你需要将其转换成路径，然后执行如下操作：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>填充工具<rt>Fill Tools</rt></ruby> > <ruby>分离填充对象<rt>Break Apart Fill Objects…</rt></ruby>，将路径分割成若干部分。

虽然 Inkscape 也有 <ruby>路径<rt>Path</rt></ruby> > <ruby>分离<rt>Break apart</rt></ruby> 功能，但是在这种情况下并不可行。

接下来，运行 Ink/Stitch 内置模拟器：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>可视化并导出<rt>Visualise and Export</rt></ruby> > <ruby>模拟器/实际预览<rt>Simulator/Realistic Preview</rt></ruby>。

![The new Fedora logo as Stitch Plan Preview][23]

注意，模拟器运行时需要占用大量的系统资源，而且启动时间也比较长。其实，以下功能操作起来会更加简便：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>可视化并导出<rt>Visualise and Export</rt></ruby> > <ruby>线迹计划预览<rt>Stitch Plan Preview</rt></ruby>。该功能会在文件外部对线条进行渲染。

![Nicubunu’s Fedora hat icon as embroidery. The angles for the stitches of the head part and the brim are different so that it looks more realistic. The outline is done in Satin stitching][24]

### 简单的缎面及缎面绣

Ink/Stitch 会使用连续的线条（非虚线）将每个笔画转换成之字形或简单的缎面。依照预先设置好的描边宽度，沿着路径绣出线迹。只要路径上没有过多的曲线，使用这一方法就没问题。

![Parameter setting dialogue and on the right the Fedora logo shape embroidered as Zig-Zag line][25]

这个方法虽然简单，但绝不是最好的选择。最好的选择是使用缎面工具，该功能可以在 <ruby>拓展<rt>Extensions</rt></ruby> > <ruby>缎面工具<rt>Satin Tools</rt></ruby> 找到。其中，转换功能又是重中之重，它可以将路径转换为缎面笔画。

![Fedora logo shape as Satin Line embroidery][26]

通过 <ruby>拓展<rt>Extensions</rt></ruby> > <ruby>缎面工具<rt>Satin Tools</rt></ruby> > <ruby>旋转缎纹路径<rt>Flip Satin Column Rails</rt></ruby>，你还可以改变线迹的方向。这样做可以凸显缎面绣的立体感，典型的例子就是泡芙刺绣（一种非常具有立体感的刺绣）。支持这种功能的机器还可以为绣花时产生的多余的连线线迹标记出修剪记号。这些记号正是从 Ink/Stitch 自身符号库里安装得到的符号。

### Ink/Stitch 线迹库

线迹库包括了 Ink/Stitch 可以创建的线迹类型。在前文，填充式线迹和之字形/缎纹线迹已经介绍过了，不过其他还有很多。

  * **平针**：平针用于边缘装饰，沿直线或曲线缝制出一排短小的线迹，由此组成的一条条虚线就是平针。虚线的尺寸可大可小。

    ![A running stitch – each dashed line will be converted in such one][27]

  * **豆针**：豆针可用于边缘装饰或添加设计细节。使用平针来回缝制就是豆针，这种缝法会增加线迹的厚度。

    ![Bean Stitches – creating a thicker line][28]

  * **手工针**：在该模式下，Ink/Stitch 会将路径的每个节点当作穿针点；这些节点也正是针穿入的位置。

    ![In manual mode – each node will be the needle penetration point][29]

  * **E 字针**：E 字针是一种简单但十分好用的绷缝线迹，用于贴花织物。这种线迹多用于婴儿装，因为婴儿的皮肤比较敏感。

    ![E-Stitch mostly used for applications on baby cloths, soft but strong connection][30]

### 绣花用线列表

有些绣花机，尤其是商用的绣花机，根据设计的需要，可以提前适配不同的针线。必要时，这类机器会自动切换使用合适的针线。有些绣花文件格式支持这一功能，但有些并不支持。Ink/Stitch 可以将用户设置好的线条列表应用到绣花设计中。

如果你想在现有的设计上导入线条列表，可执行如下操作：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>导入线条列表<rt>Import Threadlist</rt></ruby>。同样的，线条列表也可以导出：<ruby>另存为<rt>Save As</rt></ruby> 不同的文件格式，如 *.zip。当然，也可以将其打印出来：<ruby>拓展<rt>Extensions</rt></ruby> > Ink/Stitch > <ruby>可视化并导出<rt>Visualise and Export</rt></ruby> > <ruby>打印 PDF<rt>Print PDF</rt></ruby>。

### 结语

为绣花设计编写软件可不是一件简单的事儿，软件需要支持很多功能，还要应对不同文件格式（有些属于闭源文件格式）带来的难题。Ink/Stitch 已经做得很好了，尽力打造出了一款功能多样的绣花工具，让用户能够进行基础的绣花设计。当然，它也不是完美的，有些功能还需要完善。但是，Ink/Stitch 绝对是一款十分优秀的工具，我也希望它能越来越好。绣花是个不错的兴趣爱好，有了 Ink/Stitch，Fedora Linux 用户便可开启天马行空的设计之门。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-more-with-inkscape-ink-stitch/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/drawing2-816x345.png
[2]: https://fedoramagazine.org/series/make-more/
[3]: https://fedoramagazine.org/make-more-with-inkscape-g-code-tools/
[4]: https://inkstitch.org/
[5]: https://fedoramagazine.org/3d-printing-in-fedora-from-an-idea-to-the-thing/
[6]: https://en.wikipedia.org/wiki/Numerical_control
[7]: https://www.amazon.com/-/de/dp/B07VZ2YBLL/ref=sr_1_11?__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1MFJJWXMKQD6R&dchild=1&keywords=home+embroidery+machine&qid=1628388092&rnid=2941120011&s=arts-crafts&sprefix=home+embroider+%2Caps%2C-1&sr=1-11
[8]: https://www.fablabs.io/labs/map
[9]: https://www.embird.net/
[10]: https://embroidermodder.org/
[11]: https://fedoramagazine.org/wp-content/uploads/2021/08/inkstitch_logo.png
[12]: https://github.com/Embroidermodder/libembroidery
[13]: https://github.com/inkstitch/pyembroidery
[14]: http://www.needlework.ru/page/embroidery.htm
[15]: http://edutechwiki.unige.ch/en/Embroidery_format
[16]: https://inkscape.org/~wwderw/%E2%98%85inkstitch-embroidery-extension
[17]: https://github.com/inkstitch/inkstitch/releases/tag/v2.0.0
[18]: https://fedoramagazine.org/wp-content/uploads/2021/08/swatches-1024x556.png
[19]: https://inkstitch.org/assets/images/tutorials/templates/hoop-template.svg
[20]: https://fedoramagazine.org/wp-content/uploads/2021/08/satinfont-1024x556.png
[21]: https://inkstitch.org/tutorials/font-creation/
[22]: https://fedoramagazine.org/wp-content/uploads/2021/08/lettering-1024x523.png
[23]: https://fedoramagazine.org/wp-content/uploads/2021/08/stitch-preview-1024x556.png
[24]: https://fedoramagazine.org/wp-content/uploads/2021/08/nicu-stitch.gif
[25]: https://fedoramagazine.org/wp-content/uploads/2021/08/zigzag-1024x463.png
[26]: https://fedoramagazine.org/wp-content/uploads/2021/08/satin.png
[27]: https://fedoramagazine.org/wp-content/uploads/2021/08/running-stitch-detail.jpg
[28]: https://fedoramagazine.org/wp-content/uploads/2021/08/bean-stitch-detail.jpg
[29]: https://fedoramagazine.org/wp-content/uploads/2021/08/manual-stitch-detail.png
[30]: https://fedoramagazine.org/wp-content/uploads/2021/08/e-stitch-detail.jpg
