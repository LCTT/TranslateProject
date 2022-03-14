[#]: subject: "Open source photo processing with Darktable"
[#]: via: "https://opensource.com/article/21/12/open-source-photo-processing-darktable"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14088-1.html"

用开源的 Darktable 进行照片处理
======

> 如果你拍摄的照片值得处理，那么你可以看看 Darktable 为你提供了什么。

![](https://img.linux.net.cn/data/attachment/album/202112/17/110051ezze4uatt2d2f94e.jpg)

很难说好照片是如何产生的。你必须在正确的时间出现在正确的地点。你必须准备好相机和构图的观察力。而这只是发生在相机里的部分。好的摄影还有另一个阶段，许多人都没有想到这一点。它曾经需要在 _暗房_ 中的灯光和化学品，但在今天的数字工具中，后期制作发生在暗房软件中。最好的照片处理器之一是 [Darktable][2]，我在 2016 年写了一篇 [介绍 Darktable][3] 的文章。那篇文章已经过去五年了，所以我想我应该重新审视一下这个应用，写一写它的一个高级功能：蒙版。

自从我最初写下这篇文章以来，Darktable 并没有什么变化，在我看来，这是一个真正好的应用的标志之一。一个稳定的界面和持续的优秀性能是人们对软件的所有要求，而 Darktable 依旧熟悉而强大。如果你是 Darktable 的新手，请阅读我的 [介绍性文章][3]，了解基础知识。

### 什么是蒙版？

在照片处理中，蒙版被用来限制你对图像的调整，使其只限于图像的一个区域。

直观地说，<ruby>蒙版<rt>mask</rt></ruby> 是视觉艺术中的一种技术，用一种材料来遮挡另一种材料。如果你曾经在你的公寓或房子里画过一面墙，你可能使用过 _遮蔽胶带_（也叫油漆工胶带）来保护相邻的墙壁或造型不受杂乱笔触的影响。完成后，你剥去遮蔽胶带，你就有了漂亮的油漆直线。

<ruby>模板<rt>stencil</rt></ruby>也是遮蔽的一种形式。

![A mask made of masking tape][4]

（Seth Kenlon, [CC BY-SA 4.0][5]）

这是一种在摄影中使用了一个世纪的技术，因此，数字摄影工具有一个类似的技术也是合理的。

### 在 Darktable 中使用蒙版

在这个例子中，我使用了 Flickr 用户 **bcnewdemocrats** 的创作共用照片。这是一张很好的照片，因为它有迷人的主题（两个孩子在他们非常耐心的父亲脸上涂抹 Holi 粉）。因为它是关于印度的五彩节，所以它在整个过程中都有色彩飞溅。

![Original photograph][6]

（bcnewdemocrats, [CC BY-SA 4.0][5]）

这是一张不需要改进的照片，但并不是所有的调整都需要剧烈变化才能产生显著效果。

色彩校正滤镜提供了一个特别明显的调整。在彩色摄影中，尤其是人物摄影中，一个常见的修正是添加 _琥珀色_（一种偏红的橙色）。人类肤色受益于琥珀色，因为我们把这种颜色与温暖和生命联系起来。

点击 “<ruby>开启<rt>On</rt></ruby>” 按钮，激活 Darktable 窗口右侧的色彩校正调整面板。将中心点向上和向右拖动，给照片增加琥珀色。

![Color correction panel][7]

（Seth Kenlon, [CC BY-SA 4.0][5]）

这样做之后，整张照片就会浸透在琥珀色里。

![Darktable global color correction][8]

（Seth Kenlon, [CC BY-SA 4.0][5]）

在色彩校正面板的底部，点击 “<ruby>drawn & parametric mask<rt>绘制和参数化蒙版</rt></ruby>” 按钮。

![Apply mask button][9]

（Seth Kenlon, [CC BY-SA 4.0][5]）

在显示出来的工具栏中，你有几种蒙版形状可以选择。有圆、椭圆、路径、画笔、梯度，还有一个编辑现有蒙版的选项。为了简单起见，选择圆形，然后点击你的对象的脸。

![Circle mask][10]

（Seth Kenlon, [CC BY-SA 4.0][5]）

你的色彩校正滤镜立即被限制在你的圆形蒙版的区域内，给你的主要对象一个令人愉快的琥珀色调，同时避开背景。

![Color correction within a circle mask][11]

（Seth Kenlon, [CC BY-SA 4.0][5]）

你可以通过切换色彩校正滤镜的关闭和开启来看到区别。

### 复用蒙版

如果你想只对被摄者的脸部应用另一个滤镜，你不必为那个新的滤镜再创建一个蒙版。当你创建一个蒙版时，它会被添加到位于 Darktable 界面左边的 “<ruby>蒙版管理器<rt>mask manager</rt></ruby>” 面板上。默认的名字是非常通用的，但你可以双击每个蒙版的名字来重命名它。

![Mask manager][12]

（Seth Kenlon, [CC BY-SA 4.0][5]）

当你应用一个新的滤镜时，不是选择一个新的蒙版形状来创建，而是点击 “<ruby>不使用蒙版<rt>no mask used</rt></ruby>” 下拉菜单来查看现有的蒙版列表，以及之前在同一个滤镜上一起使用过的自动分组的蒙版。选择你想用于新滤镜的蒙版或蒙版组。

![Selecting an existing mask][13]

（Seth Kenlon, [CC BY-SA 4.0][5]）

### 更多蒙版

在 Darktable 中还有很多其他类型的蒙版和蒙版功能可以探索。你可以用路径和画笔工具创建复杂的形状。你也可以完全放弃使用形状，并根据色度和亮度值将过滤器限制在图像的某个区域。你可以调整蒙版的模糊度和扩散度等。在 Darktable 中进行的所有调整中，最好的一点是它们都是动态的、非破坏性的。如果你改变主意，你可以随时关闭它们，而且你实际上从未影响过图像数据本身。这并不奇怪，因为 Darktable 确实是一个强大的摄影工具，如果你拍摄的照片值得处理，你就应该看看 Darktable 为你提供了什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-photo-processing-darktable

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/design_photo_art_polaroids.png?itok=SqPLgWxJ (Polaroids and palm trees)
[2]: https://www.darktable.org/
[3]: https://opensource.com/life/16/4/how-use-darktable-digital-darkroom
[4]: https://opensource.com/sites/default/files/uploads/masking.jpg (A mask made of masking tape)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/darktable-darkroom.jpg (Original photograph)
[7]: https://opensource.com/sites/default/files/uploads/darktable-panel-color-correction.jpg (Color correction panel)
[8]: https://opensource.com/sites/default/files/uploads/darktable-color-correction-global.jpg (Darktable global color correction)
[9]: https://opensource.com/sites/default/files/uploads/darktable-button-mask.jpg (Apply mask button)
[10]: https://opensource.com/sites/default/files/uploads/darktable-button-circle.jpg (Circle mask)
[11]: https://opensource.com/sites/default/files/uploads/darktable-color-mask.jpg (Color correction within a circle mask)
[12]: https://opensource.com/sites/default/files/uploads/darktable-mask-manager.jpg (Mask manager)
[13]: https://opensource.com/sites/default/files/uploads/darktable-mask-select.jpg (Selecting an existing mask)
