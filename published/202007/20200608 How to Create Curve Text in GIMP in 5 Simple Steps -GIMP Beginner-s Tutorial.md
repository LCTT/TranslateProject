[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12396-1.html)
[#]: subject: (How to Create Curve Text in GIMP in 5 Simple Steps [GIMP Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/curve-text-gimp/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

GIMP 教程：如何在 GIMP 中创建曲线文本
======

当你在 GIMP 中制作一个徽章、海报或其它任何作品时，你需要扭曲或弯曲一些文本。多功能的 [GIMP][1] 工具提供了一些创建弯曲文本的方法。取决于你将如何使用它和你想给予文本的弧度，有一些适合不同情况的方法。

在本篇教程中，我将向你展示我最喜欢的创建曲线文本的方法。

### 如何在 GIMP 中创建曲线文本

![][2]

请确保你已经在你的系统上安装了 GIMP。

#### 步骤 1: 创建一个你想要的匹配曲线的路径

创建一个新的图像或打开一个现有的图像。选择 “工具 -> 路径”，然后大致考虑曲线文本的位置，通过分别单击路径点的开始点和结束点来创建路径。

![创建一个路径][3]

**然后给你的路径一个曲率。**首先向上或向下拖动中间的直线，然后通过移动调整点进行微调。这将给予它一个拱形结构。

![弯曲路径][4]

#### 步骤 2: 创建你想弯曲的文本

当你对自己的曲线路径满意时，你可以移动到接下来的步骤，并 **创建你的文本**。

你可能想更改字体及其大小。我的选择只是为了演示用途。

![创建一个文本][5]

#### 步骤 3: 创建一个新的图层

我强烈建议分割 GIMP 图像中的每个不同的元素到不同的图层中，以便很容易地控制它们，像移动，打开/关闭一个元素等等。

遵循这一规则，我们要弯曲的文本将被放置到一个新的图层中。建议使用像 “Curved Text” 一样的名字来命名你的新的图层，或者一些类似的东西来很容易地识别它。

![为弯曲的文本创建一个新的图层][6]

#### 步骤 4: 弯曲文本

现在你需要在你的文本图层上单击，接下来在其上右击，并单击“文字对齐路径”来折弯你的文本。弯曲的文本将被放置到新创建的图层。

![文字对齐路径][7]

你把文本弯曲了！让我们使用颜色填充文本来使其更令人满意。

### 步骤 5: 最后的修饰和导出

单击弯曲的文本图层，然后转到路径选项卡来选择文本边界。

![路径选择][8]

最后，选择油漆桶工具，选择一种颜色，并如下应用你的选择区。

![][9]

随着最后一步的到来，打开不需要的层的可见性，只保留曲线文本。接下来，需要导出你的文件为你喜欢的图像格式。

![][10]

#### 额外提示：创建阴影效果

我还有一个作为一次挑战的额外的步骤，如果你想更进一步的话。让我们在 [GIMP 中勾勒文本][11]以创建一个弯曲文本的阴影效果。

我将给予你一些提示:

  * 重新启用所有图层
  * 单击弯曲文本图层，并使用移动工具来到处移动文本
  * 创建另一个图层，并使用黑色来重复油漆桶填充程序
  * 以一种模拟一种阴影位置的方式覆盖图层（你可能需要更改图层顺序）
  * 关闭辅助图层

最终结果：

![][12]

让我在评论区知道你们对这篇 GIMP 教程的想法，以及有多少人尝试了这一额外的步骤。

--------------------------------------------------------------------------------

via: https://itsfoss.com/curve-text-gimp/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/Curve-text-in-GIMP.jpg?ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/1image-1.png?fit=800%2C508&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/2.png?fit=800%2C500&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/3.png?fit=800%2C503&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/new-layer.png?fit=800%2C637&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/text-along-path.png?fit=800%2C625&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/path-to-selection.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/6.png?fit=800%2C539&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/4.png-copy.png?ssl=1
[11]: https://itsfoss.com/gimp-text-outline/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/its-foss-curved.jpg?fit=800%2C409&ssl=1
[13]: https://itsfoss.com/subscribe-to-newsletter/
