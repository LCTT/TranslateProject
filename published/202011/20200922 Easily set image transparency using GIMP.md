[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12874-1.html)
[#]: subject: (Easily set image transparency using GIMP)
[#]: via: (https://opensource.com/article/20/9/chroma-key-gimp)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 GIMP 轻松地设置图片透明度
======

> 使用色键（绿屏）技巧来设置你电脑游戏中图片的透明度。

![](https://img.linux.net.cn/data/attachment/album/202011/30/223815rdmrgx1109ngng0g.jpg)

不管你是否正在使用 [Python][2] 或 [Lua][3] 编程一个游戏或一个 APP，你都有可能在你的游戏资源中使用 PNG 图像。PNG 格式图像的一个优点是能够存储一个 **alpha 通道**，这在一个 JPEG 格式的图像中是不可能获得的。alpha 在本质上是不可见的或透明的“颜色”。alpha 是你图像 _不可见_ 的一部分。例如，你要绘制一个甜甜圈，甜甜圈的空洞将使用 alpha 填充，你就可以看到它后面的任何东西。

一个常见的问题是如何找到一幅图像的 alpha 部分。有时你的编程框架，不管它是 [Python Arcade][4]、[Pygame][5]、LÖVE，或者其它的任何东西都会检测出 alpha 通道，（在适当地调用函数后）将其作为透明处理。这意味着它将不会在 alpha 部分来渲染新的像素，而留下甜甜圈的空洞。100% 是透明的，0% 是不透明的，在功能上起到“不可见”的作用。

有些时候，你的框架与你的图像资源在 alpha 通道的位置上是不一致的（或者，alpha 通道根本就不存在），你在你想要透明度的地方却得到像素。

这篇文章描述了我所知道的最可靠的方法来解决透明度的问题。

### 色键

在计算机图形学中，有一些有助于确定每一个像素是如何渲染的值。<ruby>色度<rt>Chrominance</rt></ruby>（或者 chroma），描述一个像素的饱和度或强度。<ruby>色键<rt>chroma key</rt></ruby>技术（也称为<ruby>绿屏<rt>green screening</rt></ruby>）最初是作为一种化学工艺而发展起来的，在复印一张底片时，使用一种特定的 **无光泽** 的颜色（最初是蓝色，后来是绿色）来故意遮掩，以允许使用另一幅图像来取代曾经有蓝色或绿色屏幕的地方。这是一种简化的解释，但是它说明了计算机图形学中被称为 alpha 通道的起源。

alpha 通道是保存在图像中的信息，用以标识要透明的像素。例如，RGB 图像有红、绿、蓝通道。RGBA 图像包含红、绿、蓝通道，以及 alpha 通道。alpha 值的范围可以从 0 到 1 ，使用小数是也有效的。

因为一个 alpha 通道可以用几种不同的方法表达，因此依赖于嵌入的 alpha 通道可能是有问题的。作为替代方案，你可以在你的游戏框架中选择一种颜色并将其转化为一个 0 的 alpha 值。要做到这一点，你必须知道在你图像中的颜色值。

### 准备你的图片

要准备一个专门为色度键保留明确颜色的图形，在你最喜欢的图片编辑器中打开图片。我建议使用 [GIMP][6] 或 [Glimpse][7]，但是 [mtPaint][8] 或 [Pinta][9]，甚至 [Inkscape][10] 也能很好地工作，这取决于你的图像的性质，以及你将这些操作指南转换到一种不同图片编辑器工具的能力。

首先打开这幅 Tux 企鹅的图像:

![Tux 企鹅][11]

### 选择图片

在图片打开后，转到 **窗口** 菜单，选择 **可停靠对话框** ，接下来选择 **图层**。在 **图层** 面板中 Tux 图层上右击。从弹出菜单中，选择 **Alpha 到选区** 。如果你的图像没有内置的 alpha 通道，那么你必须手动创建你自己的选区。

![Alpha 到选区][13]

为手动创建一个选区，单击来自工具箱的 **路径** 工具。

![GIMP 的路径工具][14]

使用 **路径** 工具，在图像周围移动鼠标，在其轮廓的每个主要交叉点处都单击和释放（不要拖动）。 不要担心沿着曲线走；只需要找到主要的交叉点和拐角。这将在每个点处创建一个节点，并在节点中间绘制一条条线段。你不需要闭合你的路径，因此当你最后到达你开始时的交叉点时，你就完成了。

![在 GIMP 中创建一个路径][15]

在你创建你的轮廓路径后，转到 **窗口** 菜单，选择 **可停靠对话框** ，接下来选择 **工具选项** 。在 **工具选项** 面板中，选择 **编辑 (Ctrl)** 。随着这项操作的激活，你可以编辑你刚刚通过单击线或单击节点绘制的路径，并通过调整它们来更好地适应你的图像。你甚至能够将直线弯曲。

![编辑路径][16]

现在从 **窗口 > 可停靠对话框** 菜单中选择 **路径** 面板。在 **路径** 面板中，单击 **路径到选区** 按钮。你的绘图现在已经被选中了。

### 扩大选区

如果你觉得你的选区太紧贴了，你可以通过扩大来给予你自己的选区一些富余。当我想在一张图像周围采用或加厚一个边框时，我有时会这么扩大选区。

为扩大一个选区，单击 **选择** 菜单，选择 **扩大** 。输入一个像素值并单击 **确定** 。

### 反转选区

你已经选择了你的图形，但是你真正想选择的东西却 _不包括_ 你所选择的图像。这是因为你要创建一个 alpha 蒙版来定义图像中的一些内容的来被其它一些内容所替换。换句话说，你需要标记那些将被转变为不可见的像素。

为了反转选择区，单击 **选择** 菜单，选择 **反转** 。现在除你的图像以外的一切东西都是被选择的。

### 使用 alpha 填充

随着选择了除了你的图像以外的一切东西，再选择你想使用的颜色来指定你的 alpha 蒙版。最常用的颜色是绿色（正如你可能从术语“绿屏”中所猜到的一样）。绿色不是什么神奇的颜色，甚至也不是特定的绿色色调。之所以使用它是因为人们经常处理不包含绿色色素的图像，这样人们能够很容易分离出绿色，而不会意外地分离出图像中重要的部分。当然，如果你的图像是一位绿色的外星人或一枚绿宝石或一些 _确实_ 包含绿色的东西，那么你应该使用一种不同的颜色。只要你所选择的颜色是单一的单色，那么你就可以使用你所希望的任意颜色。如果你正在处理很多图像，你的选择应该在所有图像中保持一致。

![在工具箱中的前景色][17]

使用你选择的颜色值来设置你的前景色。为确保你的选择是精确的，使用 [HTML][18] 或 [HSV][19] 表示的颜色。例如，如果你正在使用纯绿色，它可以在 GIMP（以及大多数的开放源码图像应用程序）中表示为 `00ff00`（`00` 是红色，`FF` 是绿色，`00` 是蓝色，`F` 是最大值）。

![设置颜色值][20]

不管你选择什么颜色，务必记录下 HTML 或 HSV 的值，以便你可以为每一张图像使用完全相同的颜色。

为填充你的 alpha 蒙版，单击 **编辑** 菜单，选择 **使用前景色填充** 。

### 平整和导出

如果你在你的图像周围留下边框，设置背景颜色来着色你想使用的边界笔刷。这通常是黑色或白色，但是它也可以是任何适宜你游戏审美观的颜色。

在你设置背景颜色后，单击 **图像** 菜单，选择 **平整图像**。不管你是否添加了边框，这样做都是安全的。这个过程将从图像中移除 alpha 通道，并使用背景色填充任何“透明的”像素。

![平整图像][21]

你现在已经为你的游戏引擎准备好了一张图像。导出图像为你的游戏引擎喜欢的任何格式，接下来使用游戏引擎所需要的每一个函数来将图像导入的你的游戏中。在的代码中，设置 alpha 值为 `00ff00`（或你使用的任何颜色），接下来使用游戏引擎的图像转换器来将该颜色作为 alpha 通道处理。

### 其它的方法

这不是唯一能在你游戏图像中获取透明度的方法。查看你游戏引擎的文档来找出它是如何默认尝试处理 alpha 通道的，在你不确定的时候，尝试让你的游戏引擎来自动侦测图像中透明度，然后再去编辑它。有时，你游戏引擎的预期值和你图像的预设值恰巧匹配，那么你就可以直接获取透明度，而不需要做任何额外的工作。

不过，当这些尝试都失败时，尝试一下色键。它为电影业工作了将近 100 年，它也可以为你工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/chroma-key-gimp

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_grid_penguin.png?itok=7Fv83mHR (Gaming with penguin pawns)
[2]: https://opensource.com/article/17/10/python-101
[3]: https://opensource.com/article/17/4/how-program-games-raspberry-pi
[4]: https://opensource.com/article/18/4/easy-2d-game-creation-python-and-arcade
[5]: https://opensource.com/article/17/12/game-framework-python
[6]: http://gimp.org
[7]: https://glimpse-editor.github.io
[8]: https://opensource.com/article/17/2/mtpaint-pixel-art-animated-gifs
[9]: https://www.pinta-project.com/
[10]: http://inkscape.org
[11]: https://opensource.com/sites/default/files/uploads/tux.png (Tux the penguin)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/gimp_alpha-to-selection.jpg (Alpha to selection)
[14]: https://opensource.com/sites/default/files/uploads/gimp_path-tool.jpg (GIMP Paths tool)
[15]: https://opensource.com/sites/default/files/uploads/gimp_path-create.jpg (Create a path in GIMP)
[16]: https://opensource.com/sites/default/files/uploads/gimp_path-edit.jpg (Edit path)
[17]: https://opensource.com/sites/default/files/uploads/gimp_foreground-colour.jpg (Foreground color in toolbox)
[18]: https://www.w3schools.com/colors/colors_picker.asp
[19]: https://en.wikipedia.org/wiki/HSL_and_HSV
[20]: https://opensource.com/sites/default/files/uploads/gimp_colour.jpg (Setting color values)
[21]: https://opensource.com/sites/default/files/uploads/gimp_matte.jpg (Flattening image)
