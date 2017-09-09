ImageMagick 入门：使用命令行来编辑图片
============================================================

> 了解使用此轻量级图像编辑器查看和修改图像的常见方法。

![Getting started with ImageMagick](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/art-yearbook-paint-draw-create-creative.png?itok=t9fOdlyJ "Getting started with ImageMagick")


在最近一篇关于[轻量级图像查看器][8]的文章中，作者 Scott Nesbitt 提到了 `display`，它是 [ImageMagick][9] 中的一个组件。ImageMagick 不仅仅是一个图像查看器，它还提供了大量的图像编辑工具和选项。本教程将详细介绍如何在 ImageMagick 中使用 `display` 命令和其他命令行工具。

现在有许多优秀的图像编辑器可用，你可能会想知道为什么有人会选择一个非 GUI 的、基于命令行的程序，如 ImageMagick。一方面，它非常可靠。但更大的好处是，它允许你建立一个以特定的方式编辑大量图像的方式。

这篇对于常见的 ImageMagick 命令的介绍应该让你入门。

### display 命令

让我们从 Scott 提到的命令开始：`display`。假设你有一个目录，其中有很多想要查看的图像。使用以下命令开始 `display`：

```
cd Pictures
display *.JPG
```

这将按照字母数字顺序顺序加载你的 JPG 文件，每张放在一个简单的窗口中。左键单击图像可以打开一个简单的独立菜单（ImageMagick 中唯一的 GUI 功能）。

