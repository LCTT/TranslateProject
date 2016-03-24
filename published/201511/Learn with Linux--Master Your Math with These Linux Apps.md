与 Linux 一起学习：使用这些 Linux 应用来征服你的数学学习
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-featured.png)

这篇文章是[与 Linux 一起学习][1]系列的一部分:

- [与 Linux 一起学习: 学习类型][2]
- [与 Linux 一起学习: 物理模拟][3]
- [与 Linux 一起学习: 学习音乐][4]
- [与 Linux 一起学习: 两个地理应用程序][5]
- [与 Linux 一起学习: 使用这些 Linux 应用来征服你的数学学习][6]

Linux 提供了大量的教育软件和许多优秀的工具来帮助各种年龄段和年级的学生学习和练习各种各样的习题，这通常是以交互的方式进行。“与 Linux 一起学习”这一系列的文章则为这些各种各样的教育软件和应用提供了一个介绍。

数学是计算机的核心。如果有人预期一个类如 GNU/ Linux 这样的伟大的操作系统精确而严格，那么这就是数学所起到的作用。如果你在寻求一些数学应用程序，那么你将不会感到失望。Linux 提供了很多优秀的工具使得数学看起来和你曾经做过的一样令人畏惧，但实际上他们会简化你使用它的方式。

### Gnuplot ###

Gnuplot 是一个适用于不同平台的命令行脚本化和多功能的图形工具。尽管它的名字中带有“GNU”，但是它并不是 GNU 操作系统的一部分。虽然不是自由授权，但它是免费软件（这意味着它受版权保护，但免费使用）。

要在 Ubuntu 系统（或者衍生系统）上安装 `gnuplot`，输入：

    sudo apt-get install gnuplot gnuplot-x11

进入一个终端窗口。启动该程序，输入：

    gnuplot

你会看到一个简单的命令行界面：

![learnmath-gnuplot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot.png)

在其中您可以直接输入函数开始。绘图命令将绘制一个曲线图。

输入内容，例如，

    plot sin(x)/x

随着`gnuplot的`提示，将会打开一个新的窗口，图像便会在里面呈现。

![learnmath-gnuplot-plot1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot1.png)

你也可以即时设置设置这个图的不同属性，比如像这样指定“title”

    plot sin(x) title 'Sine Function', tan(x) title 'Tangent'

![learnmath-gnuplot-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot2.png)

你可以做的更深入一点，使用`splot`命令绘制3D图形：

    splot sin(x*y/20)

![learnmath-gnuplot-plot3](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot3.png)

这个图形窗口有几个基本的配置选项，

![learnmath-gnuplot-options](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-options.png)

但是`gnuplot`的真正力量在于在它的命令行和脚本功能，`gnuplot`更完整的文档在[Duke大学网站][8]上面[找到][7]，带有这个了不起的教程的原始版本。

### Maxima ###

[Maxima][9]是一个源于 Macsyma 开发的一个计算机代数系统，根据它的 SourceForge 页面所述：

> “Maxima 是一个操作符号和数值表达式的系统，包括微分，积分，泰勒级数，拉普拉斯变换，常微分方程，线性方程组，多项式，集合，列表，向量，矩阵和张量等。Maxima 通过精确的分数，任意精度的整数和可变精度浮点数产生高精度的计算结果。Maxima 可以以二维和三维的方式绘制函数和数据。“

大多数Ubuntu衍生系统都有 Maxima 二进制包以及它的图形界面，要安装这些软件包，输入：

    sudo apt-get install maxima xmaxima wxmaxima

在终端窗口中，Maxima 是一个没有什么 UI 的命令行工具，但如果你开始 wxmaxima，你会进入一个简单但功能强大的图形用户界面。

![learnmath-maxima](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima.png)

你可以通过简单的输入来开始。（提示：回车会增加更多的行，如果你想计算一个表达式，使用“Shift + Enter”。）

Maxima 可以用于一些简单的问题，因此也可以作为一个计算器：

![learnmath-maxima-1and1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-1and1.png)

以及一些更复杂的问题：

![learnmath-maxima-functions](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-functions.png)

它使用`gnuplot`使得绘制简单：

![learnmath-maxima-plot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot.png)

或者绘制一些复杂的图形。

![learnmath-maxima-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot2.png)

（它需要 gnuplot-X11 的软件包来显示它们。）

除了将表达式表示为图形，Maxima 也可以用 latex 格式导出它们，或者通过右键快捷菜单进行一些常用操作.

![learnmath-maxima-menu](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-menu.png)

不过其主菜单还是提供了大量重磅功能，当然 Maxima 的功能远不止如此，这里也有一个广泛使用的[在线文档][10]。

### 总结 ###

数学不是一门容易的学科，这些在 Linux 上的优秀软件也没有使得数学更加容易，但是这些应用使得使用数学变得更加的简单和方便。以上两种应用都只是介绍一下 Linux 所提供的。如果你是认真从事数学和需要更多的功能与丰富的文档，那你更应该看看这些 [Mathbuntu][11] 项目。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/learn-linux-maths/

作者：[Attila Orosz][a]
译者：[KnightJoker](https://github.com/KnightJoker/KnightJoker)
校对：[wxyD](https://github.com/wxy)

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