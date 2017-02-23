使用 Inkscape：添加颜色
=========

![inkscape-addingcolour](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-addingcolour-945x400.png) 

在我们先前的 Inkscape 文章中，[我们介绍了 Inkscape 的基础][2] - 安装，以及如何创建基本形状及操作它们。我们还介绍了使用 Palette 更改 inkscape 对象的颜色。 虽然 Palette 对于从预定义列表快速更改对象颜色非常有用，但大多数情况下，你需要更好地控制对象的颜色。这时我们使用 Inkscape 中最重要的对话框之一 - <ruby>填充和轮廓<rt>Fill and Stroke</rt></ruby> 对话框。

**关于文章中的动画的说明：**动画中的一些颜色看起来有条纹。这只是动画创建导致的。当你在 Inkscape 尝试时，你会看到很好的平滑渐变的颜色。

### 使用 Fill/Stroke 对话框

要在 Inkscape 中打开 “Fill and Stroke” 对话框，请从主菜单中选择 `Object`>`Fill and Stroke`。打开后，此对话框中的三个选项卡允许你检查和更改当前选定对象的填充颜色、描边颜色和描边样式。

![open-fillstroke](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/open-fillstroke.gif) 

在 Inkscape 中，Fill 用来给予对象主体颜色。对象的轮廓是你的对象的可选择外框，可在<ruby>轮廓样式<rt>Stroke style</rt></ruby>选项卡中进行配置，它允许您更改轮廓的粗细，创建虚线轮廓或为轮廓添加圆角。 在下面的动画中，我会改变星形的填充颜色，然后改变轮廓颜色，并调整轮廓的粗细：

![using-fillstroke](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/using-fillstroke.gif) 

### 添加并编辑渐变效果

对象的填充（或者轮廓）也可以是渐变的。要从 “Fill and Stroke” 对话框快速设置渐变填充，请先选择 “Fill” 选项卡，然后选择<ruby>线性渐变<rt>linear gradient </rt></ruby> 选项：

 ![create-gradient](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/create-gradient.gif) 

要进一步编辑我们的渐变，我们需要使用专门的<ruby>渐变工具<rt>Gradient Tool</rt></ruby>。 从工具栏中选择“Gradient Tool”，会有一些渐变编辑锚点出现在你选择的形状上。 **移动锚点**将改变渐变的位置。 如果你**单击一个锚点**，您还可以在“Fill and Stroke”对话框中更改该锚点的颜色。 要**在渐变中添加新的锚点**，请双击连接锚点的线，然后会出现一个新的锚点。

 ![editing-gradient](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/editing-gradient.gif) 

* * *

这篇文章介绍了在 Inkscape 图纸中添加一些颜色和渐变的基础知识。 **“Fill and Stroke”** 对话框还有许多其他选项可供探索，如图案填充、不同的渐变样式和许多不同的轮廓样式。另外，查看**<ruby>工具控制栏<rt>Tools control bar</rt></ruby>** 的 **Gradient Tool** 中的其他选项，看看如何以不同的方式调整渐变。

-----------------------

作者简介：Ryan 是一名 Fedora 设计师。他使用 Fedora Workstation 作为他的主要桌面，还有来自 Libre Graphics 世界的最好的工具，尤其是矢量图形编辑器 Inkscape。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/inkscape-adding-colour/

作者：[Ryan Lerch][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://ryanlerch.id.fedoraproject.org/
[1]:https://fedoramagazine.org/inkscape-adding-colour/
[2]:https://linux.cn/article-8079-1.html
