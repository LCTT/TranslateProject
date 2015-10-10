Translated by KnightJoker

用Linux学习：使用这些Linux应用来征服你的数学
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-featured.png)

这篇文章是[用Linux学习][1]系列的一部分:

- [用Linux学习: 学习类型][2]
- [用Linux学习: 物理模拟][3]
- [用Linux学习: 学习音乐][4]
- [用Linux学习: 两个地理应用程序][5]
- [用Linux学习: 用这些Linux应用来征服你的数学][6]


Linux提供了大量的教育软件和许多优秀的工具来帮助所有年龄段的学生学习和练习各种各样的话题,常常以交互的方式。与Linux一起学习这一系列的文章则为这些各种各样的教育软件和应用提供了一个介绍。

数学是计算机的核心。如果有人用精益求精和纪律来预期一个伟大的操作系统，比如GNU/ Linux，那么这将是数学。如果你在寻求一些数学应用程序，那么你将不会感到失望。Linux提供了很多优秀的工具使得数学看起来和你曾经做过的一样令人畏惧，但实际上他们会简化你使用它的方式。
### Gnuplot ###

Gnuplot 是一个适用于不同平台的命令行脚本化和多功能的图形工具。尽管它的名字，并不是GNU操作系统的一部分。也没有免费授权，但它是免费软件（这意味着它受版权保护，但免费使用）。

要在Ubuntu系统（或者衍生系统）上安装 `gnuplot`，输入：
    sudo apt-get install gnuplot gnuplot-x11

进入一个终端窗口。启动该程序，输入：

    gnuplot

你会看到一个简单的命令行界面：

![learnmath-gnuplot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot.png)

在其中您可以直接开始输入函数。绘图命令将绘制一个曲线图。

输入内容，例如，

    plot sin(x)/x

随着`gnuplot的`提示，将会打开一个新的窗口，图像便会在里面呈现。

![learnmath-gnuplot-plot1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot1.png)

你也可以在线这个图设置不同的属性，比如像这样指定“title”

    plot sin(x) title 'Sine Function', tan(x) title 'Tangent'

![learnmath-gnuplot-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot2.png)

使用`splot`命令，你可以给的东西更深入一点并且绘制3D图形

    splot sin(x*y/20)

![learnmath-gnuplot-plot3](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot3.png)

这个窗口有几个基本的配置选项,

![learnmath-gnuplot-options](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-options.png)

但是`gnuplot`的真正力量在于在它的命令行和脚本功能，`gnuplot`广泛完整的文档可在这里找到，并在[Duke大学网站][8]上面看见这个了不起的教程[7]的原始版本。

### Maxima ###

[Maxima][9]是从Macsyma原始资料开发的一个计算机代数系统，根据它的 SourceForge 页面，

> “Maxima是符号和数值的表达，包括微分，积分，泰勒级数，拉普拉斯变换，常微分方程，线性方程组，多项式，集合，列表，向量，矩阵和张量系统的操纵系统。Maxima通过精确的分数，任意精度的整数和可变精度浮点数产生高精度的计算结果。Maxima可以二维和三维中绘制函数和数据。“

你将会获得二进制包用于大多数Ubuntu衍生系统的Maxima以及它的图形界面中，插入所有包，输入：

    sudo apt-get install maxima xmaxima wxmaxima

在终端窗口中，Maxima是一个没有太多UI的命令行工具，但如果你开始wxmaxima，你会进入一个简单但功能强大的图形用户界面。

![learnmath-maxima](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima.png)

你可以开始输入这个来简单的一个开始。（提示：如果你想计算一个表达式，使用“Shift + Enter”回车后会增加更多的方法）

Maxima可以用于一些简单的问题，因此也可以作为一个计算器，

![learnmath-maxima-1and1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-1and1.png)

以及一些更复杂的问题,

![learnmath-maxima-functions](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-functions.png)

它使用`gnuplot`使得绘制简单,

![learnmath-maxima-plot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot.png)

或者绘制一些复杂的图形.

![learnmath-maxima-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot2.png)

（它需要gnuplot-X11的包，来显示它们。）

除了美化一些图形，Maxima也尽可能用latex格式导出它们，或者通过右键是捷菜单进行一些突出的操作.

![learnmath-maxima-menu](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-menu.png)

然而其主菜单还是提供了大量压倒性的功能，当然Maxima的功能远不止如此，这里也有一个广泛使用的在线文档。

### 总结 ###

数学不是一个简单的学科，这些在Linux上的优秀软件也没有使得数学更加简单，但是这些应用使得使用数学变得更加的简单和工程化。以上两种应用都只是介绍一下Linux的所提供的。如果你是认真从事数学和需要更多的功能与丰富的文档，那你更应该看看这些Mathbuntu项目。
--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/learn-linux-maths/

作者：[Attila Orosz][a]
译者：[KnightJoker](https://github.com/KnightJoker/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:https://www.maketecheasier.com/series/learn-with-linux/
[2]:https://www.maketecheasier.com/learn-to-type-in-linux/
[3]:https://www.maketecheasier.com/linux-physics-simulation/
[4]:https://www.maketecheasier.com/linux-learning-music/
[5]:https://www.maketecheasier.com/linux-geography-apps/
[6]:https://www.maketecheasier.com/learn-linux-maths/
[7]:http://www.gnuplot.info/documentation.html
[8]:http://people.duke.edu/~hpgavin/gnuplot.html
[9]:http://maxima.sourceforge.net/
[10]:http://maxima.sourceforge.net/documentation.html
[11]:http://www.mathbuntu.org/