![display menu](https://opensource.com/sites/default/files/u128651/display_menu.png "display menu")

你可以在 **display** 菜单中找到以下内容：

*   **File** 包含选项 Open、Next、Former、Select、Save、Print、Delete、New、Visual Directory 和 Quit。 _Select_ 来选择要显示的特定文件，_Visual Directory_ 显示当前工作目录中的所有文件（而不仅仅是图像）。如果要滚动显示所有选定的图像，你可以使用 _Next_ 和 _Former_，但使用键盘快捷键（下一张图像用空格键，上一张图像用退格）更容易。
*  **Edit** 提供 Undo、Redo、Cut、Copy 和 Paste，它们只是辅助命令进行更具体的编辑过程。 当你进行不同的编辑功能看看它们做什么时 _Undo_ 特别有用。
*  **View** 有 Half Size、Original Size、Double Size、Resize、Apply、Refresh 和 Restore。这些大多是不用说明的，除非你在应用其中之一后保存图像，否则图像文件不会更改。_Resize_ 会打开一个对话框，以像素为单位，带有或者不带尺寸限制，或者是百分比指定图片大小。我不知道 _Apply_ 会做什么。
*   **Transform** 显示 Crop、Chop、Flop、Flip、Rotate Right、Rotate Left、Rotate、Shear、Roll 和 Trim Edges。_Chop_ 使用点击拖动操作剪切图像的垂直或水平部分，将边缘粘贴在一起。了解这些功能如何工作的最佳方法是操作它们，而不是看看。
*   **Enhance** 提供 Hue、Saturation、Brightness、Gamma、Spiff、Dull、Contrast Stretch、Sigmoidal Contrast、Normalize、Equalize、Negate、Grayscale、Map 和 Quantize。这些是用于颜色和调整亮度和对比度的操作。
*   **效果** 有 Despeckle、Emboss、Reduce Noise、Add Noise、Sharpen、Blur、Threshold、Edge Detect、Spread、Shade、Raise 和 Segment。这些是相当标准的图像编辑效果。
*   **F/X** 选项有 Solarize、Sepia Tone、Swirl、Implode、Vignette、Wave、Oil Paint 和 Charcoal Draw，在图像编辑器中也是非常常见的效果。
*   **Image Edit** 包含 Annotate、Draw、Color、Matte、Composite、Add Border、Add Frame、Comment、Launch 和 Region of Interest。_Launch _ 将打开 GIMP 中的当前图像（至少在我的 Fedora 中是这样）。 _Region of Interest_ 允许你选择一个区域来应用编辑。按下 Esc 取消选择该区域。
*  **Miscellany** 提供 Image Info、Zoom Image、Show Preview、Show Histogram、Show Matte、Background、Slide Show 和 Preferences。 _Show Preview_ 似乎很有趣，但我努力让它工作。
*  **Help** 有 Overview、Browse Documentation 和 About Display。 _Overview_ 提供了大量关于 display 的基本信息，并且包含大量内置的键盘快捷键，用于各种命令和操作。在我的 Fedora 中，_Browse Documentation_ 没有作用。

虽然 `display` 的 GUI 界面提供了一个称职的图像编辑器，但 ImageMagick 还提供了 89 个命令行选项，其中许多与上述菜单项相对应。例如，如果我显示的数码相片目录中的图像大于我的屏幕尺寸，我不用在显示后单独调整大小，我可以指定：

```
display -resize 50% *.JPG
```

上面菜单中的许多操作都可以通过在命令行中添加一个选项来完成。但是还有其他的选项在菜单中没有，包括 `-monochrome`，将图像转换为黑白（不是灰度），还有 `-colors`，你可以指定在图像中使用多少种颜色。例如，尝试这些：

```
display -resize 50% -monochrome *.JPG
```

```
display -resize 50% -colors 8 *.JPG
```

这些操作会创建有趣的图像。试试增强颜色或进行其他编辑后减少颜色。记住，除非你保存并覆盖它们，否则原始文件保持不变。

### convert 命令

`convert` 命令有 237 个选项 - 是的， 237 个！ - 它提供了你可以做的各种各样的事情（其中一些 `display` 也可以做）。我只会覆盖其中的几个，主要是图像操作。你可以用 `convert` 做的两件简单的事情是：

```
convert DSC_0001.JPG dsc0001.png
```

```
convert *.bmp *.png
```

第一个命令将单个文件（DSC_0001）从 JPG 转换为 PNG 格式，而不更改原始文件。第二个将对目录中的所有 BMP 图像执行此操作。

如果要查看 ImageMagick 可以使用的格式，请输入：

```
identify -list format
```

我们来看几个用 `convert` 命令来处理图像的有趣方法。以下是此命令的一般格式：

```
convert inputfilename [options] outputfilename
```

你有多个选项，它们按照从左到右排列的顺序完成。

以下是几个简单的选项：

```
convert monochrome_source.jpg -monochrome monochrome_example.jpg
```


![monochrome example](https://opensource.com/sites/default/files/u128651/monochrome_demo.jpg "monochrome example")

```
convert DSC_0008.jpg -charcoal 1.2 charcoal_example.jpg
```

![charcoal example](https://opensource.com/sites/default/files/u128651/charcoal_demo.jpg "charcoal example")

`-monochrome` 选项没有关联的设置，但 `-charcoal` 变量需要一个相关因子。根据我的经验，它需要一个小的数字（甚至小于 1）来实现类似于炭笔绘画的东西，否则你会得到很大的黑色斑点。即使如此，图像中的尖锐边缘也是非常明显的，与炭笔绘画不同。

现在来看看这些：

```
convert DSC_0032.JPG -edge 3 edge_demo.jpg
```

```
convert DSC_0032.JPG -colors 4 reduced4_demo.jpg
```

```
convert DSC_0032.JPG -colors 4 -edge 3 reduced+edge_demo.jpg
```

![edge and reduced colors example](https://opensource.com/sites/default/files/u128651/reduced_demo.jpg "edge and reduced colors example")

原始图像位于左上方。在第一个命令中，我使用了一个 `-edge` 选项，设置为 3（见右上角的图像） - 对于我的喜好而言小于它的数字都太精细了。在第二个命令（左下角的图像）中，我们将颜色的数量减少到了 4 个，与原来没有什么不同。但是看看当我们在第三个命令中组合这两个时，会发生什么（右下角的图像）！也许这有点大胆，但谁能预期到从原始图像或任何一个选项变成这个结果？

`-canny` 选项提供了另外一个惊喜。这是另一种边缘检测器，称为“多阶算法”。单独使用 `-canny` 可以产生基本黑色的图像和一些白线。我后面跟着一个 `-negate` 选项：

```
convert DSC_0049.jpg -canny 0x1 -negate canny_egret.jpg
convert DSC_0023.jpg -canny 0x1 -negate canny_ship.jpg
```

![canny demo](https://opensource.com/sites/default/files/u128651/canny_demos.jpg "canny demo")

这有点极简主义，但我认为它类似于一种笔墨绘画，与原始照片有相当显著的差异。它并不能用于所有图片。一般来说，它对有锐利线条的图像效果最好。不是焦点的元素可能会消失。注意白鹭图片中的背景沙滩没有显示，因为它是模糊的。同样注意下船舶图片，虽然大多数边缘显示得非常好，因为没有颜色，我们失去了图片的整体形象，所以也许这可以作为一些数字着色，甚至在印后着色的基础。

### montage 命令

最后，我想谈一下 `montage` （蒙太奇）命令。我已经在上面展示了这个例子，我将单个图像组合成复合图片。

这是我如何生成炭笔的例子（请注意，它们都在一行）：

```
montage -label %f DSC_0008.jpg charcoal_example.jpg -geometry +10+10
      -resize 25% -shadow -title 'charcoal demo' charcoal_demo.jpg
```

`-label` 选项会在每个图像下方标记它的文件名(`%f`)。不用 `-geometry` 选项，所有的图像将是缩略图大小（120 像素宽），`+10+10` 负责边框大小。接下来，我调整了整个最终组合的大小（`-resize 25%`），并添加了一个阴影（没有设置，因此是默认值），最后为这次 montage 操作创建了一个标题（`-title`）。

你可以将所有图像名称放在最后，最后一个图像的名称将是 `montage` 操作所保存的文件名。这可用于为命令及其所有选项创建别名，然后我可以简单地键入该别名、输入适当的文件名即可。我偶尔会这么做来减少 `montage` 操作需要输入的命令长度。

在 `-canny` 的例子中，我对 4 张图像进行了蒙太奇操作。我添加了 `-tile` 选项，确切地说是 `-tile 2x`，它创建了有两列的蒙太奇。我可以指定一个 `matrix`、`-tile 2x2` 或 `-tile x2` 来产生相同的结果。

ImageMagick 还有更多可以了解，所以我打算写更多关于它的文章，甚至可能使用 [Perl][10] 脚本运行 ImageMagick 命令。ImageMagick 具有丰富的[文档][11]，尽管该网站在示例或者显示结果上还不足，我认为最好的学习方式是通过实验和更改各种设置和选项来学习。

（题图： opensource.com）

--------------------------------------------------------------------------------

作者简介：

Greg Pittman - Greg 是肯塔基州路易斯维尔的一名退休的神经科医生，对计算机和程序设计有着长期的兴趣，从 1960 年代的 Fortran IV 开始。当 Linux 和开源软件相继出现时，他开始学习更多，并最终做出贡献。他是 Scribus 团队的成员。

---------------------

via: https://opensource.com/article/17/8/imagemagick

作者：[Greg Pittman][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://opensource.com/file/367401
[2]:https://opensource.com/file/367391
[3]:https://opensource.com/file/367396
[4]:https://opensource.com/file/367381
[5]:https://opensource.com/file/367406
[6]:https://opensource.com/article/17/8/imagemagick?rate=W2W3j4nu4L14gOClu1RhT7GOMDS31pUdyw-dsgFNqYI
[7]:https://opensource.com/user/30666/feed
[8]:https://opensource.com/article/17/7/4-lightweight-image-viewers-linux-desktop
[9]:https://www.imagemagick.org/script/index.php
[10]:https://opensource.com/sitewide-search?search_api_views_fulltext=perl
[11]:https://imagemagick.org/script/index.php
[12]:https://opensource.com/users/greg-p
[13]:https://opensource.com/users/greg-p
[14]:https://opensource.com/article/17/8/imagemagick#comments
