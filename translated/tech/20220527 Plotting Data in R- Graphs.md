[#]: subject: "Plotting Data in R: Graphs"
[#]: via: "https://www.opensourceforu.com/2022/05/plotting-data-in-r-graphs/"
[#]: author: "Shakthi Kannan https://www.opensourceforu.com/author/shakthi-kannan/"
[#]: collector: "lkxed"
[#]: translator: "tanloong"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

R 语言绘制数据：图表篇
======

R 语言有非常多的绘图和数据可视化的包，比如 graphics、lattice、ggplot2 等。这是 R 语言系列的第 9 篇文章，我们会介绍 R 中用来绘图的各种函数。

![business-man-visulising-graphs][1]

本文使用的 R 是 4.1.2 版本，
运行环境为 Parabola GNU/Linux-libre (x86-64)。

```R
$ R --version

R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```

R 是开源软件，没有任何担保责任。
只要遵守 GNU 通用公共许可证的版本 2 或者版本 3，你就可以对它进行 (修改和) 再分发。
详情见 [*https://www.gnu.org/licenses/.*](https://www.gnu.org/licenses/.)

### 折线图

我们以印度全境消费者物价指数 (CPI -- 乡村/城市) 数据集为研究对象，它可以从 [*https://data.gov.in/catalog/all-india-consumer-price-index-ruralurban-0*](https://data.gov.in/catalog/all-india-consumer-price-index-ruralurban-0) 下载。选择 "截止到 2021 年 11 月" 的版本，用 read.csv 函数读取下载好的文件，如下所示：

```R
> cpi <- read.csv(file="CPI.csv", sep=",")

> head(cpi)
Sector Year Name Andhra.Pradesh Arunachal.Pradesh Assam Bihar
1 Rural 2011 January 104 NA 104 NA
2 Urban 2011 January 103 NA 103 NA
3 Rural+Urban 2011 January 103 NA 104 NA
4 Rural 2011 February 107 NA 105 NA
5 Urban 2011 February 106 NA 106 NA
6 Rural+Urban 2011 February 105 NA 105 NA
Chattisgarh Delhi Goa Gujarat Haryana Himachal.Pradesh Jharkhand Karnataka
1 105 NA 103 104 104 104 105 104
2 104 NA 103 104 104 103 104 104
3 104 NA 103 104 104 103 105 104
4 107 NA 105 106 106 105 107 106
5 106 NA 105 107 107 105 107 108
6 105 NA 104 105 106 104 106 106
...
```

以 Punjab 州为例，对每年各月份的 CPI 值求和，然后用 plot 函数画一张折线图：

```R
> punjab <- aggregate(x=cpi$Punjab, by=list(cpi$Year), FUN=sum)

> head(punjab)
Group.1 x
1 2011 3881.76
2 2012 4183.30
3 2013 4368.40
4 2014 4455.50
5 2015 4584.30
6 2016 4715.80

> plot(punjab$Group.1, punjab$x, type="l", main="Punjab Consumer Price Index upto November 2021", xlab="Year", ylab="Consumer Price Index")
```

plot 函数可以传入如下参数：

| 参数 | 描述 | 
| :- | :- |
| x | 向量类型，用于绘制 x 轴的数据 | 
| y | 向量或列表类型，用于绘制 y 轴的数据 |
| type | 设置绘图类型："p" 画点；"l" 画线；"o" 同时画点和线，且相互重叠；"s" 画阶梯线；"h" 画铅垂线 |
| xlim | x 轴范围 |
| ylim | y 轴范围 |
| main | 标题 | 
| sub | 副标题 |
| xlab | x 轴标题 | 
| ylab | y 轴标题 | 
| axes | 逻辑型，是否绘制坐标轴 |

结果如图 1。

![Figure 1: Line chart][2]

### 自相关图

自相关图能在时序分析中展示一个变量是否具有自相关性，可以用 R 中的 acf 函数绘制。acf 函数可以设置三种自相关类型：*correlation*、*covariance* 或 *partial*。图 2 是 Punjab 州 CPI 值的自相关图，x 表示 CPI。

```R
acf(punjab$x,main='x')
```

![Figure 2: ACF chart][3]

acf 函数可以传入以下参数：

| 参数 | 描述 |
| :- | :- |
| x | 一个单变量或多变量的 time series 对象，或者一个数值向量或数值矩阵 | 
| lag.max | 最大滞后阶数 | 
| type | 字符型，设置所计算的自相关类型："correlation"、"covariance" 或 "partial" | 
| plot | 逻辑性，若 TRUE 则绘制图像，若 FALSE 则打印传入数据的描述信息 | 
| i | 一组要保留的时差滞后 | 
| j | 一组要保留的名称或数字 |

### 柱状图

R 中画柱状图的函数是 barplot。下面的代码用来画 Punjab 州 CPI 的柱状图，如图3：

```R
> barplot(punjab$x, main="Punjab Consumer Price Index", sub="Upto November 2021", xlab="Year", ylab="Consumer Price Index", col="navy")
```

![Figure 3: Line chart of Punjab's CPI][4]

barplot 函数的使用方法非常灵活，可以传入以下参数：

| 参数 | 描述 |
| :- | :- |
| height | 数值向量或数值矩阵，包含用于绘图的数据 |
| width | 数值向量，用于设置柱宽 |
| space | 柱间距 |
| beside | 逻辑型，若 FALSE 则绘制堆积柱状图，若 TRUE 则绘制并列柱状图 | 
| density | 数值型，设置阴影线的填充密度 (条数/英寸)，默认为 NULL，即不填充阴影线| 
| angle | 数值型，填充线条的角度，默认为 45 | 
| border | 柱子边缘的颜色 | 
| main | 标题 | 
| sub | 副标题 |
| xlab | x 轴标题 | 
| ylab | y 轴标题 | 
| xlim | x 轴范围 |
| ylim | y 轴范围 |
| axes | 逻辑型，是否绘制坐标轴 |

用 help 命令可以查看 barplot 函数的详细信息：

```R
> help(barplot)

barplot                package:graphics                R Documentation

Bar Plots

Description:

     Creates a bar plot with vertical or horizontal bars.

Usage:

     barplot(height, ...)

     ## Default S3 method:
     barplot(height, width = 1, space = NULL,
             names.arg = NULL, legend.text = NULL, beside = FALSE,
             horiz = FALSE, density = NULL, angle = 45,
             col = NULL, border = par("fg"),
             main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
             xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
             axes = TRUE, axisnames = TRUE,
             cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
             inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
             add = FALSE, ann = !add && par("ann"), args.legend = NULL, ...)

     ## S3 method for class 'formula'
     barplot(formula, data, subset, na.action,
             horiz = FALSE, xlab = NULL, ylab = NULL, ...)
```

### 饼图

绘制饼图时要多加注意，因为饼图不一定能展示出各扇形间的区别。(LCTT 译注："根据统计学家和一些心理学家的调查结果，这种以比例展示数据的统计图形 [实际上是很糟糕的可视化方式][10]，因此，R 关于饼图的帮助文件中清楚地说明了并不推荐使用饼图，而是使用条形图或点图作为替代。") 用 subset 函数获得 Gujarat 州在 2021 年 1 月 Rural、Urban、Rurual+Urban 的 CPI 值：

```R
> jan2021 <- subset(cpi, Name=="January" & Year=="2021")

> jan2021$Gujarat
[1] 153.9 151.2 149.1

> names <- c('Rural', 'Urban', 'Rural+Urban')
```

使用 pie 函数为 Gujarat 州的 CPI 值生成饼图，如下所示：

```R
> pie(jan2021$Gujarat, names, main="Gujarat CPI Rural and Urban Pie Chart")
```

![Figure 4: Pie chart][5]

pie 函数可以传入以下参数：

| 参数 | 描述 |
| :- | :- |
| x | 元素大于 0 的数值向量 | 
| label | 字符向量，用于设置每个扇形的标签 | 
| radius | 饼图的半径 | 
| clockwise | 逻辑型，若 TRUE 则顺时针绘图，若 FALSE 则逆时针绘图 | 
| density | 数值型，设置阴影线的填充密度 (条数/英寸)，默认为 NULL，即不填充阴影线| 
| angle | 数值型，填充线条的角度，默认为 45 | 
| col | 数值向量，用于设置颜色 | 
| lty | 每个扇形的线条类型 | 
| main | 标题 |

### 箱线图

(LCTT 译注："箱线图主要是 [从四分位数的角度出发][11] 描述数据的分布，它通过最大值 (Q4)、上四分位数 (Q3)、中位数(Q2)、下四分位数 (Q1) 和最小值 (Q0) 五处位置来获取一维数据的分布概况。我们知道，这五处位置之间依次包含了四段数据，每段中数据量均为总数据量的 1/4。通过每一段数据占据的长度，我们可以大致推断出数据的集中或离散趋势 (长度越短，说明数据在该区间上越密集，反之则稀疏。)")

箱线图能够用“须线” (whiskers) 展示一个变量的四分位距 (Interquartile Range，简称 IQR=Q3-Q1)。用上下四分位数分别加/减内四分位距，再乘以一个人为设定的倍数 range (见下面的参数列表)，得到 `range * c(Q1-IQR, Q3+IQR)`，超过这个范围的数据点就被视作离群点，在图中直接以点的形式表示出来。
boxplot 函数可以传入以下参数：

| 参数 | 描述 |
| :- | :- |
| data | 数据框或列表，用于参数类型为公式 (formula) 的情况 | 
| x | 数值向量或者列表，若为列表则对列表中每一个子对象依次作出箱线图 | 
| width | 设置箱子的宽度 | 
| outline | 逻辑型，设置是否绘制离群点 | 
| names | 设置每个箱子的标签 | 
| border | 设置每个箱子的边缘的颜色 | 
| range | 延伸倍数，设置箱线图末端 (须) 延伸到什么位置 | 
| plot | 逻辑型，设置是否生成图像，若 TRUE 则生成图像，若 FALSE 则打印传入数据的描述信息 | 
| horizontal | 逻辑型，设置箱线图是否水平放置 |

用 boxplot 函数绘制部分州的箱线图：

```R
> names <- c ('Andaman and Nicobar', 'Lakshadweep', 'Delhi', 'Goa', 'Gujarat', 'Bihar')
> boxplot(cpi$Andaman.and.Nicobar, cpi$Lakshadweep, cpi$Delhi, cpi$Goa, cpi$Gujarat, cpi$Bihar, names=names)
```

![Figure 5: Box plot][6]

### QQ 图

QQ 图 (Quantile-Quantile plot) 可以用来对比两个数据集，也可以用来检查数据是否服从某种理论分布。qqnorm 函数能绘制正态分布 QQ 图，可以检验数据是否服从正态分布，用下面的代码绘制 Punjab 州 CPI 数据的 QQ 图：

```R
> qqnorm(punjab$x)
```

![Figure 6: Q-Q plot][7]

qqline 函数可以向正态分布 QQ 图上添加理论分布曲线，它可以传入以下参数：

| 参数 | 描述 |
| :- | :- |
| x | 第一个数据样本 | 
| y | 第二个数据样本 | 
| datax | 逻辑型，设置是否以 x 轴表示理论曲线的值，默认为 FALSE |
| probs | 长度为 2 的数值向量，代表概率 | 
| xlab | x 轴标题 |
| ylab | y 轴标题 |
| qtype | [1,9] 内的整数，设置分位计算类型，详情见 help(quantile) 的 "Type" 小节 |

### 等高图

等高图可以描述三维数据，在 R 中对应的函数是 contour，这个函数也可以用来向已有的图表添加等高线。等高图常与其他图表一起使用。我们用 contour 对 R 中的 volcano 数据集 (奥克兰的火山地形信息) 绘制等高图，代码如下：

```R
> contour(volcano)
```

![Figure 7: Volcano][8]

contour 函数的常用参数如下：

| 参数 | 描述 |
| :- | :- |
| x,y | z 中数值对应的点在平面上的位置 |
| z | 数值向量 |
| nlevels | 设置等高线的条数，调整等高线的疏密 | 
| labels | 等高线上的标记字符串，默认是高度的数值 | 
| xlim | 设置 x 轴的范围 | 
| ylim | 设置 y 轴的范围 | 
| zlim | 设置 z 轴的范围 | 
| axes | 设置是否绘制坐标轴 | 
| col | 设置等高线的颜色 | 
| lty | 设置线条的类型 | 
| lwd | 设置线条的粗细 | 
| vfont | 设置标签字体 |

等高线之间的区域可以用颜色填充，每种颜色表示一个高度范围，如下所示：

```R
> filled.contour(volcano, asp = 1)
# asp 为图形纵横比，即 y 轴上的 1 单位长度和 x 轴上 1 单位长度的比率
```
填充结果见图 8。

![Figure 8: Filled volcano][9]

掌握上述内容后，你可以尝试 R 语言 graphics 包中的其他函数和图表 (LCTT 译注：用 help(package=graphics) 可以查看 graphics 包提供的函数列表)。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/plotting-data-in-r-graphs/

作者：[Shakthi Kannan][a]
选题：[lkxed][b]
译者：[tanloong](https://github.com/tanloong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/shakthi-kannan/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/business-man-visulising-graphs.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Line-chart.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-ACF-chart.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-Line-chart-of-Punjabs-CPI.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-Pie-chart.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-ox-plot.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Q-Q-plot.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-7-Volcano.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-8-Filled-volcano.jpg
[10]: https://bookdown.org/xiangyun/msg/gallery.html#sec:pie
[11]: https://bookdown.org/xiangyun/msg/gallery.html#sec:boxplot
