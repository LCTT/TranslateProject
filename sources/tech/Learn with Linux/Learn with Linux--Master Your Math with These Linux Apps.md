Translating by KnightJoker

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

Gnuplot is a command-line scriptable and versatile graphing utility for different platforms. Despite its name, it is not part of the GNU operating system. Although it is not freely licensed, it’s free-ware (meaning it’s copyrighted but free to use).

To install `gnuplot` on an Ubuntu (or derivative) system, type

    sudo apt-get install gnuplot gnuplot-x11

into a terminal window. To start the program, type

    gnuplot

You will be presented with a simple command line interface

![learnmath-gnuplot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot.png)

into which you can start typing functions directly. The plot command will draw a graph.

Typing, for instance,

    plot sin(x)/x

into the `gnuplot` prompt, will open another window, wherein the graph is presented.

![learnmath-gnuplot-plot1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot1.png)

You can also set different attributes of the graphs in-line. For example, specifying “title” will give them just that.

    plot sin(x) title 'Sine Function', tan(x) title 'Tangent'

![learnmath-gnuplot-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot2.png)

You can give things a bit more depth and draw 3D graphs with the `splot` command.

    splot sin(x*y/20)

![learnmath-gnuplot-plot3](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-plot3.png)

The plot window has a few basic configuration options,

![learnmath-gnuplot-options](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-gnuplot-options.png)

but the true power of `gnuplot` lies within its command line and scripting capabilities. The extensive full documentation of `gnuplot` can be found [here][7] with a great tutorial for the previous version [on the Duke University’s website][8].

### Maxima ###

[Maxima][9] is a computer algebra system developed from the original sources of Macsyma. According to its SourceForge page,

> “Maxima is a system for the manipulation of symbolic and numerical expressions, including differentiation, integration, Taylor series, Laplace transforms, ordinary differential equations, systems of linear equations, polynomials, sets, lists, vectors, matrices and tensors. Maxima yields high precision numerical results by using exact fractions, arbitrary-precision integers and variable-precision floating-point numbers. Maxima can plot functions and data in two and three dimensions.”

You will have binary packages for Maxima in most Ubuntu derivatives as well as the Maxima graphical interface. To install them all, type

    sudo apt-get install maxima xmaxima wxmaxima

into a terminal window. Maxima is a command line utility with not much of a UI, but if you start `wxmaxima`, you’ll get into a simple, yet powerful GUI.

![learnmath-maxima](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima.png)

You can start using this by simply starting to type. (Hint: Enter will add more lines; if you want to evaluate an expression, use “Shift + Enter.”)

Maxima can be used for very simple problems, as it also acts as a calculator,

![learnmath-maxima-1and1](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-1and1.png)

and much more complex ones as well.

![learnmath-maxima-functions](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-functions.png)

It uses `gnuplot` to draw simple

![learnmath-maxima-plot](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot.png)

and more elaborate graphs.

![learnmath-maxima-plot2](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-plot2.png)

(It needs the `gnuplot-x11` package to display them.)

Besides beautifying the expressions, Maxima makes it possible to export them in latex format, or do some operations on the highlighted functions with a right-click context menu,

![learnmath-maxima-menu](https://www.maketecheasier.com/assets/uploads/2015/07/learnmath-maxima-menu.png)

while its main menus offer an overwhelming amount of functionality. Of course, Maxima is capable of much more than this. It has an extensive documentation [available online][10].

### Conclusion ###

Mathematics is not an easy subject, and the excellent math software on Linux does not make it look easier, yet these applications make using Mathematics much more straightforward and productive. The above two applications are just an introduction to what Linux has to offer. If you are seriously engaged in math and need even more functionality with great documentation, you should check out the [Mathbuntu project][11].

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/learn-linux-maths/

作者：[Attila Orosz][a]
译者：[译者ID](https://github.com/译者ID)
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