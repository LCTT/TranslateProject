[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10711-1.html)
[#]: subject: (Do advanced math with Mathematica on the Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/do-math-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

树莓派使用入门：在树莓派上使用 Mathematica 进行高级数学运算
======

> Wolfram 在 Raspbian 中捆绑了一个版本的 Mathematica。在我们的树莓派入门系列的第 12 篇文章中将学习如何使用它。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/edu_math_formulas.png?itok=B59mYTG3)

在 90 年代中期，我进入了大学数学专业，虽然我是以计算机科学学位毕业的，但是我就差两门课程就拿到了双学位，包括数学专业的学位。当时，我接触到了 [Wolfram][2] 的一个名为 [Mathematica][1] 的应用，我们可以将黑板上的许多代数和微分方程输入计算机。我每月花几个小时在实验室学习 Wolfram 语言，并在 Mathematica 上解决积分等问题。

对于大学生来说 Mathematica 是闭源而且昂贵的，因此在差不多 20 年后，看到 Wolfram 将一个版本的 Mathematica 与 Raspbian 和 Raspberry Pi 捆绑在一起是一个惊喜。如果你决定使用另一个基于 Debian 的发行版，你可以从这里[下载][3]。请注意，此版本仅供非商业用途免费使用。

树莓派基金会的 [Mathematica 简介][4]页面介绍了一些基本概念，如变量和循环、解决一些数学问题、创建图形、做线性代数，甚至通过应用与 GPIO 引脚交互。

![](https://opensource.com/sites/default/files/uploads/raspberrypi_12_mathematica_batman-plot.png)

要深入了解 Mathematica，请查看 [Wolfram 语言文档][5]。如果你只是想解决一些基本的微积分问题，请[查看它的函数][6]部分。如果你想[绘制一些 2D 和 3D 图形][7]，请阅读链接的教程。

或者，如果你想在做数学运算时坚持使用开源工具，请查看命令行工具 `expr`、`factor` 和 `bc`。（记住使用 [man 命令][8] 阅读使用帮助）如果想画图，[Gnuplot][9] 是个不错的选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/do-math-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Wolfram_Mathematica
[2]: https://wolfram.com/
[3]: https://www.wolfram.com/raspberry-pi/
[4]: https://projects.raspberrypi.org/en/projects/getting-started-with-mathematica/
[5]: https://www.wolfram.com/language/
[6]: https://reference.wolfram.com/language/guide/Calculus.html
[7]: https://reference.wolfram.com/language/howto/PlotAGraph.html
[8]: https://opensource.com/article/19/3/learn-linux-raspberry-pi
[9]: http://gnuplot.info/
