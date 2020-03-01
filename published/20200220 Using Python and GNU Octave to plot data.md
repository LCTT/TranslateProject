[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11943-1.html)
[#]: subject: (Using Python and GNU Octave to plot data)
[#]: via: (https://opensource.com/article/20/2/python-gnu-octave-data-science)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

使用 Python 和 GNU Octave 绘制数据
======

> 了解如何使用 Python 和 GNU Octave 完成一项常见的数据科学任务。

![](https://img.linux.net.cn/data/attachment/album/202002/29/114750tr7qykssk90yrvyz.jpg)

数据科学是跨越编程语言的知识领域。有些语言以解决这一领域的问题而闻名，而另一些则鲜为人知。这篇文章将帮助你熟悉用一些流行的语言完成数据科学的工作。

### 选择 Python 和 GNU Octave 做数据科学工作

我经常尝试学习一种新的编程语言。为什么？这既有对旧方式的厌倦，也有对新方式的好奇。当我开始学习编程时，我唯一知道的语言是 C 语言。那些年的编程生涯既艰难又危险，因为我必须手动分配内存、管理指针、并记得释放内存。

后来一个朋友建议我试试 Python，现在我的编程生活变得轻松多了。虽然程序运行变得慢多了，但我不必通过编写分析软件来受苦了。然而，我很快就意识到每种语言都有比其它语言更适合自己的应用场景。后来我学习了一些其它语言，每种语言都给我带来了一些新的启发。发现新的编程风格让我可以将一些解决方案移植到其他语言中，这样一切都变得有趣多了。

为了对一种新的编程语言（及其文档）有所了解，我总是从编写一些执行我熟悉的任务的示例程序开始。为此，我将解释如何用 Python 和 GNU Octave 编写一个程序来完成一个你可以归类为数据科学的特殊任务。如果你已经熟悉其中一种语言，从它开始，然后通过其他语言寻找相似之处和不同之处。这篇文章并不是对编程语言的详尽比较，只是一个小小的展示。

所有的程序都应该在[命令行][2]上运行，而不是用[图形用户界面][3]（GUI）。完整的例子可以在 [polyglot_fit 存储库][4]中找到。

### 编程任务

你将在本系列中编写的程序:

  * 从 [CSV 文件][5]中读取数据
  * 用直线插入数据（例如 `f(x)=m ⋅ x + q`）
  * 将结果生成图像文件

这是许多数据科学家遇到的常见情况。示例数据是 [Anscombe 的四重奏][6]的第一组，如下表所示。这是一组人工构建的数据，当用直线拟合时会给出相同的结果，但是它们的曲线非常不同。数据文件是一个文本文件，以制表符作为列分隔符，开头几行作为标题。此任务将仅使用第一组（即前两列）。

![](https://img.linux.net.cn/data/attachment/album/202002/29/122805h3yrs1dkrgysssxk.png)

### Python 方式

[Python][7] 是一种通用编程语言，是当今最流行的语言之一（依据 [TIOBE 指数][8]、[RedMonk 编程语言排名][9]、[编程语言流行指数][10]、[GitHub Octoverse 状态][11]和其他来源的调查结果）。它是一种[解释型语言][12]；因此，源代码由执行该指令的程序读取和评估。它有一个全面的[标准库][13]并且总体上非常好用（我对这最后一句话没有证据；这只是我的拙见）。

#### 安装

要使用 Python 开发，你需要解释器和一些库。最低要求是：

* [NumPy][14] 用于简化数组和矩阵的操作
* [SciPy][15] 用于数据科学
* [Matplotlib][16] 用于绘图

在 [Fedora][17] 安装它们是很容易的：

```
sudo dnf install python3 python3-numpy python3-scipy python3-matplotlib
```

#### 代码注释

在 Python中，[注释][18]是通过在行首添加一个 `#` 来实现的，该行的其余部分将被解释器丢弃：

```
# 这是被解释器忽略的注释。
```

[fitting_python.py][19] 示例使用注释在源代码中插入许可证信息，第一行是[特殊注释][20]，它允许该脚本在命令行上执行:

```
#!/usr/bin/env python3
```

这一行通知命令行解释器，该脚本需要由程序 `python3` 执行。

#### 需要的库

在 Python 中，库和模块可以作为一个对象导入（如示例中的第一行），其中包含库的所有函数和成员。可以通过使用 `as` 方式用自定义标签重命名它们：

```
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt
```

你也可以决定只导入一个子模块（如第二行和第三行）。语法有两个（基本上）等效的方式：`import module.submodule` 和 `from module import submodule`。

#### 定义变量

Python 的变量是在第一次赋值时被声明的：

```
input_file_name = "anscombe.csv"
delimiter = "\t"
skip_header = 3
column_x = 0
column_y = 1
```

变量类型由分配给变量的值推断。没有具有常量值的变量，除非它们在模块中声明并且只能被读取。习惯上，不应被修改的变量应该用大写字母命名。

#### 打印输出

通过命令行运行程序意味着输出只能打印在终端上。Python 有 [print()][21] 函数，默认情况下，该函数打印其参数，并在输出的末尾添加一个换行符：

```
print("#### Anscombe's first set with Python ####")
```

在 Python 中，可以将 `print()` 函数与[字符串类][23]的[格式化能力][22]相结合。字符串具有`format` 方法，可用于向字符串本身添加一些格式化文本。例如，可以添加格式化的浮点数，例如:

```
print("Slope: {:f}".format(slope))
```

#### 读取数据

使用 NumPy 和函数 [genfromtxt()][24] 读取 CSV 文件非常容易，该函数生成 [NumPy 数组][25]：

```
data = np.genfromtxt(input_file_name, delimiter = delimiter, skip_header = skip_header)
```

在 Python 中，一个函数可以有数量可变的参数，你可以通过指定所需的参数来传递一个参数的子集。数组是非常强大的矩阵状对象，可以很容易地分割成更小的数组：

```
x = data[:, column_x]
y = data[:, column_y]
```

冒号选择整个范围，也可以用来选择子范围。例如，要选择数组的前两行，可以使用：

```
first_two_rows = data[0:1, :]
```

#### 拟合数据

SciPy 提供了方便的数据拟合功能，例如 [linregress()][26] 功能。该函数提供了一些与拟合相关的重要值，如斜率、截距和两个数据集的相关系数:

```
slope, intercept, r_value, p_value, std_err = stats.linregress(x, y)

print("Slope: {:f}".format(slope))
print("Intercept: {:f}".format(intercept))
print("Correlation coefficient: {:f}".format(r_value))
```

因为 `linregress()` 提供了几条信息，所以结果可以同时保存到几个变量中。

#### 绘图

Matplotlib 库仅仅绘制数据点，因此，你应该定义要绘制的点的坐标。已经定义了 `x` 和 `y` 数组，所以你可以直接绘制它们，但是你还需要代表直线的数据点。

```
fit_x = np.linspace(x.min() - 1, x.max() + 1, 100)
```

[linspace()][27] 函数可以方便地在两个值之间生成一组等距值。利用强大的 NumPy 数组可以轻松计算纵坐标，该数组可以像普通数值变量一样在公式中使用：

```
fit_y = slope * fit_x + intercept
```

该公式在数组中逐元素应用；因此，结果在初始数组中具有相同数量的条目。

要绘图，首先，定义一个包含所有图形的[图形对象][28]：

```
fig_width = 7 #inch
fig_height = fig_width / 16 * 9 #inch
fig_dpi = 100

fig = plt.figure(figsize = (fig_width, fig_height), dpi = fig_dpi)
```

一个图形可以画几个图；在 Matplotlib 中，这些图被称为[轴][29]。本示例定义一个单轴对象来绘制数据点：

```
ax = fig.add_subplot(111)

ax.plot(fit_x, fit_y, label = "Fit", linestyle = '-')
ax.plot(x, y, label = "Data", marker = '.', linestyle = '')

ax.legend()
ax.set_xlim(min(x) - 1, max(x) + 1)
ax.set_ylim(min(y) - 1, max(y) + 1)
ax.set_xlabel('x')
ax.set_ylabel('y')
```

将该图保存到 [PNG 图形文件][30]中，有:

```
fig.savefig('fit_python.png')
```

如果要显示（而不是保存）该绘图，请调用：

```
plt.show()
```

此示例引用了绘图部分中使用的所有对象：它定义了对象 `fig` 和对象 `ax`。这在技术上是不必要的，因为 `plt` 对象可以直接用于绘制数据集。《[Matplotlib 教程][31]》展示了这样一个接口：

```
plt.plot(fit_x, fit_y)
```

坦率地说，我不喜欢这种方法，因为它隐藏了各种对象之间发生的重要交互。不幸的是，有时[官方的例子][32]有点令人困惑，因为他们倾向于使用不同的方法。在这个简单的例子中，引用图形对象是不必要的，但是在更复杂的例子中（例如在图形用户界面中嵌入图形时），引用图形对象就变得很重要了。

#### 结果

命令行输入：

```
#### Anscombe's first set with Python ####
Slope: 0.500091
Intercept: 3.000091
Correlation coefficient: 0.816421
```

这是 Matplotlib 产生的图像：

![Plot and fit of the dataset obtained with Python][33]

### GNU Octave 方式

[GNU Octave][34] 语言主要用于数值计算。它提供了一个简单的操作向量和矩阵的语法，并且有一些强大的绘图工具。这是一种像 Python 一样的解释语言。由于 Octave 的语法[几乎兼容][35] [MATLAB][36]，它经常被描述为一个替代 MATLAB 的免费方案。Octave 没有被列为最流行的编程语言，而 MATLAB 则是，所以 Octave 在某种意义上是相当流行的。MATLAB 早于 NumPy，我觉得它是受到了前者的启发。当你看这个例子时，你会看到相似之处。

#### 安装

[fitting_octave.m][37] 的例子只需要基本的 Octave 包，在 Fedora 中安装相当简单：

```
sudo dnf install octave
```

#### 代码注释

在 Octave 中，你可以用百分比符号（`%`）为代码添加注释，如果不需要与 MATLAB 兼容，你也可以使用 `#`。使用 `#` 的选项允许你编写像 Python 示例一样的特殊注释行，以便直接在命令行上执行脚本。

#### 必要的库

本例中使用的所有内容都包含在基本包中，因此你不需要加载任何新的库。如果你需要一个库，[语法][38]是 `pkg load module`。该命令将模块的功能添加到可用功能列表中。在这方面，Python 具有更大的灵活性。

#### 定义变量

变量的定义与 Python 的语法基本相同：

```
input_file_name = "anscombe.csv";
delimiter = "\t";
skip_header = 3;
column_x = 1;
column_y = 2;
```

请注意，行尾有一个分号；这不是必需的，但是它会抑制该行结果的输出。如果没有分号，解释器将打印表达式的结果：

```
octave:1> input_file_name = "anscombe.csv"
input_file_name = anscombe.csv
octave:2> sqrt(2)
ans =  1.4142
```

#### 打印输出结果

强大的函数 [printf()][39] 是用来在终端上打印的。与 Python 不同，`printf()` 函数不会自动在打印字符串的末尾添加换行，因此你必须添加它。第一个参数是一个字符串，可以包含要传递给函数的其他参数的格式信息，例如：

```
printf("Slope: %f\n", slope);
```

在 Python 中，格式是内置在字符串本身中的，但是在 Octave 中，它是特定于 `printf()` 函数。

#### 读取数据

[dlmread()][40] 函数可以读取类似 CSV 文件的文本内容：

```
data = dlmread(input_file_name, delimiter, skip_header, 0);
```

结果是一个[矩阵][41]对象，这是 Octave 中的基本数据类型之一。矩阵可以用类似于 Python 的语法进行切片：

```
x = data(:, column_x);
y = data(:, column_y);
```

根本的区别是索引从 1 开始，而不是从 0 开始。因此，在该示例中，`x` 列是第一列。

#### 拟合数据

要用直线拟合数据，可以使用 [polyfit()][42] 函数。它用一个多项式拟合输入数据，所以你只需要使用一阶多项式：

```
p = polyfit(x, y, 1);

slope = p(1);
intercept = p(2);
```

结果是具有多项式系数的矩阵；因此，它选择前两个索引。要确定相关系数，请使用 [corr()][43] 函数：

```
r_value = corr(x, y);
```

最后，使用 `printf()` 函数打印结果：

```
printf("Slope: %f\n", slope);
printf("Intercept: %f\n", intercept);
printf("Correlation coefficient: %f\n", r_value);
```

#### 绘图

与 Matplotlib 示例一样，首先需要创建一个表示拟合直线的数据集:

```
fit_x = linspace(min(x) - 1, max(x) + 1, 100);
fit_y = slope * fit_x + intercept;
```

与 NumPy 的相似性也很明显，因为它使用了 [linspace()][44] 函数，其行为就像 Python 的等效版本一样。

同样，与 Matplotlib 一样，首先创建一个[图][45]对象，然后创建一个[轴][46]对象来保存这些图：

```
fig_width = 7; %inch
fig_height = fig_width / 16 * 9; %inch
fig_dpi = 100;

fig = figure("units", "inches",
             "position", [1, 1, fig_width, fig_height]);

ax = axes("parent", fig);

set(ax, "fontsize", 14);
set(ax, "linewidth", 2);
```

要设置轴对象的属性，请使用 [set()][47] 函数。然而，该接口相当混乱，因为该函数需要一个逗号分隔的属性和值对列表。这些对只是代表属性名的一个字符串和代表该属性值的第二个对象的连续。还有其他设置各种属性的函数：

```
xlim(ax, [min(x) - 1, max(x) + 1]);
ylim(ax, [min(y) - 1, max(y) + 1]);
xlabel(ax, 'x');
ylabel(ax, 'y');
```

绘图是用 [plot()][48] 功能实现的。默认行为是每次调用都会重置坐标轴，因此需要使用函数 [hold()][49]。

```
hold(ax, "on");

plot(ax, fit_x, fit_y,
     "marker", "none",
     "linestyle", "-",
     "linewidth", 2);
plot(ax, x, y,
     "marker", ".",
     "markersize", 20,
     "linestyle", "none");

hold(ax, "off");
```

此外，还可以在 `plot()` 函数中添加属性和值对。[legend][50] 必须单独创建，标签应手动声明：

```
lg = legend(ax, "Fit", "Data");
set(lg, "location", "northwest");
```

最后，将输出保存到 PNG 图像：

```
image_size = sprintf("-S%f,%f", fig_width * fig_dpi, fig_height * fig_dpi);
image_resolution = sprintf("-r%f,%f", fig_dpi);

print(fig, 'fit_octave.png',
      '-dpng',
      image_size,
      image_resolution);
```

令人困惑的是，在这种情况下，选项被作为一个字符串传递，带有属性名和值。因为在 Octave 字符串中没有 Python 的格式化工具，所以必须使用 [sprintf()][51] 函数。它的行为就像 `printf()` 函数，但是它的结果不是打印出来的，而是作为字符串返回的。

在这个例子中，就像在 Python 中一样，图形对象很明显被引用以保持它们之间的交互。如果说 Python 在这方面的文档有点混乱，那么 [Octave 的文档][52]就更糟糕了。我发现的大多数例子都不关心引用对象；相反，它们依赖于绘图命令作用于当前活动图形。全局[根图形对象][53]跟踪现有的图形和轴。

#### 结果

命令行上的结果输出是：

```
#### Anscombe's first set with Octave ####
Slope: 0.500091
Intercept: 3.000091
Correlation coefficient: 0.816421
```

它显示了用 Octave 生成的结果图像。

![Plot and fit of the dataset obtained with Octave][54]

###接下来

Python 和 GNU Octave 都可以绘制出相同的信息，尽管它们的实现方式不同。如果你想探索其他语言来完成类似的任务，我强烈建议你看看 [Rosetta Code][55]。这是一个了不起的资源，可以看到如何用多种语言解决同样的问题。

你喜欢用什么语言绘制数据？在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/python-gnu-octave-data-science

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://en.wikipedia.org/wiki/Command-line_interface
[3]: https://en.wikipedia.org/wiki/Graphical_user_interface
[4]: https://gitlab.com/cristiano.fontana/polyglot_fit
[5]: https://en.wikipedia.org/wiki/Comma-separated_values
[6]: https://en.wikipedia.org/wiki/Anscombe%27s_quartet
[7]: https://www.python.org/
[8]: https://www.tiobe.com/tiobe-index/
[9]: https://redmonk.com/sogrady/2019/07/18/language-rankings-6-19/
[10]: http://pypl.github.io/PYPL.html
[11]: https://octoverse.github.com/
[12]: https://en.wikipedia.org/wiki/Interpreted_language
[13]: https://docs.python.org/3/library/
[14]: https://numpy.org/
[15]: https://www.scipy.org/
[16]: https://matplotlib.org/
[17]: https://getfedora.org/
[18]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[19]: https://gitlab.com/cristiano.fontana/polyglot_fit/-/blob/master/fitting_python.py
[20]: https://en.wikipedia.org/wiki/Shebang_(Unix)
[21]: https://docs.python.org/3/library/functions.html#print
[22]: https://docs.python.org/3/library/string.html#string-formatting
[23]: https://docs.python.org/3/library/string.html
[24]: https://docs.scipy.org/doc/numpy/reference/generated/numpy.genfromtxt.html
[25]: https://docs.scipy.org/doc/numpy/reference/generated/numpy.array.html
[26]: https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.linregress.html
[27]: https://docs.scipy.org/doc/numpy/reference/generated/numpy.linspace.html
[28]: https://matplotlib.org/api/_as_gen/matplotlib.figure.Figure.html#matplotlib.figure.Figure
[29]: https://matplotlib.org/api/axes_api.html#matplotlib.axes.Axes
[30]: https://en.wikipedia.org/wiki/Portable_Network_Graphics
[31]: https://matplotlib.org/tutorials/introductory/pyplot.html#sphx-glr-tutorials-introductory-pyplot-py
[32]: https://matplotlib.org/gallery/index.html
[33]: https://opensource.com/sites/default/files/uploads/fit_python.png (Plot and fit of the dataset obtained with Python)
[34]: https://www.gnu.org/software/octave/
[35]: https://wiki.octave.org/FAQ#Differences_between_Octave_and_Matlab
[36]: https://en.wikipedia.org/wiki/MATLAB
[37]: https://gitlab.com/cristiano.fontana/polyglot_fit/-/blob/master/fitting_octave.m
[38]: https://octave.org/doc/v5.1.0/Using-Packages.html#Using-Packages
[39]: https://octave.org/doc/v5.1.0/Formatted-Output.html#XREFprintf
[40]: https://octave.org/doc/v5.1.0/Simple-File-I_002fO.html#XREFdlmread
[41]: https://octave.org/doc/v5.1.0/Matrices.html
[42]: https://octave.org/doc/v5.1.0/Polynomial-Interpolation.html
[43]: https://octave.org/doc/v5.1.0/Correlation-and-Regression-Analysis.html#XREFcorr
[44]: https://octave.sourceforge.io/octave/function/linspace.html
[45]: https://octave.org/doc/v5.1.0/Multiple-Plot-Windows.html
[46]: https://octave.org/doc/v5.1.0/Graphics-Objects.html#XREFaxes
[47]: https://octave.org/doc/v5.1.0/Graphics-Objects.html#XREFset
[48]: https://octave.org/doc/v5.1.0/Two_002dDimensional-Plots.html#XREFplot
[49]: https://octave.org/doc/v5.1.0/Manipulation-of-Plot-Windows.html#XREFhold
[50]: https://octave.org/doc/v5.1.0/Plot-Annotations.html#XREFlegend
[51]: https://octave.org/doc/v5.1.0/Formatted-Output.html#XREFsprintf
[52]: https://octave.org/doc/v5.1.0/Two_002dDimensional-Plots.html#Two_002dDimensional-Plots
[53]: https://octave.org/doc/v5.1.0/Graphics-Objects.html#XREFgroot
[54]: https://opensource.com/sites/default/files/uploads/fit_octave.png (Plot and fit of the dataset obtained with Octave)
[55]: http://www.rosettacode.org/
