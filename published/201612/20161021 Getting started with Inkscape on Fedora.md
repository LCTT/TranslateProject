Fedora 中使用 Inkscape 起步
=============

![inkscape-gettingstarted](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gettingstarted-945x400.png) 

Inkscape 是一个流行的、功能齐全、自由而开源的矢量[图形编辑器][3]，它已经在 Fedora 官方仓库中。它特别适合创作 [SVG 格式][4]的矢量图形。Inkscape 非常适于创建和操作图片和插图，以及创建图表和用户界面设计。

[
 ![cyberscoty-landscape-800px](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/cyberscoty-landscape-800px.png) 
][5]

*使用 inkscape 创建的[风车景色][1]的插图*

[其官方网站的截图页][6]上有一些很好的例子，说明 Inkscape 可以做些什么。<ruby>Fedora 杂志<rt>Fedora Magazine</rt></ruby>上的大多数精选图片也是使用 Inkscape 创建的，包括最近的精选图片：

[
 ![communty](https://cdn.fedoramagazine.org/wp-content/uploads/2016/09/communty.png) 
][7]

*Fedora 杂志最近使用 Inkscape 创建的精选图片*

### 在 Fedora 上安装 Inkscape

**Inkscape 已经[在 Fedora 官方仓库中了][8]，因此可以非常简单地在 Fedora Workstation 上使用 Software 这个应用来安装它：**

[
 ![inkscape-gnome-software](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gnome-software.png) 
][9]

另外，如果你习惯用命令行，你可以使用 `dnf` 命令来安装：

```
sudo dnf install inkscape
```

### （开始）深入 Inkscape

当第一次打开程序时，你会看到一个空白页面，并且有一组不同的工具栏。对于初学者，最重要的三个工具栏是：Toolbar、Tools Control Bar、 Colour Palette（调色板）：

[
 ![inkscape_window](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape_window.png) 
][10]

**Toolbar**提供了创建绘图的所有基本工具，包括以下工具：

* 矩形工具：用于绘制矩形和正方形
* 星形/多边形（形状）工具
* 圆形工具：用于绘制椭圆和圆
* 文本工具：用于添加标签和其他文本
* 路径工具：用于创建或编辑更复杂或自定义的形状
* 选择工具：用于选择图形中的对象

**Colour Palette** 提供了一种设置当前选定对象的颜色的快速方式。 **Tools Control Bar** 提供了工具栏中当前选定工具的所有设置。每次选择新工具时，Tools Control Bar 会变成该工具的相应设置：

[
 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-toolscontrolbar.gif) 
][11]

### 绘图

接下来，让我们使用 Inkscape 绘制一个星星。 首先，从 **Toolbar** 中选择星形工具，**然后在主绘图区域上单击并拖动。**

你可能会注意到你画的星星看起来很像一个三角形。要更改它，请使用 **Tools Control Bar** 中的 **Corners** 选项，再添加几个点。 最后，当你完成后，在星星仍被选中的状态下，从 **Palette**（调色板）中选择一种颜色来改变星星的颜色：

[
 ![inkscape-drawastar](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-drawastar.gif) 
][12]

接下来，可以在 Toolbar 中实验一些其他形状工具，如矩形工具，螺旋工具和圆形工具。通过不同的设置，每个工具都可以创建一些独特的图形。

### 在绘图中选择并移动对象

现在你有一堆图形了，你可以使用 Select 工具来移动它们。要使用 Select 工具，首先从工具栏中选择它，然后单击要操作的形状，接着将图形拖动到您想要的位置。

选择形状后，你还可以使用尺寸句柄调整图形大小。此外，如果你单击所选的图形，尺寸句柄将转变为旋转模式，并允许你旋转图形：

[
 ![inkscape-movingshapes](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-movingshapes.gif) 
][13]

* * *

Inkscape是一个很棒的软件，它还包含了更多的工具和功能。在本系列的下一篇文章中，我们将介绍更多可用来创建插图和文档的功能和选项。

-----------------------

作者简介：Ryan 是一名 Fedora 设计师。他使用 Fedora Workstation 作为他的主要桌面，还有来自 Libre Graphics 世界的最好的工具，尤其是矢量图形编辑器 Inkscape。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-inkscape-fedora/

作者：[Ryan Lerch][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ryanlerch.id.fedoraproject.org/
[1]:https://openclipart.org/detail/185885/windmill-in-landscape
[2]:https://fedoramagazine.org/getting-started-inkscape-fedora/
[3]:https://inkscape.org/
[4]:https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[5]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/cyberscoty-landscape-800px.png
[6]:https://inkscape.org/en/about/screenshots/
[7]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/09/communty.png
[8]:https://apps.fedoraproject.org/packages/inkscape
[9]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gnome-software.png
[10]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape_window.png
[11]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-toolscontrolbar.gif
[12]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-drawastar.gif
[13]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-movingshapes.gif
